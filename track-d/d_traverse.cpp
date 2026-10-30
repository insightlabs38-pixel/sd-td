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

static inline uint32_t number(const char*& p) {
    uint32_t x = 0;
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

// Exclusive prefix sum of counts stored in off[0..n), leaving off[n] = total; cursor receives a copy.
static Array<uint32_t> prefix(Csr& g, uint32_t n) {
    uint32_t sum = 0;
    for (uint32_t k = 0; k < n; ++k) { uint32_t c = g.off[k]; g.off[k] = sum; sum += c; }
    g.off[n] = sum;
    Array<uint32_t> cursor(n);
    memcpy(cursor.p, g.off.p, n * sizeof(uint32_t));
    return cursor;
}

static inline uint32_t bump(uint32_t& x) { return __atomic_fetch_add(&x, 1u, __ATOMIC_RELAXED); }

struct Triples {
    Array<uint32_t> u, v, w;
    size_t len = 0;
};

static std::vector<Triples> parse_edges(const char* begin, const char* end, unsigned threads) {
    std::vector<const char*> cut(threads + 1, end);
    cut[0] = begin;
    for (unsigned i = 1; i < threads; ++i) {
        const char* q = begin + static_cast<size_t>(end - begin) * i / threads;
        q = static_cast<const char*>(memchr(q, '\n', end - q));
        cut[i] = q ? q + 1 : end;
    }
    std::vector<Triples> parts(threads);
    parallel(threads, [&](unsigned t) {
        Triples& e = parts[t];
        size_t cap = static_cast<size_t>(cut[t + 1] - cut[t]) / 6 + 1;
        e.u = Array<uint32_t>(cap); e.v = Array<uint32_t>(cap); e.w = Array<uint32_t>(cap);
        const char* p = cut[t];
        while (p < cut[t + 1]) {
            const char* block = p;
            const char* stop = std::min(cut[t + 1], p + (size_t(2) << 20));
            for (; p < stop; ++e.len) {
                e.u[e.len] = number(p);
                e.v[e.len] = number(p);
                e.w[e.len] = number(p);
            }
            MappedFile::drop(block, p);
        }
    });
    return parts;
}

static Csr build_raw(std::vector<Triples>& parts, uint32_t n, size_t m, unsigned threads) {
    Csr g(n, m);
    memset(g.off.p, 0, (n + 1) * sizeof(uint32_t));
    parallel(threads, [&](unsigned t) {
        for (size_t i = 0; i < parts[t].len; ++i) bump(g.off[parts[t].u[i]]);
    });
    Array<uint32_t> cursor = prefix(g, n);
    parallel(threads, [&](unsigned t) {
        const Triples& e = parts[t];
        for (size_t i = 0; i < e.len; ++i) g.adj[bump(cursor[e.u[i]])] = {e.v[i], e.w[i]};
    });
    return g;
}

struct Graph {
    uint32_t n = 0;
    Csr fwd, rev;
    Array<uint32_t> perm; // original id -> search id
};

// One BFS region: nodes in discovery order and their out-degrees.
struct Region {
    Array<uint32_t> order, degree;
    uint32_t len = 0;
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
    for (uint32_t head = 0; head < r.len; ++head) {
        if (head + 16 < r.len) __builtin_prefetch(&raw.off[r.order[head + 16]]);
        if (head + 8 < r.len) __builtin_prefetch(&raw.adj[raw.off[r.order[head + 8]]]);
        uint32_t u = r.order[head], b = raw.off[u], e = raw.off[u + 1];
        r.degree[head] = e - b;
        r.edges += e - b;
        for (uint32_t i = b; i < e; ++i)
            if (claims.take(raw.adj[i].to)) r.order[r.len++] = raw.adj[i].to;
    }
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
    uint32_t n = g.n, m = g.fwd.off[n];
    g.rev = Csr(n, m);
    memset(g.rev.off.p, 0, (n + 1) * sizeof(uint32_t));
    blocked(threads, m, [&](size_t lo, size_t hi) { for (size_t i = lo; i < hi; ++i) bump(g.rev.off[g.fwd.adj[i].to]); });
    Array<uint32_t> cursor = prefix(g.rev, n);
    blocked(threads, n, [&](size_t lo, size_t hi) {
        for (size_t u = lo; u < hi; ++u)
            for (uint32_t i = g.fwd.off[u]; i < g.fwd.off[u + 1]; ++i)
                g.rev.adj[bump(cursor[g.fwd.adj[i].to])] = {static_cast<uint32_t>(u), g.fwd.adj[i].w};
    });
}

static Graph read_graph(const std::string& path, unsigned threads) {
    MappedFile file(path);
    const char* p = file.data;
    uint32_t n = number(p);
    (void)number(p);
    Graph g;
    {
        std::vector<Triples> parts = parse_edges(p, file.data + file.size, threads);
        size_t m = 0;
        for (const Triples& e : parts) m += e.len;
        Csr raw = build_raw(parts, n, m, threads);
        parts.clear();
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
        uint32_t s = number(p), t = number(p);
        result.push_back({g.perm[s], g.perm[t]});
    }
    return result;
}

struct HeapNode { uint64_t distance; uint32_t node; };
struct Heap {
    std::array<std::vector<HeapNode>, 65> buckets;
    uint64_t last = 0;
    size_t count = 0;
    inline static unsigned index(uint64_t x) { return x ? 64 - __builtin_clzll(x) : 0; }
    void clear() {
        for (auto& b : buckets) b.clear();
        last = 0;
        count = 0;
    }
    bool empty() const { return count == 0; }
    void push(uint64_t d, uint32_t v) {
        buckets[index(d ^ last)].push_back({d, v});
        ++count;
    }
    void prepare() {
        if (!buckets[0].empty()) return;
        unsigned i = 1;
        while (buckets[i].empty()) ++i;
        uint64_t minimum = INF;
        for (const auto& e : buckets[i]) minimum = std::min(minimum, e.distance);
        last = minimum;
        for (const auto& e : buckets[i]) buckets[index(e.distance ^ last)].push_back(e);
        buckets[i].clear();
    }
    HeapNode top() { prepare(); return buckets[0].back(); }
    HeapNode pop() {
        prepare();
        HeapNode e = buckets[0].back();
        buckets[0].pop_back();
        --count;
        return e;
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
    void skip_stale() { while (!heap.empty() && dist.get(heap.top().node) != heap.top().distance) heap.pop(); }
    // Settles the next vertex and relaxes its edges; `best` improves wherever the opposite search has a label.
    void step(const Side& other, uint64_t& best) {
        HeapNode top = heap.pop();
        uint32_t u = top.node;
        uint64_t d = top.distance;
        best = std::min(best, d + other.dist.get(u));
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
        for (uint32_t settled = 0; settled < probe; ++settled) {
            fwd.skip_stale();
            if (fwd.heap.empty()) return -1;
            if (fwd.heap.top().node == t) return static_cast<int64_t>(fwd.heap.top().distance);
            fwd.step(bwd, best);
        }
        bwd.start(t);
        best = std::min(best, fwd.dist.get(t));
        for (;;) {
            fwd.skip_stale();
            bwd.skip_stale();
            if (fwd.heap.empty() || bwd.heap.empty()) break;
            uint64_t f = fwd.heap.top().distance, b = bwd.heap.top().distance;
            if (f + b >= best) break;
            if (f <= b) fwd.step(bwd, best); else bwd.step(fwd, best);
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
