from pathlib import Path
import subprocess
branch='prize/d-codex-final-sparse-screen';tree=Path('/workspace/work/sparse-screen')
subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'dee8523da78fe7bc87816bd8e8f1a871db6d27b8'],check=True)
r=tree/'research/sparse-claims';r.mkdir(parents=True)
s=(tree/'track-d/d_traverse.cpp').read_text();(r/'control.cpp').write_text(s)
for factor in [2,4,8]:
 shift=6-(factor.bit_length()-1);mask=(1<<shift)-1
 x=s.replace('u64 bit = u64(1) << (z & 63), *word = &claimed[z >> 6];',f'u64 bit = u64(1) << (z & {mask}), *word = &claimed[z >> {shift}];').replace('Bits claimed(bypass.size());',f'Bits claimed(bypass.size()*{factor});')
 assert x!=s;(r/f'sparse{factor}.cpp').write_text(x);Path(f'work/variants/prefix12_sparse{factor}.cpp').write_text(x)
p=Path('work/prefix-qualify/tests/stream_compare.py').read_text().replace("names=['control','candidate']","names=['control','sparse2','sparse4','sparse8']")
(r/'bench.py').write_text(p)
wf='''name: D sparse atomic claim screen
on:
  push:
    branches: ['prize/d-codex-final-sparse-screen']
  workflow_dispatch:
jobs:
  screen:
    runs-on: ubuntu-latest
    timeout-minutes: 25
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.13'
      - name: Immutable pinned GCC15 builds
        run: |
          set -euo pipefail
          mkdir -p /tmp/compare /tmp/receipts
          cp research/sparse-claims/*.cpp /tmp/compare/
          docker run --rm -v /tmp/compare:/work -w /work gcc:15@sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce bash -c 'set -e; for x in control sparse2 sparse4 sparse8; do g++ -O3 -std=c++17 -pthread -flto -static -s -o $x $x.cpp; done'
          sha256sum /tmp/compare/* | tee /tmp/receipts/hashes.txt
          for name in control sparse2 sparse4 sparse8; do
            SD_TEST_BINARY=/tmp/compare/$name python tests/test_d.py
          done
      - name: Independent full seeds and matched executions
        run: |
          set -euo pipefail
          git clone --depth 1 https://github.com/hackathon-raptors/speed-demon-2026.git /tmp/official
          for seed in 1 7 17; do
            python /tmp/official/generators/d_traverse.py --scale full --seed "$seed" --out "/tmp/data-full-$seed"
          done
          python research/sparse-claims/bench.py | tee /tmp/receipts/summary.txt
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: sparse-claim-screen
          path: /tmp/receipts
'''
(tree/'.github/workflows/d-sparse-screen.yml').write_text(wf)
for args in [['add','research/sparse-claims','.github/workflows/d-sparse-screen.yml'],['commit','-m','Screen sparse globally unique atomic claim layouts'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
