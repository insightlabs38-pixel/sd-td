from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
s='#include <chrono>\n#include <cstdio>\n#include <sys/resource.h>\n'+s
pos=s.index('using u32')
s=s[:pos]+'''void stamp(const char *phase) {
 static auto previous = std::chrono::steady_clock::now();
 static double cpu_previous=0;
 auto now=std::chrono::steady_clock::now();
 rusage r{}; getrusage(RUSAGE_SELF,&r);
 double cpu=r.ru_utime.tv_sec+r.ru_utime.tv_usec*1e-6+r.ru_stime.tv_sec+r.ru_stime.tv_usec*1e-6;
 fprintf(stderr,"%s wall_ms=%.3f cpu_ms=%.3f rss_kib=%ld\\n",phase,std::chrono::duration<double,std::milli>(now-previous).count(),(cpu-cpu_previous)*1000,r.ru_maxrss);
 previous=now;cpu_previous=cpu;
}
thread_local uint64_t pops=0,stale=0,arcs=0,changes=0;
'''+s[pos:]
s=s.replace('int main() {','int main() {\n  stamp("start");')
s=s.replace('  Graph *g = new Graph(n, m);','  stamp("parse-bin");\n  Graph *g = new Graph(n, m);',1)
s=s.replace('  g->merge(escapes);\n  return g;','  g->merge(escapes);\n  stamp("raw-csr");\n  return g;',1)
s=s.replace('  u32 wbits = raw->wbits, mask = raw->mask;','  stamp("grow-contract");\n  u32 wbits = raw->wbits, mask = raw->mask;')
s=s.replace('  Graph *g = new Graph(base[threads], edges[threads]);','  stamp("rename-map");\n  Graph *g = new Graph(base[threads], edges[threads]);')
s=s.replace('  std::vector<Escapes> back(threads);','  stamp("forward-rename-count");\n  std::vector<Escapes> back(threads);')
s=s.replace('  return {g, rev.r};','  fprintf(stderr,"graph n=%u m=%u escapes=%zu reverse_escapes=%zu\\n",g->n,g->m,g->esc.size(),rev.r->esc.size());\n  stamp("reverse-place");\n  return {g, rev.r};')
s=s.replace('      if (dist.get(u) != d)\n        continue;','      ++pops;\n      if (dist.get(u) != d) { ++stale; continue; }')
s=s.replace('        queue.push(nd, v, nd < old);','        ++arcs;changes+=nd<old;\n        queue.push(nd, v, nd < old);')
s=s.replace('  std::atomic<size_t> next{0};','  stamp("schedule");\n  std::atomic<size_t> next{0};')
s=s.replace('    }\n  });\n  std::string text;','    }\n    fprintf(stderr,"query pops=%lu stale=%lu arcs=%lu changes=%lu\\n",pops,stale,arcs,changes);\n  });\n  stamp("queries");\n  std::string text;')
s=s.replace('  exit(0);','  stamp("output");\n  exit(0);')
Path('work/variants/profile.cpp').write_text(s)
