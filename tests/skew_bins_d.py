"""Exact skew/overflow fixture with heavy weights in a high-numbered bin."""
import argparse,os,pathlib,subprocess,tempfile
p=argparse.ArgumentParser();p.add_argument('--small',action='store_true');a=p.parse_args()
n,m=(10000,120000) if a.small else (1740512,5000000)
tail=n-1;weights=[0,1,65534,65535,4294967295,4294967293,10000000]
targets=[0,1,2,3,4,5,6,17,n-2]
queries=[(tail,v) for v in targets]+[(v,tail) for v in targets[:3]]+[(tail,tail),(0,0)]
expected=[]
for s,t in queries:
 if s==t:expected.append(0)
 elif s!=tail:expected.append(-1)
 else:expected.append(min(weights[i%len(weights)] for i in range(t,m,n-1)))
with tempfile.TemporaryDirectory() as directory:
 root=pathlib.Path(directory);out=root/'out';out.mkdir()
 with (root/'graph.txt').open('w') as f:
  f.write(f'{n} {m}\n')
  for start in range(0,m,10000):
   f.writelines(f'{tail} {i%(n-1)} {weights[i%len(weights)]}\n' for i in range(start,min(m,start+10000)))
 (root/'queries.txt').write_text(''.join(f'{s} {t}\n' for s,t in queries))
 for threads in ([4,12] if a.small else [4,6,12]):
  env=dict(os.environ,SD_DATA=str(root),SD_OUT=str(out),SD_THREADS=str(threads))
  subprocess.run([os.environ['SD_TEST_BINARY']],env=env,check=True,timeout=180)
  got=list(map(int,(out/'distances.txt').read_text().split()));assert got==expected,(threads,got,expected)
print('PASS skewed high-bin overflow',n,m)
