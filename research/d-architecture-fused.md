# D frontier: fused construction and branch-free search (Nov 1)

Branch `frontier/d-architecture-fused`, forked from main `f6597da`. Local numbers are a 4-vCPU Sapphire Rapids KVM guest with THP=always (which reproduces the board's memory gap: champion source 86 MB local vs 98.5 MB board; THP=madvise gives 71 MB). They are proxies, not scoring-box results.

## 1. Where the time goes (champion, single thread, thread-ms)

parse 120, raw CSR 40, degree-2 bypass 88, BFS grow 54, rest 19, gather 70, reverse 79, queries 300. Construction is ~61% of all work; at 4 workers it is ~65% of wall. Query work: 5.38M settles (bidirectional, contracted graph), 66% of query time in the 170 queries of 10k-50k settles. Board receipts show D main's 4-build-thread cap (tuned on 4-vCPU runners) coincided with T 0.122 -> 0.170 on the 12-thread box.

## 2. Architecture families

**D: joint preprocessing (implemented).** Fuses bypass + BFS + gather into one pass over a 4-slot row layout (one miss per vertex instead of off->adj). Lessons that mattered, each measured:
- Locked claims (`lock cmpxchg`/`bts`) serialised on pending random stores; plain-store claims with duplicate tolerance removed that (exactness argument in README).
- Writing the raw->region map during BFS put random stores on the critical path; a separate scatter pass: grow 120 -> 104 ms (microbenchmark on dumped real rows).
- False sharing of per-worker counters (`Region`, `Binner` adjacent in vectors): grow 58 -> 45 ms at 4 workers.
- Private first-check bitmap: per-thread grow 65 -> 55 ms at 4 workers.
- SIMD separator parsing: 120 -> ~97 thread-ms. Atomic-free transpose: 79 -> ~57 thread-ms.
- Rejected: merged forward conversion + reverse count (no time gain, peak 62 -> 85 MB); byte-sized region degrees (grow +5 ms); prefetching region buffers.

**C: query engine (implemented).** Branch-free relaxation: 294 -> 244 thread-ms. FIFO bucket drain with lookahead prefetch of row and label: 268 -> 230. 4-slot search rows: -3%. Rejected: interleaved forward/backward label pages (+11%: the two searches cover disjoint regions, so interleaving doubles the footprint while the other side's lookups hit the shared blank page anyway); processing stale entries without the check (16% of pops are stale; +6%); prefetching neighbours' labels (+18%); bucket width 2^6/2^8 and label pages 2^6/2^8 (no gain after the redesign).

**B: goal-directed search (cost model, rejected).** A full SSSP on the 1.2M-vertex search graph costs ~1.2M x 46 ns ~ 55 thread-ms at the measured settle cost. ALT needs forward and reverse distances per landmark: even two landmarks (4 SSSPs, ~220 thread-ms) cost about the whole query phase (~235 thread-ms) before any query runs, and cannot remove more than part of it. No coordinates exist for geometric bounds; region-seed distances from construction are exact only inside each Voronoi cell, which does not give a potential for targets in other cells.

**A: hierarchical reduction (cost model, rejected beyond degree 2).** CH/core contraction needs witness searches per contracted vertex; even ~0.5 us per vertex over 600k vertices exceeds the query phase it would shorten. Witness-free degree-3 elimination on an independent set keeps the edge count and removes ~25% of vertices, estimated -10-15% query time (~30 thread-ms) for an extra pass over both search graphs (~40-60 thread-ms). Degree-2 chain contraction stays, now free inside the fused pass.

## 3. Results (local proxies)

Paired, interleaved, full seed 1, all outputs `a23dbdf0...`:

| build | 4 workers median / min / CPU | 12 workers median / min / CPU |
|---|---|---|
| board champion source `be15ac2e` | 238.8 / 220.5 / 836 ms | 256.5 / 236.7 / 893 ms |
| D main `e63d989d` (no PGO) | 236.1 / 213.7 / 817 ms | 236.9 / 217.7 / 817 ms |
| this branch | 210.4 / 187.9 / 736 ms | 219.4 / 202.6 / 766 ms |
| this branch, PGO | 201.1 / 178.9 / 708 ms | 213.8 / 200.5 / 747 ms |

cgroup peak at 12 workers, THP=always: champion 80 MB, this branch 62 MB. S (clang-format LLVM + non-blank, non-comment count): champion ~855 by the same script (board 862), this branch ~775.

Qualification: 88 differential cases and 60 lattice/contraction stress cases at 1/4/12 workers, official tiny/sample/full hashes, seed-2 full output identical to the champion's, ASan+UBSan clean, TSan clean at 12 workers, CI runs 41266200700 and 41266520621 (pinned offline PGO Docker build and worker matrix).
