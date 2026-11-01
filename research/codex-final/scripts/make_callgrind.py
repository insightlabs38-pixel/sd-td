from pathlib import Path
for name in ['pr17','fixed_weight','u16_fixed128_clipped']:
 s=Path('work/controls/pr17/d_traverse.cpp').read_text() if name=='pr17' else Path('work/variants/'+name+'.cpp').read_text()
 s='#include <valgrind/callgrind.h>\n'+s
 s=s.replace('  std::atomic<size_t> next{0};','  CALLGRIND_START_INSTRUMENTATION;\n  std::atomic<size_t> next{0};').replace('  std::string text;','  CALLGRIND_STOP_INSTRUMENTATION;\n  std::string text;')
 Path('work/variants/'+name+'_cg.cpp').write_text(s)
