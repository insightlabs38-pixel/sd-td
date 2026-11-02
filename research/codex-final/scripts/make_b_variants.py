from pathlib import Path
s=Path('work/variants/b_control.cpp').read_text()
a=s.index('  L *slot(u32 v) {');b=s.index('  void reset() {',a)
old=s[a:b]
new=old.replace('      dir[v / 128] = std::fill_n(store + used.size() * 128, 128, NONE) - 128;', '''      L *p = store + used.size() * 128;
      if constexpr (NONE == L(-1))
        memset(p, 255, 128 * sizeof(L));
      else
        std::fill_n(p, 128, NONE);
      dir[v / 128] = p;''')
assert new!=old
Path('work/variants/b_memset.cpp').write_text(s[:a]+new+s[b:])
x=s.replace('  L *store, blank[128];','  L *store;\n  static inline L blank[128];').replace('    std::fill(blank, blank + 128, NONE);','    static const bool initialized = (std::fill_n(blank, 128, NONE), true);')
assert x!=s
Path('work/variants/b_sharedblank.cpp').write_text(x)
Path('work/variants/b_fill_shared.cpp').write_text(x[:x.index('  L *slot(u32 v) {')]+new+x[x.index('  void reset() {',x.index('  L *slot(u32 v) {')):])
a=s.index('  void claim(u32 z) {',s.index('struct Grower'));b=s.index('  void put(',a)
claim=s[a:b]
x=s.replace('  Bits &claimed;','  std::vector<uint8_t> &claimed;').replace('  Bits claimed(bypass.size());','  std::vector<uint8_t> claimed(n);')
a=x.index('  void claim(u32 z) {',x.index('struct Grower'));b=x.index('  void put(',a)
x=x[:a]+'''  void claim(u32 z) {
    uint8_t *flag = &claimed[z];
    if (__atomic_load_n(flag, __ATOMIC_RELAXED))
      return;
    __atomic_store_n(flag, uint8_t(1), __ATOMIC_RELAXED);
    reg.order[reg.len++] = z;
  }
'''+x[b:]
x=x.replace('// Claims race without locked instructions: a vertex claimed twice leaves a\n  // copy that no edge reaches, as every head resolves through one map entry.', '// Byte flags only change from zero to one, so a worker never revisits a\n  // vertex. Racing workers may each retain a copy; renaming chooses one.')
Path('work/variants/b_claimbytes.cpp').write_text(x)
x=s.replace('    __atomic_store_n(word, seen | bit, __ATOMIC_RELAXED);\n    reg.order[reg.len++] = z;', '    if (!(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit))\n      reg.order[reg.len++] = z;')
Path('work/variants/b_claimatomic.cpp').write_text(x)
x=s.replace('    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);','    u64 seen = claim_load(word, __ATOMIC_RELAXED);').replace('    __atomic_store_n(word, seen | bit, __ATOMIC_RELAXED);','    claim_store(word, seen | bit, __ATOMIC_RELAXED);')
Path('work/variants/b_instrumented.cpp').write_text(x)
