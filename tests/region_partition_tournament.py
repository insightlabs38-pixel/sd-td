#!/usr/bin/env python3
"""Compare equal-id and region-aligned reverse-CSR ownership end to end."""
import hashlib
import os
import pathlib
import random
import statistics
import subprocess
import time

EXPECTED = "a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e"
ROOT = pathlib.Path("/tmp/region-bench")
ROOT.mkdir(exist_ok=True)


def main():
    for workers in (4, 6, 12):
        times = {"equal": [], "region": []}
        for round_id in range(25):
            order = ["equal", "region"]
            random.Random(20261101 + workers * 100 + round_id).shuffle(order)
            for name in order:
                output = ROOT / name
                output.mkdir(exist_ok=True)
                env = os.environ.copy()
                env.update(SD_DATA="/tmp/full-data", SD_OUT=str(output),
                           SD_THREADS=str(workers))
                start = time.perf_counter_ns()
                subprocess.run([f"/tmp/region-{name}"], env=env, check=True,
                               stdout=subprocess.DEVNULL)
                duration = (time.perf_counter_ns() - start) / 1e9
                digest = hashlib.sha256((output / "distances.txt").read_bytes()).hexdigest()
                if digest != EXPECTED:
                    raise AssertionError((workers, round_id, name, digest))
                times[name].append(duration)
        a, b = times["equal"], times["region"]
        wins = sum(y < x for x, y in zip(a, b))
        print(f"workers={workers}, 25 matched full-seed rounds, exact hashes",
              flush=True)
        print(f"  equal median={statistics.median(a):.6f}s min={min(a):.6f}s", flush=True)
        print(f"  region median={statistics.median(b):.6f}s min={min(b):.6f}s "
              f"paired wins={wins}/25", flush=True)


if __name__ == "__main__":
    main()
