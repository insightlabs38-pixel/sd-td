from pathlib import Path
for name in ['prefix_csr24','prefix_csr24index','prefix_csr24indexw11']:
 s=Path('work/variants/'+name+'.cpp').read_text();assert 'u32 e=0;memcpy(&e,adj+i,3);' in s
 s=s.replace('u32 e=0;memcpy(&e,adj+i,3);','u32 e;memcpy(&e,adj+i,4);e&=0xffffff;')
 Path('work/variants/'+name+'_load.cpp').write_text(s)
