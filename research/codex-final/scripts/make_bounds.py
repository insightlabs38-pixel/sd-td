from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
for mode in ['target','vertex','edge']:
 s=base.replace('    bwd.dist.reset(), fwd.start(s);','    bwd.start(t), fwd.start(s);').replace('    bwd.start(t);\n    best = fwd.dist.get(t);','    best = fwd.dist.get(t);')
 s=s.replace('known < f || f == INF','known <= f || f == INF')
 s=s.replace('size_t drain_bits(const Side &other, u64 &best)', 'size_t drain_bits(const Side &other, u64 &best, u64 bound)')
 s=s.replace('      if (dist.get(u) != d)','      if (dist.get(u) != d || d + bound >= best)')
 s=s.replace('size_t drain(const Side &other, u64 &best)', 'size_t drain(const Side &other, u64 &best, u64 bound = 0)')
 s=s.replace('drain_bits<11>(other, best)','drain_bits<11>(other, best, bound)').replace('drain_bits<>(other, best)','drain_bits<>(other, best, bound)')
 if mode!='target':
  s=s.replace('fs += fwd.drain(bwd, best);\n      else','fs += fwd.drain(bwd, best, b);\n      else').replace('bs += bwd.drain(fwd, best);','bs += bwd.drain(fwd, best, f);')
 if mode=='edge':
  s=s.replace('queue.push(nd, v, nd < old);','queue.push(nd, v, nd < old && nd + bound < best);')
 Path(f'work/variants/bound_{mode}.cpp').write_text(s)
