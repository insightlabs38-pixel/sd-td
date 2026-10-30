#include <algorithm>
#include <array>
#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <memory>
#include <string>
#include <thread>
#include <utility>
#include <vector>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

// Real distances stay below 2^53, so INF plus any distance cannot wrap.
static constexpr uint64_t INF = uint64_t(1) << 62;
struct Edge { uint32_t to, w; };

// Uninitialized, lazily faulted, 2 MiB-aligned storage that asks for transparent huge pages.
template <class T> struct Array {
    static constexpr size_t HUGE = size_t(1) << 21;
    T* p = nullptr;
    void* base = nullptr;
    size_t span = 0;
    Array() = default;
    explicit Array(size_t n) {
        size_t bytes = n * sizeof(T);
        span = bytes + HUGE;
        base = mmap(nullptr, span, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (base == MAP_FAILED) { perror("mmap"); std::exit(2); }
        p = reinterpret_cast<T*>((reinterpret_cast<uintptr_t>(base) + HUGE - 1) & ~(HUGE - 1));
        if (bytes >= HUGE) madvise(p, bytes, MADV_HUGEPAGE);
    }
    Array(Array&& o) noexcept : p(o.p), base(o.base), span(o.span) { o.base = nullptr; }
    Array& operator=(Array&& o) noexcept { release(); p = o.p; base = o.base; span = o.span; o.base = nullptr; return *this; }
    ~Array() { release(); }
    void release() { if (base) munmap(base, span); base = nullptr; }
    T& operator[](size_t i) { return p[i]; }
    const T& operator[](size_t i) const { return p[i]; }
};

template <class F> static void parallel(unsigned threads, F&& f) {
    std::vector<std::thread> pool;
    for (unsigned i = 1; i < threads; ++i) pool.emplace_back(f, i);
    f(0);
    for (auto& t : pool) t.join();
}

template <class F> static void blocked(unsigned threads, size_t total, F&& f) {
    parallel(threads, [&](unsigned t) { f(total * t / threads, total * (t + 1) / threads); });
}

static inline uint32_t number(const char*& p, const char* end) {
    uint32_t x = 0;
    if (end - p >= 8) {
        uint64_t w;
        memcpy(&w, p, 8);
        uint64_t stop = (w & 0xF0F0F0F0F0F0F0F0ull) ^ 0x3030303030303030ull; // nonzero byte = separator
        unsigned digits = stop ? __builtin_ctzll(stop) >> 3 : 8;
        uint64_t d = (w & 0x0F0F0F0F0F0F0F0Full) << (8 * (8 - digits));
        d = d * 10 + (d >> 8);
        d = (((d & 0x000000FF000000FFull) * 0x000F424000000064ull) + (((d >> 16) & 0x000000FF000000FFull) * 0x0000271000000001ull)) >> 32;
        x = static_cast<uint32_t>(d);
        p += digits;
    }
    while (*p >= '0' && *p <= '9') { x = x * 10 + static_cast<uint32_t>(*p - '0'); ++p; }
    ++p; // Official input has one space or LF after every integer.
    return x;
}

struct MappedFile {
    const char* data = nullptr;
    size_t size = 0;
    explicit MappedFile(const std::string& path) {
        int fd = open(path.c_str(), O_RDONLY);
        struct stat st{};
        if (fd < 0 || fstat(fd, &st) != 0) { perror(path.c_str()); std::exit(2); }
        size = static_cast<size_t>(st.st_size);
        void* q = size ? mmap(nullptr, size, PROT_READ, MAP_PRIVATE, fd, 0) : nullptr;
        if (q == MAP_FAILED) { perror("mmap"); std::exit(2); }
        data = static_cast<const char*>(q);
        close(fd);
    }
    ~MappedFile() { if (data) munmap(const_cast<char*>(data), size); }
    // Returns page-aligned interior of [a, b) to the kernel once parsed.
    static void drop(const char* a, const char* b) {
        auto lo = (reinterpret_cast<uintptr_t>(a) + 4095) & ~uintptr_t(4095);
        auto hi = reinterpret_cast<uintptr_t>(b) & ~uintptr_t(4095);
        if (hi > lo) madvise(reinterpret_cast<void*>(lo), hi - lo, MADV_DONTNEED);
    }
};

struct Csr {
    Array<uint32_t> off;
    Array<Edge> adj;
    Csr() = default;
    Csr(size_t n, size_t m) : off(n + 1), adj(m) {}
};

struct Triple { uint32_t u, v, w; };

// One thread's edges partitioned by u >> shift into short chunk runs, so each bucket can later become CSR in cache.
class Binner {
    static constexpr uint32_t CHUNK = 256;
    Array<Triple> pool_;
    size_t used_ = 0;
    std::vector<Triple*> fill_, limit_;
    std::vector<std::vector<std::pair<const Triple*, uint32_t>>> runs_;
    unsigned shift_;
    void open_chunk(size_t b) {
        close(b);
        fill_[b] = pool_.p + used_;
        limit_[b] = fill_[b] + CHUNK;
        used_ += CHUNK;
    }
    void close(size_t b) {
        if (!limit_[b]) return;
        Triple* start = limit_[b] - CHUNK;
        if (fill_[b] != start) runs_[b].push_back({start, static_cast<uint32_t>(fill_[b] - start)});
    }
public:
    Binner(unsigned shift, size_t buckets, size_t max_edges)
        : pool_(max_edges + (buckets + 1) * CHUNK), fill_(buckets, nullptr), limit_(buckets, nullptr), runs_(buckets), shift_(shift) {}
    void add(uint32_t u, uint32_t v, uint32_t w) {
        size_t b = u >> shift_;
        if (fill_[b] == limit_[b]) open_chunk(b);
        *fill_[b]++ = {u, v, w};
    }
    void finish() { for (size_t b = 0; b < runs_.size(); ++b) { close(b); limit_[b] = nullptr; } }
    const std::vector<std::pair<const Triple*, uint32_t>>& runs(size_t b) const { return runs_[b]; }
};

static unsigned bucket_shift(uint32_t n) {
    unsigned shift = 0;
    while ((n >> shift) > 256) ++shift;
    return shift;
}

// Builds CSR keyed by Triple::u (head Triple::v) from the per-thread bins, one bucket at a time.
static Csr bins_to_csr(const std::vector<Binner>& bins, uint32_t n, unsigned shift, unsigned threads) {
    size_t buckets = (static_cast<size_t>(n) + (size_t(1) << shift) - 1) >> shift;
    std::vector<size_t> base(buckets + 1, 0);
    for (size_t b = 0; b < buckets; ++b) {
        base[b + 1] = base[b];
        for (const Binner& bin : bins) for (auto& run : bin.runs(b)) base[b + 1] += run.second;
    }
    Csr g(n, base[buckets]);
    g.off[n] = static_cast<uint32_t>(base[buckets]);
    std::atomic<size_t> next{0};
    parallel(threads, [&](unsigned) {
        std::vector<uint32_t> cursor(size_t(1) << shift);
        for (size_t b; (b = next.fetch_add(1)) < buckets;) {
            size_t lo = b << shift, hi = std::min<size_t>(n, lo + (size_t(1) << shift));
            std::fill(cursor.begin(), cursor.begin() + (hi - lo), 0);
            for (const Binner& bin : bins) for (auto& run : bin.runs(b)) for (uint32_t i = 0; i < run.second; ++i) ++cursor[run.first[i].u - lo];
            uint32_t sum = static_cast<uint32_t>(base[b]);
            for (size_t k = lo; k < hi; ++k) { uint32_t c = cursor[k - lo]; g.off[k] = cursor[k - lo] = sum; sum += c; }
            for (const Binner& bin : bins)
                for (auto& run : bin.runs(b))
                    for (uint32_t i = 0; i < run.second; ++i) g.adj[cursor[run.first[i].u - lo]++] = {run.first[i].v, run.first[i].w};
        }
    });
    return g;
}

static std::vector<Binner> parse_edges(const char* begin, const char* end, uint32_t n, unsigned shift, unsigned threads) {
    std::vector<const char*> cut(threads + 1, end);
    cut[0] = begin;
    for (unsigned i = 1; i < threads; ++i) {
        const char* q = begin + static_cast<size_t>(end - begin) * i / threads;
        q = static_cast<const char*>(memchr(q, '\n', end - q));
        cut[i] = q ? q + 1 : end;
    }
    size_t buckets = (static_cast<size_t>(n) + (size_t(1) << shift) - 1) >> shift;
    std::vector<Binner> bins;
    for (unsigned t = 0; t < threads; ++t) bins.emplace_back(shift, buckets, static_cast<size_t>(cut[t + 1] - cut[t]) / 6 + 1);
    parallel(threads, [&](unsigned t) {
        Binner& bin = bins[t];
        const char* p = cut[t];
        while (p < cut[t + 1]) {
            const char* block = p;
            const char* stop = std::min(cut[t + 1], p + (size_t(2) << 20));
            while (p < stop) {
                uint32_t u = number(p, end), v = number(p, end), w = number(p, end);
                bin.add(u, v, w);
            }
            MappedFile::drop(block, p);
        }
        bin.finish();
    });
    return bins;
}

struct Graph {
    uint32_t n = 0;
    Csr fwd, rev;
    Array<uint32_t> perm; // original id -> search id
};

// One BFS region: nodes in discovery order and their out-degrees.
struct Region {
    Array<uint32_t> order, degree;
    uint32_t len = 0, expanded = 0;
    uint64_t edges = 0;
};

class Claims {
    std::vector<uint64_t> bits_;
public:
    explicit Claims(uint32_t n) : bits_((n + 63) / 64, 0) {}
    bool take(uint32_t v) {
        uint64_t bit = 1ull << (v & 63);
        uint64_t* word = &bits_[v >> 6];
        if (__atomic_load_n(word, __ATOMIC_RELAXED) & bit) return false;
        return !(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit);
    }
    uint64_t word(size_t i) const { return bits_[i]; }
    size_t words() const { return bits_.size(); }
};

static void grow(const Csr& raw, Claims& claims, Region& r) {
    uint32_t len = r.len;
    uint64_t edges = r.edges;
    uint32_t* order = r.order.p;
    uint32_t* degree = r.degree.p;
    uint32_t head = r.expanded;
    for (; head < len; ++head) {
        if (head + 16 < len) __builtin_prefetch(&raw.off[order[head + 16]]);
        if (head + 8 < len) __builtin_prefetch(&raw.adj[raw.off[order[head + 8]]]);
        uint32_t u = order[head], b = raw.off[u], e = raw.off[u + 1];
        degree[head] = e - b;
        edges += e - b;
        for (uint32_t i = b; i < e; ++i)
            if (claims.take(raw.adj[i].to)) order[len++] = raw.adj[i].to;
    }
    r.len = len;
    r.expanded = head;
    r.edges = edges;
}

// Search ids follow concurrent BFS regions grown from scattered seeds, so graph neighbours stay close in memory.
static Graph reorder(const Csr& raw, uint32_t n, unsigned threads) {
    Graph g;
    g.n = n;
    Claims claims(n);
    std::vector<Region> regions(threads + 1);
    for (unsigned t = 0; t <= threads; ++t) { regions[t].order = Array<uint32_t>(n); regions[t].degree = Array<uint32_t>(n); }
    for (unsigned t = 0; t < threads; ++t) {
        for (uint32_t i = 0, r = static_cast<uint32_t>(uint64_t(n) * t / threads); i < n; ++i, r = r + 1 == n ? 0 : r + 1)
            if (raw.off[r + 1] - raw.off[r] >= 2) {
                if (claims.take(r)) regions[t].order[regions[t].len++] = r;
                break;
            }
    }
    parallel(threads, [&](unsigned t) { grow(raw, claims, regions[t]); });
    Region& rest = regions[threads];
    for (size_t w = 0; w < claims.words(); ++w)
        for (uint64_t free = ~claims.word(w); free; free &= free - 1) {
            uint32_t v = static_cast<uint32_t>(w * 64 + __builtin_ctzll(free));
            if (v < n && claims.take(v)) { rest.order[rest.len++] = v; grow(raw, claims, rest); }
        }

    std::vector<uint32_t> base(threads + 2, 0);
    std::vector<uint64_t> ebase(threads + 2, 0);
    for (unsigned t = 0; t <= threads; ++t) { base[t + 1] = base[t] + regions[t].len; ebase[t + 1] = ebase[t] + regions[t].edges; }
    Array<uint32_t> order(n), degree(n);
    g.perm = Array<uint32_t>(n);
    g.fwd = Csr(n, ebase[threads + 1]);
    parallel(threads + 1, [&](unsigned t) {
        const Region& r = regions[t];
        uint64_t sum = ebase[t];
        for (uint32_t i = 0; i < r.len; ++i) {
            order[base[t] + i] = r.order[i];
            g.perm[r.order[i]] = base[t] + i;
            g.fwd.off[base[t] + i] = static_cast<uint32_t>(sum);
            sum += r.degree[i];
        }
    });
    g.fwd.off[n] = static_cast<uint32_t>(ebase[threads + 1]);
    regions.clear();
    blocked(threads, n, [&](size_t lo, size_t hi) {
        for (size_t k = lo; k < hi; ++k) {
            if (k + 8 < hi) __builtin_prefetch(&raw.adj[raw.off[order[k + 8]]]);
            uint32_t o = order[k], pos = g.fwd.off[k];
            for (uint32_t i = raw.off[o]; i < raw.off[o + 1]; ++i) g.fwd.adj[pos++] = {g.perm[raw.adj[i].to], raw.adj[i].w};
        }
    });
    return g;
}

static void add_reverse(Graph& g, unsigned threads) {
    uint32_t n = g.n;
    unsigned shift = bucket_shift(n);
    size_t buckets = (static_cast<size_t>(n) + (size_t(1) << shift) - 1) >> shift;
    auto first = [&](unsigned t) { return static_cast<uint32_t>(uint64_t(n) * t / threads); };
    std::vector<Binner> bins;
    for (unsigned t = 0; t < threads; ++t) bins.emplace_back(shift, buckets, g.fwd.off[first(t + 1)] - g.fwd.off[first(t)]);
    parallel(threads, [&](unsigned t) {
        for (uint32_t u = first(t); u < first(t + 1); ++u)
            for (uint32_t i = g.fwd.off[u]; i < g.fwd.off[u + 1]; ++i) bins[t].add(g.fwd.adj[i].to, u, g.fwd.adj[i].w);
        bins[t].finish();
    });
    g.rev = bins_to_csr(bins, n, shift, threads);
}

static Graph read_graph(const std::string& path, unsigned threads) {
    MappedFile file(path);
    const char* p = file.data;
    const char* end = p + file.size;
    uint32_t n = number(p, end);
    (void)number(p, end);
    Graph g;
    {
        unsigned shift = bucket_shift(n);
        std::vector<Binner> bins = parse_edges(p, end, n, shift, threads);
        Csr raw = bins_to_csr(bins, n, shift, threads);
        bins.clear();
        g = reorder(raw, n, threads);
    }
    add_reverse(g, threads);
    return g;
}

struct Query { uint32_t from, to; };

static std::vector<Query> read_queries(const std::string& path, const Graph& g) {
    MappedFile file(path);
    std::vector<Query> result;
    const char* p = file.data;
    const char* end = p + file.size;
    while (p < end) {
        uint32_t s = number(p, end), t = number(p, end);
        result.push_back({g.perm[s], g.perm[t]});
    }
    return result;
}

struct HeapNode { uint64_t distance; uint32_t node; };
// Monotone queue: keys within B of the minimum sit in exact-key buckets, larger jumps in a binary heap.
struct Heap {
    static constexpr unsigned B = 4096;
    std::array<std::vector<uint32_t>, B> bucket;
    std::array<uint64_t, B / 64> occupied{};
    std::vector<HeapNode> far;
    uint64_t cur = 0;
    size_t near = 0;
    bool from_far = false;
    static bool later(const HeapNode& a, const HeapNode& b) { return a.distance > b.distance; }
    void clear() {
        for (size_t w = 0; w < occupied.size(); ++w)
            for (uint64_t bits = occupied[w]; bits; bits &= bits - 1) bucket[w * 64 + __builtin_ctzll(bits)].clear();
        occupied.fill(0);
        far.clear();
        cur = 0;
        near = 0;
    }
    bool empty() const { return near == 0 && far.empty(); }
    void push(uint64_t d, uint32_t v) {
        if (d - cur >= B) { far.push_back({d, v}); std::push_heap(far.begin(), far.end(), later); return; }
        unsigned b = d & (B - 1);
        bucket[b].push_back(v);
        occupied[b >> 6] |= 1ull << (b & 63);
        ++near;
    }
    HeapNode top() {
        if (near) {
            unsigned b = cur & (B - 1), w = b >> 6;
            uint64_t bits = occupied[w] & (~0ull << (b & 63));
            while (!bits) { w = (w + 1) & (B / 64 - 1); bits = occupied[w]; }
            unsigned idx = (w << 6) | __builtin_ctzll(bits);
            uint64_t key = cur + ((idx - b) & (B - 1));
            if (far.empty() || far.front().distance > key) { cur = key; from_far = false; return {key, bucket[idx].back()}; }
        }
        from_far = true;
        return far.front();
    }
    // Removes the entry returned by the preceding top().
    void drop(const HeapNode& t) {
        if (from_far) {
            std::pop_heap(far.begin(), far.end(), later);
            far.pop_back();
            if (near == 0) cur = t.distance;
            return;
        }
        unsigned b = t.distance & (B - 1);
        bucket[b].pop_back();
        if (bucket[b].empty()) occupied[b >> 6] &= ~(1ull << (b & 63));
        --near;
    }
};

// Distances live in fixed pages materialized on first write and recycled per query, so memory tracks the search, not n.
class Distances {
    static constexpr unsigned SHIFT = 9, SIZE = 1u << SHIFT;
    std::vector<uint64_t*> dir_;
    std::vector<uint32_t> used_;
    std::vector<uint64_t*> spare_;
    std::vector<std::unique_ptr<uint64_t[]>> store_;
    std::array<uint64_t, SIZE> blank_;
    uint64_t* acquire(uint32_t page) {
        uint64_t* p;
        if (spare_.empty()) { store_.emplace_back(new uint64_t[SIZE]); p = store_.back().get(); }
        else { p = spare_.back(); spare_.pop_back(); }
        std::fill(p, p + SIZE, INF);
        used_.push_back(page);
        return dir_[page] = p;
    }
public:
    explicit Distances(uint32_t n) : dir_((n >> SHIFT) + 1) { blank_.fill(INF); std::fill(dir_.begin(), dir_.end(), blank_.data()); }
    uint64_t get(uint32_t v) const { return dir_[v >> SHIFT][v & (SIZE - 1)]; }
    void set(uint32_t v, uint64_t d) {
        uint64_t* p = dir_[v >> SHIFT];
        if (p == blank_.data()) p = acquire(v >> SHIFT);
        p[v & (SIZE - 1)] = d;
    }
    void reset() {
        for (uint32_t page : used_) { spare_.push_back(dir_[page]); dir_[page] = blank_.data(); }
        used_.clear();
    }
};

struct Side {
    const Csr& csr;
    Distances dist;
    Heap heap;
    Side(const Csr& c, uint32_t n) : csr(c), dist(n) {}
    void start(uint32_t s) { dist.reset(); heap.clear(); dist.set(s, 0); heap.push(0, s); }
    // Drops outdated entries and returns the live minimum (heap must be nonempty on entry to the loop).
    bool live_top(HeapNode& t) {
        while (!heap.empty()) {
            t = heap.top();
            if (dist.get(t.node) == t.distance) return true;
            heap.drop(t);
        }
        return false;
    }
    // Settles the next vertex and relaxes its edges; `best` improves wherever the opposite search has a label.
    void step(const Side& other, HeapNode top, uint64_t& best) {
        uint32_t u = top.node;
        uint64_t d = top.distance;
        heap.drop(top);
        for (uint32_t i = csr.off[u], e = csr.off[u + 1]; i < e; ++i) {
            uint32_t v = csr.adj[i].to;
            uint64_t nd = d + csr.adj[i].w;
            if (nd < dist.get(v)) {
                dist.set(v, nd);
                heap.push(nd, v);
                best = std::min(best, nd + other.dist.get(v));
            }
        }
    }
};

struct Worker {
    const Graph& graph;
    Side fwd, bwd;
    uint32_t probe;
    Worker(const Graph& g, uint32_t p) : graph(g), fwd(g.fwd, g.n), bwd(g.rev, g.n), probe(p) {}
    int64_t solve(uint32_t s, uint32_t t) {
        if (s == t) return 0;
        if (graph.fwd.off[s] == graph.fwd.off[s + 1] || graph.rev.off[t] == graph.rev.off[t + 1]) return -1;
        bwd.dist.reset();
        fwd.start(s);
        uint64_t best = INF;
        HeapNode ft, bt;
        for (uint32_t settled = 0; settled < probe; ++settled) {
            if (!fwd.live_top(ft)) return -1;
            if (ft.node == t) return static_cast<int64_t>(ft.distance);
            fwd.step(bwd, ft, best);
        }
        bwd.start(t);
        best = std::min(best, fwd.dist.get(t));
        while (fwd.live_top(ft) && bwd.live_top(bt) && ft.distance + bt.distance < best) {
            if (ft.distance <= bt.distance) fwd.step(bwd, ft, best); else bwd.step(fwd, bt, best);
        }
        return best == INF ? -1 : static_cast<int64_t>(best);
    }
};

static void write_results(const std::string& path, const std::vector<int64_t>& answers) {
    std::string text;
    text.reserve(answers.size() * 12);
    for (int64_t x : answers) text += std::to_string(x) + '\n';
    FILE* f = fopen(path.c_str(), "wb");
    if (!f || fwrite(text.data(), 1, text.size(), f) != text.size() || fclose(f) != 0) { perror(path.c_str()); std::exit(2); }
}

int main() {
    const char* env_data = getenv("SD_DATA");
    const char* env_out = getenv("SD_OUT");
    std::string data = env_data ? env_data : "/data";
    std::string out = env_out ? env_out : "/out";
    unsigned threads = std::min(12u, std::max(1u, std::thread::hardware_concurrency()));
    if (const char* env = getenv("SD_THREADS")) threads = std::max(1, std::min(64, atoi(env)));
    uint32_t probe = 256;
    if (const char* env = getenv("SD_PROBE")) probe = static_cast<uint32_t>(std::max(0, atoi(env)));
    Graph g = read_graph(data + "/graph.txt", threads);
    std::vector<Query> queries = read_queries(data + "/queries.txt", g);
    std::vector<int64_t> answers(queries.size(), -1);
    std::atomic<size_t> next{0};
    parallel(std::min<size_t>(threads, std::max<size_t>(1, queries.size())), [&](unsigned) {
        Worker worker(g, probe);
        for (size_t i; (i = next.fetch_add(1, std::memory_order_relaxed)) < queries.size();)
            answers[i] = worker.solve(queries[i].from, queries[i].to);
    });
    write_results(out + "/distances.txt", answers);
}
