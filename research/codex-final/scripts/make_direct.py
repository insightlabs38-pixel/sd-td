from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('  static constexpr u32 BATCH = 8;',s.index('struct Grower'));b=s.index('  const Graph &raw;',a)
s=s[:a]+s[b:]
s=s.replace('  std::vector<Walk> walks;\n','')
a=s.index('  // Advances a walk');b=s.index('\n};',a)
s=s[:a]+'''  void grow(u32 z) {
    u32 lo = reg.len;
    claim(z);
    for (; lo < reg.len; ++lo) {
      u32 u = reg.order[lo];
      for (u32 h = lo + 1; h < std::min(reg.len, lo + 9); ++h)
        __builtin_prefetch(&raw.adj[4 * size_t(reg.order[h])]);
      for (auto [i, end] = row(raw, u); i < end; ++i) {
        u32 v = raw.head(raw.adj[i]);
        if (v != u) {
          claim(v);
          put(reg.edges++, v, raw.weight(i));
        }
      }
      reg.ends[lo] = reg.edges;
    }
  }
'''+s[b:]
s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);','  std::fill(bypass.begin(), bypass.end(), 0);\n  auto [fwd, rev] = contract(raw, bypass, threads, ends);')
Path('work/variants/direct_bfs.cpp').write_text(s)
# Only remove degree-two eligibility, retaining all existing expansion/contraction logic.
s=Path('work/variants/fix_atomic.cpp').read_text()
pos=s.index('  auto [fwd, rev] = contract')
s=s[:pos]+'''  for (u32 u = 0; u < raw->n; ++u) {
    auto [a, b] = row(*raw, u);
    if (b - a > 1) bypass[u >> 6] &= ~(u64(1) << (u & 63));
  }
'''+s[pos:]
Path('work/variants/contract_one.cpp').write_text(s)
