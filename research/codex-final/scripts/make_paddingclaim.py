from pathlib import Path
s=Path('work/variants/b_control.cpp').read_text()
s=s.replace('constexpr u32 NONE = ~0u, SPILL = ~1u;', 'constexpr u32 NONE = ~0u, SPILL = ~1u, CLAIMED_EMPTY = ~2u;')
s=s.replace('  return {4 * u, 4 * u + (r[0] != NONE) + (r[1] != NONE) + (r[2] != NONE) +\n                     (r[3] != NONE)};', '  u32 last = __atomic_load_n(&r[3], __ATOMIC_RELAXED);\n  return {4 * u, 4 * u + (r[0] != NONE) + (r[1] != NONE) + (r[2] != NONE) +\n                     (last < CLAIMED_EMPTY)};')
a=s.index('  void claim(u32 z) {',s.index('struct Grower'));b=s.index('  void put(',a)
s=s[:a]+'''  void claim(u32 z) {
    u32 *slot = &raw.adj[4 * size_t(z) + 3];
    u32 tag = __atomic_load_n(slot, __ATOMIC_RELAXED);
    if (tag >= CLAIMED_EMPTY) {
      if (tag == NONE && __atomic_compare_exchange_n(
          slot, &tag, CLAIMED_EMPTY, false, __ATOMIC_RELAXED, __ATOMIC_RELAXED))
        reg.order[reg.len++] = z;
      return;
    }
    u64 bit = u64(1) << (z & 63), *word = &claimed[z >> 6];
    u64 seen = __atomic_load_n(word, __ATOMIC_RELAXED);
    if (!(seen & bit) && !(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit))
      reg.order[reg.len++] = z;
  }
'''+s[b:]
s=s.replace('// Claims race without locked instructions: a vertex claimed twice leaves a\n  // copy that no edge reaches, as every head resolves through one map entry.', '// Empty fourth slots carry an atomic claim marker in the row itself.\n  // Degree-four rows use the bitmap; both paths give unique ownership.')
s=s.replace('// Vertex ids stay far below 2^25 (a vertex is claimed twice only when\n  // a racing store loses its bit), leaving seven bits for the key remainder.', '// Claims are globally unique, so legal vertex ids fit in 25 bits,\n  // leaving seven bits for the key remainder.')
assert 'last < CLAIMED_EMPTY' in s
Path('work/variants/b_claimpadding.cpp').write_text(s)
