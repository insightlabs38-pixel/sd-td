from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text()
for cap in [512,2048,8192,32768]:
 for fifo in [False,True] if cap in [2048,8192] else [False]:
  x=s.replace('  std::vector<Walk> walks;','  std::vector<Walk> walks;\n  std::vector<u32> pending;\n  u32 limit=0;')
  old='''    if (!(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit))
      reg.order[reg.len++] = z;'''
  new='''    if (!(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit)) {
      if(reg.len<limit) reg.order[reg.len++]=z;
      else pending.push_back(z);
    }'''
  assert old in x;x=x.replace(old,new)
  old='''    u32 lo = reg.len, hi;
    for (claim(z); lo < reg.len; lo = hi) {'''
  new=f'''    u32 lo = reg.len, hi;
    limit=reg.len+{cap};
    claim(z);
    size_t taken=0;
    for (;;) {{
      for (; lo < reg.len; lo = hi) {{'''
  assert old in x;x=x.replace(old,new)
  a=x.index('  void grow(u32 z)');b=x.index('\n};\n\n// The reverse',a)
  g=x[a:b];old='''      }
    }
  }''';assert g.endswith(old),g[-120:]
  new='''      }
      }
'''+('''      if(taken==pending.size()) {pending.clear();break;}
''' if fifo else '''      if(pending.empty()) break;
''')+f'''      limit=reg.len+{cap};
'''+('''      reg.order[reg.len++]=pending[taken++];
''' if fifo else '''      reg.order[reg.len++]=pending.back();pending.pop_back();
''')+'''    }
  }'''
  g=g[:-len(old)]+new;x=x[:a]+g+x[b:]
  name=f'prefix12_local{cap}'+('_fifo' if fifo else '')
  Path('work/variants/'+name+'.cpp').write_text(x)
