from pathlib import Path
for suffix,wb,hb in [('',10,14),('w11',11,13)]:
 s=Path(f'work/variants/prefix_csr24{suffix}.cpp').read_text();a=s.index('struct CsrGraph {');b=s.index('// An edge binned by its tail',a)
 c=s[a:b]
 c=c.replace('  Escapes esc;','  std::vector<u32> base;\n  std::vector<u64> heavy;')
 start=c.index('  void merge(');end=c.index('  void put(',start)
 c=c[:start]+f'''  void merge(std::vector<Escapes> &parts) {{
    Escapes all;
    for(auto &e:parts) all.insert(all.end(),e.begin(),e.end());
    std::sort(all.begin(),all.end());
    base.resize(m/{1<<hb}+1); heavy.reserve(all.size());
    u32 previous=~0u;
    for(auto [i,w]:all) {{
      u32 block=i>>{hb};
      if(block!=previous) base[block]=heavy.size(),previous=block;
      u32 token=u32(heavy.size()-base[block])<<{wb}|{(1<<wb)-1}u;
      memcpy(adj+i,&token,3);heavy.push_back(w);
    }}
  }}
'''+c[end:]
 c=c.replace('    if(e==0xffffff) {\n      u64 x=std::lower_bound(esc.begin(),esc.end(),std::pair(size_t(i),u64(0)))->second;',f'    if((e&{(1<<wb)-1}u)=={(1<<wb)-1}u) {{\n      u64 x=heavy[base[i>>{hb}]+(e>>{wb})];')
 assert 'esc.begin' not in c
 s=s[:a]+c+s[b:]
 Path(f'work/variants/prefix_csr24index{suffix}.cpp').write_text(s)
