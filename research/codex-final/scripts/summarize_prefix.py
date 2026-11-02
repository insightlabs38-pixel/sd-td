import json,pathlib,statistics,math,csv
rows=[json.loads(x) for x in pathlib.Path('work/receipts/prefix-docker-bench.jsonl').read_text().splitlines()]
S={'fix_atomic':647,'prefix_review':674,'bounded_six_review':668};result=[]
for seed in [1,7,17]:
 for threads in [4,6,12]:
  stats={}
  for name in ['fix_atomic','prefix_review','bounded_six_review']:
   v=[x for x in rows if x['seed']==seed and x['threads']==threads and x['name']==name]
   assert len(v)==5,(seed,threads,name,len(v))
   stats[name]=(statistics.mean(sorted(x['wall'] for x in v)[1:-1]),max(x['peak'] for x in v))
  a,am=stats['fix_atomic']
  for name in list(stats)[1:]:
   b,bm=stats[name];ratio=(a/b)**.5*(am/bm)**.2*(S['fix_atomic']/S[name])**.15
   result.append(dict(seed=seed,threads=threads,candidate=name,T_control=a,T_candidate=b,M_control=am,M_candidate=bm,S_control=647,S_candidate=S[name],K_ratio=ratio,T_change=(b/a-1)*100,M_change=(bm/am-1)*100))
pathlib.Path('work/receipts/prefix-comparisons.json').write_text(json.dumps(result,indent=2)+'\n')
for name in ['prefix_review','bounded_six_review']:
 v=[x for x in result if x['candidate']==name]
 print(name,'range',min(x['K_ratio'] for x in v),max(x['K_ratio'] for x in v),'geomean diagnostic',math.prod(x['K_ratio'] for x in v)**(1/len(v)), 'wins',sum(x['K_ratio']>1 for x in v))
