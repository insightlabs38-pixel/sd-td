#!/usr/bin/env python3
"""Paired full-input exactness and wall-time tournament for fused Track D."""
import hashlib
import os
import pathlib
import random
import statistics
import subprocess
import time

EXPECTED = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
VARIANTS = ("base", "div", "p0", "p128", "p512", "div128", "div512")
DATA = "/tmp/full-data"
ROOT = pathlib.Path("/tmp/fused-bench")


def main():
    ROOT.mkdir(exist_ok=True)
    for workers in (4, 6, 12):
        times = {name: [] for name in VARIANTS}
        wins = {name: 0 for name in VARIANTS}
        for round_id in range(17):
            order = list(VARIANTS)
            random.Random(20261101 + 101 * workers + round_id).shuffle(order)
            round_times = {}
            for name in order:
                out = ROOT / name
                out.mkdir(exist_ok=True)
                env = os.environ.copy()
                env.update(SD_DATA=DATA, SD_OUT=str(out), SD_THREADS=str(workers))
                start = time.perf_counter_ns()
                subprocess.run([f"/tmp/fused-{name}"], env=env, check=True,
                               stdout=subprocess.DEVNULL)
                seconds = (time.perf_counter_ns() - start) / 1e9
                digest = hashlib.sha256((out / "distances.txt").read_bytes()).hexdigest()
                if digest != EXPECTED:
                    raise AssertionError((name, workers, round_id, digest))
                times[name].append(seconds)
                round_times[name] = seconds
            for name in VARIANTS:
                wins[name] += round_times[name] < round_times["base"]
        print(f"workers={workers}, 17 interleaved rounds, all official full hashes exact", flush=True)
        for name in VARIANTS:
            vals = times[name]
            print(f"  {name:7s} median={statistics.median(vals):.6f}s "
                  f"min={min(vals):.6f}s wins={wins[name]}/17", flush=True)


if __name__ == "__main__":
    main()
