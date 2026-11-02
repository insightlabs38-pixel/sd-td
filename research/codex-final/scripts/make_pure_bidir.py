from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
a=base.index('    bwd.dist.reset(), fwd.start(s);',base.index('template <class L> struct Worker'))
b=base.index('    for (;;) {',a)
base=base[:a]+'''    fwd.start(s), bwd.start(t);
    u64 best = INF;
'''+base[b:]
base=base.replace('if (fs <= bs)', 'if (POLICY)').replace('fs += fwd.drain(bwd, best);','fwd.drain(bwd, best);').replace('bs += bwd.drain(fwd, best);','bwd.drain(fwd, best);')
base=base.replace('size_t drain_bits(const Side &other, u64 &best)','void drain_bits(const Side &other, u64 &best)').replace('u32 mask = (1u << queue.node_bits) - 1, settled = 0;','u32 mask = (1u << queue.node_bits) - 1;').replace('      ++settled;\n','').replace('    return settled;\n','')
base=base.replace('  size_t drain(const Side &other, u64 &best) {\n    return g.wbits == 11 ? drain_bits<11>(other, best)\n                         : drain_bits<>(other, best);\n  }', '''  void drain(const Side &other, u64 &best) {
    if (g.wbits == 11) drain_bits<11>(other, best);
    else drain_bits<>(other, best);
  }''')
for name,policy in [('frontier','fwd.queue.near <= bwd.queue.near'),('distance','f <= b'),('alternate','(flip = !flip)')]:
 s=base.replace('POLICY',policy)
 if name=='alternate':s=s.replace('    u64 best = INF;','    u64 best = INF;\n    bool flip = false;')
 Path(f'work/variants/pure_{name}.cpp').write_text(s)
