#!/usr/bin/env python3
"""Exact matched PGO Docker comparison of baseline versus AVX2 build flags."""
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import tempfile

EXPECTED = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
MODES = ("base", "avx2")
SCRIPT = 'a=$(date +%s%N); /traverse; b=$(date +%s%N); echo D_NS=$((b-a)); echo D_PEAK=$(cat /sys/fs/cgroup/memory.peak)'


def run(mode, data, out, workers):
    cmd = ["docker", "run", "--rm", "--network", "none", "--read-only",
           "--memory", "8g", "--user", "65534:65534",
           "-e", f"SD_THREADS={workers}",
           "-v", f"{data}:/data:ro", "-v", f"{out}:/out:rw",
           "--entrypoint", "/bin/sh", f"d-pgo-{mode}", "-c", SCRIPT]
    result = subprocess.run(cmd, check=True, text=True, capture_output=True)
    values = dict(line.strip().split("=", 1) for line in result.stdout.splitlines()
                  if line.startswith(("D_NS=", "D_PEAK=")))
    digest = hashlib.sha256((out / "distances.txt").read_bytes()).hexdigest()
    return int(values["D_NS"]) / 1e9, int(values["D_PEAK"]), digest


def main():
    with tempfile.TemporaryDirectory(prefix="d-pgo-") as td:
        root = Path(td)
        for seed, workers_list, reps in ((1, (4, 6, 12), 9), (7, (6, 12), 7)):
            data = root / f"data-{seed}"
            data.mkdir()
            subprocess.run(["python3", "/tmp/official/generators/d_traverse.py",
                            "--seed", str(seed), "--scale", "full",
                            "--out", str(data)], check=True)
            outputs = {m: root / f"out-{m}" for m in MODES}
            for d in outputs.values():
                d.mkdir(exist_ok=True)
                d.chmod(0o777)
            for workers in workers_list:
                truth = None
                for mode in MODES:
                    _, _, digest = run(mode, data, outputs[mode], workers)
                    if truth is None:
                        truth = digest
                    assert digest == truth, (seed, workers, mode, digest, truth)
                    if seed == 1:
                        assert digest == EXPECTED, digest
                samples = {m: [] for m in MODES}
                peaks = {m: [] for m in MODES}
                wins = 0
                for rep in range(reps):
                    order = MODES if rep % 2 == 0 else MODES[::-1]
                    times = {}
                    for mode in order:
                        elapsed, peak, digest = run(mode, data, outputs[mode], workers)
                        assert digest == truth, (seed, workers, mode, digest)
                        times[mode] = elapsed
                        samples[mode].append(elapsed)
                        peaks[mode].append(peak)
                    wins += times["avx2"] < times["base"]
                med = {m: statistics.median(samples[m]) for m in MODES}
                print("D_PGO_MATCHED", json.dumps({
                    "seed": seed, "workers": workers, "rounds": reps,
                    "baseline_s": round(med["base"], 6),
                    "avx2_s": round(med["avx2"], 6),
                    "speedup_pct": round(100 * (1 - med["avx2"] / med["base"]), 3),
                    "paired_wins": wins, "hash": truth,
                    "cgroup_peak_median_bytes": {m: int(statistics.median(peaks[m])) for m in MODES},
                }, sort_keys=True), flush=True)
        print("D_PGO_DOCKER_TOURNAMENT_PASS", flush=True)


if __name__ == "__main__":
    main()
