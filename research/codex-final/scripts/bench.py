import os,sys,subprocess,time,random,json,hashlib,statistics,pathlib,resource
import fcntl
lock=open('/workspace/work/campaign.lock','w');fcntl.flock(lock,fcntl.LOCK_EX)
names=sys.argv[1:] or ['pr15','pr17','pr18','wide','coalesce5','coalesce7','coalesce9','coalesce11']
rows=[];rng=random.Random(88)
for threads in map(int,os.getenv('THREADS','1,4,6,12').split(',')):
 for r in range(int(os.getenv('ROUNDS','9'))):
  order=names[:];rng.shuffle(order)
  for name in order:
   env=dict(os.environ,SD_DATA='/workspace/work/data/full'+os.getenv('SEED','1'),SD_OUT='/workspace/work/out',SD_THREADS=str(threads))
   t=time.perf_counter();p=subprocess.Popen(['/workspace/work/bin/'+name],env=env)
   _,st,usage=os.wait4(p.pid,0);dt=time.perf_counter()-t;p.returncode=os.waitstatus_to_exitcode(st)
   assert p.returncode==0,(name,p.returncode)
   h=hashlib.sha256(pathlib.Path('work/out/distances.txt').read_bytes()).hexdigest()
   assert h==os.getenv('EXPECTED','a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e'),(name,h)
   row=dict(name=name,threads=threads,round=r,wall=dt,cpu=usage.ru_utime+usage.ru_stime,rss=usage.ru_maxrss,sha256=h)
   rows.append(row)
   with open(os.getenv('RECEIPT','work/receipts/bench1.jsonl'),'a') as f:f.write(json.dumps(row)+'\n')
 for name in names:
  v=[x for x in rows if x['threads']==threads and x['name']==name]
  print(threads,name,'wall',round(statistics.median(x['wall'] for x in v),6),'cpu',round(statistics.median(x['cpu'] for x in v),6),'maxrss',max(x['rss'] for x in v),flush=True)
