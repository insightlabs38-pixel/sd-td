from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
for slots in [2,3]:
 s=base
 s=s.replace('if (at[x] > 4)\n          row[0] = SPILL, row[1] = pos, row[2] = at[x], at[x] = pos,\n          pos += row[2];', '''if (at[x] > SLOTS) {
          u32 degree = at[x];
          row[0] = SPILL, row[1] = pos | std::min(degree, 255u) << 24;
          if (degree >= 255) rows[pos++] = degree;
          at[x] = pos, pos += degree;
        }''')
 s=s.replace('u32 *row = rows + 4 * size_t(v);', 'u32 *row = rows + SLOTS * size_t(v);')
 # Inspected declaration in the actual source uses this spelling.
 s=s.replace('u32 v = first + x, *row = rows + 4 * size_t(v);', 'u32 v = first + x, *row = rows + SLOTS * size_t(v);')
 s=s.replace('std::fill(row, row + 4, NONE)', 'std::fill(row, row + SLOTS, NONE)')
 s=s.replace('at[x] = 4 * v;', 'at[x] = SLOTS * v;')
 s=s.replace('extra += at[x] > 4 ? at[x] : 0;', 'extra += at[x] > SLOTS ? at[x] + (at[x] >= 255) : 0;')
 # The spill reservation includes a header only for very large degrees.
 s=s.replace('if (at[x] > 4)\n          extra += at[x];','if (at[x] > SLOTS)\n          extra += at[x] + (at[x] >= 255);')
 s=s.replace('u32 pos = 4 * n + spilled.fetch_add(extra);', 'u32 pos = SLOTS * n + spilled.fetch_add(extra);')
 a=s.index('std::pair<u32, u32> row(');b=s.index('// One worker',a)
 s=s[:a]+'''std::pair<u32, u32> row(const Graph &raw, u32 u) {
  const u32 *r = raw.adj + SLOTS * size_t(u);
  if (r[0] == SPILL) {
    u32 pos = r[1] & 0xFFFFFF, degree = r[1] >> 24;
    if (degree == 255) degree = raw.adj[pos++];
    return {pos, pos + degree};
  }
  return {SLOTS * u, SLOTS * u + INLINE_COUNT};
}

'''+s[b:]
 s=s.replace('4 * size_t(next)', 'SLOTS * size_t(next)').replace('4 * size_t(y)', 'SLOTS * size_t(y)').replace('4 * size_t(reg.order[h])', 'SLOTS * size_t(reg.order[h])').replace('4 * size_t(walks[i].at)', 'SLOTS * size_t(walks[i].at)')
 s=s.replace('INLINE_COUNT',' + '.join(f'(r[{i}] != NONE)' for i in range(slots)))
 s=s.replace('SLOTS',str(slots))
 Path(f'work/variants/raw{slots}_slots.cpp').write_text(s)
 # Prefetch spilled survivor edges after their descriptors have been fetched.
 target='''      size_t walking = 0;'''
 extra='''      for (u32 h = lo; h < std::min(reg.len, hi + BATCH); ++h) {
        auto [i, end] = row(raw, reg.order[h]);
        __builtin_prefetch(&raw.adj[i]);
      }
'''
 s=s.replace(target,extra+target)
 Path(f'work/variants/raw{slots}_prefetch.cpp').write_text(s)
