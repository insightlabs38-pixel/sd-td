#!/bin/bash
set -e
mkdir -p work/data/pgo-train work/pgo-out work/pgo-profile
awk -v out=/workspace/work/data/pgo-train -f work/pgo-gen.awk
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c 'export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; set -e; g++ -O3 -std=c++17 -pthread -flto -static -s -fprofile-generate=/mnt/pgo-profile -fprofile-update=atomic -o bin/pgo variants/fix_atomic.cpp; SD_DATA=/mnt/data/pgo-train SD_OUT=/mnt/pgo-out SD_THREADS=4 bin/pgo; g++ -O3 -std=c++17 -pthread -flto -static -s -fprofile-use=/mnt/pgo-profile -fprofile-correction -o bin/pgo variants/fix_atomic.cpp'
