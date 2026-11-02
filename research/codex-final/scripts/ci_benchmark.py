"""Pinned-source native cross-check. RSS is diagnostic, not the scoring memory axis."""
import hashlib
import json
import os
import pathlib
import random
import statistics
import subprocess
import time

root = pathlib.Path('/tmp/codex-final')
out = pathlib.Path('/dev/shm/codex-final-out')
out.mkdir(exist_ok=True)
truth = {1: 'a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e', 7: '66d63e1c9c1f80583914b835d82fd24e1bd78fba3bdc1cf73efb7f60ed4fe646', 17: 'ad7c211024014a4c21a50faab598dd19e730cbc0b4e8013a7d3b3306132913ba'}
names = ['pr15', 'pr17', 'pr18', 'candidate', 'cap4']
rows = []
rng = random.Random(47119)
for seed in (1, 7, 17):
    data = root / f'full{seed}'
    for file in data.iterdir():
        with file.open('rb') as f:
            while f.read(1024 * 1024):
                pass
    for threads in (4, 6, 12):
        for round in range(13):
            order = names[:]
            rng.shuffle(order)
            for name in order:
                env = dict(os.environ, SD_DATA=str(data), SD_OUT=str(out), SD_THREADS=str(threads))
                start = time.perf_counter()
                proc = subprocess.Popen([str(root / 'bin' / name)], env=env)
                _, status, usage = os.wait4(proc.pid, 0)
                elapsed = time.perf_counter() - start
                proc.returncode = os.waitstatus_to_exitcode(status)
                assert proc.returncode == 0, (name, proc.returncode)
                got = hashlib.sha256((out / 'distances.txt').read_bytes()).hexdigest()
                assert got == truth[seed], (name, seed, threads, round, got)
                row = dict(name=name, seed=seed, threads=threads, round=round, wall=elapsed, cpu=usage.ru_utime + usage.ru_stime, rss_kib=usage.ru_maxrss, sha256=got)
                rows.append(row)
                with (root / 'receipts' / 'native.jsonl').open('a') as f:
                    f.write(json.dumps(row) + '\n')
        for name in names:
            values = [r for r in rows if r['seed'] == seed and r['threads'] == threads and r['name'] == name]
            walls = sorted(r['wall'] for r in values)
            print(seed, threads, name, 'median', statistics.median(walls), 'trimmean', statistics.mean(walls[1:-1]), 'cpu_median', statistics.median(r['cpu'] for r in values), 'rss_max', max(r['rss_kib'] for r in values), flush=True)
