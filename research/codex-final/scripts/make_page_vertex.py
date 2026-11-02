from pathlib import Path
s=Path('work/variants/prefix_csr24index_load.cpp').read_text()
a=s.index('// Three-byte local edges')
s=s[:a]+'''struct Vertex {
 u32 page,lo;
 Vertex(u32 v):page(v>>7),lo(v&127) {}
 Vertex(u32 page,u32 lo):page(page),lo(lo) {}
 operator u32() const {return page<<7|lo;}
};
'''+s[a:]
s=s.replace('int delta=int(v)-int(u);','u32 delta=v-((u&~127u)-8192);').replace('u32(delta)&16383u','delta&16383u').replace('delta < -8192 || delta >= 8192','delta >= 16384')
s=s.replace('std::pair<u32,u64> edge(u32 u,u32 i) const','std::pair<Vertex,u64> edge(u32 u,u32 i) const')
s=s.replace('return {u32(x>>43),x&((u64(1)<<43)-1)};','return {Vertex(u32(x>>43)),x&((u64(1)<<43)-1)};')
s=s.replace('return {u+u32(int32_t(e<<8)>>18),e&1023u};','return {Vertex((u>>7)-64+(e>>17),(e>>10)&127),e&1023u};')
a=s.index('template <class L> struct Labels {');b=s.index('// One direction with',a)
x=s[a:b].replace('at(u32 v)','at(Vertex v)').replace('get(u32 v)','get(Vertex v)').replace('slot(u32 v)','slot(Vertex v)').replace('v / 128','v.page').replace('v % 128','v.lo')
s=s[:a]+x+s[b:]
Path('work/variants/prefix_csr24pages.cpp').write_text(s)
