# prize/d-opus-last-a receipts

Source blob `15e1a45d` (S 637 C++ + 6 Dockerfile = 643 by LLVM clang-format + scc-style count; c2 601 + 6 = 607). Dockerfile unchanged `8eabe09b`. Built with pinned `gcc:15@sha256:eb5e6428...` and the exact Dockerfile flags.

## Exactness
- Full seed 1 SHA `a23dbdf0...` (organizer), seed 7 `66d63e1c...` at 1/4/12 workers; sample seed 1 equal to the organizer reference.
- `tests/test_d.py` 88 differential cases (1/4/12 workers x 6 probes), `boundary_d.py` 60, `stress_d.py` 30: pass.
- ASan+UBSan (`-fno-sanitize-recover`, leak check off): sample 1/4/12 workers, full seed 1 at 12, and the 88 differential cases pass. TSan: sample at 4/12 workers, no reports.

## Local timing (4-vCPU KVM, Xeon 2.1 GHz; noisy shared host)
Interleaved random order, 21 rounds, wall incl. process start, full seed 1:
- 12 workers: c2 median 220.5 ms, A 199.4 ms (ratio 0.904, A faster in 17/21).
- 4 workers: c2 212.3 ms, A 187.6 ms (0.884, 17/21).
Phase medians (11 rounds, 4 workers, instrumented build): grow 55 -> 51 ms (4-slot rows), rename 13.4 -> 10.7 ms, reverse 8.1 -> 6.3 ms, id map 6.6 -> 3.9 ms; minor faults 34.8k -> 23.2k.

## Memory
Fresh cgroup-v1 peak at 12 workers (3 runs): c2 58.47/58.54/58.57 MB, A 59.31/59.25/58.38 MB. The 4-slot rows (+1.9 MB) are offset by dropping the per-worker private claim bitmaps (-1.8 MB at 12 workers).

## Why the 12-worker partition matters
At 12 workers on the official seed, c2's BFS regions held 125k-612k edges each (max/mean 1.67), and c2 assigns the id map, renaming and reverse placement per region, so those phases wait on the largest region. Official PR #18 (construction capped at 4 workers) lost 40% in T against uncapped c2, so the board rewards construction that scales to 12 threads; this partition removes the remaining region-size imbalance. The 4-vCPU host cannot show this effect.
