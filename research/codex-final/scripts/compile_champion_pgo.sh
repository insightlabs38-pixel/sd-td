#!/bin/bash
set -eu
mkdir -p work/champion-pgo-profile work/champion-train work/pgo-train-out
cp work/variants/champion33672.cpp work/variants/champion_pgo.cpp
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c '
set -e
export PATH=/usr/local/bin:/usr/bin:/bin
cd /mnt
g++ -O2 -std=c++17 -o bin/pgo_train_graph variants/pgo_train_graph.cpp
bin/pgo_train_graph
g++ -O3 -std=c++17 -pthread -flto -static -s -fprofile-generate=/mnt/champion-pgo-profile -fprofile-update=atomic -o bin/champion_pgo variants/champion_pgo.cpp
SD_DATA=/mnt/champion-train SD_OUT=/mnt/pgo-train-out SD_THREADS=12 bin/champion_pgo
test -n "$(find champion-pgo-profile -name "*.gcda" -print -quit)"
g++ -O3 -std=c++17 -pthread -flto -static -s -fprofile-use=/mnt/champion-pgo-profile -fprofile-correction -o bin/champion_pgo variants/champion_pgo.cpp
cp bin/champion_pgo bin/champion_pgo_plain
g++ -O3 -std=c++17 -pthread -flto -static -s -fprofile-use=/mnt/champion-pgo-profile -fprofile-correction -fprofile-partial-training -o bin/champion_pgo variants/champion_pgo.cpp
cp bin/champion_pgo bin/champion_pgo_partial
'
