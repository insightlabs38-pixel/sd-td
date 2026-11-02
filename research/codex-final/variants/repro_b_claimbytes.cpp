#define CLAIM_BYTES
#define EXPECT_FIXED
#include <atomic>
#include <cstdio>
#include <cstdint>
#include <sys/wait.h>
#include <signal.h>
#include <thread>
#include <unistd.h>
std::atomic<int> phase{0};
thread_local int role=0;
void *watched=nullptr;
uint32_t *fast_length=nullptr, vertices=0;
template<class T> T claim_load(T *p,int order) {
  if(role==1 && p==watched && *fast_length>=vertices-1 && phase.load()==1) {
    fprintf(stderr,"fast region already contains %u of %u vertices; releasing stale claim\n",*fast_length,vertices);
    phase.store(2);
    while(phase.load()!=3) std::this_thread::yield();
  }
  T value=__atomic_load_n(p,order);
  if(role==2 && p==watched && phase.load()==0) {
    phase.store(1);
    while(phase.load()!=2) std::this_thread::yield();
  }
  return value;
}
template<class T,class V> void claim_store(T *p,V v,int order) {
  __atomic_store_n(p,T(v),order);
  if(role==2 && p==watched && phase.load()==2) {
    phase.store(3);
    while(phase.load()!=4) std::this_thread::yield();
  }
}
uint64_t claim_or(uint64_t *p,uint64_t bit,int order) {
  uint64_t prior=__atomic_fetch_or(p,bit,order);
  if(role==2 && p==watched && phase.load()==2) {
    phase.store(3);
    while(phase.load()!=4) std::this_thread::yield();
  }
  return prior;
}
#define main unused_solver_main
#include "b_claimbytes_instrumented.cpp"
#undef main
template<class T> T *guarded(size_t n) {
  size_t bytes=(n*sizeof(T)+64+4095)/4096*4096;
  char *p=(char*)mmap(nullptr,bytes+4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
  mprotect(p+bytes,4096,PROT_NONE);
  return (T*)p;
}
void reproduce(bool full) {
  u32 n=full?1740512:1000, m=full?5000000:4000, seed=n/2;
  vertices=n;
  u32 *rows=alloc<u32>(size_t(4)*n+m);
  Graph raw(n,m,rows,rows);
  for(u32 u=0;u<n;++u) {
    rows[4ul*u]=(u+1)%n<<raw.wbits|1;
    rows[4ul*u+1]=(u+2)%n<<raw.wbits|1;
    rows[4ul*u+2]=rows[4ul*u+3]=NONE;
  }
  rows[4ul*seed]=1u<<raw.wbits|1;
  u32 extra=m-2*n, start=4*n;
  rows[0]=SPILL; rows[1]=start; rows[2]=extra+2;
  rows[start]=1u<<raw.wbits|1;
  for(u32 j=1;j<extra+2;++j)rows[start+j]=2u<<raw.wbits|1;
  Bits bypass(n/64+1,~u64(0));
#ifdef CLAIM_BYTES
  std::vector<uint8_t> claimed(n);
#else
  Bits claimed(n/64+1);
#endif
  bypass[0]&=~u64(1); bypass[seed/64]&=~(u64(1)<<(seed%64));
#ifdef CLAIM_BYTES
  watched=&claimed[1];
#else
  watched=claimed.data();
#endif
  Region a{},b{};
  for(Region *r:{&a,&b}) {
    r->order=guarded<u32>(n);r->ends=guarded<u32>(n);r->out=guarded<u32>(m);
  }
  fast_length=&a.len;
  Grower fast{raw,bypass,claimed,a},slow{raw,bypass,claimed,b};
  std::thread other([&]{role=2;slow.grow(seed);});
  while(phase.load()!=1)std::this_thread::yield();
  role=1;fast.grow(0);
  fprintf(stderr,"completed fast region len=%u edges=%u (capacities %u,%u)\n",a.len,a.edges,n,m);
  phase.store(4);other.join();
}
int main(int argc,char**) {
  pid_t child=fork();
  if(!child){reproduce(argc>1);_exit(0);}
  int status=0;waitpid(child,&status,0);
  printf("child_signal=%d expected_guard_failure=%d\n",WIFSIGNALED(status)?WTERMSIG(status):0,SIGSEGV);
#ifdef EXPECT_FIXED
  return WIFEXITED(status)&&WEXITSTATUS(status)==0?0:1;
#else
  return WIFSIGNALED(status)&&WTERMSIG(status)==SIGSEGV?0:1;
#endif
}
