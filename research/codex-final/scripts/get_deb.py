import urllib.request,lzma,pathlib,subprocess,sys
meta=pathlib.Path('work/tools/Packages.xz')
if not meta.exists():meta.write_bytes(urllib.request.urlopen('https://deb.debian.org/debian/dists/trixie/main/binary-amd64/Packages.xz').read())
for p in lzma.decompress(meta.read_bytes()).split(b'\n\n'):
 if not p.strip():continue
 name=p.splitlines()[0].decode().removeprefix('Package: ')
 if name in sys.argv[1:]:
  d=dict(x.split(': ',1) for x in p.decode().splitlines() if ': ' in x and not x.startswith(' '))
  path='work/tools/'+name+'.deb';pathlib.Path(path).write_bytes(urllib.request.urlopen('https://deb.debian.org/debian/'+d['Filename']).read());subprocess.run(['dpkg-deb','-x',path,'work/tools/root'],check=True)
  print(name,d['Version'])
