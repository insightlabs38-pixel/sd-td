from pathlib import Path
import subprocess
branch='prize/d-codex-final-champion-codegen-screen';tree=Path('/workspace/work/codegen-screen')
subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'9a28cc082325714126385578db85c6c1617bc617'],check=True)
p=Path('/workspace/work/prefix-qualify/tests/stream_compare.py').read_text().replace("names=['control','candidate']","names=['control','align32','align64','bmi','bmi32','native']").replace('range(17)','range(13)')
(tree/'tests/codegen_compare.py').write_text(p)
wf='''name: D champion code generation screen
on:
  push:
    branches: ['prize/d-codex-final-champion-codegen-screen']
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
      - name: Pinned GCC15 same-source builds
        run: |
          set -euo pipefail
          mkdir -p /tmp/compare /tmp/receipts
          cp track-d/d_traverse.cpp /tmp/compare/code.cpp
          lscpu | tee /tmp/receipts/cpu.txt
          docker run --rm -v /tmp/compare:/work -w /work gcc:15@sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce bash -c 'set -e; for x in control align32 align64 bmi bmi32 native; do flags=""; case "$x" in align32) flags="-falign-loops=32";; align64) flags="-falign-loops=64";; bmi) flags="-mbmi -mbmi2";; bmi32) flags="-mbmi -mbmi2 -falign-loops=32";; native) flags="-march=native";; esac; g++ -O3 -std=c++17 -pthread -flto -static -s $flags -o "$x" code.cpp; done'
          sha256sum /tmp/compare/* | tee /tmp/receipts/hashes.txt
          for name in control align32 align64 bmi bmi32 native; do
            SD_TEST_BINARY=/tmp/compare/$name python tests/test_d.py
          done
      - name: Independent full seeds and interleaved executions
        run: |
          set -euo pipefail
          git clone --depth 1 https://github.com/hackathon-raptors/speed-demon-2026.git /tmp/official
          for seed in 1 7 17; do
            python /tmp/official/generators/d_traverse.py --scale full --seed "$seed" --out "/tmp/data-full-$seed"
          done
          python tests/codegen_compare.py | tee /tmp/receipts/summary.txt
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: codegen-screen
          path: /tmp/receipts
'''
(tree/'.github/workflows/d-codegen-screen.yml').write_text(wf)
for args in [['add','tests/codegen_compare.py','.github/workflows/d-codegen-screen.yml'],['commit','-m','Screen compiler layout and BMI on exact champion source'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
