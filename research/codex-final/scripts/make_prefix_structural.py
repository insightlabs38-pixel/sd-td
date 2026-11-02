from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
# Recycle allocator free pages before query labels begin.
x=s.replace('  size_t queries = ends.size() / 2;','  malloc_trim(0);\n  size_t queries = ends.size() / 2;');Path('work/variants/prefix_trim.cpp').write_text(x)
# Cumulative row ends eliminate degree escapes and prefix reconstruction.
x=s.replace('uint8_t *ends;','u32 *ends;').replace('reg.ends = alloc<uint8_t>(n)','reg.ends = alloc<u32>(n)').replace('release(reg.ends, n);','release(reg.ends, n);')
x=x.replace('        u32 before = reg.edges;\n','')
x=x.replace('        u32 degree = reg.edges - before;\n        reg.ends[h] = std::min(degree, 255u);\n        if (degree >= 255) reg.esc.push_back({~size_t(0) - h, degree});','        reg.ends[h] = reg.edges;')
old='''      u32 pos = std::accumulate(reg.ends, reg.ends + lo, 0u), shift = edges[t];
      for (auto it = std::lower_bound(reg.esc.begin(), reg.esc.end(), std::pair(~size_t(0) - reg.len, 0ul)); it != reg.esc.end(); ++it)
        if (~it->first < lo) pos += it->second - 255;'''
assert old in x;x=x.replace(old,'      u32 pos = lo ? reg.ends[lo-1] : 0, shift = edges[t];')
x=x.replace('''        u32 degree = reg.ends[i];
        if (degree == 255)
          degree = std::lower_bound(reg.esc.begin(), reg.esc.end(), std::pair(~size_t(0) - i, 0ul))->second;''','        u32 degree = reg.ends[i]-pos;')
Path('work/variants/prefix_cumulative.cpp').write_text(x)
# Serial edge contraction: much less state, retain exact step/claim semantics.
a=s.index('  void expand(u32 u, size_t &walking) {');b=s.index('\n};\n\n// The reverse',a)
x=s[:a]+'''  void grow(u32 z) {
    for(u32 lo=reg.len,unused=(claim(z),0);lo<reg.len;++lo) {
      for(u32 h=lo+1;h<std::min(reg.len,lo+9);++h)
        __builtin_prefetch(&raw.adj[4*size_t(reg.order[h])]);
      u32 u=reg.order[lo],before=reg.edges;
      for(auto [i,end]=row(raw,u);i<end;++i) {
        u32 y=raw.head(raw.adj[i]);
        if(y==u)continue;
        u32 pos=reg.edges++;
        if(test(bypass,y)) {
          Walk w{pos,u,u,y,0,raw.weight(i)};
          while(step(w)) {}
        } else claim(y),put(pos,y,raw.weight(i));
      }
      u32 degree=reg.edges-before;
      reg.ends[lo]=std::min(degree,255u);
      if(degree>=255)reg.esc.push_back({~size_t(0)-lo,degree});
    }
  }'''+s[b:]
x=x.replace('  static constexpr u32 BATCH = 8;\n','').replace('  std::vector<Walk> walks;\n','')
Path('work/variants/prefix_serial.cpp').write_text(x)
# Collapse only the fully materialized CSR allocations, never sparse labels.
a=s.index('int main() {')
helper='''void huge(void *p,size_t bytes) {
  uintptr_t start=uintptr_t(p)&~uintptr_t(4095);
  bytes+=uintptr_t(p)-start;
  madvise((void*)start,bytes,MADV_HUGEPAGE);
  madvise((void*)start,bytes,25); // MADV_COLLAPSE: advisory on older kernels
}
'''
x=s[:a]+helper+s[a:]
x=x.replace('  size_t queries = ends.size() / 2;','''  huge(fwd->adj,(size_t(fwd->m)+fwd->n+1)*4);
  huge(rev->adj,size_t(rev->m)*4);
  huge(rev->off,(size_t(rev->n)+1)*4);
  size_t queries = ends.size() / 2;''')
Path('work/variants/prefix_huge.cpp').write_text(x)
