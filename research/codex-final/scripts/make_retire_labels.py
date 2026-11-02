from pathlib import Path
s=Path('work/variants/champion33672.cpp').read_text()
for floor in [0,64,128,256]:
 x=s
 start='''  void reset() {
    for (u32 page : used)'''
 pre='''  void reset() {
    size_t bytes=(used.size()*256*sizeof(L)+4095)&~size_t(4095);
'''
 if floor:
  pre+=f'''    size_t keep=sizeof(L)==2 ? {floor}*1024 : 0;
    if(bytes>keep) madvise((char*)store+keep,bytes-keep,MADV_DONTNEED);
'''
 else:
  pre+='''    if(sizeof(L)==8 && bytes) madvise(store,bytes,MADV_DONTNEED);
'''
 pre+='    for (u32 page : used)'
 assert start in x;x=x.replace(start,pre)
 x=x.replace('        d = wide->solve(s, t);','        d = wide->solve(s, t);\n        wide->fwd.dist.reset();wide->bwd.dist.reset();')
 if floor:x=x.replace('      u64 d = narrow.solve(s, t);','      u64 d = narrow.solve(s, t);\n      narrow.fwd.dist.reset();narrow.bwd.dist.reset();')
 Path(f'work/variants/champion_retire{floor}.cpp').write_text(x)
