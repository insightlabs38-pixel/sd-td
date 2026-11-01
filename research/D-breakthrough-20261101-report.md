# Track D: unrestricted architectural research, November 1, 2026

**Status:** Independent research, exact native challengers measured; no verified whole-K winner. Do not merge into `main`, developer branches or `sd-sm`. All sources generated against main at `249e80bf`. Private v1.9.4 archive was not required or accessed.

## Specification and cost baseline

- Official full workload: 1,740,512 nodes, 5,000,000 arcs, 2,000 source-target pairs; directed, zero and maximum uint32 weights, parallel arcs, disconnected components; path sums in uint64.
- Existing fused engine performs 6-byte-edge binning, degree-2 contraction, BFS layout, forward/reverse packed rows, exact forward probe and bidirectional bucket Dijkstra.
- Three full-seed profile sets with four workers found **~82 ms graph construction, 14 ms reverse transpose, 60 ms query processing** (around 156 ms process) on the instrumented GitHub host. The post-contraction graph retains ~1.20M vertices and ~4.04M arcs.
- These are native host timings, **not official scoring-box timings**. Separate A/B CI hosts give different absolute times; rely on within-run comparisons.

## Independently implemented native architectures and result receipts

All three families were built in C++17 and verified under independent Dijkstra/adversarial suites, full official seed-1 hash, full seed-7 agreement, ASan/UBSan and TSan:

| Architecture / research branch | Full-seed paired median, four workers | Full seed1 exact? | Evidence |
|---|---|---|---|
| `research/d-breakthrough-20261101-lazy-shortcuts`: inline degree3/4 virtual path expansion, depths 1/2/3 | Baseline 257.319 ms vs lazy degree3 depth1 321.861 ms; 20.1% slower | Yes | [Actions 41288929518](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41288929518) |
| `research/d-breakthrough-20261101-forward-only`: no reverse graph, terminal-target incoming certificate | Baseline 245.672 ms vs 354.315 ms; 30.7% slower | Yes | [Actions 41289096034](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41289096034) |
| `research/d-breakthrough-20261101-partial-ch`: terminal-protected, directed independent-set shortcuts, fill budget 0 | Baseline 244.477 ms vs 304.706 ms; 19.8% slower | Yes | [Actions 41289255424](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41289255424) |
| Same partial hierarchy, fill budget 4 | 244.477 ms vs 360.317 ms; 32.2% slower | Yes | Same as above |

- Each native tournament: nine rotations per mode, full 2k queries, **seeds 1 and 7, workers 4 and 12**, SHA-256 equality on seed 1 and cross-binary equality for seed 7. Raw seconds saved as GitHub Actions artifacts.
- Dedicated [ThreadSanitizer matrix 41291180614](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41291180614) passed across the three families.
- Full-workload native RSS/CPU [Actions 41291270583](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41291270583): baseline peak ~150,520 KiB; lazy ~150,520 KiB; forward-only ~151,004 KiB; partial fill4 ~171,440 KiB. Compared with ~0.25s baseline, observed fill4 wall ~0.36-0.39s. Different memory reporting from official scoreboard is expected.
- Fill4 eliminated ~395,000 vertices **but increased retained arcs from ~4.04M to ~4.87M**. Higher shortcut density offsets the smaller vertex count, and preprocessing inflates RSS.
- Conservative fill0 removed ~58,837 additional vertices and left ~3.98M arcs. It still lost a complete pinned GCC15 PGO Docker trial, **0.37s baseline vs 0.43s candidate** median (five container-launch-inclusive runs), with full seed1 official output hash on each. [Actions 41291352931](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41291352931).
- Previous October 31 probes separately found degree3/4 settled-node reductions and ALT expansion reductions on an 8.8k-node synthetic network. These were *not* end-to-end speedup evidence.
- Other independent repository branches subsequently ran native balanced directed ALT (one/two landmarks), fused shortcut insertion and direct raw layout; available CI also reports substantial complete-runtime regressions, indicating that straightforward forms do not defeat the fused champion.

## Direct phase diagnostics (matched native seed1)

[Actions 41291433678](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41291433678) instrumented each complete architecture. On a single four-worker host, three seed1 repeats showed:

| Stage (approx median ms) | Baseline | Lazy degree3-depth1 | Forward only | Partial hierarchy budget0 |
|---|---:|---:|---:|---:|
| Original graph build | 136 | 136 | 138 | 137 |
| Reverse construction | 21 | 21 | 0 | 22 |
| Hierarchy overlay | 0 | 0 | 0 | 63 |
| All queries | 89 | 152 | 220 | 89 |

This cleanly identifies the losses: lazy inline expansion adds ~63ms **inside queries**, not during graph construction; forward-only saves ~21ms transpose but adds ~131ms searching; budget0 directed elimination adds ~63ms overlay and makes the query stage essentially unchanged. A better implementation must avoid *both* a separate whole-graph overlay pass and rising shortcut density, and demonstrate a substantial reduction in query work.

## Why the candidate economics failed

**Construction dominates ~60% of the process**, and its optimization is already unusually fused. A 20ms preprocessing increase requires saving about one-third of the ~60ms query stage merely to break even on T, before source-size and memory penalties. Extra directed shortcuts are not free: they raise graph density, cache traffic, reverse construction and edge relaxations. Recursively inlined path expansion also performs additional relaxations and can defeat the cheap monotone bucket queue. Forward-only avoids reverse construction but makes long-rank queries too expensive.

For score K, use the official exponents 0.50 (T), 0.20 (M), 0.15 (S), 0.15 (D). **No official K is asserted here.** Even ignoring M/S penalties, a 20% slowdown causes ~10.6% K loss through the timing factor.

## Independent work, intact and reproducible

- `research/d-breakthrough-20261101-phases`: baseline phase timing, [Actions 41290767377](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41290767377).
- `research/d-breakthrough-20261101-sanitizers`: TSan, peak RSS, CPU, four-architecture instrumentation and reproducible CI.
- `research/d-breakthrough-20261101-compact-multiround`: native dense survivor remapping and multi-round exact independent-set shortcuts, tested at one/two/three rounds in [Actions 41291555905](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41291555905).
- Candidate code, benchmark scripts and all serious experiments stay on their own research branches; main/integrator/developer history untouched.

## Open technical hypotheses, not abandoned

1. Compacting multi-round elimination must be judged on the full process, not just survivor count; measure arc fill, peak RSS, per-phase time and exactness. If still slow, an actually integrated **single-construction** overlay is necessary, not yet another full transpose and rewrite.
2. Consider query/region-specific routing indexes that avoid full-sweep landmark preprocessing and unnecessary cross-region arcs. A true improvement needs measurable saved query work that exceeds preprocessing.
3. Attack parse/bin + BFS/contraction + transpose together: direct graph construction is known to lose, but more radical ownership and graph-layout combinations might avoid the ~96ms joint cost while retaining the locality benefits.
4. Preserve exactness for all listed adversarial cases, full seeds, TSan and pinned PGO Docker. Only hand off candidates with a documented robust favorable complete-K proxy. Do not infer failure of an entire architectural family from a single costly implementation.

**Safety/limits:** No merged production changes, no official score claim, no private research archive published. All CI executions run as ordinary GitHub Actions on explicitly isolated research branches.
