from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
a=s.index('// ---------------------------------------------------------------- queries')
merged=r'''
// One shared adjacency union for both directions. Zero means absent, the
// largest field escapes, and every other field stores weight+1.
struct Merged {
  struct __attribute__((packed)) Edge { u32 low; uint16_t high; };
  struct Row { u32 start, length; };
  u32 n, wbits, mask;
  size_t capacity;
  Edge *adj;
  Row *rows;
  Escapes esc;
  Merged(Graph &g, Graph &r, unsigned threads)
      : n(g.n), wbits((48 - id_bits(n)) / 2), mask((1u << wbits) - 1),
        capacity(size_t(g.m) * 2), adj(alloc<Edge>(capacity)), rows(alloc<Row>(n)) {
    std::vector<Escapes> heavy(threads);
    parallel(threads, [&](unsigned t) {
      u32 lo = cut(n, t, threads), hi = cut(n, t + 1, threads);
      size_t at = size_t(g.off[lo]) + r.off[lo];
      std::vector<std::pair<u32, u64>> edges;
      u32 first = lo;
      auto reclaim = [&](Graph &old, u32 end) {
        size_t begin = (size_t(old.off[first]) * 4 + 4095) & ~size_t(4095);
        size_t stop = size_t(old.off[end]) * 4 & ~size_t(4095);
        if (stop > begin) madvise((char *)old.adj + begin, stop - begin, MADV_DONTNEED);
      };
      for (u32 u = lo; u < hi; ++u) {
        edges.clear();
        for (u32 i = g.off[u]; i < g.off[u + 1]; ++i)
          edges.push_back({g.head(g.adj[i]) * 2, g.weight(i)});
        for (u32 i = r.off[u]; i < r.off[u + 1]; ++i)
          edges.push_back({r.head(r.adj[i]) * 2 + 1, r.weight(i)});
        std::sort(edges.begin(), edges.end());
        size_t begin = at;
        for (size_t j = 0; j < edges.size();) {
          u32 v = edges[j].first / 2;
          u64 word = u64(v) << (2 * wbits);
          while (j < edges.size() && edges[j].first / 2 == v) {
            u32 dir = edges[j].first & 1;
            u64 weight = edges[j].second;
            do { ++j; } while (j < edges.size() && edges[j].first == v * 2 + dir);
            if (weight + 1 >= mask) heavy[t].push_back({at * 2 + dir, weight});
            word |= std::min<u64>(weight + 1, mask) << (dir * wbits);
          }
          adj[at++] = {u32(word), uint16_t(word >> 32)};
        }
        rows[u] = {u32(begin), u32(at - begin)};
        if (u + 1 == hi || u - first >= 8192) {
          reclaim(g, u + 1), reclaim(r, u + 1); first = u + 1;
        }
      }
    });
    for (const auto &part : heavy) esc.insert(esc.end(), part.begin(), part.end());
    std::sort(esc.begin(), esc.end());
  }
};
struct SearchGraph {
  Merged &g;
  u32 direction, n;
  Merged::Edge *adj;
  Merged::Row *rows;
  SearchGraph(Merged &g, u32 d) : g(g), direction(d), n(g.n), adj(g.adj), rows(g.rows) {}
  u32 begin(u32 u) const { return rows[u].start; }
  u32 end(u32 u) const { return rows[u].start + rows[u].length; }
  u64 word(Merged::Edge e) const { return e.low | u64(e.high) << 32; }
  u32 head(Merged::Edge e) const { return word(e) >> (2 * g.wbits); }
  u64 weight(u32 i) const {
    u32 w = word(adj[i]) >> (direction * g.wbits) & g.mask;
    if (!w) return INF;
    return w == g.mask ? std::lower_bound(g.esc.begin(), g.esc.end(), std::pair(size_t(i) * 2 + direction, u64(0)))->second : w - 1;
  }
};
'''
s=s[:a]+merged+s[a:]
a=s.index('// ---------------------------------------------------------------- queries')
x=s[a:].replace('const Graph &g;','const SearchGraph &g;').replace('explicit Side(const Graph &g)','explicit Side(const SearchGraph &g)')
x=x.replace('&g.off[ahead]','&g.rows[ahead]').replace('g.off[ahead]','g.begin(ahead)').replace('g.off[u + 1]','g.end(u)').replace('g.off[u]','g.begin(u)')
x=x.replace('fwd.g.off[s + 1]','fwd.g.end(s)').replace('fwd.g.off[s]','fwd.g.begin(s)').replace('bwd.g.off[t + 1]','bwd.g.end(t)').replace('bwd.g.off[t]','bwd.g.begin(t)')
x=x.replace('        L *x = dist.slot(v);\n        u64 nd = d + g.weight(i), old = *x;','        u64 weight = g.weight(i);\n        if (weight == INF) continue;\n        L *x = dist.slot(v);\n        u64 nd = d + weight, old = *x;')
x=x.replace('  size_t queries = ends.size() / 2;','  Merged shared(*fwd, *rev, threads);\n  delete fwd; delete rev;\n  SearchGraph forward(shared, 0), backward(shared, 1);\n  size_t queries = ends.size() / 2;')
x=x.replace('Side<u32>(*fwd), Side<u32>(*rev)','Side<u32>(forward), Side<u32>(backward)').replace('Side<u64>(*fwd), Side<u64>(*rev)','Side<u64>(forward), Side<u64>(backward)')
s=s[:a]+x
Path('work/variants/merged6.cpp').write_text(s)
