#!/usr/bin/env python3
"""Matched PGO binaries extracted from immutable multi-stage Docker builds."""
import hashlib
import json
import os
from pathlib import Path
import re
import statistics
import subprocess
import time

EXPECTED_1 = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
OUT = Path("/tmp/pgo-out")
OUT.mkdir(exist_ok=True)
report = {}
for seed in (1, 7):
    data = Path(f"/tmp/pgo-full-{seed}")
    data.mkdir(exist_ok=True)
    subprocess.run(["python", "/tmp/official/generators/d_traverse.py",
                    "--seed", str(seed), "--scale", "full",
                    "--out", str(data)], check=True)
    for workers in (4, 12):
        key = f"seed{seed}-workers{workers}"
        runs = {v: [] for v in ("base", "fch")}
        rss = {v: [] for v in runs}
        hashes = {}
        for repeat in range(11):
            for mode in (("base", "fch") if repeat % 2 == 0 else ("fch", "base")):
                env = dict(os.environ, SD_DATA=str(data), SD_OUT=str(OUT),
                           SD_THREADS=str(workers))
                start = time.perf_counter()
                proc = subprocess.run(["/usr/bin/time", "-f", "D_RSS_KIB=%M",
                                       f"/tmp/d-pgo-{mode}"], check=True,
                                      env=env, capture_output=True, text=True)
                elapsed = time.perf_counter() - start
                match = re.search(r"D_RSS_KIB=(\d+)", proc.stderr)
                if match is None:
                    raise RuntimeError(proc.stderr[-1000:])
                digest = hashlib.sha256((OUT / "distances.txt").read_bytes()).hexdigest()
                if seed == 1 and digest != EXPECTED_1:
                    raise AssertionError((mode, key, digest))
                hashes[mode] = digest
                runs[mode].append(elapsed)
                rss[mode].append(int(match.group(1)))
        if len(set(hashes.values())) != 1:
            raise AssertionError((key, hashes))
        report[key] = {mode: dict(
            median_s=round(statistics.median(runs[mode]), 6),
            median_rss_kib=statistics.median(rss[mode]),
            wall_s=[round(t,6) for t in runs[mode]],
            rss_kib=rss[mode]) for mode in runs}
        print("D_PINNED_PGO_PAIR", key, json.dumps(report[key]), flush=True)
Path("/tmp/d-pgo-fch.json").write_text(json.dumps(report, indent=2))
print("D_PINNED_PGO_MATCHED_PASS", flush=True)
