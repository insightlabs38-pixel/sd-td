import json,sys,statistics,pathlib,math
receipt,control,sfile,out=sys.argv[1:];rows=[json.loads(x) for x in pathlib.Path(receipt).read_text().splitlines()];S=json.load(open(sfile));result=[]
for seed,threads in sorted({(x['seed'],x['threads']) for x in rows}):
 stats={}
 for name in sorted({x['name'] for x in rows}):
  v=[x for x in rows if x['seed']==seed and x['threads']==threads and x['name']==name];assert len(v)==5,(seed,threads,name,len(v));stats[name]=(statistics.mean(sorted(x['wall'] for x in v)[1:-1]),max(x['peak'] for x in v))
 a,am=stats[control]
 for name,(b,bm) in stats.items():
  if name==control:continue
  ratio=(a/b)**.5*(am/bm)**.2*(S[control]/S[name])**.15
  result.append(dict(seed=seed,threads=threads,candidate=name,T_control=a,T_candidate=b,M_control=am,M_candidate=bm,S_control=S[control],S_candidate=S[name],K_ratio=ratio,T_change=(b/a-1)*100,M_change=(bm/am-1)*100))
pathlib.Path(out).write_text(json.dumps(result,indent=2)+'\n')
for name in sorted({x['candidate'] for x in result}):
 v=[x for x in result if x['candidate']==name];print(name,'range',min(x['K_ratio'] for x in v),max(x['K_ratio'] for x in v),'diagnostic geomean',math.prod(x['K_ratio'] for x in v)**(1/len(v)),'wins',sum(x['K_ratio']>1 for x in v))
 for x in v:
  if x['threads']==12:print(' ',x['seed'],'T%',round(x['T_change'],2),'M%',round(x['M_change'],2),'Kratio',round(x['K_ratio'],5))
