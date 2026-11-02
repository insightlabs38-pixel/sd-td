from pathlib import Path
import subprocess
s=Path('/workspace/work/prefix-simd-pages-qualify/track-d/d_traverse.cpp').read_text();Path('/workspace/work/variants/champion33672.cpp').write_text(s)
for name in ['wide128','query10','wide128-query10']:
 branch='prize/d-codex-final-champion-'+name;tree=Path('/workspace/work/champion-'+name+'-qualify')
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'9a28cc082325714126385578db85c6c1617bc617'],check=True)
 x=s
 if 'wide128' in name:x=x.replace('B = BOUNDED ? 512 : 2048','B = BOUNDED ? 512 : 128')
 if 'query10' in name:x=x.replace('parallel(std::min<size_t>(threads, queries + 1)','parallel(std::min<size_t>(std::min(threads,10u), queries + 1)')
 assert x!=s;(tree/'track-d/d_traverse.cpp').write_text(x);Path('/workspace/work/variants/champion_'+name.replace('-','_')+'.cpp').write_text(x)
 wf=tree/'.github/workflows/d-codex-final-qualify.yml';w=wf.read_text().replace('prize/d-codex-final-prefix-simd-pages',branch).replace('5d56a5bebdf1d82633e6e643801213f5df987578','02e0764ef534a8a6694006b12911776e0a9f2860');wf.write_text(w)
 for args in [['add','track-d/d_traverse.cpp','.github/workflows/d-codex-final-qualify.yml'],['commit','-m','Qualify '+name+' on valid K33.672416 champion'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
 print(name,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD:track-d/d_traverse.cpp'],text=True).strip(),flush=True)
