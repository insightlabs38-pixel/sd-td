from pathlib import Path
import subprocess
for name,source in [('wide128','prefix12_wide128'),('query10','prefix12_query10')]:
 branch='prize/d-codex-final-prefix-'+name;tree=Path('/workspace/work/prefix-'+name+'-qualify')
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'dee8523da78fe7bc87816bd8e8f1a871db6d27b8'],check=True)
 with (tree/'track-d/d_traverse.cpp').open('w') as f:subprocess.run(['/workspace/work/tools/clang-format','--style=LLVM','/workspace/work/variants/'+source+'.cpp'],stdout=f,check=True)
 w=Path('/workspace/work/prefix-simd-qualify/.github/workflows/d-codex-final-qualify.yml').read_text().replace('prize/d-codex-final-prefix-simd',branch)
 (tree/'.github/workflows/d-codex-final-qualify.yml').write_text(w);(tree/'tests/stream_compare.py').write_text(Path('/workspace/work/prefix-simd-qualify/tests/stream_compare.py').read_text())
 for args in [['add','track-d/d_traverse.cpp','.github/workflows/d-codex-final-qualify.yml','tests/stream_compare.py'],['commit','-m','Qualify prefix '+name+' against immutable champion'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
 print(name,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD:track-d/d_traverse.cpp'],text=True).strip(),flush=True)
