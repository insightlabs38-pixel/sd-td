from pathlib import Path
query=Path('work/variants/pure_frontier.cpp').read_text();qa=query.index('// ---------------------------------------------------------------- queries');qb=query.index('\nint main()',qa)
step=Path('work/variants/step_two_sse.cpp').read_text();sa=step.index('  bool step(Walk &w) {');sb=step.index('  void expand(',sa)
parser=Path('work/variants/stream_parser64.cpp').read_text();pa=parser.index('// Bit i is set when');pb=parser.index('// Maps a file read-only',pa)
for name,start in [('pure_sse','fix_atomic'),('pure_sse_byte','byte_degrees')]:
 s=Path(f'work/variants/{start}.cpp').read_text()
 a=s.index('// ---------------------------------------------------------------- queries');b=s.index('\nint main()',a);s=s[:a]+query[qa:qb]+s[b:]
 a=s.index('  bool step(Walk &w) {');b=s.index('  void expand(',a);s=s[:a]+step[sa:sb]+s[b:]
 if name.endswith('byte'):
  s=s.replace('#include <numeric>','#include <numeric>\n#include <malloc.h>')
  s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);','  malloc_trim(0);\n  auto [fwd, rev] = contract(raw, bypass, threads, ends);')
  pos=s.index('  // Raw id -> new id.')
  s=s[:pos]+'''  if (mremap(where, (size_t(4) * n + m) * 4 + 64,
             (size_t(n) + total + edges[threads] + 1) * 4 + 64, 0) == MAP_FAILED) exit(2);
'''+s[pos:]
 Path(f'work/variants/{name}.cpp').write_text(s)
 if name.endswith('byte'):
  for cap in [6,8]:
   t=s.replace('parallel(std::min<size_t>(threads, queries + 1)',f'parallel(std::min<size_t>(std::min(threads, {cap}u), queries + 1)')
   Path(f'work/variants/{name}_cap{cap}.cpp').write_text(t)
 a=s.index('// Bit i is set when');b=s.index('// Maps a file read-only',a)
 Path(f'work/variants/{name}_stream.cpp').write_text(s[:a]+parser[pa:pb]+s[b:])
