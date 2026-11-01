"""Interleaved paired timing: ab_d.py DATA_DIR OUT_DIR BIN [BIN...]; ROUNDS env sets the round count."""
import os
import statistics
import subprocess
import sys
import time

data, out, bins = sys.argv[1], sys.argv[2], sys.argv[3:]
env = dict(os.environ, SD_DATA=data, SD_OUT=out)
times = {b: [] for b in bins}
for _ in range(int(os.environ.get('ROUNDS', '15'))):
    for b in bins:
        start = time.perf_counter()
        subprocess.run([b], env=env, check=True)
        times[b].append(time.perf_counter() - start)
base = times[bins[0]]
for b, v in times.items():
    wins = sum(x < y for x, y in zip(v, base))
    ratio = statistics.median(x / y for x, y in zip(v, base))
    print(f'{b}: median {statistics.median(v):.6f} min {min(v):.6f} max {max(v):.6f} paired_wins {wins}/{len(v)} paired_ratio {ratio:.6f}')
