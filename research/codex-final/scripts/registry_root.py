import urllib.request,json,tarfile,pathlib,shutil,os,hashlib,tempfile
root=pathlib.Path('/dev/shm/sd-gccroot')
t=json.load(urllib.request.urlopen('https://auth.docker.io/token?service=registry.docker.io&scope=repository:library/gcc:pull'))['token']
def get(path):
 return urllib.request.urlopen(urllib.request.Request('https://registry-1.docker.io/v2/library/gcc/'+path,headers={'Authorization':'Bearer '+t,'Accept':'application/vnd.oci.image.index.v1+json,application/vnd.oci.image.manifest.v1+json'}))
index=json.load(get('manifests/sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce'))
digest=next(x['digest'] for x in index['manifests'] if x['platform'].get('architecture')=='amd64' and x['platform'].get('os')=='linux')
manifest=json.load(get('manifests/'+digest))
pathlib.Path('work/receipts/gcc-manifest.json').write_text(json.dumps(manifest,indent=2))
for layer in manifest['layers']:
 print(layer['digest'],flush=True)
 with tempfile.TemporaryFile(dir='/dev/shm') as f:
  h=hashlib.sha256()
  with get('blobs/'+layer['digest']) as r:
   while chunk:=r.read(1024*1024):h.update(chunk);f.write(chunk)
  assert 'sha256:'+h.hexdigest()==layer['digest']
  f.seek(0)
  archive=tarfile.open(fileobj=f,mode='r|gz')
  for a in archive:
   path=root/a.name
   if '/.wh.' in '/'+a.name:
    target=path.parent/path.name[4:]
    if target.is_dir():shutil.rmtree(target)
    elif target.exists():target.unlink()
    continue
   if a.isdev():continue
   a.uid=os.getuid();a.gid=os.getgid()
   try:archive.extract(a,root,filter='fully_trusted')
   except (FileExistsError,PermissionError):pass
print('DONE',flush=True)
