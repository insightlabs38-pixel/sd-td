from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('struct alignas(64) Region {\n  u32 *order, *ends, *out, len = 0, edges = 0;', '''constexpr u32 ORDER_BITS = 23, ORDER_MASK = (1u << ORDER_BITS) - 1;
constexpr u32 DEGREE_MASK = (1u << (32 - ORDER_BITS)) - 1;
struct alignas(64) Region {
  u32 *order, *out, len = 0, edges = 0;
  std::vector<u32> prefix;
  u32 degree(u32 i, u32 packed) const {
    u32 d = packed >> ORDER_BITS;
    return d == DEGREE_MASK
      ? std::lower_bound(esc.begin(), esc.end(), std::pair(~size_t(0) - i, 0ul))->second
      : d;
  }''')
s=s.replace('''      for (u32 h = lo; h < hi; ++h)
        expand(reg.order[h], walking), reg.ends[h] = reg.edges;''','''      for (u32 h = lo; h < hi; ++h) {
        u32 start = reg.edges;
        if (h % 256 == 0) reg.prefix.push_back(start);
        expand(reg.order[h], walking);
        u32 degree = reg.edges - start;
        if (degree >= DEGREE_MASK) reg.esc.push_back({~size_t(0) - h, degree});
        reg.order[h] |= std::min(degree, DEGREE_MASK) << ORDER_BITS;
      }''')
s=s.replace('reg.order = alloc<u32>(n), reg.ends = alloc<u32>(n),\n    reg.out = alloc<u32>(m);','reg.order = alloc<u32>(n), reg.out = alloc<u32>(m);')
s=s.replace('r->off[v] = pos += r->off[v];','r->off[v] = pos += r->off[v] & ORDER_MASK;')
# Sort mixed edge-weight and degree escapes before the id mapping phase.
pos=s.index('  // Raw id -> new id.')
s=s[:pos]+'''  for (Region &reg : regions) std::sort(reg.esc.begin(), reg.esc.end());
  std::vector<u32> starts(threads);
'''+s[pos:]
s=s.replace('''    each(k, [&](unsigned t, u32 lo, u32 hi) {
      for (u32 i = lo; i < hi; ++i)
        __atomic_store_n(&where[regions[t].order[i]], base[t] + i,''','''    each(k, [&](unsigned t, u32 lo, u32 hi) {
      Region &reg = regions[t];
      if (lo) {
        u32 pos = reg.prefix[lo / 256];
        for (u32 i = lo / 256 * 256; i < lo; ++i) pos += reg.degree(i, reg.order[i]);
        starts[k] = pos;
      }
      for (u32 i = lo; i < hi; ++i)
        __atomic_store_n(&where[reg.order[i] & ORDER_MASK], base[t] + i,''')
s=s.replace('    std::sort(reg.esc.begin(), reg.esc.end());\n    orders.push_back', '    orders.push_back')
s=s.replace('  Reverse rev(g->n, g->m, cuts, splice<u32>(orders, total + 1));','''  // Move whole pages, then close the page-padding gaps before retaining
  // the degree bits above the reverse counters. Every legal indegree fits
  // below bit 23, so counting cannot modify the degree field.
  u32 *packed = splice<u32>(orders, total + 1 + threads * 1024);
  size_t at = 0;
  for (unsigned t = 0; t < threads; ++t) {
    memmove(packed + base[t], packed + at, regions[t].len * 4ul);
    at += (regions[t].len + 1023) / 1024 * 1024;
  }
  Reverse rev(g->n, g->m, cuts, packed);''')
s=s.replace('    std::fill(rev.r->off + cuts[k], rev.r->off + cuts[k + 1], 0);','''    for (u32 u = cuts[k]; u < cuts[k + 1]; ++u) rev.r->off[u] &= ~ORDER_MASK;''')
s=s.replace('u32 pos = lo ? reg.ends[lo - 1] : 0, shift = edges[t];','u32 pos = lo ? starts[k] : 0, shift = edges[t];')
s=s.replace('''        for (; pos < reg.ends[i]; ++pos) {''','''        u32 end = pos + reg.degree(i, rev.r->off[base[t] + i]);
        for (; pos < end; ++pos) {''')
s=s.replace('  for (Region &reg : regions)\n    release(reg.ends, n);\n','')
Path('work/variants/packed_order.cpp').write_text(s)
