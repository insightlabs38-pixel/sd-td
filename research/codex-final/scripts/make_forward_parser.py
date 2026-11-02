from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('// Bit i is set when');b=s.index('// Maps a file read-only',a)
s=s[:a]+'''u32 scan(const char *&p) {
  u32 v = 0;
  while (*p >= '0') v = v * 10 + (*p++ - '0');
  return ++p, v;
}

// Digits have bit 4 set; both legal separators have it clear. The first
// clear byte locates a short integer. Eight-or-more digits use the scalar
// path, preserving the full uint32 range.
u32 number(const char *&p) {
  u64 x;
  memcpy(&x, p, 8);
  u64 separators = ~x & 0x1010101010101010;
  if (!separators) return scan(p);
  unsigned len = __builtin_ctzll(separators) / 8;
  p += len + 1;
  x = (x << (64 - 8 * len)) & 0x0F0F0F0F0F0F0F0F;
  x = x * 10 + (x >> 8);
  u64 m = 0x000000FF000000FF;
  x = (x & m) * 0x000F424000000064 + ((x >> 16) & m) * 0x0000271000000001;
  return x >> 32;
}

template <class Emit>
void parse(const char *lo, const char *hi, const char *begin, const char *end,
           Emit emit) {
  const char *p = begin;
  while (p < end) {
    u32 u, v, w;
    // A valid edge line has at most 27 bytes. The final bytes use scalar
    // reads so an eight-byte load never crosses the mapped file's boundary.
    if (hi - p >= 32) u = number(p), v = number(p), w = number(p);
    else u = scan(p), v = scan(p), w = scan(p);
    emit(u, v, w);
  }
}

'''+s[b:]
Path('work/variants/forward_parser.cpp').write_text(s)
# BMI2 isolates the variable-shift code-generation hypothesis.
