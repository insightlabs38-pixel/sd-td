from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
for width in [16,64]:
 s=base
 a=s.index('  const char *field = begin;',s.index('void parse'));b=s.index('\n}\n\nu32 scan',a)
 s=s[:a]+'''  const char *field = begin, *chunk = begin, *block = begin;
  u64 mask = 0;
  char pad[WIDTH];
  auto next = [&] {
    if (!mask) {
      block = chunk, chunk += WIDTH;
      if (hi - block < WIDTH)
        memset(pad, '0', WIDTH), memcpy(pad, block, hi - block);
      mask = separators(hi - block < WIDTH ? pad : block);
    }
    const char *sep = block + __builtin_ctzll(mask);
    mask &= mask - 1;
    return sep;
  };
  while (field < end) {
    const char *a = next(), *b = next(), *c = next();
    u32 u = decimal(field, a, lo), v = decimal(a + 1, b, lo);
    u32 w = decimal(b + 1, c, lo);
    emit(u, v, w), field = c + 1;
  }'''+s[b:]
 if width==16:
  a=s.index('u64 separators(');b=s.index('// Value of the digits',a)
  s=s[:a]+'''u64 separators(const char *p) {
  __m128i x = _mm_loadu_si128(reinterpret_cast<const __m128i *>(p));
  return _mm_movemask_epi8(_mm_cmplt_epi8(x, _mm_set1_epi8('0')));
}

'''+s[b:]
 # A block can have no separators at width 16; refill until one is found.
 s=s.replace('    if (!mask) {','    while (!mask) {').replace('WIDTH',str(width))
 Path(f'work/variants/stream_parser{width}.cpp').write_text(s)
