#!/bin/bash
set -eu
docker run --rm -v /var/lib/docker/vfs/dir/9e1e982dbef583bad7592026324908fca27fe998b6e59acf2aebdbe9d6d438c2:/gcc:ro -v /workspace/work:/gcc/mnt --tmpfs /gcc/tmp:rw,size=256m busybox:1.37 chroot /gcc /bin/bash -c 'set -e; export PATH=/usr/local/bin:/usr/bin:/bin; cd /mnt; for p in champion33672 champion_restrict_helper; do g++ -O3 -std=c++17 -pthread -flto -static -g -o bin/${p}_dbg variants/$p.cpp; done'
python - <<'PY'
import pathlib,subprocess,hashlib
for n in ['champion33672','champion_restrict_helper']:
 for suffix in ['', '_dbg']:
  p='work/bin/'+n+suffix;q='work/receipts/'+n+suffix+'.text';subprocess.run(['objcopy','--only-section=.text','-O','binary',p,q],check=True);print(p,hashlib.sha256(pathlib.Path(q).read_bytes()).hexdigest())
 syms=[x.split()[-1] for x in subprocess.check_output(['nm','work/bin/'+n+'_dbg'],text=True).splitlines() if 'ZZ4main' in x and 'clE' in x and '.cold' not in x]
 with open('work/receipts/'+n+'-worker.asm','w') as f:
  for sym in syms:subprocess.run(['objdump','-d','--no-show-raw-insn','--disassemble='+sym,'work/bin/'+n+'_dbg'],stdout=f,check=True)
PY
