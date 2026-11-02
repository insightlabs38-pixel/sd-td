from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('#include <numeric>','#include <numeric>\n#include <pthread.h>\n#include <malloc.h>')
s=s.replace('  u64 occupied[B / 64] = {}, cur = 0, near = 0;', '  u64 occupied[B / 64] = {}, cur = 0, near = 0;\n  u32 read = 0;')
s=s.replace('    far = {}, cur = near = 0;','    far = {}, cur = near = read = 0;')
pos=s.index('  // Moves cur to the first nonempty bucket')
s=s[:pos]+'''  u64 peek() const {
    if (!near) return far.empty() ? INF : (far.top().first >> shift) << shift;
    u32 b = cur % B, w = b / 64;
    u64 bits = occupied[w] & (~u64(0) << b % 64);
    while (!bits) bits = occupied[w = (w + 1) % (B / 64)];
    return (cur + (w * 64 + __builtin_ctzll(bits) - b) % B) << shift;
  }
'''+s[pos:]
pos=s.index('// Labels in pages of 128')
metric='''// A clipped undirected distance is a feasible potential in either sign.
// Owners update disjoint label blocks between expansion phases, without CAS.
template <unsigned P = 0>
std::vector<u32> metric(const Graph &f, const Graph &r, unsigned workers) {
  unsigned count = P ? P : workers;
  std::vector<u32> d(f.n, ~u32(0));
  if (!f.n) return d;
  std::vector<Queue> queues;
  queues.reserve(count);
  for (unsigned t = 0; t < count; ++t) queues.emplace_back(f.n);
  std::vector<std::vector<std::vector<u64>>> mail(
      count, std::vector<std::vector<u64>>(count));
  struct alignas(64) Minimum { u64 key = INF; };
  std::vector<Minimum> minima(count);
  pthread_barrier_t barrier;
  if (pthread_barrier_init(&barrier, nullptr, count)) exit(2);
  d[0] = 0;
  queues[0].push(0, 0);
  u64 frontier = 0;
  parallel(count, [&](unsigned t) {
    Queue &q = queues[t];
    while (frontier != INF) {
      q.cur = frontier;
      for (; !q.far.empty() && (q.far.top().first >> q.shift) - q.cur < Queue::B; q.far.pop())
        q.push(q.far.top().first, q.far.top().second);
      auto &bucket = q.bucket[q.cur % Queue::B];
      for (u32 k = 0; k < bucket.size; ++k) {
        u32 u = bucket.data[k] & ((1u << q.node_bits) - 1);
        u64 distance = q.cur << q.shift | bucket.data[k] >> q.node_bits;
        if (d[u] != distance) continue;
        for (const Graph *g : {&f, &r})
          for (u32 i = g->off[u]; i < g->off[u + 1]; ++i) {
            u32 v = g->head(g->adj[i]);
            u64 nd = distance + g->weight(i);
            if (nd < d[v])
              mail[t][(v >> 6) % count].push_back(nd << 32 | v);
          }
      }
      q.near -= bucket.size;
      bucket.size = 0;
      q.occupied[q.cur % Queue::B / 64] &= ~(u64(1) << q.cur % 64);
      pthread_barrier_wait(&barrier);
      for (unsigned from = 0; from < count; ++from) {
        auto &in = mail[from][t];
        for (u64 entry : in) {
          u32 v = entry, nd = entry >> 32;
          if (nd < d[v]) d[v] = nd, q.push(nd, v);
        }
        in.clear();
      }
      minima[t].key = q.peek();
      pthread_barrier_wait(&barrier);
      if (t == 0) {
        frontier = INF;
        for (auto m : minima) frontier = std::min(frontier, m.key);
        if (frontier != INF) frontier >>= q.shift;
      }
      pthread_barrier_wait(&barrier);
    }
  });
  pthread_barrier_destroy(&barrier);
  for (auto &q : queues) for (auto &b : q.bucket) free(b.data);
  return d;
}

'''
s=s[:pos]+metric+s[pos:]
s=s.replace('  const Graph &g;\n  Labels<L> dist;','  const Graph &g;\n  const std::vector<u32> &potential;\n  int direction = 1;\n  Labels<L> dist;')
s=s.replace('  explicit Side(const Graph &g) : g(g), dist(g.n), queue(g.n) {}','  Side(const Graph &g, const std::vector<u32> &p)\n      : g(g), potential(p), dist(g.n), queue(g.n) {}')
s=s.replace('  template <unsigned W = 0> size_t drain_bits(const Side &other, u64 &best) {','  template <unsigned W = 0, int D = 1> size_t drain_bits(const Side &other, u64 &best) {')
s=s.replace('    for (u32 k = 0; k < bk.size; ++k) {','    u32 first = queue.read, end = std::min(bk.size, first + 64);\n    for (u32 k = first; k < end; ++k) {')
s=s.replace('      ++settled;\n      for (u32 i = g.off[u];','      ++settled;\n      u64 pu = potential[u];\n      for (u32 i = g.off[u];')
s=s.replace('        u64 nd = d + (w == mask ? g.weight(i) : w), old = *x;','        u64 pv = potential[v];\n        u64 nd = d + (w == mask ? g.weight(i) : w);\n        nd += D > 0 ? pu : pv;\n        nd -= D > 0 ? pv : pu;\n        u64 old = *x;')
s=s.replace('    queue.near -= bk.size, bk.size = 0;\n    queue.occupied[queue.cur % Queue::B / 64] &= ~(u64(1) << queue.cur % 64);','    queue.read = end;\n    queue.near -= end - first;\n    if (end == bk.size) {\n      bk.size = queue.read = 0;\n      queue.occupied[queue.cur % Queue::B / 64] &= ~(u64(1) << queue.cur % 64);\n    }')
s=s.replace('    return g.wbits == 11 ? drain_bits<11>(other, best)\n                         : drain_bits<>(other, best);','    if (direction > 0)\n      return g.wbits == 11 ? drain_bits<11, 1>(other, best) : drain_bits<0, 1>(other, best);\n    return g.wbits == 11 ? drain_bits<11, -1>(other, best) : drain_bits<0, -1>(other, best);')
s=s.replace('  u64 solve(u32 s, u32 t) {\n    if (s == t)', '  u64 solve(u32 s, u32 t) {\n    fwd.direction = fwd.potential[s] <= fwd.potential[t] ? 1 : -1;\n    bwd.direction = -fwd.direction;\n    if (s == t)')
s=s.replace('      if (known < f || f == INF)', '      if (known <= f || f == INF)')
s=s.replace('  size_t queries = ends.size() / 2;','  unsigned index_workers = std::min(threads, 6u);\n  if (getenv("SD_INDEX_THREADS")) index_workers = std::clamp(atoi(getenv("SD_INDEX_THREADS")), 1, int(threads));\n  auto potentials = index_workers == 6 ? metric<6>(*fwd, *rev, index_workers)\n           : index_workers == 4 ? metric<4>(*fwd, *rev, index_workers)\n                               : metric<>(*fwd, *rev, index_workers);\n  malloc_trim(0);\n  size_t queries = ends.size() / 2;')
s=s.replace('Side<uint16_t>(*fwd), Side<uint16_t>(*rev)','Side<uint16_t>(*fwd, potentials), Side<uint16_t>(*rev, potentials)').replace('Side<u64>(*fwd), Side<u64>(*rev)','Side<u64>(*fwd, potentials), Side<u64>(*rev, potentials)')
s=s.replace('      answers[i] = d < INF ? int64_t(d) : -1;','      u64 delta = potentials[s] > potentials[t] ? potentials[s] - potentials[t] : potentials[t] - potentials[s];\n      answers[i] = d < INF ? int64_t(d + delta) : -1;')
Path('work/variants/one_potential.cpp').write_text(s)
