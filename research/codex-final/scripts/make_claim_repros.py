from pathlib import Path
base=Path('work/variants/repro_claim.cpp').read_text()
base=base.replace('uint64_t *watched=nullptr;', 'void *watched=nullptr;')
base=base.replace('uint64_t claim_load(uint64_t *p,int order)', 'template<class T> T claim_load(T *p,int order)').replace('  uint64_t value=__atomic_load_n(p,order);','  T value=__atomic_load_n(p,order);')
base=base.replace('void claim_store(uint64_t *p,uint64_t v,int order)', 'template<class T,class V> void claim_store(T *p,V v,int order)').replace('__atomic_store_n(p,v,order);','__atomic_store_n(p,T(v),order);')
pos=base.index('#define main unused_solver_main')
base=base[:pos]+'''uint64_t claim_or(uint64_t *p,uint64_t bit,int order) {
  uint64_t prior=__atomic_fetch_or(p,bit,order);
  if(role==2 && p==watched && phase.load()==2) {
    phase.store(3);
    while(phase.load()!=4) std::this_thread::yield();
  }
  return prior;
}
'''+base[pos:]
base=base.replace('  Bits bypass(n/64+1,~u64(0)), claimed(n/64+1);','''  Bits bypass(n/64+1,~u64(0));
#ifdef CLAIM_BYTES
  std::vector<uint8_t> claimed(n);
#else
  Bits claimed(n/64+1);
#endif''')
base=base.replace('  watched=claimed.data();','''#ifdef CLAIM_BYTES
  watched=&claimed[1];
#else
  watched=claimed.data();
#endif''')
base=base.replace('  return WIFSIGNALED(status)&&WTERMSIG(status)==SIGSEGV?0:1;', '''#ifdef EXPECT_FIXED
  return WIFEXITED(status)&&WEXITSTATUS(status)==0?0:1;
#else
  return WIFSIGNALED(status)&&WTERMSIG(status)==SIGSEGV?0:1;
#endif''')
Path('work/claim_repro_template.cpp').write_text(base)
for name,mode in [('b_claimbytes','CLAIM_BYTES'),('b_claimatomic','CLAIM_ATOMIC')]:
 s=Path('work/variants/'+name+'.cpp').read_text()
 a=s.index('  void claim(',s.index('struct Grower'));b=s.index('  void put(',a)
 body=s[a:b].replace('__atomic_load_n(', 'claim_load(').replace('__atomic_store_n(', 'claim_store(').replace('__atomic_fetch_or(', 'claim_or(')
 s=s[:a]+body+s[b:]
 Path('work/variants/'+name+'_instrumented.cpp').write_text(s)
 harness='#define '+mode+'\n#define EXPECT_FIXED\n'+base.replace('"b_instrumented.cpp"','"'+name+'_instrumented.cpp"')
 Path('work/variants/repro_'+name+'.cpp').write_text(harness)
