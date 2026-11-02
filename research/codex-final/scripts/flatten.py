import tarfile,subprocess,pathlib,os,shutil
root=pathlib.Path('/dev/shm/sd-gccroot')
p=subprocess.Popen(['docker','save','gcc@sha256:eb5e64286ad47187b32bda75c6b6916166ecb41da56559b8b09e0001748d2cce'],stdout=subprocess.PIPE)
for entry in tarfile.open(fileobj=p.stdout,mode='r|'):
 if not entry.name.endswith('/layer.tar'): continue
 print(entry.name,flush=True)
 for t in tarfile.open(fileobj=entry.tarfile.extractfile(entry),mode='r|'):
  path=root/t.name
  if '/.wh.' in '/'+t.name:
   target=path.parent/path.name[4:]
   if target.is_dir(): shutil.rmtree(target)
   elif target.exists(): target.unlink()
   continue
  if t.isdev():continue
  t.uid=os.getuid();t.gid=os.getgid()
  try: t.tarfile.extract(t,root,filter='fully_trusted')
  except (FileExistsError,PermissionError): pass
assert p.wait()==0
