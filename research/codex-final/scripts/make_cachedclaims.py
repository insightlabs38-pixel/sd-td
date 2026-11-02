from pathlib import Path
s=Path('work/variants/b_bytes_safe.cpp').read_text()
s=s.replace('  std::vector<uint8_t> &claimed;','  Bits &claimed, mine;').replace('  std::vector<uint8_t> claimed(n);','  Bits claimed(bypass.size());').replace('Grower grower{*raw, bypass, claimed, reg};','Grower grower{*raw, bypass, claimed, Bits(claimed.size()), reg};')
a=s.index('  void claim(u32 z) {',s.index('struct Grower'));b=s.index('  void put(',a)
body='''  void claim(u32 z) {
    u64 bit = u64(1) << (z & 63), *word = &claimed[z >> 6];
    u64 &known = mine[z >> 6];
    if (known & bit) return;
    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);
    known |= seen | bit;
    if (seen & bit) return;
    __atomic_store_n(word, seen | bit, __ATOMIC_RELAXED);
    reg.order[reg.len++] = z;
  }
'''
x=s[:a]+body+s[b:]
x=x.replace('// Byte flags only change from zero to one, so a worker never revisits a\n  // vertex. Racing workers may each retain a copy; renaming chooses one.', '// Private knowledge only grows. Observed shared bits prove that some\n  // worker retained the vertex, even if a later shared store loses them.')
Path('work/variants/b_cachedclaims.cpp').write_text(x)
y=x.replace('    known |= seen | bit;','    known |= bit;')
Path('work/variants/b_private_safe.cpp').write_text(y)
