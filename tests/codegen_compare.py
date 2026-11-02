import hashlib,json,os,pathlib,random,statistics,subprocess,time
out=pathlib.Path('/dev/shm/stream-out');out.mkdir(exist_ok=True)
rows=[];rng=random.Random(9123)
truth={1:'a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e',7:'66d63e1c9c1f80583914b835d82fd24e1bd78fba3bdc1cf73efb7f60ed4fe646',17:'ad7c211024014a4c21a50faab598dd19e730cbc0b4e8013a7d3b3306132913ba'}
for seed in [1,7,17]:
 data=pathlib.Path(f'/tmp/data-full-{seed}')
 for path in data.iterdir():path.read_bytes()
 for threads in [4,6,12]:
  for r in range(13):
   names=['control','align32','align64','bmi','bmi32','native'];rng.shuffle(names)
   for name in names:
    env=dict(os.environ,SD_DATA=str(data),SD_OUT=str(out),SD_THREADS=str(threads))
    start=time.perf_counter();p=subprocess.Popen(['/tmp/compare/'+name],env=env)
    _,st,u=os.wait4(p.pid,0);elapsed=time.perf_counter()-start
    assert os.waitstatus_to_exitcode(st)==0
    sha=hashlib.sha256((out/'distances.txt').read_bytes()).hexdigest();assert sha==truth[seed]
    row=dict(seed=seed,threads=threads,round=r,name=name,wall=elapsed,cpu=u.ru_utime+u.ru_stime,rss=u.ru_maxrss,sha256=sha)
    rows.append(row)
    with open('/tmp/receipts/comparison.jsonl','a') as f:f.write(json.dumps(row)+'\n')
  for name in names:
   v=[x for x in rows if x['seed']==seed and x['threads']==threads and x['name']==name]
   print(seed,threads,name,'wall',statistics.median(x['wall'] for x in v),'cpu',statistics.median(x['cpu'] for x in v),'rss',max(x['rss'] for x in v),flush=True)
