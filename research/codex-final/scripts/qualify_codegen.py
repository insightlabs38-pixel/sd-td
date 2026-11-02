from pathlib import Path
import subprocess
branch='prize/d-codex-final-champion-bmi32';tree=Path('/workspace/work/champion-bmi32-qualify')
subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'9a28cc082325714126385578db85c6c1617bc617'],check=True)
p=tree/'track-d/Dockerfile';s=p.read_text();assert '-static -s' in s;s=s.replace('-static -s','-static -s -mbmi -mbmi2 -falign-loops=32');p.write_text(s)
p=tree/'.github/workflows/d-codex-final-qualify.yml';s=p.read_text().replace('prize/d-codex-final-prefix-simd-pages',branch).replace("paths: ['track-d/d_traverse.cpp',", "paths: ['track-d/Dockerfile', 'track-d/d_traverse.cpp',").replace('5d56a5bebdf1d82633e6e643801213f5df987578','02e0764ef534a8a6694006b12911776e0a9f2860')
old="bash -c 'set -e; for x in control candidate; do g++ -O3 -std=c++17 -pthread -flto -static -s -o $x $x.cpp; done'"
new="bash -c 'set -e; g++ -O3 -std=c++17 -pthread -flto -static -s -o control control.cpp; g++ -O3 -std=c++17 -pthread -flto -static -s -mbmi -mbmi2 -falign-loops=32 -o candidate candidate.cpp'"
assert old in s;s=s.replace(old,new);p.write_text(s)
for args in [['add','track-d/Dockerfile','.github/workflows/d-codex-final-qualify.yml'],['commit','-m','Qualify BMI and loop layout with unchanged champion solver'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
print(subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD','HEAD:track-d/d_traverse.cpp','HEAD:track-d/Dockerfile'],text=True))
