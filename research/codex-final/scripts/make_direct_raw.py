from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text();a=s.index('// An edge binned by its tail');b=s.index('// ---------------------------------------------------------------- ordering',a)
x='''// Parse directly into four inline slots. The byte cursor stops issuing RMWs
// after four claims; at most threads-1 stale loads can increment it further.
// Other edges are collected privately and scattered only after row headers exist.
Graph *read_graph(const char *lo,const char *hi,const Bits &terminal,
                  Bits &bypass,unsigned threads) {
  const char *p=lo;
  u32 n=scan(p),m=scan(p);
  auto line=[&](unsigned k) {
    const char *x=p+(hi-p)*k/threads;
    return x==p || x==hi ? x : (const char*)memchr(x,'\\n',hi-x)+1;
  };
  auto range=[&](unsigned t) {
    u32 words=(n+63)/64;
    return std::pair(cut(words,t,threads)*64,std::min(n,cut(words,t+1,threads)*64));
  };
  u32 *rows=alloc<u32>(4ul*n+m),*cursor=alloc<u32>(n);
  uint8_t *filled=alloc<uint8_t>(n);
  Graph *g=new Graph(n,m,rows,rows);
  struct Extra {u32 u,v,w;};
  std::vector<std::vector<Extra>> extra(threads);
  std::vector<Escapes> escapes(threads);
  parallel(threads,[&](unsigned t) {
    auto [first,end]=range(t);
    std::fill(rows+4ul*first,rows+4ul*end,NONE);
  });
  parallel(threads,[&](unsigned t) {
    parse(lo,hi,line(t),line(t+1),[&](u32 u,u32 v,u32 w) {
      u32 i=__atomic_load_n(filled+u,__ATOMIC_RELAXED);
      if(i<4) i=__atomic_fetch_add(filled+u,uint8_t(1),__ATOMIC_RELAXED);
      if(i<4) g->put(4ul*u+i,v,w,escapes[t]);
      else extra[t].push_back({u,v,w});
    });
  });
  parallel(threads,[&](unsigned t) {
    for(auto e:extra[t]) __atomic_fetch_add(cursor+e.u,1u,__ATOMIC_RELAXED);
  });
  std::atomic<u32> spilled{0};
  parallel(threads,[&](unsigned t) {
    auto [first,end]=range(t);
    for(u32 u=first;u<end;++u) {
      if(filled[u]<=2 && !test(terminal,u)) set(bypass,u);
      if(u32 count=cursor[u]) {
        u32 start=4*n+spilled.fetch_add(count+4),*r=rows+4ul*u;
        std::copy_n(r,4,rows+start);
        r[0]=SPILL;r[1]=start;r[2]=count+4;r[3]=NONE;
        cursor[u]=start+4;
      }
    }
  });
  parallel(threads,[&](unsigned t) {
    for(auto e:extra[t])
      g->put(__atomic_fetch_add(cursor+e.u,1u,__ATOMIC_RELAXED),e.v,e.w,escapes[t]);
    for(auto &e:escapes[t])
      if(e.first<4ul*n && rows[e.first/4*4]==SPILL)
        e.first=rows[e.first/4*4+1]+e.first%4;
  });
  release(cursor,n);release(filled,n);
  g->merge(escapes);
  return g;
}

'''
s=s[:a]+x+s[b:]
Path('work/variants/prefix12_directraw.cpp').write_text(s)
