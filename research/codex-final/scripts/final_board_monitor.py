import datetime,json,pathlib,subprocess,time
r=pathlib.Path('work/receipts')
while True:
 now=datetime.datetime.now(datetime.timezone.utc)
 p=r/('board-freeze-'+now.strftime('%H%M%S')+'.json')
 q=subprocess.run(['curl','-fsSL','--max-time','20','https://s3.amazonaws.com/raptors.dev/speeddemon.dev/2026/board/board.json','-o',str(p)])
 if q.returncode==0:
  try:b=json.loads(p.read_text())
  except json.JSONDecodeError:
   p.rename(p.with_suffix('.incomplete'))
   print('Incomplete published board snapshot; retrying',flush=True)
   time.sleep(5)
   continue
  t=next(t for t in b['teams'] if t['team']=='HighVelocity');d=t['tracks']['d']
  row=dict(at_utc=now.isoformat(),generated_at=b['generated_at'],watch=t['watch'],queue=t['queue'],best=d['best'],latest=d['latest'])
  with (r/'final-board-monitor.jsonl').open('a') as f:f.write(json.dumps(row)+'\n')
  print(json.dumps(row),flush=True)
 if now.hour>=15:break
 time.sleep(min(40,max(1,(now.replace(hour=15,minute=0,second=1,microsecond=0)-now).total_seconds())))
