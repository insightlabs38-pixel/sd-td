from pathlib import Path
s=Path('work/variants/b_control.cpp').read_text()
s=s.replace('using Bits = std::vector<u64>;','using Bits = std::vector<u64>;\nusing Marks = std::vector<uint8_t>;\nconstexpr uint8_t CLAIMED = 1, BYPASS = 2;\nbool test(const Marks &b, u32 v) { return __atomic_load_n(&b[v], __ATOMIC_RELAXED) & BYPASS; }\nvoid set(Marks &b, u32 v) { b[v] = BYPASS; }')
s=s.replace('Bits &bypass, unsigned threads)', 'Marks &bypass, unsigned threads)')
s=s.replace('  const Bits &bypass;\n  Bits &claimed;', '  Marks &bypass;')
s=s.replace('contract(Graph *raw, const Bits &bypass,','contract(Graph *raw, Marks &bypass,')
s=s.replace('  Bits claimed(bypass.size());\n','')
s=s.replace('Grower grower{*raw, bypass, claimed, reg};','Grower grower{*raw, bypass, reg};')
s=s.replace('  Bits terminal(scan(p) / 64 + 1), bypass(terminal.size());','  u32 n = scan(p);\n  Bits terminal(n / 64 + 1);\n  Marks bypass(n);')
a=s.index('  void claim(u32 z) {',s.index('struct Grower'));b=s.index('  void put(',a)
s=s[:a]+'''  void claim(u32 z) {
    uint8_t *flag = &bypass[z];
    uint8_t seen = __atomic_load_n(flag, __ATOMIC_RELAXED);
    if (seen & CLAIMED)
      return;
    __atomic_store_n(flag, uint8_t(seen | CLAIMED), __ATOMIC_RELAXED);
    reg.order[reg.len++] = z;
  }
'''+s[b:]
s=s.replace('// Claims race without locked instructions: a vertex claimed twice leaves a\n  // copy that no edge reaches, as every head resolves through one map entry.', '// The bypass bit is immutable and the claim bit only changes to one.\n  // Workers may race to retain copies, but none revisits its own vertices.')
assert 'Bits claimed' not in s and 'bypass, claimed' not in s
Path('work/variants/b_claimtags.cpp').write_text(s)
x=s.replace('  void claim(u32 z) {\n    uint8_t *flag = &bypass[z];\n    uint8_t seen = __atomic_load_n(flag, __ATOMIC_RELAXED);','  void claim(u32 z, uint8_t seen) {\n    uint8_t *flag = &bypass[z];')
pos=x.index('  void put(',x.index('struct Grower'))
x=x[:pos]+'''  void claim(u32 z) { claim(z, __atomic_load_n(&bypass[z], __ATOMIC_RELAXED)); }
'''+x[pos:]
x=x.replace('      if (!test(bypass, y)) {\n        claim(y), put(pos, y, raw.weight(i));','      uint8_t seen = __atomic_load_n(&bypass[y], __ATOMIC_RELAXED);\n      if (!(seen & BYPASS)) {\n        claim(y, seen), put(pos, y, raw.weight(i));')
Path('work/variants/b_claimtags_fused.cpp').write_text(x)
