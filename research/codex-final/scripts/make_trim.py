from pathlib import Path
for name in ['fix_atomic','packed_order']:
 s=Path(f'work/variants/{name}.cpp').read_text().replace('#include <numeric>','#include <numeric>\n#include <malloc.h>')
 s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);','  malloc_trim(0);\n  auto [fwd, rev] = contract(raw, bypass, threads, ends);')
 Path(f'work/variants/{name}_trim.cpp').write_text(s)
s=Path('work/variants/packed_order_trim.cpp').read_text()
pos=s.index('  // Raw id -> new id.')
s=s[:pos]+'''  size_t kept = (size_t(n) + total + edges[threads] + 1) * 4;
  kept = (kept + 4095) / 4096 * 4096;
  size_t all = (size_t(4) * n + m) * 4 + 64;
  if (kept < all) munmap((char *)where + kept, all - kept);
'''+s[pos:]
Path('work/variants/packed_order_trim_tail.cpp').write_text(s)
