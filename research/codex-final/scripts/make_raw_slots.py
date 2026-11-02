from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
for slots in [3,2]:
 x=s
 x=x.replace('size_t(4) * n + m',f'size_t({slots}) * n + m')
 x=x.replace('at[x] > 4',f'at[x] > {slots}').replace('u32 pos = 4 * n',f'u32 pos = {slots} * n')
 x=x.replace('rows + 4 * size_t(v)',f'rows + {slots} * size_t(v)').replace('row + 4, NONE',f'row + {slots}, NONE').replace('at[x] = 4 * v',f'at[x] = {slots} * v')
 x=x.replace('raw.adj + 4 * size_t(u)',f'raw.adj + {slots} * size_t(u)').replace('u32 i = 4 * w.at',f'u32 i = {slots} * w.at').replace('raw.adj[4 * size_t(',f'raw.adj[{slots} * size_t(')
 old='return {4 * u, 4 * u + (r[0] != NONE) + (r[1] != NONE) + (r[2] != NONE) +\n                     (r[3] != NONE)};'
 new=f'return {{{slots} * u, {slots} * u + (r[0] != NONE) + (r[1] != NONE)'+(' + (r[2] != NONE)' if slots==3 else '')+'};'
 assert old in x;x=x.replace(old,new)
 if slots==2:
  old='row[0] = SPILL, row[1] = pos, row[2] = at[x], at[x] = pos,\n          pos += row[2];'
  new='row[0] = ~at[x], row[1] = pos, pos += at[x], at[x] = row[1];'
  assert old in x;x=x.replace(old,new)
  x=x.replace('if (r[0] == SPILL)\n    return {r[1], r[1] + r[2]};','if (r[0] != NONE && (r[0] >> Graph::wbits) >= raw.n)\n    return {r[1], r[1] + ~r[0]};')
 Path(f'work/variants/prefix_raw{slots}.cpp').write_text(x)
