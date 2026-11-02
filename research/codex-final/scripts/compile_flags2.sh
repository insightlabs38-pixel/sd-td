#!/bin/bash
set -e
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c 'export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; set -e
names=(o2 os fast pta ptamalloc noipasra novec noschedule)
flags=("-O2" "-Os" "-Ofast" "-fipa-pta" "-fipa-pta" "-fno-ipa-sra" "-fno-tree-vectorize" "-fno-schedule-insns2")
for i in ${!names[@]}; do src=variants/fix_atomic.cpp; if [ "${names[$i]}" = ptamalloc ]; then src=variants/fix_atomic_noalias.cpp; fi; g++ -O3 -std=c++17 -pthread -flto -static -s ${flags[$i]} -o bin/flags2_${names[$i]} "$src"; done'
