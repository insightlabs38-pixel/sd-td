from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
# Mark branches eligible for inspection, while terminals remain hard stops.
s=s.replace('if (at[x] <= 2 && !test(terminal, v))','if (at[x] <= 4 && !test(terminal, v))')
pos=s.index('  // Advances a walk')
s=s[:pos]+'''  bool dead(u32 u, u32 parent) const {
    if (!test(bypass, u)) return false;
    auto [i, end] = row(raw, u);
    for (; i < end; ++i) {
      u32 v = raw.head(raw.adj[i]);
      if (v != u && v != parent) return false;
    }
    return true;
  }
'''+s[pos:]
s=s.replace('if (h != w.prev && h != w.at)','if (h != w.prev && h != w.at && !dead(h, w.at))')
s=s.replace('      if (y == u)\n        continue;','      if (y == u || dead(y, u))\n        continue;')
Path('work/variants/leaf_inline.cpp').write_text(s)
# Cache parent proofs while raw rows are in cache during construction; zero = no proof.
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('                  Bits &bypass, unsigned threads) {','                  Bits &bypass, unsigned threads, u32 *parents) {')
s=s.replace('      if (--left[b / Bins::GROUP] == 0)', '''      for (u32 x = 0; x < size; ++x) {
        u32 u = first + x, *r = rows + 4ul * u;
        if (r[0] == SPILL || test(terminal, u)) continue;
        u32 parent = NONE;
        for (u32 k = 0; k < 4 && r[k] != NONE; ++k) {
          u32 v = g->head(r[k]);
          if (v != u) {
            if (parent != NONE && parent != v) { parent = SPILL; break; }
            parent = v;
          }
        }
        if (parent < SPILL) parents[u] = parent + 1;
      }
      if (--left[b / Bins::GROUP] == 0)''')
s=s.replace('  const Bits &bypass;\n  Bits &claimed;', '  const Bits &bypass;\n  const u32 *parents;\n  Bits &claimed;')
s=s.replace('if (h != w.prev && h != w.at)','if (h != w.prev && h != w.at && parents[h] != w.at + 1)')
s=s.replace('      if (y == u)\n        continue;','      if (y == u || parents[y] == u + 1)\n        continue;')
s=s.replace('unsigned threads, std::vector<u32> &ends) {','unsigned threads, std::vector<u32> &ends, u32 *parents) {')
s=s.replace('Grower grower{*raw, bypass, claimed, reg};','Grower grower{*raw, bypass, parents, claimed, reg};')
s=s.replace('  u32 wbits = raw->wbits, mask = raw->mask;', '  release(parents, n);\n  u32 wbits = raw->wbits, mask = raw->mask;')
s=s.replace('  Graph *raw = read_graph(graph, graph + gsize, terminal, bypass, threads);', '''  u32 *parents = alloc<u32>(terminal.size() * 64);
  Graph *raw = read_graph(graph, graph + gsize, terminal, bypass, threads, parents);
  parallel(threads, [&](unsigned t) {
    for (u32 word = cut(bypass.size(), t, threads); word < cut(bypass.size(), t+1, threads); ++word)
      for (u32 u = word * 64; u < std::min(raw->n, word * 64 + 64); ++u) {
        if (test(terminal, u)) continue;
        auto [i, end] = row(*raw, u);
        u32 degree = 0;
        for (; i < end; ++i) {
          u32 v = raw->head(raw->adj[i]);
          degree += v != u && parents[v] != u + 1;
        }
        if (degree <= 2) set(bypass, u);
      }
  });''')
s=s.replace('contract(raw, bypass, threads, ends);','contract(raw, bypass, threads, ends, parents);')
Path('work/variants/leaf_cached.cpp').write_text(s)
