from pathlib import Path
s=Path('work/variants/reverse_shortcut.cpp').read_text()
# Consistent atomic snapshots for mutable survivor edges. Bypass rows are
# immutable, so walk classification stays vectorized without atomics.
s=s.replace('''  u64 weight(size_t i) const {
    if ((adj[i] & mask) != mask)
      return adj[i] & mask;''','''  u64 weight(size_t i, u32 edge) const {
    if ((edge & mask) != mask)
      return edge & mask;''')
pos=s.index('  void put(size_t i, u32 v, u64 w, Escapes &fresh)')
s=s[:pos]+'''  u64 weight(size_t i) const { return weight(i, adj[i]); }
'''+s[pos:]
s=s.replace('''  if (r[0] == SPILL)''','''  u32 first = __atomic_load_n(r, __ATOMIC_RELAXED);
  if (first == SPILL)''')
s=s.replace('(r[0] != NONE) + (r[1] != NONE) + (r[2] != NONE) +\n                     (r[3] != NONE)', '''(first != NONE) +
    (__atomic_load_n(r + 1, __ATOMIC_RELAXED) != NONE) +
    (__atomic_load_n(r + 2, __ATOMIC_RELAXED) != NONE) +
    (__atomic_load_n(r + 3, __ATOMIC_RELAXED) != NONE)''')
s=s.replace('''    if (next != w.root && claim(next) && w.back != NONE && !test(bypass, next)) {''','''    if (next != w.root) claim(next);
    if (next != w.root && w.back != NONE && w.pos >= MIN_STEPS && !test(bypass, next)) {''')
s=s.replace('u32 edge = raw.adj[k], back = edge & raw.mask;', 'u32 edge = __atomic_load_n(raw.adj + k, __ATOMIC_RELAXED), back = edge & raw.mask;')
s=s.replace('''          if (raw.head(edge) == w.prev && back < raw.mask - w.back)
            raw.adj[k] = w.root << raw.wbits | (back + w.back);''','''          if (raw.head(edge) == w.prev && back < raw.mask - w.back) {
            u32 replacement = w.root << raw.wbits | (back + w.back);
            __atomic_compare_exchange_n(raw.adj + k, &edge, replacement, false,
                                        __ATOMIC_RELAXED, __ATOMIC_RELAXED);
          }''')
s=s.replace('''  void expand(u32 u, size_t &walking) {
    for''', '''  void expand(u32 u, size_t &walking) {
    u32 initialBack = test(bypass, u) ? NONE : 0;
    for''')
s=s.replace('''      u32 y = raw.head(raw.adj[i]), pos = reg.edges;''','''      u32 edge = __atomic_load_n(raw.adj + i, __ATOMIC_RELAXED);
      u32 y = raw.head(edge), pos = reg.edges;''')
s=s.replace('claim(y), put(pos, y, raw.weight(i));','claim(y), put(pos, y, raw.weight(i, edge));')
s=s.replace('test(bypass, u) ? NONE : 0, raw.weight(i)', 'initialBack, raw.weight(i, edge)')
for length in [1,2,4]:
 Path(f'work/variants/reverse_shared{length}.cpp').write_text(s.replace('MIN_STEPS',str((length-1)<<24)+'u'))
# The owned-only variant skips singleton chains to avoid their row-search cost.
s=Path('work/variants/reverse_shortcut.cpp').read_text().replace('claim(next) && w.back != NONE &&', 'claim(next) && w.back != NONE && w.pos >= (1u << 24) &&')
Path('work/variants/reverse_owned2.cpp').write_text(s)
