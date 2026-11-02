from pathlib import Path
s=Path('work/variants/one_potential.cpp').read_text()
s='''#include <chrono>
#include <cstdio>
#include <sys/resource.h>
void stamp(const char *p) {
 static auto last=std::chrono::steady_clock::now();
 static double prev=0;
 rusage r{}; getrusage(RUSAGE_SELF,&r);
 double cpu=r.ru_utime.tv_sec+r.ru_utime.tv_usec*1e-6+r.ru_stime.tv_sec+r.ru_stime.tv_usec*1e-6;
 auto now=std::chrono::steady_clock::now();
 fprintf(stderr,"%s wall=%.3f cpu=%.3f\\n",p,std::chrono::duration<double,std::milli>(now-last).count(),(cpu-prev)*1000);
 prev=cpu;last=now;
}
'''+s
s=s.replace('int main() {','int main() {\n stamp("start");')
s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);','  stamp("raw");\n  auto [fwd, rev] = contract(raw, bypass, threads, ends);\n  stamp("contract");')
s=s.replace('  size_t queries = ends.size() / 2;','  stamp("index");\n  size_t queries = ends.size() / 2;')
s=s.replace('  std::string text;','  stamp("queries");\n  std::string text;')
Path('work/variants/potential_profile.cpp').write_text(s)
# Give only query queues finer buckets; the preprocessing queue remains unchanged.
s=Path('work/variants/one_potential.cpp').read_text()
a=s.index('struct Queue {');b=s.index('// A clipped undirected distance',a)
q=s[a:b]
for shift in [0,2,4]:
 alt=q.replace('struct Queue {','struct QueryQueue {').replace('explicit Queue(u32)', 'explicit QueryQueue(u32)').replace('shift = 7','shift = '+str(shift))
 insert=s.index("// A clipped undirected distance")
 t=s[:insert]+alt+s[insert:]
 a=t.index('template <class L> struct Side');b=t.index('// An exact forward probe',a)
 part=t[a:b].replace('Queue queue;','QueryQueue queue;').replace('Queue::','QueryQueue::')
 t=t[:a]+part+t[b:]
 Path(f'work/variants/potential_width{shift}.cpp').write_text(t)
