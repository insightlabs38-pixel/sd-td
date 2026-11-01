#!/usr/bin/env python3
"""Matched native full-system SSE2/AVX2 separator tournament; no private inputs."""
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]
EXPECTED_SEED1 = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
MODES = ("sse2", "avxflags", "avxsep")
WORKERS = (4, 6, 12)
REPS = 11


def run(mode, data, out, workers):
    env = os.environ.copy()
    env.update(SD_DATA=str(data), SD_OUT=str(out), SD_THREADS=str(workers))
    start = time.perf_counter()
    subprocess.run([f"/tmp/d-{mode}"], env=env, check=True,
                   stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    elapsed = time.perf_counter() - start
    digest = hashlib.sha256((out / "distances.txt").read_bytes()).hexdigest()
    return elapsed, digest


def main():
    with tempfile.TemporaryDirectory(prefix="d-avx2-") as td:
        root = Path(td)
        for seed in (1, 7):
            data = root / f"data-{seed}"
            data.mkdir()
            subprocess.run(["python3", "/tmp/official/generators/d_traverse.py",
                            "--seed", str(seed), "--scale", "full",
                            "--out", str(data)], check=True)
            outputs = {m: root / f"out-{m}" for m in MODES}
            for d in outputs.values():
                d.mkdir(exist_ok=True)
            for workers in WORKERS:
                reference = None
                for mode in MODES:
                    _, digest = run(mode, data, outputs[mode], workers)
                    if reference is None:
                        reference = digest
                    assert digest == reference, (seed, workers, mode, digest, reference)
                    if seed == 1:
                        assert digest == EXPECTED_SEED1, digest
                samples = {m: [] for m in MODES}
                wins = {m: 0 for m in MODES if m != "sse2"}
                for rep in range(REPS):
                    # Rotate measurement order, reducing monotonic thermal drift.
                    order = MODES[rep % 3:] + MODES[:rep % 3]
                    round_times = {}
                    for mode in order:
                        seconds, digest = run(mode, data, outputs[mode], workers)
                        assert digest == reference, (seed, workers, mode, digest)
                        round_times[mode] = seconds
                        samples[mode].append(seconds)
                    for mode in wins:
                        wins[mode] += round_times[mode] < round_times["sse2"]
                med = {m: statistics.median(samples[m]) for m in MODES}
                print("D_AVX2_MATCHED", json.dumps({
                    "seed": seed, "workers": workers, "reps": REPS,
                    "median_s": {m: round(med[m], 6) for m in MODES},
                    "speedup_pct": {m: round(100 * (1 - med[m] / med["sse2"]), 3)
                                    for m in MODES if m != "sse2"},
                    "paired_wins": wins, "hash": reference,
                }, sort_keys=True), flush=True)
        print("D_AVX2_TOURNAMENT_PASS", flush=True)


if __name__ == "__main__":
    main()
