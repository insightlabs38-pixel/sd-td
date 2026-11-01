from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
for base in ['pr17','fixed_weight']:
 s=Path('work/controls/pr17/d_traverse.cpp').read_text() if base=='pr17' else Path('work/variants/fixed_weight.cpp').read_text()
 s=s.replace('Worker<u32> narrow{Side<u32>(*fwd), Side<u32>(*rev)};', 'Worker<uint16_t> narrow{Side<uint16_t>(*fwd), Side<uint16_t>(*rev)};').replace('d >= Labels<u32>::NONE','d >= Labels<uint16_t>::NONE')
 for page in [64,128,256]:
  a=s.index('template <class L> struct Labels');b=s.index('// One direction',a)
  x=s[:a]+s[a:b].replace('128',str(page))+s[b:]
  name=('u16' if base=='pr17' else 'u16_fixed')+str(page)
  Path('work/variants/'+name+'.cpp').write_text(x)
