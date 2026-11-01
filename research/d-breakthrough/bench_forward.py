#!/usr/bin/env python3
"""Whole-process matched native tournament, no cached derived graph data."""
import hashlib
import json
import os
from pathlib import Path
import resource
import statistics
import subprocess
import time

MODES = ["base", "forward"]
REFERENCE = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
OUT = Path("/tmp/d-bt-out")
OUT.mkdir(exist_ok=True)
all_results = {}
for seed in (1, 7):
    data = Path(f"/tmp/d-bt-data-{seed}")
    data.mkdir(exist_ok=True)
    subprocess.run(["python", "/tmp/official/generators/d_traverse.py", "--seed", str(seed),
                    "--scale", "full", "--out", str(data)], check=True)
    for workers in (4, 12):
        key = f"seed{seed}-workers{workers}"
        rounds = {x: [] for x in MODES}
        hashes = {}
        # Rotate execution order to avoid granting any one candidate a
        # persistent page-cache or scheduler advantage.
        for rep in range(9):
            order = MODES[rep % len(MODES):] + MODES[:rep % len(MODES)]
            for mode in order:
                env = dict(os.environ, SD_THREADS=str(workers),
                           SD_DATA=str(data), SD_OUT=str(OUT))
                t0 = time.perf_counter_ns()
                subprocess.run([f"/tmp/d-{mode}"], check=True, env=env,
                               stdout=subprocess.DEVNULL)
                elapsed = (time.perf_counter_ns() - t0) / 1e9
                blob = (OUT / "distances.txt").read_bytes()
                digest = hashlib.sha256(blob).hexdigest()
                if seed == 1 and digest != REFERENCE:
                    raise AssertionError((mode, key, "official hash mismatch", digest))
                if mode in hashes and digest != hashes[mode]:
                    raise AssertionError((mode, key, "unstable output"))
                hashes[mode] = digest
                rounds[mode].append(elapsed)
        if len(set(hashes.values())) != 1:
            raise AssertionError((key, "mismatched candidate answers", hashes))
        baseline = statistics.median(rounds["base"])
        results = {}
        for mode, times in rounds.items():
            median = statistics.median(times)
            results[mode] = dict(
                median_s=round(median, 6),
                min_s=round(min(times), 6),
                max_s=round(max(times), 6),
                speedup_pct=round(100 * (baseline / median - 1), 3),
                raw_s=[round(x, 6) for x in times])
        all_results[key] = dict(sha256=hashes["base"], benchmarks=results)
        print("D_BREAKTHROUGH_TOURNAMENT", key, json.dumps(results, sort_keys=True), flush=True)
Path("/tmp/d-forward-results.json").write_text(json.dumps(all_results, indent=2))
print("WHOLE_SYSTEM_MATCHED_TOURNAMENT_PASS", flush=True)
