from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
# The raw graph keeps its direct head encoding; only the ordered CSR changes.
a=s.index('// An edge binned by its tail')
new='''// Three-byte local edges with exact (head,weight) escapes.
struct CsrGraph {
  struct __attribute__((packed)) Edge { uint8_t bytes[3]; };
  u32 n,m,*off;
  Edge *adj;
  Escapes esc;
  CsrGraph(u32 n,u32 m,u32 *off,void *adj) : n(n),m(m),off(off),adj((Edge*)adj) {}
  void merge(std::vector<Escapes> &parts) {
    for(auto &e:parts) esc.insert(esc.end(),e.begin(),e.end());
    std::sort(esc.begin(),esc.end());
  }
  void put(u32 i,u32 u,u32 v,u64 w,Escapes &fresh) {
    int delta=int(v)-int(u);
    u32 e=(u32(delta)&16383u)<<10 | u32(w);
    if(delta < -8192 || delta >= 8192 || w>=1023) {
      e=0xffffff; fresh.push_back({i,u64(v)<<43|w});
    }
    memcpy(adj+i,&e,3);
  }
  std::pair<u32,u64> edge(u32 u,u32 i) const {
    u32 e=0;memcpy(&e,adj+i,3);
    if(e==0xffffff) {
      u64 x=std::lower_bound(esc.begin(),esc.end(),std::pair(size_t(i),u64(0)))->second;
      return {u32(x>>43),x&((u64(1)<<43)-1)};
    }
    return {u+u32(int32_t(e<<8)>>18),e&1023u};
  }
};

'''
s=s[:a]+new+s[a:]
# splice releases unmoved written pages when destination uses fewer bytes.
s=s.replace('    mremap(part, move, move, MREMAP_MAYMOVE | MREMAP_FIXED, at), at += move;', '''    if(move) mremap(part, move, move, MREMAP_MAYMOVE | MREMAP_FIXED, at), at += move;
    size_t used_pages=(used+page-1)/page*page;
    if(move<used_pages) munmap((char*)part+move,used_pages-move);''')
s=s.replace('  Graph *r;','  CsrGraph *r;').replace('r(new Graph(n, m, off, off))','r(new CsrGraph(n, m, off, off))')
s=s.replace('void place(const Graph &g,','void place(const CsrGraph &g,')
s=s.replace('++r->off[g.head(g.adj[i])];','++r->off[g.edge(u,i).first];')
s=s.replace('r->put(--r->off[g.head(g.adj[i])], u, g.weight(i), esc);','auto [v,w]=g.edge(u,i);\n      r->put(--r->off[v], v, u, w, esc);')
s=s.replace('if (g.head(g.adj[i]) - lo < hi - lo)','if (g.edge(u,i).first - lo < hi - lo)')
s=s.replace('std::pair<Graph *, Graph *> contract','std::pair<CsrGraph *, CsrGraph *> contract')
s=s.replace('(size_t(n) + total + edges[threads] + 1) * 4 + 64','(size_t(n) + total + (3ul*edges[threads]+3)/4 + 1) * 4 + 64')
s=s.replace('Graph *g = new Graph(total, edges[threads], spare + edges[threads], spare);','CsrGraph *g = new CsrGraph(total, edges[threads], spare + (3ul*edges[threads]+3)/4, spare);')
s=s.replace('g->put(shift + pos, h, weight, escapes[k]);','g->put(shift + pos, base[t] + i, h, weight, escapes[k]);')
s=s.replace('rev.r->adj = splice<u32>(outs, g->m);','rev.r->adj = splice<CsrGraph::Edge>(outs, g->m);')
s=s.replace('  const Graph &g;','  const CsrGraph &g;').replace('explicit Side(const Graph &g)','explicit Side(const CsrGraph &g)')
s=s.replace('        u32 v = g.adj[i] >> (W ? W : g.wbits);','        auto [v,w] = g.edge(u,i);')
s=s.replace('        u32 mask = W ? (1u << W) - 1 : g.mask;\n        u64 w = g.adj[i] & mask;\n        u64 nd = d + (w == mask ? g.weight(i) : w), old = *x;','        u64 nd = d + w, old = *x;')
s=s.replace('    if (g.wbits == 11) drain_bits<11>(other, best);\n    else drain_bits<>(other, best);','    drain_bits<>(other,best);')
assert 'g.head(' not in s and 'g.weight(' not in s
Path('work/variants/prefix_csr24.cpp').write_text(s)
# Signed thirteen-bit delta, eleven-bit weight alternative.
x=s.replace('16383u)<<10','8191u)<<11').replace('delta < -8192 || delta >= 8192 || w>=1023','delta < -4096 || delta >= 4096 || w>=2047').replace('int32_t(e<<8)>>18','int32_t(e<<8)>>19').replace('e&1023u','e&2047u')
Path('work/variants/prefix_csr24w11.cpp').write_text(x)
