import json,pathlib,statistics,math,csv
rows=[json.loads(x) for x in pathlib.Path('work/receipts/prefix12-pages-docker.jsonl').read_text().splitlines()]
S={'prefix_twelve':674,'prefix12_page32':674,'prefix12_page64':674,'prefix12_page256':674,'prefix_trim12':675};result=[]
for seed in [1,7,17]:
 for threads in [4,6,12]:
  stats={}
  for name in ['prefix_twelve','prefix12_page32','prefix12_page64','prefix12_page256','prefix_trim12']:
   v=[x for x in rows if x['seed']==seed and x['threads']==threads and x['name']==name]
   assert len(v)==5,(seed,threads,name,len(v))
   stats[name]=(statistics.mean(sorted(x['wall'] for x in v)[1:-1]),max(x['peak'] for x in v))
  a,am=stats['prefix_twelve']
  for name in list(stats)[1:]:
   b,bm=stats[name];ratio=(a/b)**.5*(am/bm)**.2*(S['prefix_twelve']/S[name])**.15
   result.append(dict(seed=seed,threads=threads,candidate=name,T_control=a,T_candidate=b,M_control=am,M_candidate=bm,S_control=674,S_candidate=S[name],K_ratio=ratio,T_change=(b/a-1)*100,M_change=(bm/am-1)*100))
pathlib.Path('work/receipts/prefix12-pages-comparisons.json').write_text(json.dumps(result,indent=2)+'\n')
for name in ['prefix12_page32','prefix12_page64','prefix12_page256','prefix_trim12']:
 v=[x for x in result if x['candidate']==name]
 print(name,'range',min(x['K_ratio'] for x in v),max(x['K_ratio'] for x in v),'geomean diagnostic',math.prod(x['K_ratio'] for x in v)**(1/len(v)), 'wins',sum(x['K_ratio']>1 for x in v))
