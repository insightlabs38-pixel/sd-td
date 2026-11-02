import os,subprocess,pathlib,hashlib,random,json,fcntl,uuid,statistics,sys,time
lock=open('/workspace/work/campaign.lock','w');fcntl.flock(lock,fcntl.LOCK_EX)
names=sys.argv[1:] or ['pr15','pr17','pr18','final','final_cap4']
threadslist=list(map(int,os.getenv('THREADS','4,6,12').split(',')))
seeds=list(map(int,os.getenv('SEEDS','1,7,17').split(',')))
rng=random.Random(193)
receipt=pathlib.Path(os.getenv('RECEIPT','work/receipts/docker-bench.jsonl'))
rows=[json.loads(line) for line in receipt.read_text().splitlines()] if receipt.exists() else []
seen={(x['seed'],x['threads'],x['round'],x['name']) for x in rows}
root=pathlib.Path('/dev/shm/sd-codex-docker');root.mkdir(exist_ok=True)
for seed in seeds:
 data=pathlib.Path(f'/workspace/work/data/full{seed}')
 expected='a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e' if seed==1 else hashlib.sha256(pathlib.Path(f'work/ref/full{seed}/distances.txt').read_bytes()).hexdigest()
 for file in data.iterdir():
  with file.open('rb') as f:
   while f.read(1024*1024):pass
 for threads in threadslist:
  for repetition in range(int(os.getenv('ROUNDS','7'))):
   order=names[:];rng.shuffle(order)
   for name in order:
    if (seed,threads,repetition,name) in seen:continue
    rid='r'+uuid.uuid4().hex[:12];base=root/rid;out=base/'out';sd=base/'sd';out.mkdir(parents=True);sd.mkdir();out.chmod(0o777);sd.chmod(0o770)
    cmd=['docker','run','--name',rid,'--cgroup-parent=/codex-d-final/'+rid,'--cpuset-cpus='+','.join(map(str,sorted(os.sched_getaffinity(0)))),'--network=none','--read-only','--memory=8g','--memory-swap=8g','--pids-limit=512','--user=0:0','--cap-drop=ALL','--cap-add=SETUID','--cap-add=SETGID','--security-opt=no-new-privileges','--ulimit=nofile=8192:8192','--tmpfs=/tmp:rw,size=1g,exec','-e',f'SD_THREADS={threads}','-v',str(data)+':/data:ro','-v',str(out)+':/out:rw','-v',str(sd)+':/sd:rw','--entrypoint=/sd-timer',os.getenv('SD_BENCH_IMAGE','sd-codex-runtime:final'),'/sd/timing.json','65534','65534','--','/'+name]
    p=subprocess.run(cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    if p.returncode:raise RuntimeError((name,p.returncode,p.stderr.decode()))
    timing=json.loads((sd/'timing.json').read_text());assert timing['exit_code']==timing['signal']==0
    got=hashlib.sha256((out/'distances.txt').read_bytes()).hexdigest();assert got==expected,(seed,threads,name,got,expected)
    diff=subprocess.check_output(['docker','diff',rid],text=True)
    assert all(x.split()[-1] in ['/data','/out','/sd','/tmp'] for x in diff.splitlines()),diff
    subprocess.run(['docker','rm','-fv',rid],check=True,stdout=subprocess.DEVNULL)
    peak=int(pathlib.Path('/sys/fs/cgroup/codex-d-final/'+rid+'/memory.peak').read_text())
    row=dict(seed=seed,threads=threads,round=repetition,name=name,wall=timing['wall_ns']*1e-9,peak=peak,sha256=got,run=rid,cpuset=sorted(os.sched_getaffinity(0)))
    rows.append(row)
    with open(os.getenv('RECEIPT','work/receipts/docker-bench.jsonl'),'a') as f:f.write(json.dumps(row)+'\n')
  for name in names:
   v=[r for r in rows if r['name']==name and r['seed']==seed and r['threads']==threads]
   walls=sorted(r['wall'] for r in v);trim=statistics.mean(walls[1:-1])
   print(seed,threads,name,'trimmean',round(trim,6),'median',round(statistics.median(walls),6),'maxpeak',max(r['peak'] for r in v),flush=True)
