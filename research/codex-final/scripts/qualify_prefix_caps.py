from pathlib import Path
import subprocess
root=Path('/workspace/work')
for cap,name in [(8,'eight'),(12,'twelve')]:
 branch=f'prize/d-codex-final-prefix-{name}'; tree=root/f'prefix-{name}-qualify'
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'5b66a9f82f525db61d675dbbc6e75aabaf50cb75'],check=True)
 p=tree/'track-d/d_traverse.cpp';s=p.read_text();assert 'std::min(threads, 6u)' in s
 s=s.replace('std::min(threads, 6u)',f'std::min(threads, {cap}u)' if cap<12 else 'threads');p.write_text(s)
 wf=tree/'.github/workflows/d-codex-final-qualify.yml';wf.write_text(wf.read_text().replace('prize/d-codex-final-prefix-bins',branch))
 subprocess.run(['git','-C',str(tree),'add','track-d/d_traverse.cpp','.github/workflows/d-codex-final-qualify.yml'],check=True)
 subprocess.run(['git','-C',str(tree),'commit','-m',f'Qualify prefix graph with {name} query workers'],check=True)
 subprocess.run(['git','-C',str(tree),'push','-u','origin',branch],check=True)
 print(branch,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD:track-d/d_traverse.cpp'],text=True).strip(),flush=True)
