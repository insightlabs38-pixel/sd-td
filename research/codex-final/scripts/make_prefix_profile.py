from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
s='#include <chrono>\n#include <cstdio>\n#include <sys/resource.h>\n'+s
p=s.index('using u32')
s=s[:p]+'''void stamp(const char *phase) {
 static auto previous=std::chrono::steady_clock::now(); static double previous_cpu=0;
 auto now=std::chrono::steady_clock::now(); rusage r{};getrusage(RUSAGE_SELF,&r);
 double cpu=r.ru_utime.tv_sec+r.ru_utime.tv_usec*1e-6+r.ru_stime.tv_sec+r.ru_stime.tv_usec*1e-6;
 fprintf(stderr,"phase=%s wall_ms=%.3f cpu_ms=%.3f rss=%ld\\n",phase,std::chrono::duration<double,std::milli>(now-previous).count(),(cpu-previous_cpu)*1000,r.ru_maxrss);
 previous=now;previous_cpu=cpu;
}
thread_local uint64_t pops=0,stale=0,arcs=0,changes=0;
'''+s[p:]
s=s.replace('int main() {','int main() {\n  stamp("start");')
s=s.replace('  // Four slots per vertex','  stamp("parse");\n  // Four slots per vertex')
s=s.replace('  g->merge(escapes);\n  return g;','  g->merge(escapes);\n  stamp("raw");\n  return g;')
s=s.replace('  u32 wbits = raw->wbits, mask = raw->mask;','  stamp("grow");\n  u32 wbits = raw->wbits, mask = raw->mask;')
s=s.replace('  std::vector<Escapes> back(threads);','  stamp("rename");\n  std::vector<Escapes> back(threads);')
s=s.replace('  return {g, rev.r};','  stamp("reverse");\n  return {g, rev.r};')
s=s.replace('      if (dist.get(u) != d)\n        continue;','      ++pops;\n      if (dist.get(u) != d) { ++stale; continue; }')
s=s.replace('        queue.push(nd, v, nd < old);','        ++arcs;changes+=nd<old;\n        queue.push(nd, v, nd < old);')
s=s.replace('  size_t queries = ends.size() / 2;','''  uint64_t hist[8]={};
  for(u32 u=0;u<fwd->n;++u) for(u32 i=fwd->off[u];i<fwd->off[u+1];++i) {
    u32 v=fwd->head(fwd->adj[i]);u32 delta=u>v?u-v:v-u;
    for(unsigned k=0;k<6;++k) hist[k]+=delta<(1u<<(10+k));
    hist[6]+=u/65536==v/65536;hist[7]+=fwd->weight(i)>=2047;
  }
  fprintf(stderr,"graph n=%u m=%u esc=%zu hist",fwd->n,fwd->m,fwd->esc.size());for(auto x:hist)fprintf(stderr," %lu",x);fprintf(stderr,"\\n");
  stamp("stats");
  size_t queries = ends.size() / 2;''')
s=s.replace('    Worker<uint16_t> narrow','    std::vector<std::pair<u64,u32>> costs;\n    Worker<uint16_t> narrow')
s=s.replace('      u64 d = narrow.solve(s, t);','      u64 before=pops;\n      u64 d = narrow.solve(s, t);')
s=s.replace('      answers[i] = d < INF ? int64_t(d) : -1;','      costs.push_back({pops-before,i});\n      answers[i] = d < INF ? int64_t(d) : -1;')
s=s.replace('    }\n  });\n  std::string text;','''    }
    fprintf(stderr,"pops=%lu stale=%lu arcs=%lu changes=%lu\\n",pops,stale,arcs,changes);
    std::sort(costs.rbegin(),costs.rend());for(size_t j=0;j<std::min<size_t>(10,costs.size());++j)fprintf(stderr,"expensive q=%u pops=%lu\\n",costs[j].second,costs[j].first);
  });
  stamp("queries");
  std::string text;''')
s=s.replace('  exit(0);','  stamp("output");\n  exit(0);')
Path('work/variants/prefix_profile.cpp').write_text(s)
