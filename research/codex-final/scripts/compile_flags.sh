#!/bin/bash
set -e
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c 'export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; set -e
names=(alder bmi bmi_alder jcc noexceptions ltoone avx2 unroll)
flags=("-mtune=alderlake" "-mbmi -mbmi2 -mlzcnt -mpopcnt" "-mtune=alderlake -mbmi -mbmi2 -mlzcnt -mpopcnt" "-Wa,-mbranches-within-32B-boundaries" "-fno-exceptions -fno-rtti" "-flto-partition=one" "-mavx2" "-funroll-loops")
for i in ${!names[@]}; do g++ -O3 -std=c++17 -pthread -flto -static -s ${flags[$i]} -o bin/flags_${names[$i]} variants/fix_atomic.cpp; done'
