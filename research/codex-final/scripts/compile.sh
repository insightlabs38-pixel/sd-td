#!/bin/bash
set -e
args=()
for p in "$@"; do args+=("g++ -O3 -std=c++17 -pthread -flto -static -s -o bin/$p variants/$p.cpp"); done
script=$(IFS=';'; echo "${args[*]}")
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c "export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; set -e; $script"
