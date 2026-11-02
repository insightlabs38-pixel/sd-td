from pathlib import Path
s=Path('work/variants/champion33672.cpp').read_text()
a=s.index('template <class L> struct Side');b=s.index('// An exact forward probe',a)
part=s[a:b]
for name,member in [('local',False),('member',True)]:
 x=part.replace('    u32 mask = (1u << queue.node_bits) - 1;','    const u32 *__restrict adj=g.adj,*__restrict off=g.off;\n    u32 mask = (1u << queue.node_bits) - 1;').replace('&g.off[ahead]','&off[ahead]').replace('&g.adj[g.off[ahead]]','&adj[off[ahead]]').replace('g.off[u]','off[u]').replace('g.off[u + 1]','off[u + 1]').replace('g.adj[i]','adj[i]')
 if member:x=x.replace('void drain_bits(const Side &other, u64 &best) {','void drain_bits(const Side &other, u64 &best) __restrict {')
 Path('work/variants/champion_restrict_'+name+'.cpp').write_text(s[:a]+x+s[b:])
x=part
start=x.index('      for (u32 i = g.off[u];');end=x.index('    queue.near -=',start)
body=x[start:end];assert body.endswith('    }\n');body=body[:-6]
helper='''  template <unsigned W> __attribute__((always_inline))
  void relax(u32 u,u64 d,const u32 *__restrict adj,const u32 *__restrict off,
             const Side &other,u64 &best) __restrict {
'''+body.replace('g.off[u]','off[u]').replace('g.off[u + 1]','off[u + 1]').replace('g.adj[i]','adj[i]')+'''  }
'''
x=x[:start]+'      relax<W>(u,d,g.adj,g.off,other,best);\n    }\n'+x[end:]
pos=x.index('  template <unsigned W = 0>');x=x[:pos]+helper+x[pos:]
Path('work/variants/champion_restrict_helper.cpp').write_text(s[:a]+x+s[b:])
