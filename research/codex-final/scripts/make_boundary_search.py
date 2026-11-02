from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('template <class L> struct Worker');b=s.index('\nint main()',a)
s=s[:a]+'''template <class L> struct Worker {
  Side<L> fwd, bwd;
  u64 base = 0;
  // Each nontrivial path pays a first and a last edge. Remove the common
  // minimum boundary costs and search between the two sets of neighbors.
  u64 seed(Side<L> &side, u32 root) {
    const Graph &g = side.g;
    u64 least = INF;
    side.dist.reset(), side.queue.clear();
    *side.dist.slot(root) = 0;
    for (u32 i = g.off[root]; i < g.off[root + 1]; ++i)
      if (g.head(g.adj[i]) != root) least = std::min(least, g.weight(i));
    for (u32 i = g.off[root]; i < g.off[root + 1]; ++i) {
      u32 v = g.head(g.adj[i]);
      if (v == root) continue;
      u64 d = g.weight(i) - least;
      L *x = side.dist.slot(v);
      u64 old = *x;
      *x = L(std::min(d, old));
      side.queue.push(d, v, d < old);
    }
    return least;
  }
  u64 solve(u32 s, u32 t) {
    base = 0;
    if (s == t) return 0;
    u64 a = seed(fwd, s), b = seed(bwd, t), direct = INF;
    for (u32 i = fwd.g.off[s]; i < fwd.g.off[s + 1]; ++i)
      if (fwd.g.head(fwd.g.adj[i]) == t)
        direct = std::min(direct, fwd.g.weight(i));
    if (a == INF || b == INF) return INF;
    base = a + b;
    if (direct <= base) { base = direct; return 0; }
    u64 best = direct < INF ? direct - base : INF, fs = 0, bs = 0;
    for (u32 i = fwd.g.off[s]; i < fwd.g.off[s + 1]; ++i) {
      u32 v = fwd.g.head(fwd.g.adj[i]);
      if (v != s && v != t)
        best = std::min(best, fwd.dist.get(v) + bwd.dist.get(v));
    }
    while (fs < 256) {
      u64 f = fwd.queue.lower_bound();
      if (f >= best || f == INF) return best;
      fs += fwd.drain(bwd, best);
    }
    for (;;) {
      u64 f = fwd.queue.lower_bound(), b = bwd.queue.lower_bound();
      if (f == INF || b == INF || f + b >= best) return best;
      if (fs <= bs) fs += fwd.drain(bwd, best);
      else bs += bwd.drain(fwd, best);
    }
  }
};
'''+s[b:]
s=s.replace('      u64 d = narrow.solve(s, t);','      u64 d = narrow.solve(s, t), base = narrow.base;')
s=s.replace('        d = wide->solve(s, t);','        d = wide->solve(s, t), base = wide->base;')
s=s.replace('int64_t(d) : -1','int64_t(d + base) : -1')
Path('work/variants/boundary_search.cpp').write_text(s)
for probe in [0,64]:
 Path(f'work/variants/boundary_search{probe}.cpp').write_text(s.replace('while (fs < 256)',f'while (fs < {probe})'))
