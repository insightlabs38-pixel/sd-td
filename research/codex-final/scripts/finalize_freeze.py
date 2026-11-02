import datetime,json,pathlib,subprocess,shutil
now=datetime.datetime.now(datetime.timezone.utc);assert now.hour>=15
cwd='work/submit'
def g(*args):return subprocess.check_output(['git','-C',cwd,*args],text=True).strip()
subprocess.run(['git','-C','sd-sm','fetch','origin','+refs/heads/speed-demon:refs/remotes/origin/speed-demon'],check=True)
head=g('rev-parse','origin/speed-demon');s=g('rev-parse',head+':track-d/d_traverse.cpp');d=g('rev-parse',head+':track-d/Dockerfile')
assert s=='02e0764ef534a8a6694006b12911776e0a9f2860';assert d=='8eabe09b96a60131ce5bfda3f098011e1f0863e6'
assert 'pgo_train_graph.cpp' not in g('ls-tree','--name-only',head+':track-d').splitlines()
r=pathlib.Path('work/receipts');p=sorted(r.glob('board-freeze-*.json'))[-1];b=json.loads(p.read_text());t=next(t for t in b['teams'] if t['team']=='HighVelocity');best=t['tracks']['d']['best'];latest=t['tracks']['d']['latest']
assert best['ok'] and all(best['gates'].values());assert best['commit'] in ['55bc81024955ea5dda6d289fb7d6192f13c4b92f', '6426b26362d036a1784498591de0fa4c9956285e']
leaders=[]
for x in b['teams']:
 z=((x.get('tracks') or {}).get('d') or {}).get('best') or {}
 if z.get('K') is not None:leaders.append(dict(team=x['team'],**z))
leaders.sort(key=lambda x:x['K'],reverse=True)
j=dict(at_utc=now.isoformat(),freeze_utc='2026-11-02T15:00:00Z',remote_commit=head,solver_blob=s,docker_blob=d,no_training_helper=True,official_best=best,official_latest=latest,watch=t['watch'],queue=t['queue'],leader=leaders[0],gap=leaders[0]['K']-best['K'],qualification=41434298002,submission_mutations_stopped_at='2026-11-02T14:53:42Z')
(r/'FINAL-FREEZE.json').write_text(json.dumps(j,indent=2)+'\n');a=pathlib.Path('work/evidence/research/codex-final')
for x in r.iterdir():
 if x.is_file() and x.stat().st_size<6000000 and x.suffix not in ['.text','.out']:
  if x.suffix=='.asm' and x.stat().st_size>200000:continue
  shutil.copy2(x,a/'receipts'/x.name)
c=json.loads((a/'CURRENT.json').read_text());c.update(dict(at_utc=now.isoformat(),official_commit=head,best_valid_K=best['K'],best_valid_run=best['run_id'],leader_K=leaders[0]['K'],gap=j['gap'],frozen=True,final_official_latest=latest));(a/'CURRENT.json').write_text(json.dumps(c,indent=2)+'\n')
with (a/'LUNA-HANDOFF.md').open('a') as f:
 f.write('\nFreeze verification at '+now.isoformat()+': remote '+head+', exact solver/Docker unchanged; no training helper. Best valid K='+str(best['K'])+', run='+best['run_id']+'. Latest restored-source official run: '+json.dumps(latest)+'. Leader '+leaders[0]['team']+' K'+str(leaders[0]['K'])+', gap'+str(round(j['gap'],6))+'. Submission changes stopped at14:53 UTC; no official writes after freeze. See receipts/FINAL-FREEZE.json.\n')
for x in ['finalize_freeze.py','final_board_monitor.py']:shutil.copy2(pathlib.Path('work',x),a/'scripts'/x)
print(json.dumps(j,indent=2))
