#include <atomic>
#include <cstdio>
#include <cstdint>
#include <sys/wait.h>
#include <signal.h>
#include <thread>
#include <unistd.h>
std::atomic<int> arrivals{0};
thread_local bool held=false;
template<class T> T claim_load0(T *p,uint32_t z,int order) {
  T seen=__atomic_load_n(p,order);
  if(z==0 && !held) {
    held=true;arrivals.fetch_add(1);
    while(arrivals.load()!=3)std::this_thread::yield();
  }
  return seen;
}
#define main unused_solver_main
#include "solver.cpp"
#undef main
template<class T> T *guarded(size_t n) {
  size_t bytes=(n*sizeof(T)+64+4095)/4096*4096;
  char *p=(char*)mmap(nullptr,bytes+4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
  mprotect(p+bytes,4096,PROT_NONE);
  return (T*)p;
}
void reproduce(bool full) {
  u32 n=full?1740512:1000, m=full?5000000:4000;
  u32 a=cut(n,1,3),b=cut(n,2,3);
  u32 *rows=guarded<u32>(size_t(4)*n+m);
  Graph *raw=new Graph(n,m,rows,rows);
  for(size_t i=0;i<size_t(4)*n;++i)rows[i]=NONE;
  rows[0]=SPILL;rows[1]=4*n;rows[2]=m-2;
  for(u32 i=0;i<m-2;++i)rows[size_t(4)*n+i]=1u<<raw->wbits|1;
  rows[size_t(4)*a]=rows[size_t(4)*b]=1;
  Bits bypass(n/64+1,~u64(0));
  for(u32 v:{0u,1u,a,b})bypass[v/64]&=~(u64(1)<<(v%64));
  std::vector<u32> ends{0,1,a,b};
  auto [fwd,rev]=contract(raw,bypass,3,ends);
  Worker<u64> w{Side<u64>(*fwd),Side<u64>(*rev)};
  u64 d=w.solve(ends[0],ends[1]),missing=w.solve(ends[2],ends[3]);
  fprintf(stderr,"forward vertices=%u edges=%u capacities n=%u m=%u answers=%llu,%llu\n",fwd->n,fwd->m,n,m,(unsigned long long)d,(unsigned long long)missing);
  if(d!=1 || missing!=INF)_exit(5);
}
int main(int argc,char**) {
  pid_t child=fork();
  if(!child){reproduce(argc>1);_exit(0);}
  int status=0;waitpid(child,&status,0);
  printf("child_signal=%d exit_code=%d\n",WIFSIGNALED(status)?WTERMSIG(status):0,WIFEXITED(status)?WEXITSTATUS(status):-1);
#ifdef EXPECT_FAULT
  return WIFSIGNALED(status)&&WTERMSIG(status)==SIGSEGV?0:1;
#else
  return WIFEXITED(status)&&WEXITSTATUS(status)==0?0:1;
#endif
}
