from pathlib import Path
s=Path('work/variants/b_control.cpp').read_text()
s=s.replace('constexpr u32 NONE = ~0u, SPILL = ~1u;', 'constexpr u32 CLAIM = u32(1) << 31, NONE = CLAIM - 1, SPILL = NONE - 1;')
s=s.replace('  u64 weight(size_t i) const {\n    if ((adj[i] & mask) != mask)\n      return adj[i] & mask;', '  u32 edge(size_t i) const { return __atomic_load_n(&adj[i], __ATOMIC_RELAXED); }\n  u64 weight(size_t i) const {\n    u32 e = edge(i);\n    if ((e & mask) != mask)\n      return e & mask;')
s=s.replace('  Graph *g = new Graph(n, m, rows, rows);','  Graph *g = new Graph(n, m, rows, rows);\n  --g->wbits, g->mask >>= 1; // reserve the top raw-edge bit for claims')
s=s.replace('  if (r[0] == SPILL)\n', '  u32 first = raw.edge(4 * size_t(u)) & ~CLAIM;\n  if (first == SPILL)\n')
s=s.replace('(r[0] != NONE) + (r[1] != NONE)', '(first != NONE) + (r[1] != NONE)')
s=s.replace('  Bits &claimed;\n','').replace('  Bits claimed(bypass.size());\n','').replace('Grower grower{*raw, bypass, claimed, reg};','Grower grower{*raw, bypass, reg};')
a=s.index('  void claim(u32 z) {',s.index('struct Grower'));b=s.index('  void put(',a)
s=s[:a]+'''  void claim(u32 z) {
    u32 *flag = &raw.adj[4 * size_t(z)];
    if (raw.edge(4 * size_t(z)) & CLAIM)
      return;
    if (!(__atomic_fetch_or(flag, CLAIM, __ATOMIC_RELAXED) & CLAIM))
      reg.order[reg.len++] = z;
  }
'''+s[b:]
s=s.replace('raw.head(raw.adj[i])','raw.head(raw.edge(i) & ~CLAIM)')
s=s.replace('// Claims race without locked instructions: a vertex claimed twice leaves a\n  // copy that no edge reaches, as every head resolves through one map entry.', '// A raw row carries its globally unique claim bit. Lower raw weight\n  // precision uses exact escapes; queried CSR weights retain their precision.')
Path('work/variants/b_claimrow.cpp').write_text(s)
