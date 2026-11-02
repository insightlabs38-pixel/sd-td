from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text()
s=s.replace('template <class L> struct Labels','template <class L, class P=uintptr_t> struct Labels').replace('template <class L> struct Side','template <class L, class P=uintptr_t> struct Side').replace('template <class L> struct Worker','template <class L, class P=uintptr_t> struct Worker')
s=s.replace('  Labels<L> dist;','  Labels<L,P> dist;').replace('  Side<L> fwd, bwd;','  Side<L,P> fwd, bwd;')
a=s.index('template <class L, class P=uintptr_t> struct Labels');b=s.index('// One direction with',a)
x=s[a:b]
x=x.replace('  std::vector<L *> dir;','  L *store;\n  P blank;\n  std::vector<P> dir;').replace('  L *store, blank[128];\n','')
a0=x.index('  explicit Labels(');b0=x.index('  void reset()',a0)
x=x[:a0]+'''  explicit Labels(u32 n) {
    store=alloc<L>(n+256);
    if constexpr(sizeof(P)==4) {
      release(store,n+256);
      store=(L*)mmap(nullptr,(size_t(n)+256)*sizeof(L)+64,PROT_READ|PROT_WRITE,
          MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE|MAP_32BIT,-1,0);
      if(store==MAP_FAILED) throw LowAddressUnavailable{};
      madvise(store,(size_t(n)+256)*sizeof(L)+64,MADV_NOHUGEPAGE);
    }
    blank=P(uintptr_t(store));dir.assign(n/128+1,blank);
    std::fill_n(store,128,NONE);
  }
  L *at(u32 v) const {return (L*)uintptr_t(dir[v/128])+v%128;}
  u64 get(u32 v) const {return *at(v);}
  L *slot(u32 v) {
    if(dir[v/128]==blank) {
      L *p=std::fill_n(store+(used.size()+1)*128,128,NONE)-128;
      dir[v/128]=P(uintptr_t(p));used.push_back(v/128);
    }
    return at(v);
  }
'''+x[b0:]
s=s[:a]+'struct LowAddressUnavailable {};\n'+x+s[b:]
a=s.index('    Worker<uint16_t> narrow{');b=s.index('\n  });\n  std::string text;',a)
body=s[a:b]
old='    Worker<uint16_t> narrow{Side<uint16_t>(*fwd), Side<uint16_t>(*rev)};\n'
assert old in body;body=body.replace(old,'    auto run = [&](auto &narrow) {\n')
body+='''
    };
    Worker<uint16_t,u32> *low=nullptr;
    try {low=new Worker<uint16_t,u32>{Side<uint16_t,u32>(*fwd),Side<uint16_t,u32>(*rev)};}
    catch(const LowAddressUnavailable &) {}
    if(low) run(*low);
    else {
      Worker<uint16_t> high{Side<uint16_t>(*fwd),Side<uint16_t>(*rev)};
      run(high);
    }'''
s=s[:a]+body+s[b:]
Path('work/variants/prefix12_lowlabels.cpp').write_text(s)
# Force fallback through the same compile-time directory interfaces.
x=s.replace('if(store==MAP_FAILED) throw LowAddressUnavailable{};','if(store==MAP_FAILED || getenv("SD_FORCE_LABEL_FALLBACK")) throw LowAddressUnavailable{};')
Path('work/variants/prefix12_lowlabels_gate.cpp').write_text(x)
