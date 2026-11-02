import json,math,pathlib,statistics,csv
src=pathlib.Path('work/receipts/docker-bench.jsonl')
rows=[json.loads(s) for s in src.read_text().splitlines()]
S={'pr15':592,'pr17':607,'pr18':609,'final':605,'final_cap4':607}
metrics={}
for seed in (1,7,17):
 for threads in (4,6,12):
  for name in S:
   v=sorted((r for r in rows if r['seed']==seed and r['threads']==threads and r['name']==name),key=lambda r:r['round'])
   if len(v)<5:continue
   # Primary: exact official aggregation, first five preassigned repetitions.
   five=v[:5];walls=sorted(x['wall'] for x in five)
   metrics[seed,threads,name]={'T':statistics.mean(walls[1:-1]),'M':max(x['peak'] for x in five),'S':S[name],'n':len(v),'T7':statistics.mean(sorted(x['wall'] for x in v)[1:-1]),'M7':max(x['peak'] for x in v)}
comparisons=[]
for seed in (1,7,17):
 for threads in (4,6,12):
  for control,candidate in [('pr17','final'),('pr18','final_cap4'),('pr15','final'),('pr15','final_cap4')]:
   if (seed,threads,control) not in metrics or (seed,threads,candidate) not in metrics:continue
   a=metrics[seed,threads,control];b=metrics[seed,threads,candidate]
   tf=(a['T']/b['T'])**.5;mf=(a['M']/b['M'])**.2;sf=(a['S']/b['S'])**.15
   ar={r['round']:r['wall'] for r in rows if r['seed']==seed and r['threads']==threads and r['name']==control}
   br={r['round']:r['wall'] for r in rows if r['seed']==seed and r['threads']==threads and r['name']==candidate}
   common=sorted(ar.keys()&br.keys())
   rec=dict(seed=seed,threads=threads,control=control,candidate=candidate,T_control=a['T'],T_candidate=b['T'],T_change_percent=(b['T']/a['T']-1)*100,M_control=a['M'],M_candidate=b['M'],M_change_percent=(b['M']/a['M']-1)*100,S_control=a['S'],S_candidate=b['S'],T_factor=tf,M_factor=mf,S_factor=sf,K_ratio=tf*mf*sf,paired_wins=sum(br[r]<ar[r] for r in common),pairs=len(common),T7_control=a['T7'],T7_candidate=b['T7'],M7_control=a['M7'],M7_candidate=b['M7'])
   comparisons.append(rec)
pathlib.Path('work/receipts/docker-comparisons.json').write_text(json.dumps(comparisons,indent=2)+'\n')
with open('work/receipts/docker-comparisons.csv','w') as f:
 w=csv.DictWriter(f,fieldnames=list(comparisons[0]));w.writeheader();w.writerows(comparisons)
lines=['# Local parent-cgroup score-axis comparison','', 'Primary T is the official trimmed mean of the first five preassigned runs; M is their maximum parent-cgroup memory.peak. Seven randomized interleaved repetitions are retained as a robustness check. All runs use exact pinned GCC15 non-PGO binaries, organizer sd-timer, warmed inputs, tmpfs work directories, network disabled, read-only rootfs, 8 GB limit and uid 65534. This two-CPU-quota guest is not the official six-physical-core system. Ratios are local comparisons, not official K projections.','', '| seed | workers | control | candidate | T change | M change | S | local K ratio | paired wins |','|---|---:|---|---|---:|---:|---|---:|---:|']
for c in comparisons:
 lines.append(f"| {c['seed']} | {c['threads']} | {c['control']} | {c['candidate']} | {c['T_change_percent']:+.2f}% | {c['M_change_percent']:+.2f}% | {c['S_control']}→{c['S_candidate']} | {c['K_ratio']:.4f} | {c['paired_wins']}/{c['pairs']} |")
lines+=['', 'K ratio = (T_control/T_candidate)^0.5 × (M_control/M_candidate)^0.2 × (S_control/S_candidate)^0.15; D=1 throughout, and the source clamp is active for both sources. Raw T/M values and separate factors are in the accompanying JSON/CSV.']
pathlib.Path('work/receipts/docker-comparisons.md').write_text('\n'.join(lines)+'\n')
for control,candidate in [('pr17','final'),('pr18','final_cap4'),('pr15','final_cap4')]:
 v=[c for c in comparisons if c['control']==control and c['candidate']==candidate]
 if v:
  print(control,candidate,'configs',len(v),'K range',min(c['K_ratio'] for c in v),max(c['K_ratio'] for c in v),'T range',min(c['T_change_percent'] for c in v),max(c['T_change_percent'] for c in v),'wins',sum(c['paired_wins'] for c in v),'/',sum(c['pairs'] for c in v))
