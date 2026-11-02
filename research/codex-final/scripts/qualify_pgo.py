from pathlib import Path
import subprocess
for name,extra in [('pgo',''),('pgo-bmi32','-mbmi -mbmi2 -falign-loops=32')]:
 branch='prize/d-codex-final-champion-'+name;tree=Path('/workspace/work/champion-'+name+'-qualify')
 subprocess.run(['git','-C','/workspace/sd-td','worktree','add','-b',branch,str(tree),'9a28cc082325714126385578db85c6c1617bc617'],check=True)
 with (tree/'track-d/pgo_train_graph.cpp').open('w') as f:subprocess.run(['/workspace/work/tools/clang-format','--style=LLVM','/workspace/work/variants/pgo_train_graph.cpp'],stdout=f,check=True)
 flags='-O3 -std=c++17 -pthread -flto -static -s'+(' '+extra if extra else '')
 d=f'''FROM gcc:15@sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce AS build
COPY d_traverse.cpp pgo_train_graph.cpp /src/
RUN mkdir -p /mnt/champion-train /tmp/pgo /tmp/train-out && \\
    g++ -O2 -std=c++17 -o /tmp/train-gen /src/pgo_train_graph.cpp && \\
    /tmp/train-gen && \\
    g++ {flags} -fprofile-generate=/tmp/pgo -fprofile-update=atomic -o /traverse /src/d_traverse.cpp && \\
    SD_DATA=/mnt/champion-train SD_OUT=/tmp/train-out SD_THREADS=12 /traverse && \\
    test -n "$(find /tmp/pgo -name '*.gcda' -print -quit)" && \\
    g++ {flags} -fprofile-use=/tmp/pgo -fprofile-correction -fprofile-partial-training -o /traverse /src/d_traverse.cpp
FROM debian:13-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
COPY --from=build /traverse /traverse
ENTRYPOINT ["/traverse"]
'''
 (tree/'track-d/Dockerfile').write_text(d)
 p=tree/'.github/workflows/d-codex-final-qualify.yml';w=p.read_text();w=w[:w.index('  compare:')]
 w=w.replace('prize/d-codex-final-prefix-simd-pages',branch).replace("paths: ['track-d/d_traverse.cpp',", "paths: ['track-d/Dockerfile', 'track-d/pgo_train_graph.cpp', 'track-d/d_traverse.cpp',")
 w=w.replace('      - uses: actions/checkout@v4\n      - uses: actions/setup-python@v5','      - uses: actions/checkout@v4\n        with:\n          fetch-depth: 0\n      - uses: actions/setup-python@v5',1)
 point='      - uses: actions/upload-artifact@v4\n'
 step='''      - name: Compare the exact qualified PGO binary with immutable control
        run: |
          set -euo pipefail
          mkdir -p /tmp/compare
          git cat-file blob 02e0764ef534a8a6694006b12911776e0a9f2860 >/tmp/compare/control.cpp
          docker run --rm -v /tmp/compare:/work -w /work gcc:15@sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce g++ -O3 -std=c++17 -pthread -flto -static -s -o control control.cpp
          cp /tmp/traverse /tmp/compare/candidate
          sha256sum /tmp/compare/control /tmp/compare/candidate | tee /tmp/receipts/comparison-binaries.txt
          python tests/stream_compare.py | tee /tmp/receipts/summary.txt
          cp /tmp/traverse /tmp/receipts/qualified-traverse
          docker build --target build -t d-pgo-build track-d
          id=$(docker create d-pgo-build)
          docker cp "$id:/tmp/pgo" /tmp/receipts/profile
          docker rm "$id"
'''
 assert point in w;w=w.replace(point,step+point,1);p.write_text(w)
 for args in [['add','track-d/Dockerfile','track-d/pgo_train_graph.cpp','.github/workflows/d-codex-final-qualify.yml'],['commit','-m','Qualify '+name+' with counted synthetic training source'],['push','-u','origin',branch]]:subprocess.run(['git','-C',str(tree)]+args,check=True)
 print(name,subprocess.check_output(['git','-C',str(tree),'rev-parse','HEAD','HEAD:track-d/d_traverse.cpp','HEAD:track-d/Dockerfile','HEAD:track-d/pgo_train_graph.cpp'],text=True).strip(),flush=True)
