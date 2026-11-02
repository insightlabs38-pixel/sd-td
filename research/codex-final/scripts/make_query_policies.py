from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
for mode in ['frontier','distance','work','chunk32','chunk128','chunk32frontier']:
 s=base
 if 'frontier' in mode:s=s.replace('if (fs <= bs)','if (fwd.queue.near <= bwd.queue.near)')
 if mode=='distance':s=s.replace('if (fs <= bs)','if (f <= b)')
 if mode=='work':s=s.replace('++settled;', 'settled += g.off[u + 1] - g.off[u];')
 if 'chunk' in mode:
  chunk=128 if '128' in mode else 32
  s=s.replace('u64 occupied[B / 64] = {}, cur = 0, near = 0;','u64 occupied[B / 64] = {}, cur = 0, near = 0;\n  u32 read = 0;')
  s=s.replace('far = {}, cur = near = 0;', 'far = {}, cur = near = read = 0;')
  s=s.replace('    for (u32 k = 0; k < bk.size; ++k) {',f'    u32 first = queue.read, end = std::min(bk.size, first + {chunk});\n    for (u32 k = first; k < end; ++k) {{')
  s=s.replace('    queue.near -= bk.size, bk.size = 0;\n    queue.occupied[queue.cur % Queue::B / 64] &= ~(u64(1) << queue.cur % 64);', '''    queue.read = end;
    queue.near -= end - first;
    if (end == bk.size) {
      bk.size = queue.read = 0;
      queue.occupied[queue.cur % Queue::B / 64] &= ~(u64(1) << queue.cur % 64);
    }''')
 Path(f'work/variants/query_{mode}.cpp').write_text(s)
