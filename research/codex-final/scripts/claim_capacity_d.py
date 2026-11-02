"""Force three workers to observe an unclaimed high-degree vertex."""
import argparse
import os
import pathlib
import subprocess
import tempfile
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=pathlib.Path)
parser.add_argument('--expect-fault',action='store_true')
args=parser.parse_args()
here=pathlib.Path(__file__).resolve().parent
source=args.source or here.parent/'track-d'/'d_traverse.cpp'
text=source.read_text();a=text.index('  void claim(',text.index('struct Grower'));b=text.index('  void put(',a)
body=text[a:b].replace('__atomic_load_n(flag, __ATOMIC_RELAXED)','claim_load0(flag, z, __ATOMIC_RELAXED)').replace('__atomic_load_n(word, __ATOMIC_RELAXED)','claim_load0(word, z, __ATOMIC_RELAXED)')
assert body!=text[a:b]
text=text[:a]+body+text[b:]
harness=(here/'claim_capacity_d.cpp').read_text()
if args.expect_fault:harness='#define EXPECT_FAULT\n'+harness
with tempfile.TemporaryDirectory() as directory:
 p=pathlib.Path(directory);(p/'solver.cpp').write_text(text);(p/'test.cpp').write_text(harness)
 subprocess.run([os.getenv('CXX','g++'),'-O2','-std=c++17','-pthread',str(p/'test.cpp'),'-o',str(p/'test')],check=True)
 for extra in ([],['full']):subprocess.run([str(p/'test')]+extra,check=True,timeout=120)
print('PASS simultaneous-hub capacity schedule: small and full dimensions')
