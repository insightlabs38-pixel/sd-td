#!/bin/bash
set -e
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c 'export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; set -e; for p in prefix_bins prefix_csr24index_load; do g++ -O3 -std=c++17 -pthread -flto -static -g -o bin/${p}_dbg variants/$p.cpp; done'
for p in prefix_bins prefix_csr24index_load; do
 objcopy --only-section=.text -O binary work/bin/$p work/receipts/$p.text
 objcopy --only-section=.text -O binary work/bin/${p}_dbg work/receipts/${p}_dbg.text
 sha256sum work/receipts/$p.text work/receipts/${p}_dbg.text
 nm -C work/bin/${p}_dbg | rg 'Side<unsigned short>|Worker<unsigned short>' > work/receipts/$p-hot-symbols.txt
 nm work/bin/${p}_dbg | rg 'drain|solve' > work/receipts/$p-mangled-symbols.txt
 python - "$p" <<'PY'
import sys,pathlib,subprocess
p=sys.argv[1]
syms=[x.split()[-1] for x in pathlib.Path(f'work/receipts/{p}-mangled-symbols.txt').read_text().splitlines() if 'ItE' in x and 'drain' in x]
if not syms:syms=[x.split()[-1] for x in pathlib.Path(f'work/receipts/{p}-mangled-symbols.txt').read_text().splitlines() if 'ItE' in x]
with open(f'work/receipts/{p}-hot.asm','w') as out:
 for sym in syms:subprocess.run(['objdump','-d','-C','--no-show-raw-insn','--disassemble='+sym,f'work/bin/{p}_dbg'],stdout=out,check=True)
PY
done
