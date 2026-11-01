#include <algorithm>
#include <array>
#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <memory>
#include <numeric>
#include <string>
#include <thread>
#include <vector>
#include <emmintrin.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#ifdef SD_PROFILE
#include <chrono>
static void mark(const char* what) {
    static auto start = std::chrono::steady_clock::now();
    fprintf(stderr, "%8.2f ms %s\n", std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count(), what);
}
#else
static void mark(const char*) {}
#endif

// Real distances stay below 2^53, so INF plus any distance cannot wrap.
static constexpr uint64_t INF = uint64_t(1) << 62;
using Escapes = std::vector<std::pair<uint32_t, uint64_t>>;
using Bits = std::vector<uint64_t>;
static bool test(const Bits& bits, uint32_t v) { return bits[v >> 6] >> (v & 63) & 1; }

// Uninitialized, lazily faulted storage, so memory is committed only where it is written.
template <class T> struct Array {
    T* p = nullptr;
    size_t bytes = 0;
    Array() = default;
    explicit Array(size_t n, bool sparse = false) : bytes(n * sizeof(T) + 64) {
        void* q = mmap(nullptr, bytes, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (q == MAP_FAILED) { perror("mmap"); std::exit(2); }
        p = static_cast<T*>(q);
        if (sparse) madvise(q, bytes, MADV_NOHUGEPAGE); // partly used arrays would round up to whole huge pages
    }
    Array(Array&& o) noexcept : p(o.p), bytes(o.bytes) { o.p = nullptr; }
    Array& operator=(Array&& o) noexcept { release(); p = o.p; bytes = o.bytes; o.p = nullptr; return *this; }
    ~Array() { release(); }
    void release() { if (p) munmap(p, bytes); p = nullptr; }
    T& operator[](size_t i) { return p[i]; }
    const T& operator[](size_t i) const { return p[i]; }
};

template <class F> static void parallel(unsigned threads, F&& f) {
    std::vector<std::thread> pool;
    for (unsigned i = 1; i < threads; ++i) pool.emplace_back(f, i);
    f(0);
    for (auto& t : pool) t.join();
}

static unsigned id_bits(uint64_t n) {
    unsigned bits = 1;
    while (bits < 32 && (uint64_t(1) << bits) < n) ++bits;
    return bits;
}

static void sort_merge(Escapes& into, std::vector<Escapes>& parts) {
    for (auto& e : parts) into.insert(into.end(), e.begin(), e.end());
    std::sort(into.begin(), into.end());
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
};

// ---------------------------------------------------------------- parsing

// Bit i is set when p[i] is a separator (space or LF), the only bytes below '0'.
static inline uint64_t separators(const char* p) {
    const __m128i zero = _mm_set1_epi8('0');
    uint64_t m = 0;
    for (int k = 0; k < 4; ++k) {
        __m128i x = _mm_loadu_si128(reinterpret_cast<const __m128i*>(p + 16 * k));
        m |= uint64_t(static_cast<uint16_t>(_mm_movemask_epi8(_mm_cmplt_epi8(x, zero)))) << (16 * k);
    }
    return m;
}

// Decimal value of [a, b); short numbers are read as the 8 bytes ending at b with the leading bytes masked off.
static inline uint32_t decimal(const char* a, const char* b, const char* lo) {
    size_t len = static_cast<size_t>(b - a);
    if (len <= 8 && b - lo >= 8) {
        uint64_t x;
        memcpy(&x, b - 8, 8);
        x &= (~uint64_t(0) << (64 - 8 * len)) & 0x0F0F0F0F0F0F0F0Full;
        x = x * 10 + (x >> 8);
        x = ((x & 0x000000FF000000FFull) * 0x000F424000000064ull + ((x >> 16) & 0x000000FF000000FFull) * 0x0000271000000001ull) >> 32;
        return static_cast<uint32_t>(x);
    }
    uint32_t v = 0;
    for (; a < b; ++a) v = v * 10 + static_cast<uint32_t>(*a - '0');
    return v;
}

// Calls emit(u, v, w) for every line in [begin, end); both are line boundaries within the file [lo, hi).
template <class Emit> static void parse_lines(const char* lo, const char* hi, const char* begin, const char* end, Emit&& emit) {
    const char* field = begin;
    uint32_t vals[3];
    unsigned k = 0;
    alignas(16) char tail[64];
    for (const char* q = begin; q < end; q += 64) {
        uint64_t m;
        if (hi - q >= 64) {
            m = separators(q);
        } else {
            memset(tail, '0', sizeof tail);
            memcpy(tail, q, static_cast<size_t>(hi - q));
            m = separators(tail);
        }
        if (end - q < 64) m &= (uint64_t(1) << (end - q)) - 1;
        for (; m; m &= m - 1) {
            const char* sep = q + __builtin_ctzll(m);
            vals[k] = decimal(field, sep, lo);
            field = sep + 1;
            if (++k == 3) { emit(vals[0], vals[1], vals[2]); k = 0; }
        }
    }
}

// A bin entry packs the tail's low bits with the head and keeps 16 weight bits, so it takes 6 bytes;
// heavier weights store the all-ones marker and live in the binner's sorted side table.
struct __attribute__((packed)) Entry { uint32_t key; uint16_t w; };
using Run = std::pair<const Entry*, uint32_t>;

// One thread's edges partitioned by u >> shift into short chunk runs, so each bucket can later be built in cache.
class Binner {
    static constexpr uint32_t CHUNK = 256;
    Array<Entry> pool_;
    size_t used_ = 0;
    std::vector<Entry*> fill_, limit_;
    std::vector<std::vector<Run>> runs_;
    std::vector<std::pair<const Entry*, uint32_t>> heavy_;
    unsigned shift_, bits_;
    void close(size_t b) {
        if (!limit_[b]) return;
        Entry* start = limit_[b] - CHUNK;
        if (fill_[b] != start) runs_[b].push_back({start, static_cast<uint32_t>(fill_[b] - start)});
    }
public:
    Binner(unsigned shift, unsigned bits, size_t buckets, size_t max_edges)
        : pool_(max_edges + (buckets + 1) * CHUNK, true), fill_(buckets, nullptr), limit_(buckets, nullptr), runs_(buckets), shift_(shift), bits_(bits) {}
    void add(uint32_t u, uint32_t v, uint32_t w) {
        size_t b = u >> shift_;
        if (fill_[b] == limit_[b]) {
            close(b);
            fill_[b] = pool_.p + used_;
            limit_[b] = fill_[b] + CHUNK;
            used_ += CHUNK;
        }
        if (w >= 0xFFFF) heavy_.push_back({fill_[b], w});
        uint32_t key = static_cast<uint32_t>((uint64_t(u) & ((uint64_t(1) << shift_) - 1)) << bits_) | v;
        *fill_[b]++ = {key, static_cast<uint16_t>(std::min(w, 0xFFFFu))};
    }
    void finish() {
        for (size_t b = 0; b < runs_.size(); ++b) { close(b); limit_[b] = nullptr; }
        std::sort(heavy_.begin(), heavy_.end());
    }
    uint32_t weight(const Entry& e) const {
        return e.w != 0xFFFF ? e.w : std::lower_bound(heavy_.begin(), heavy_.end(), std::make_pair(&e, 0u))->second;
    }
    const std::vector<Run>& runs(size_t b) const { return runs_[b]; }
};

// ---------------------------------------------------------------- graphs

// Adjacency in 4-slot rows of packed edges (head in the high bits, weight in the low bits), so visiting a
// vertex is one cache miss. A vertex with more than four edges keeps three inline and a spill code in the
// fourth slot pointing to a counted list after the rows. Weights that do not fit live in a sorted escape table.
struct Rows {
    static constexpr uint32_t EMPTY = ~0u;
    Array<uint32_t> slot;
    Escapes escapes;
    uint32_t n = 0, wbits = 0, mask = 0, spill = 0;
    std::atomic<size_t> tail{0}; // overflow slots handed out so far
    Rows(uint32_t count, size_t extra) : slot(size_t(count) * 4 + extra), n(count) {
        wbits = 32 - id_bits(uint64_t(n) + 2);
        while (wbits > 1 && (uint64_t(n + 1) << wbits) + extra >= EMPTY) --wbits; // spill codes must stay below EMPTY
        mask = (uint32_t(1) << wbits) - 1;
        spill = (n + 1) << wbits;
    }
    uint32_t head(uint32_t e) const { return e >> wbits; }
    uint64_t weight(uint32_t e, size_t i) const {
        uint32_t w = e & mask;
        if (w != mask) return w;
        return std::lower_bound(escapes.begin(), escapes.end(), std::make_pair(static_cast<uint32_t>(i), uint64_t(0)))->second;
    }
    void put(size_t i, uint32_t v, uint64_t w, Escapes& fresh) {
        if (w >= mask) fresh.push_back({static_cast<uint32_t>(i), w});
        slot[i] = v << wbits | static_cast<uint32_t>(std::min<uint64_t>(w, mask));
    }
    // Prepares u's row for d edges and returns the slot index of its overflow list (0 if inline).
    size_t open(uint32_t u, uint32_t d) {
        uint32_t* r = &slot[size_t(u) * 4];
        r[0] = r[1] = r[2] = r[3] = EMPTY;
        if (d <= 4) return 0;
        size_t at = tail.fetch_add(d - 2, std::memory_order_relaxed);
        r[3] = spill + static_cast<uint32_t>(at);
        slot[size_t(n) * 4 + at] = d - 3;
        return size_t(n) * 4 + at;
    }
    // Slot index of u's k-th edge given open()'s result.
    static size_t where(uint32_t u, uint32_t k, size_t list) { return !list || k < 3 ? size_t(u) * 4 + k : list + k - 2; }
    template <class F> void each(uint32_t u, F&& f) const {
        const uint32_t* r = &slot[size_t(u) * 4];
        for (unsigned k = 0; k < 4; ++k) {
            uint32_t e = r[k];
            if (e >= spill) {
                if (e == EMPTY) return;
                size_t list = size_t(n) * 4 + (e - spill);
                for (uint32_t j = 1; j <= slot[list]; ++j) f(slot[list + j], list + j);
                return;
            }
            f(e, size_t(u) * 4 + k);
        }
    }
};

// Builds the raw rows one tail bucket at a time in cache and marks bypassable vertices: out-degree <= 2
// and not a query endpoint.
static void bins_to_rows(const std::vector<Binner>& bins, unsigned shift, const Bits& terminal, Rows& raw, Bits& bypass, unsigned threads) {
    uint32_t n = raw.n;
    size_t buckets = (static_cast<size_t>(n) + (size_t(1) << shift) - 1) >> shift;
    std::vector<Escapes> escapes(threads);
    std::atomic<size_t> next{0};
    const unsigned bits = id_bits(n);
    const uint32_t head_mask = static_cast<uint32_t>((uint64_t(1) << bits) - 1);
    parallel(threads, [&](unsigned t) {
        std::vector<uint32_t> degree(size_t(1) << shift), placed(size_t(1) << shift);
        std::vector<size_t> list(size_t(1) << shift);
        for (size_t b; (b = next.fetch_add(1)) < buckets;) {
            size_t lo = b << shift, hi = std::min<size_t>(n, lo + (size_t(1) << shift));
            std::fill(degree.begin(), degree.end(), 0);
            std::fill(placed.begin(), placed.end(), 0);
            for (const Binner& bin : bins)
                for (auto& run : bin.runs(b))
                    for (uint32_t i = 0; i < run.second; ++i) ++degree[run.first[i].key >> bits];
            for (size_t k = lo; k < hi; ++k) {
                list[k - lo] = raw.open(static_cast<uint32_t>(k), degree[k - lo]);
                if (degree[k - lo] <= 2 && !test(terminal, k)) bypass[k >> 6] |= 1ull << (k & 63); // buckets are word aligned
            }
            for (const Binner& bin : bins)
                for (auto& run : bin.runs(b))
                    for (uint32_t i = 0; i < run.second; ++i) {
                        const Entry& e = run.first[i];
                        uint32_t x = e.key >> bits, u = static_cast<uint32_t>(lo + x);
                        raw.put(Rows::where(u, placed[x]++, list[x]), e.key & head_mask, bin.weight(e), escapes[t]);
                    }
        }
    });
    sort_merge(raw.escapes, escapes);
}

// ---------------------------------------------------------------- fused contraction, ordering and gathering

// One worker's share of the search order: vertices in discovery order with their surviving out-edges (raw heads).
struct Region {
    Array<uint32_t> order, out;
    Array<uint8_t> degree; // saturates at 255; exact counts of larger vertices sit in `wide`
    std::vector<std::pair<uint32_t, uint32_t>> wide;
    Escapes escapes; // keyed by position in out
    uint32_t len = 0, expanded = 0, edges = 0;
    size_t extra = 0; // overflow slots its vertices need as search rows
};

// Concurrent BFS regions over the raw graph. Expanding a vertex follows each out-edge through bypassable
// vertices (one way on, not back) to the first survivor, so contraction, ordering and gathering share one pass.
// Edges are written in place; walks of a batch advance one hop per round so their cache misses overlap.
class Grower {
    static constexpr uint32_t BATCH = 32;
    struct Walk { uint32_t pos, root, prev, at; uint64_t weight; uint32_t steps; };
    const Rows& raw;
    const Bits& bypass;
    Bits& claimed;
    Bits mine_;
    Region& reg;
    std::vector<Walk> walks_;
    uint64_t sink_ = 0;

    // A private bitmap answers most checks, since a region mostly meets its own vertices. Claims race without
    // locked instructions: a vertex claimed twice leaves an extra copy that no forward edge reaches (heads resolve
    // through one ref entry), so it can never be on a shortest path.
    void claim(uint32_t z) {
        uint64_t bit = 1ull << (z & 63);
        if (mine_[z >> 6] & bit) return;
        mine_[z >> 6] |= bit;
        uint64_t* word = &claimed[z >> 6];
        uint64_t seen = __atomic_load_n(word, __ATOMIC_RELAXED);
        uint32_t fresh = !(seen & bit);
        __atomic_store_n(fresh ? word : &sink_, seen | bit, __ATOMIC_RELAXED); // shared lines are written only by claims
        reg.order[reg.len] = z;
        reg.len += fresh;
    }
    void put(uint32_t pos, uint32_t z, uint64_t w) {
        if (w >= raw.mask) reg.escapes.push_back({pos, w});
        reg.out[pos] = z << raw.wbits | static_cast<uint32_t>(std::min<uint64_t>(w, raw.mask));
    }
    // Advances a walk one hop; returns false once its edge is final.
    bool step(Walk& w) {
        const uint32_t* r = &raw.slot[size_t(w.at) * 4]; // bypassable rows hold at most two edges
        uint32_t ahead = 0, next = w.at, which = 0;
        for (uint32_t k = 0; k < 2 && r[k] != Rows::EMPTY; ++k) {
            uint32_t h = raw.head(r[k]);
            if (h != w.prev && h != w.at) { ++ahead; next = h; which = k; }
        }
        if (ahead > 1) { claim(w.at); put(w.pos, w.at, w.weight); return false; }
        if (ahead == 0 || next == w.root) { put(w.pos, w.root, 0); return false; } // a harmless self-loop
        w.weight += raw.weight(r[which], size_t(w.at) * 4 + which);
        w.prev = w.at;
        w.at = next;
        if (test(bypass, next) && ++w.steps < 64) { __builtin_prefetch(&raw.slot[size_t(next) * 4]); return true; }
        claim(next);
        put(w.pos, next, w.weight);
        return false;
    }
public:
    Grower(const Rows& r, const Bits& b, Bits& c, Region& g) : raw(r), bypass(b), claimed(c), mine_(c.size(), 0), reg(g) {}

    bool seed(uint32_t z) {
        uint32_t before = reg.len;
        claim(z);
        return reg.len != before;
    }

    void expand() {
        const uint32_t* order = reg.order.p;
        while (reg.expanded < reg.len) {
            uint32_t lo = reg.expanded, hi = std::min(reg.len, lo + BATCH);
            for (uint32_t h = lo + 2 * BATCH; h < std::min(reg.len, hi + 2 * BATCH); ++h) __builtin_prefetch(&raw.slot[size_t(order[h]) * 4]);
            size_t walking = 0;
            for (uint32_t h = lo; h < hi; ++h) {
                uint32_t u = order[h], first = reg.edges;
                raw.each(u, [&](uint32_t e, size_t slot) {
                    uint32_t y = raw.head(e);
                    if (y == u) return;
                    uint32_t pos = reg.edges++;
                    uint64_t w = raw.weight(e, slot);
                    if (!test(bypass, y)) { claim(y); put(pos, y, w); return; }
                    if (walks_.size() == walking) walks_.resize(2 * walking + 64);
                    walks_[walking++] = {pos, u, u, y, w, 0};
                    __builtin_prefetch(&raw.slot[size_t(y) * 4]);
                });
                uint32_t d = reg.edges - first;
                reg.degree[h] = static_cast<uint8_t>(std::min(d, 255u));
                if (d >= 255) reg.wide.push_back({h, d});
                if (d > 4) reg.extra += d - 2;
            }
            while (walking) {
                size_t kept = 0;
                for (size_t i = 0; i < walking; ++i) if (step(walks_[i])) walks_[kept++] = walks_[i];
                walking = kept;
            }
            reg.expanded = hi;
        }
    }
};

struct Graph {
    std::unique_ptr<Rows> fwd, rev;
};

struct Query { uint32_t from, to; };

// Grows the regions, then concatenates them into the forward rows; ref maps raw ids to search ids.
static Graph build_forward(Rows& raw, const Bits& bypass, size_t m, unsigned threads, std::vector<Query>& queries) {
    uint32_t n = raw.n;
    unsigned lbits = id_bits(uint64_t(n) + 1);
    Array<uint32_t> regref(n);
    Bits claimed((size_t(n) + 63) / 64, 0);
    std::vector<Region> regions(threads);
    parallel(threads, [&](unsigned t) {
        Region& reg = regions[t];
        reg.order = Array<uint32_t>(n, true);
        reg.degree = Array<uint8_t>(n, true);
        reg.out = Array<uint32_t>(m, true);
        Grower grower(raw, bypass, claimed, reg);
        // Seeds are the unclaimed survivors of this worker's raw-id slice, so idle workers start new regions.
        uint32_t lo = static_cast<uint32_t>(size_t(n) * t / threads), hi = static_cast<uint32_t>(size_t(n) * (t + 1) / threads);
        for (uint32_t x = lo; x < hi; ++x)
            if (!test(bypass, x) && grower.seed(x)) grower.expand();
        // A vertex listed twice is named by whichever entry lands last, consistently for every head.
        for (uint32_t i = 0; i < reg.len; ++i) __atomic_store_n(&regref[reg.order[i]], t << lbits | i, __ATOMIC_RELAXED);
    });
    mark("grow");
    raw.slot.release();
    std::vector<uint32_t> base(threads + 1, 0), ebase(threads + 1, 0), xbase(threads + 1, 0);
    for (unsigned t = 0; t < threads; ++t) {
        const Region& reg = regions[t];
        base[t + 1] = base[t] + reg.len;
        ebase[t + 1] = ebase[t] + reg.edges;
        xbase[t + 1] = static_cast<uint32_t>(xbase[t] + reg.extra);
    }
    auto locate = [&](uint32_t r) { return base[r >> lbits] + (r & ((uint32_t(1) << lbits) - 1)); };
    Graph g;
    g.fwd = std::make_unique<Rows>(base[threads], xbase[threads]);
    Rows& fwd = *g.fwd;
    std::vector<Escapes> escapes(threads);
    parallel(threads, [&](unsigned t) {
        Region& reg = regions[t];
        std::sort(reg.escapes.begin(), reg.escapes.end());
        uint32_t pos = 0;
        size_t esc = 0, wide = 0, at = size_t(fwd.n) * 4 + xbase[t];
        for (uint32_t i = 0; i < reg.len; ++i) {
            uint32_t id = base[t] + i, d = reg.degree[i] == 255 ? reg.wide[wide++].second : reg.degree[i];
            uint32_t* r = &fwd.slot[size_t(id) * 4];
            r[0] = r[1] = r[2] = r[3] = Rows::EMPTY;
            size_t list = 0;
            if (d > 4) { list = at; r[3] = fwd.spill + static_cast<uint32_t>(at - size_t(fwd.n) * 4); fwd.slot[at] = d - 3; at += d - 2; }
            for (uint32_t k = 0; k < d; ++k, ++pos) {
                uint32_t e = reg.out[pos];
                uint64_t w = e & raw.mask;
                if (w == raw.mask) w = reg.escapes[esc++].second;
                fwd.put(Rows::where(id, k, list), locate(regref[raw.head(e)]), w, escapes[t]);
            }
        }
    });
    sort_merge(fwd.escapes, escapes);
    for (Query& q : queries) q = {locate(regref[q.from]), locate(regref[q.to])};
    return g;
}

// Transposes the forward rows. Each worker owns an id range; in-edges from other ranges travel through inboxes.
static void add_reverse(Graph& g, unsigned threads) {
    const Rows& fwd = *g.fwd;
    uint32_t n = fwd.n;
    struct Remote { uint32_t head, tail; uint64_t w; };
    std::vector<std::vector<std::vector<Remote>>> box(threads, std::vector<std::vector<Remote>>(threads));
    std::vector<uint32_t> cut(threads + 1);
    for (unsigned t = 0; t <= threads; ++t) cut[t] = static_cast<uint32_t>(size_t(n) * t / threads);
    Array<uint32_t> degree(n), placed(n);
    std::vector<size_t> extra(threads + 1, 0);
    std::vector<Escapes> escapes(threads);
    std::atomic<unsigned> arrived{0};
    auto barrier = [&](unsigned round) { arrived.fetch_add(1); while (arrived.load() < round * threads) std::this_thread::yield(); };
    parallel(threads, [&](unsigned t) {
        uint32_t lo = cut[t], hi = cut[t + 1];
        memset(&degree[lo], 0, size_t(hi - lo) * 4);
        memset(&placed[lo], 0, size_t(hi - lo) * 4);
        for (uint32_t u = lo; u < hi; ++u)
            fwd.each(u, [&](uint32_t e, size_t i) {
                uint32_t v = fwd.head(e);
                if (v >= lo && v < hi) ++degree[v];
                else box[t][std::upper_bound(cut.begin(), cut.end(), v) - cut.begin() - 1].push_back({v, u, fwd.weight(e, i)});
            });
        barrier(1);
        for (unsigned s = 0; s < threads; ++s) for (const Remote& r : box[s][t]) ++degree[r.head];
        for (uint32_t v = lo; v < hi; ++v) extra[t + 1] += degree[v] > 4 ? degree[v] - 2 : 0;
        barrier(2);
        if (t == 0) {
            for (unsigned s = 0; s < threads; ++s) extra[s + 1] += extra[s];
            g.rev = std::make_unique<Rows>(n, extra[threads]);
        }
        barrier(3);
        Rows& rev = *g.rev;
        size_t at = size_t(n) * 4 + extra[t];
        for (uint32_t v = lo; v < hi; ++v) {
            uint32_t* r = &rev.slot[size_t(v) * 4];
            r[0] = r[1] = r[2] = r[3] = Rows::EMPTY;
            if (degree[v] > 4) { r[3] = rev.spill + static_cast<uint32_t>(at - size_t(n) * 4); rev.slot[at] = degree[v] - 3; at += degree[v] - 2; }
        }
        auto add = [&](uint32_t v, uint32_t u, uint64_t w) {
            uint32_t k = placed[v]++;
            size_t i = degree[v] <= 4 || k < 3 ? size_t(v) * 4 + k : size_t(n) * 4 + (rev.slot[size_t(v) * 4 + 3] - rev.spill) + k - 2;
            rev.put(i, u, w, escapes[t]);
        };
        for (uint32_t u = lo; u < hi; ++u)
            fwd.each(u, [&](uint32_t e, size_t i) {
                uint32_t v = fwd.head(e);
                if (v >= lo && v < hi) add(v, u, fwd.weight(e, i));
            });
        for (unsigned s = 0; s < threads; ++s) for (const Remote& r : box[s][t]) add(r.head, r.tail, r.w);
    });
    sort_merge(g.rev->escapes, escapes);
}

static std::vector<Query> read_queries(const std::string& path) {
    MappedFile file(path);
    std::vector<Query> result;
    const char* p = file.data;
    const char* end = p + file.size;
    while (p < end) {
        uint32_t x[2] = {0, 0};
        for (uint32_t& v : x) { while (*p >= '0') v = v * 10 + static_cast<uint32_t>(*p++ - '0'); ++p; }
        result.push_back({x[0], x[1]});
    }
    return result;
}

static Graph read_graph(const std::string& path, std::vector<Query>& queries, unsigned threads) {
    MappedFile file(path);
    const char* lo = file.data;
    const char* hi = lo + file.size;
    uint32_t head[2] = {0, 0};
    const char* p = lo;
    for (uint32_t& v : head) { while (*p >= '0') v = v * 10 + static_cast<uint32_t>(*p++ - '0'); ++p; }
    uint32_t n = head[0];
    unsigned shift = std::max(6u, std::min(11u, 32 - id_bits(n))); // bucket key and head share 32 bits
    size_t buckets = (static_cast<size_t>(n) + (size_t(1) << shift) - 1) >> shift;
    std::vector<const char*> cut(threads + 1, hi);
    cut[0] = p;
    for (unsigned i = 1; i < threads; ++i) {
        const char* q = p + static_cast<size_t>(hi - p) * i / threads;
        q = static_cast<const char*>(memchr(q, '\n', static_cast<size_t>(hi - q)));
        cut[i] = q ? q + 1 : hi;
    }
    Bits terminal((size_t(n) + 63) / 64, 0), bypass((size_t(n) + 63) / 64, 0);
    for (const Query& q : queries) { terminal[q.from >> 6] |= 1ull << (q.from & 63); terminal[q.to >> 6] |= 1ull << (q.to & 63); }
    Rows raw(n, head[1] + threads);
    {
        std::vector<Binner> bins;
        for (unsigned t = 0; t < threads; ++t) bins.emplace_back(shift, id_bits(n), buckets, static_cast<size_t>(cut[t + 1] - cut[t]) / 6 + 1);
        parallel(threads, [&](unsigned t) {
            parse_lines(lo, hi, cut[t], cut[t + 1], [&](uint32_t u, uint32_t v, uint32_t w) { bins[t].add(u, v, w); });
            bins[t].finish();
        });
        mark("parse");
        bins_to_rows(bins, shift, terminal, raw, bypass, threads);
        mark("rows");
    }
    Graph g = build_forward(raw, bypass, head[1], threads, queries);
    mark("forward");
    return g;
}

// ---------------------------------------------------------------- queries

struct HeapNode { uint64_t distance; uint32_t node; };
// Bucketed monotone queue: width 2^shift buckets in a ring; larger jumps wait in a binary heap.
// push writes unconditionally and counts the entry only when `take`, so relaxations need no branch.
struct Heap {
    static constexpr unsigned B = 2048, SHIFT_MAX = 7;
    struct Bucket { uint32_t* data = nullptr; uint32_t size = 0, cap = 0; };
    std::array<Bucket, B> bucket;
    std::array<uint64_t, B / 64> occupied{};
    std::vector<HeapNode> far;
    uint64_t cur = 0;
    size_t near = 0;
    unsigned shift = 0, node_bits = 32;
    static bool later(const HeapNode& a, const HeapNode& b) { return a.distance > b.distance; }
    explicit Heap(uint32_t n) : shift(std::min(SHIFT_MAX, 32 - id_bits(n))), node_bits(32 - shift) {}
    ~Heap() { for (Bucket& k : bucket) free(k.data); }
    void clear() {
        for (size_t w = 0; w < occupied.size(); ++w)
            for (uint64_t bits = occupied[w]; bits; bits &= bits - 1) bucket[w * 64 + __builtin_ctzll(bits)].size = 0;
        occupied.fill(0);
        far.clear();
        cur = 0;
        near = 0;
    }
    void push(uint64_t d, uint32_t v, bool take = true) {
        if ((d >> shift) - cur >= B) {
            if (take) { far.push_back({d, v}); std::push_heap(far.begin(), far.end(), later); }
            return;
        }
        unsigned b = (d >> shift) & (B - 1);
        Bucket& k = bucket[b];
        if (k.size == k.cap) {
            k.cap = std::max(16u, k.cap * 2);
            k.data = static_cast<uint32_t*>(realloc(k.data, k.cap * sizeof(uint32_t)));
            if (!k.data) std::exit(2);
        }
        k.data[k.size] = v | static_cast<uint32_t>((d & ((uint64_t(1) << shift) - 1)) << node_bits);
        k.size += take;
        occupied[b >> 6] |= uint64_t(take) << (b & 63);
        near += take;
    }
    // Positions cur on the first nonempty bucket and returns its smallest possible key; INF if empty.
    uint64_t lower_bound() {
        if (near) {
            unsigned b = cur & (B - 1), w = b >> 6;
            uint64_t bits = occupied[w] & (~0ull << (b & 63));
            while (!bits) { w = (w + 1) & (B / 64 - 1); bits = occupied[w]; }
            cur += (((w << 6) | __builtin_ctzll(bits)) - b) & (B - 1);
        } else if (!far.empty()) {
            cur = far.front().distance >> shift;
        } else {
            return INF;
        }
        while (!far.empty() && (far.front().distance >> shift) - cur < B) {
            HeapNode x = far.front();
            std::pop_heap(far.begin(), far.end(), later);
            far.pop_back();
            push(x.distance, x.node);
        }
        return cur << shift;
    }
};

// Distances live in fixed pages materialized on first write and recycled per query, so memory tracks the search, not n.
class Distances {
    static constexpr unsigned SHIFT = 7, SIZE = 1u << SHIFT;
    std::vector<uint64_t*> dir_;
    std::vector<uint32_t> used_;
    std::vector<std::unique_ptr<uint64_t[]>> store_;
    std::array<uint64_t, SIZE> blank_;
    uint64_t* acquire(uint32_t page) {
        if (used_.size() == store_.size()) store_.emplace_back(new uint64_t[SIZE]);
        uint64_t* p = store_[used_.size()].get();
        std::fill(p, p + SIZE, INF);
        used_.push_back(page);
        return dir_[page] = p;
    }
public:
    explicit Distances(uint32_t n) : dir_((n >> SHIFT) + 1) { blank_.fill(INF); std::fill(dir_.begin(), dir_.end(), blank_.data()); }
    uint64_t get(uint32_t v) const { return dir_[v >> SHIFT][v & (SIZE - 1)]; }
    // A writable label for v; a page is materialized first, as any finite distance improves a blank one.
    uint64_t* slot(uint32_t v) {
        uint64_t* p = dir_[v >> SHIFT];
        if (p == blank_.data()) p = acquire(v >> SHIFT);
        return p + (v & (SIZE - 1));
    }
    void reset() {
        for (uint32_t page : used_) dir_[page] = blank_.data();
        used_.clear();
    }
};

struct Side {
    const Rows& g;
    Distances dist;
    Heap heap;
    Side(const Rows& c) : g(c), dist(c.n), heap(c.n) {}
    void start(uint32_t s) { dist.reset(); heap.clear(); *dist.slot(s) = 0; heap.push(0, s); }
    // Settles every vertex of the current bucket (re-draining entries it adds) and returns how many were expanded.
    // Relaxations are branch-free: nd + other(v) is a real s-t path length whether or not v improved.
    size_t drain(const Side& other, uint64_t& best) {
        Heap::Bucket& bk = heap.bucket[heap.cur & (Heap::B - 1)];
        const uint64_t base = heap.cur << heap.shift;
        const uint32_t node_mask = static_cast<uint32_t>((uint64_t(1) << heap.node_bits) - 1);
        size_t count = 0;
        while (bk.size) {
            if (bk.size >= 3) __builtin_prefetch(&g.slot[size_t(bk.data[bk.size - 3] & node_mask) * 4], 0, 1);
            uint32_t entry = bk.data[--bk.size];
            --heap.near;
            uint32_t u = entry & node_mask;
            uint64_t d = base | (uint64_t(entry) >> heap.node_bits);
            if (dist.get(u) != d) continue;
            ++count;
            g.each(u, [&](uint32_t e, size_t i) {
                uint32_t v = g.head(e);
                uint64_t w = e & g.mask;
                if (w == g.mask) w = g.weight(e, i);
                uint64_t nd = d + w, *x = dist.slot(v), old = *x;
                bool take = nd < old;
                *x = take ? nd : old;
                heap.push(nd, v, take);
                uint64_t meet = nd + other.dist.get(v);
                best = meet < best ? meet : best;
            });
        }
        unsigned b = heap.cur & (Heap::B - 1);
        heap.occupied[b >> 6] &= ~(1ull << (b & 63));
        return count;
    }
};

struct Worker {
    Side fwd, bwd;
    uint32_t probe;
    Worker(const Graph& g, uint32_t p) : fwd(*g.fwd), bwd(*g.rev), probe(p) {}
    int64_t solve(uint32_t s, uint32_t t) {
        if (s == t) return 0;
        if (fwd.g.slot[size_t(s) * 4] == Rows::EMPTY || bwd.g.slot[size_t(t) * 4] == Rows::EMPTY) return -1;
        bwd.dist.reset();
        fwd.start(s);
        uint64_t best = INF;
        size_t settled = 0;
        for (; settled < probe;) {
            uint64_t f = fwd.heap.lower_bound();
            uint64_t known = fwd.dist.get(t);
            if (known < f) return static_cast<int64_t>(known);
            if (f == INF) return -1;
            settled += fwd.drain(bwd, best);
        }
        bwd.start(t);
        best = std::min(best, fwd.dist.get(t));
        size_t fs = settled, bs = 0;
        for (;;) {
            uint64_t f = fwd.heap.lower_bound(), b = bwd.heap.lower_bound();
            if (f == INF || b == INF || f + b >= best) break;
            if (fs <= bs) fs += fwd.drain(bwd, best);
            else bs += bwd.drain(fwd, best);
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

static std::string option(const char* name, const char* fallback) {
    const char* v = getenv(name);
    return v ? v : fallback;
}

int main() {
    mark("start");
    std::string data = option("SD_DATA", "/data"), out = option("SD_OUT", "/out");
    unsigned threads = std::min(12u, std::max(1u, std::thread::hardware_concurrency()));
    if (getenv("SD_THREADS")) threads = std::max(1, std::min(64, atoi(getenv("SD_THREADS"))));
    uint32_t probe = std::max(0, atoi(option("SD_PROBE", "256").c_str()));
    std::vector<Query> queries = read_queries(data + "/queries.txt");
    Graph g = read_graph(data + "/graph.txt", queries, threads);
    add_reverse(g, threads);
    mark("reverse");
    std::vector<int64_t> answers(queries.size(), -1);
    std::vector<uint32_t> schedule(queries.size());
    std::iota(schedule.begin(), schedule.end(), 0);
    std::sort(schedule.begin(), schedule.end(), [&](uint32_t a, uint32_t b) { return queries[a].from < queries[b].from; });
    std::atomic<size_t> next{0};
    parallel(std::min<size_t>(threads, std::max<size_t>(1, queries.size())), [&](unsigned) {
        Worker worker(g, probe);
        for (size_t k; (k = next.fetch_add(1, std::memory_order_relaxed)) < queries.size();) {
            uint32_t i = schedule[k];
            answers[i] = worker.solve(queries[i].from, queries[i].to);
        }
    });
    mark("queries");
    write_results(out + "/distances.txt", answers);
    mark("write");
    _exit(0);
}
