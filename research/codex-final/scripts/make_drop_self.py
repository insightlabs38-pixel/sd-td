from pathlib import Path
s=Path('work/variants/champion33672.cpp').read_text()
a=s.index('  if (mremap(where,');b=s.index('  // The pages of the regions',a)
old=s[a:b]
new='''  // Compact zero self-loops produced by dead contraction walks while naming
  // each region. Every escaped weight belongs to a retained non-self edge.
  parallel(threads,[&](unsigned t) {
    Region &reg=regions[t];
    std::sort(reg.esc.begin(),reg.esc.end());
    size_t heavy=0;
    u32 pos=0,kept=0;
    for(u32 i=0;i<reg.len;++i) {
      u32 degree=reg.ends[i],before=kept,root=reg.order[i];
      auto large=reg.esc.end();
      if(degree==255) {
        large=std::lower_bound(reg.esc.begin(),reg.esc.end(),std::pair(~size_t(0)-i,0ul));
        degree=large->second;
      }
      for(u32 end=pos+degree;pos<end;++pos) {
        u32 e=reg.out[pos];
        if((e>>wbits)==root) continue;
        if((e&mask)==mask) reg.esc[heavy++].first=kept;
        reg.out[kept++]=e;
      }
      degree=kept-before;
      reg.ends[i]=std::min(degree,255u);
      if(large!=reg.esc.end()) large->second=std::max(degree,255u);
      __atomic_store_n(where+root,base[t]+i,__ATOMIC_RELAXED);
    }
    reg.edges=kept;
    if(mremap(reg.out,m*4ul+64,kept*4ul+64,0)==MAP_FAILED) exit(2);
  });
  for(unsigned t=0;t<threads;++t) edges[t+1]=edges[t]+regions[t].edges;
  if (mremap(where, (size_t(4) * n + m) * 4 + 64,
             (size_t(n) + total + edges[threads] + 1) * 4 + 64, 0) == MAP_FAILED) exit(2);
'''
s=s[:a]+new+s[b:]
s=s.replace('    std::sort(reg.esc.begin(), reg.esc.end());\n    orders.push_back','    orders.push_back')
Path('work/variants/champion_drop_self.cpp').write_text(s)
x=s.replace('  // Compact zero self-loops','  u32 old_edges=edges[threads];\n  // Compact zero self-loops').replace('  // The pages of the regions', '  fprintf(stderr,"self_loops_removed=%u original_edges=%u new_edges=%u\\n",old_edges-edges[threads],old_edges,edges[threads]);\n  // The pages of the regions')
x='#include <cstdio>\n'+x;Path('work/variants/champion_drop_self_stats.cpp').write_text(x)
