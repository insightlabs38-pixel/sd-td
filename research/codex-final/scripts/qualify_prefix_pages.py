from pathlib import Path
import subprocess
for label,parent,source in [('pages','dee8523da78fe7bc87816bd8e8f1a871db6d27b8','/workspace/work/prefix-twelve-qualify/track-d/d_traverse.cpp'),('simd-pages','43e49bf','/workspace/work/prefix-simd-qualify/track-d/d_traverse.cpp')]:
 branch='prize/d-codex-final-prefix-'+label;tree=Path('/workspace/work/prefix-'+label+'-qualify')
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),parent],check=True)
 s=Path(source).read_text();a=s.index('template <class L> struct Labels');b=s.index('// One direction with',a);s=s[:a]+s[a:b].replace('128','256')+s[b:];(tree/'track-d/d_traverse.cpp').write_text(s)
 wf=tree/'.github/workflows/d-codex-final-qualify.yml';w=wf.read_text().replace('prize/d-codex-final-prefix-twelve',branch).replace('prize/d-codex-final-prefix-simd\'',branch+"'")
 if '  compare:' not in w:
  ref=Path('/workspace/work/prefix-simd-qualify/.github/workflows/d-codex-final-qualify.yml').read_text();w+=ref[ref.index('  compare:'):]
  (tree/'tests/stream_compare.py').write_text(Path('/workspace/work/prefix-simd-qualify/tests/stream_compare.py').read_text())
 wf.write_text(w)
 for args in [['add','track-d/d_traverse.cpp','.github/workflows/d-codex-final-qualify.yml','tests/stream_compare.py'],['commit','-m','Qualify wider label pages on prefix '+label],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
 print(label,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD:track-d/d_traverse.cpp'],text=True).strip(),flush=True)
