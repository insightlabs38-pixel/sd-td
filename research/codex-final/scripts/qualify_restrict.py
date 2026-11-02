from pathlib import Path
import subprocess
for name in ['member','helper']:
 branch='prize/d-codex-final-champion-restrict-'+name;tree=Path('/workspace/work/champion-restrict-'+name+'-qualify')
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'9a28cc082325714126385578db85c6c1617bc617'],check=True)
 with (tree/'track-d/d_traverse.cpp').open('w') as f:subprocess.run(['/workspace/work/tools/clang-format','--style=LLVM','/workspace/work/variants/champion_restrict_'+name+'.cpp'],stdout=f,check=True)
 p=tree/'.github/workflows/d-codex-final-qualify.yml';w=p.read_text().replace('prize/d-codex-final-prefix-simd-pages',branch).replace('5d56a5bebdf1d82633e6e643801213f5df987578','02e0764ef534a8a6694006b12911776e0a9f2860');p.write_text(w)
 for args in [['add','track-d/d_traverse.cpp','.github/workflows/d-codex-final-qualify.yml'],['commit','-m','Qualify nonalias query '+name+' against exact champion'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
 print(name,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD','HEAD:track-d/d_traverse.cpp'],text=True).strip(),flush=True)
