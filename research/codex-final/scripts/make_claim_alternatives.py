from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
for width in [8,16,32]:
 s=base.replace('  Bits &claimed;',f'  std::vector<uint{width}_t> &claimed;')
 a=s.index('  // The relaxed OR linearizes');b=s.index('  void put(',a)
 s=s[:a]+'''  void claim(u32 z) {
    auto *flag = &claimed[z];
    if (!__atomic_load_n(flag, __ATOMIC_RELAXED) &&
        !__atomic_exchange_n(flag, 1, __ATOMIC_RELAXED))
      reg.order[reg.len++] = z;
  }
'''+s[b:]
 s=s.replace('  Bits claimed(bypass.size());',f'  std::vector<uint{width}_t> claimed(n);')
 Path(f'work/variants/claim_exchange{width}.cpp').write_text(s)
s=base.replace('  std::vector<Walk> walks;', '  std::vector<Walk> walks;\n  Bits known = Bits(claimed.size());')
s=s.replace('    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);', '''    u64 &cached = known[z >> 6];
    if (cached & bit) return;
    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);
    cached |= seen | bit;''')
Path('work/variants/claim_bulk_cache.cpp').write_text(s)
# Always execute RMW, avoiding the separate shared load and its dependency.
s=base.replace('    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);\n    if (seen & bit)\n      return;\n','')
Path('work/variants/claim_always_rmw.cpp').write_text(s)
