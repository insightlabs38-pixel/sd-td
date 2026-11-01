from pathlib import Path
s=Path('work/variants/u16_fixed128.cpp').read_text()
# Eight bits for the shortest queries, then 16, then exact 64; retains all states per worker.
a=s.index('    Worker<uint16_t> narrow');b=s.index('    for (size_t k;',a)
s=s[:a]+s[a:b]+'    Worker<uint8_t> small{Side<uint8_t>(*fwd), Side<uint8_t>(*rev)};\n'+s[b:]
s=s.replace('      u64 d = narrow.solve(s, t);','      u64 d = small.solve(s, t);\n      if (d >= Labels<uint8_t>::NONE && (d < INF || small.fwd.wide || small.bwd.wide))\n        d = narrow.solve(s, t);')
# narrow flags stale if skipped! only widen based d>=NONE16, any small return <255 skips anyway.
s=s.replace('      if (narrow.fwd.wide || narrow.bwd.wide ||\n          (d >= Labels<uint16_t>::NONE && d < INF)) {','      if (d >= Labels<uint16_t>::NONE && (d < INF || narrow.fwd.wide || narrow.bwd.wide)) {')
Path('work/variants/adaptive.cpp').write_text(s)
