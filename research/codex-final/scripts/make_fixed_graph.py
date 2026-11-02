from pathlib import Path
for name in ['fix_atomic','compact_bounded_pure_sse','compact_bounded_pure_sse_byte_cap6']:
 base=Path(f'work/variants/{name}.cpp').read_text()
 for kind in ['bins','graph','all']:
  s=base
  if kind in ['bins','all']:
   s=s.replace('  u32 bits, shift, buckets, cap;', '  static constexpr u32 bits = 21, shift = 11;\n  u32 buckets, cap;')
   old='''      : bits(id_bits(n)), shift(std::max(6u, std::min(11u, 32 - bits))),
        buckets(n >> shift), cap(cap), fill(buckets + 1), chunks(buckets + 1) {'''
   assert old in s
   s=s.replace(old,'''      : buckets(n >> shift), cap(cap), fill(buckets + 1), chunks(buckets + 1) {''')
  if kind in ['graph','all']:
   s=s.replace('  u32 n, m, wbits, mask, *off, *adj;', '  static constexpr u32 wbits = 11, mask = (1u << wbits) - 1;\n  u32 n, m, *off, *adj;')
   old='''      : n(n), m(m), wbits(32 - id_bits(n + 1)), mask((1u << wbits) - 1),
        off(off ? off : alloc<u32>(n + 1)), adj(adj ? adj : alloc<u32>(m)) {}'''
   assert old in s
   s=s.replace(old,'''      : n(n), m(m), off(off ? off : alloc<u32>(n + 1)), adj(adj ? adj : alloc<u32>(m)) {}''')
  if kind=='all':
   s=s.replace('unsigned id_bits(u64 n) { return n < 2 ? 1 : 64 - __builtin_clzll(n - 1); }\n','')
  Path(f'work/variants/fixed_{kind}_{name}.cpp').write_text(s)
