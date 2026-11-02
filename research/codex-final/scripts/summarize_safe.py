import pathlib,json,statistics,csv,math
rows=[json.loads(x) for x in pathlib.Path('work/receipts/safe-docker-bench.jsonl').read_text().splitlines()]
S={'control23':647,'fix_atomic':647,'fix_bytes':655};out=[]
for seed in [1,7,17]:
 for t in [4,6,12]:
  stats={}
  for name in S:
   v=sorted([r for r in rows if r['seed']==seed and r['threads']==t and r['name']==name],key=lambda r:r['round'])
   assert len(v)==7
   five=v[:5];stats[name]=(statistics.mean(sorted(x['wall'] for x in five)[1:-1]),max(x['peak'] for x in five))
  for baseline,candidate in [('control23','fix_atomic'),('control23','fix_bytes'),('fix_atomic','fix_bytes')]:
   a,am=stats[baseline];b,bm=stats[candidate]
   k=(a/b)**.5*(am/bm)**.2*(S[baseline]/S[candidate])**.15
   av={x['round']:x['wall'] for x in rows if x['seed']==seed and x['threads']==t and x['name']==baseline};bv={x['round']:x['wall'] for x in rows if x['seed']==seed and x['threads']==t and x['name']==candidate}
   out.append(dict(seed=seed,threads=t,control=baseline,candidate=candidate,T_control=a,T_candidate=b,M_control=am,M_candidate=bm,S_control=S[baseline],S_candidate=S[candidate],T_change_percent=(b/a-1)*100,M_change_percent=(bm/am-1)*100,K_ratio=k,paired_wins=sum(bv[r]<av[r] for r in av),pairs=len(av)))
pathlib.Path('work/receipts/safe-comparisons.json').write_text(json.dumps(out,indent=2)+'\n')
with open('work/receipts/safe-comparisons.csv','w') as f:w=csv.DictWriter(f,fieldnames=list(out[0]));w.writeheader();w.writerows(out)
for pair in [('control23','fix_atomic'),('control23','fix_bytes'),('fix_atomic','fix_bytes')]:
 v=[x for x in out if (x['control'],x['candidate'])==pair]
 print(pair,'K range',round(min(x['K_ratio'] for x in v),5),round(max(x['K_ratio'] for x in v),5),'geomean diagnostic',round(math.prod(x['K_ratio'] for x in v)**(1/len(v)),5),'configs gain',sum(x['K_ratio']>1 for x in v),'/',len(v),'time wins',sum(x['paired_wins'] for x in v),'/',sum(x['pairs'] for x in v))
