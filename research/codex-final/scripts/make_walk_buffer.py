from pathlib import Path
s=Path('work/variants/champion33672.cpp').read_text()
s=s.replace('  std::vector<Walk> walks;','''  std::vector<Walk> walks;
  u64 *scratch=alloc<u64>(raw.m);
  u32 batchStart=0;
  ~Grower() {release(scratch,raw.m);}''')
a=s.index('  void put(u32 pos, u32 z, u64 w) {',s.index('struct Grower'));b=s.index('  // Advances a walk',a)
x=s[a:b].replace('  void put(', '  void emit(')
x+='''  void put(u32 pos,u32 z,u64 w) {
    scratch[pos-batchStart]=u64(z)<<43|w;
  }
'''
s=s[:a]+x+s[b:]
a=s.index('  void grow(u32 z)');b=s.index('\n};\n\n// The reverse',a)
x=s[a:b]
x=x.replace('      size_t walking = 0;','      size_t walking = 0;\n      u32 ends[BATCH];\n      batchStart=reg.edges;')
x=x.replace('''        u32 before = reg.edges;
        expand(reg.order[h], walking);
        u32 degree = reg.edges - before;
        reg.ends[h] = std::min(degree, 255u);
        if (degree >= 255)
          reg.esc.push_back({~size_t(0) - h, degree});''','''        expand(reg.order[h], walking);
        ends[h-lo]=reg.edges;''')
assert 'u32 before = reg.edges;' not in x
old='''        walking = kept;
      }
    }
  }'''
new='''        walking = kept;
      }
      reg.edges=batchStart;
      u32 pos=0;
      for(u32 h=lo;h<hi;++h) {
        u32 before=reg.edges;
        for(;pos<ends[h-lo]-batchStart;++pos) {
          u64 e=scratch[pos];u32 v=e>>43;
          if(v!=reg.order[h]) emit(reg.edges++,v,e&((u64(1)<<43)-1));
        }
        u32 degree=reg.edges-before;
        reg.ends[h]=std::min(degree,255u);
        if(degree>=255) reg.esc.push_back({~size_t(0)-h,degree});
      }
    }
  }'''
assert x.endswith(old);x=x[:-len(old)]+new;s=s[:a]+x+s[b:]
Path('work/variants/champion_walkbuffer.cpp').write_text(s)
