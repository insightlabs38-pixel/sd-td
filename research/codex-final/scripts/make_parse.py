from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
s=base.replace('  const char *field = begin;\n  u32 val[3], k = 0;', '  const char *field = begin, *ends[2];\n  u32 k = 0;')
s=s.replace('      val[k] = decimal(field, sep, lo), field = sep + 1;\n      if (++k == 3)\n        emit(val[0], val[1], val[2]), k = 0;', '''      if (k < 2) ends[k++] = sep;
      else {
        u32 a = decimal(field, ends[0], lo);
        u32 b = decimal(ends[0] + 1, ends[1], lo);
        u32 c = decimal(ends[1] + 1, sep, lo);
        emit(a, b, c);
        field = sep + 1, k = 0;
      }''')
Path('work/variants/parse_triple.cpp').write_text(s)
# Collect a block's separators, then convert fields with compile-time positions.
s=base
s=s.replace('  const char *field = begin;\n  u32 val[3], k = 0;', '  const char *field = begin, *ends[24];\n  u32 k = 0;')
s=s.replace('      val[k] = decimal(field, sep, lo), field = sep + 1;\n      if (++k == 3)\n        emit(val[0], val[1], val[2]), k = 0;', '''      ends[k++] = sep;
      if (k == 24) {
        for (u32 j = 0; j < 24; j += 3) {
          u32 a = decimal(field, ends[j], lo);
          u32 b = decimal(ends[j] + 1, ends[j+1], lo);
          u32 c = decimal(ends[j+1] + 1, ends[j+2], lo);
          emit(a, b, c);
          field = ends[j+2] + 1;
        }
        k = 0;
      }''')
a=s.index('\n}\n\nu32 scan',s.index('void parse'))
s=s[:a]+'''
  for (u32 j = 0; j < k; j += 3) {
    emit(decimal(field, ends[j], lo), decimal(ends[j]+1, ends[j+1], lo),
         decimal(ends[j+1]+1, ends[j+2], lo));
    field = ends[j+2] + 1;
  }'''+s[a:]
Path('work/variants/parse_batch.cpp').write_text(s)
# Restrict wide overlapping stores to entries whose successors share the same chunk/owner.
s=base.replace('    pool[fill[b]++] = {key, uint16_t(std::min<u64>(w, 0xFFFF))};', '''    u32 i = fill[b]++;
    u64 packed = key | (std::min<u64>(w, 0xFFFF) << 32);
    if ((i + 1) % CHUNK)
      memcpy(pool + i, &packed, 8);
    else pool[i] = {key, uint16_t(packed >> 32)};''')
Path('work/variants/bin_overlap_safe.cpp').write_text(s)
