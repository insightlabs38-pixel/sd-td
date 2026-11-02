# Safe-source checkpoint, November 2

Highest K is the objective. Historical unsafe-source K values are performance controls, not eligible champions. Continue architecture experiments; this is a checkpoint, not a declaration that the frontier is exhausted.

## Qualified candidates

| Candidate | Branch | Head | Solver blob | S / D |
|---|---|---|---|---|
| [PR24](https://github.com/insightlabs38-pixel/sd-td/pull/24) | prize/d-codex-final-claim-atomic | 888e22648c0821e5fcdc0963e99dd38be512e496 | 4e45be05890b6228c8df88702da48f51a15fc712 | 647 / 1 |
| [PR25](https://github.com/insightlabs38-pixel/sd-td/pull/25) | prize/d-codex-final-claim-bytes | 303ca2c85c95050d71656376cfc0b2fc17b818bb | 308304cde5e02be22fe33fbce25b9fb5eef9a2cc | 655 / 1 |

Both retain Dockerfile blob `8eabe09b96a60131ce5bfda3f098011e1f0863e6`. Exact compiled binary SHA256s: atomic `2e50dc331be69e743249f77ca6a749d1b65938d090ebd7ccbe1b5555cf296ae8`; bytes `594c39b60c1954a45f500d84ce08c78b0719073cbb7959a79110a450f16e8331`. Local pinned GCC builds and original pinned Dockerfile CI builds agree byte for byte.

CI runs [41374712573](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41374712573) and [41374714910](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41374714910) passed address/undefined and thread sanitizers, 88 differential fixtures, 60 distance boundaries, 110 saturation cases, 30 contraction stress seeds, deterministic full-size stale-claim and simultaneous-hub guard fixtures, and organizer tiny/sample/full seeds including full 1/7/17 at 4/6/12 workers in pinned offline restricted Docker. Full logs are `receipts/qualification-*.log`. Qualification alone does not establish K improvement.

## Complete local K

`receipts/safe-docker-bench.jsonl` has 189 exact-output executions: three sources, three independent full seeds, 4/6/12 workers, seven randomized matched rounds. The unsafe PR23 solver `e11b09e30d2ac0fdfada01317b5dce3deae5f6dd` is retained as timing control. First five preassigned rounds use official aggregation: T is the mean after removing minimum and maximum, M is maximum parent-cgroup memory.peak after container exit. S includes canonical formatting and six Dockerfile lines; D=1. All seven raw rounds remain available.

`receipts/safe-comparisons.csv` and `.json` contain every score-axis change. Atomic/control23 K ratios range 0.97731–1.02360 (diagnostic geometric mean 0.99571); bytes/control23 0.97759–1.01230 (0.99166); bytes/atomic 0.97349–1.01789 (0.99594). These configurations are separate results, not one official score. The host has a two-CPU quota and is not the official six-physical-core machine. Atomic is the stronger local complete-K choice; retain bytes for independent official evaluation.

Read-only official receipts observed on the exact atomic source: `run-92971f1f95cc` K31.932285, T0.092659, M60,686,336; `run-95260dc5cc5c` K32.314743, T0.090606, M60,473,344. Both S647/D1. Unsafe PR23's K32.868729 remains historical only. No extrapolated K34 claim is made.

## Correctness distinction

The shared bitmap's old atomic load/store loses bits under legal interleavings. Without a worker-private replay guard, one worker can revisit a high-degree vertex and overrun n/m buffers. `claims/` preserves the deterministic original-source reproduction. A second guard fixture, `scripts/claim_capacity_d.py`, forces three simultaneous high-degree claims: once-per-worker uniqueness alone can produce 14,999,996 stored edges from a legal five-million-edge input and overflow the recycled forward graph. Atomic globally unique claims solve both bounds. Byte claims require the checked expansion in PR25. GCC15 already emits lock BTS for the atomic fix.

## Continued experiments

Actual sources and raw receipts are preserved under variants/ and receipts/. New hypotheses after the fixes include a parallel clipped undirected landmark with reduced-cost queries, phased cache-line ownership without locked claims, contraction-free BFS, degree-one-only contraction, exact dead-detour pruning, target/opposite-frontier bounds, and dense labels with page/vertex reset and query-worker caps. Rejected variants are not qualified submission candidates. Timing and memory regressions must remain visible rather than being projected into optimistic official gains.

Recommendation at this checkpoint: keep PR24 selected while stronger experiments run; PR25 is a qualified alternative. Safe rollback is standalone PR20 solver `55f5221730afa74a362278adb94f2eb5ef2f6ee0` with the original Dockerfile (observed official K31.245834). Preserve the old sources for reproducibility, but do not restore the racing PR23 as a valid solver.


Official update: safe PR24 BEST is now K32.780740, run-2e268a627927. Qualified PR25 trial commit2244048e64033b137daf4bc94242a91069a4b9d1 passed all gates but scored K30.342851/T0.101688/M61517824/S655/D1, run-e696b8644680. Rejected and restored ONLY D to PR24 in pushed commite9a5789, preserving newer A/B/C changes. User now explicitly authorizes direct D submission. Hourly task is enabled through freeze. Leader observed K34.117253 (SweetDreams); gap versus our safe BEST1.336513K,4.077% uplift needed. Board JSON snapshots preserve source identities and queue context.


2026-11-02 10:10 UTC: NEW VALID CHAMPION prefix bins, official commit
ab541b93850e2fe9615d9d10a95e1cc93894f04c, solver24aff529703cb9aca78976b70682edcfd97ce6f0,
original Docker8eabe09b96a60131ce5bfda3f098011e1f0863e6. Official run-e055d3802c43:
K32.933888 T0.089314 M55287808 S674 D1, all gates pass. Qualification41424109317
passes all sanitizer, pinned offline Docker, independent oracle/full matrix and
high-bin skew overflow gates. This supersedes PR24 as the selected safe source.
Raw local parent-cgroup matrix135 executions includes full seeds1/7/17, workers4/6/12,
first-five trimmed mean time/max memory, canonical S: prefix/control K ratios1.0182–1.0731.
Do not treat local ratios as official projections. Leader34.168125; valid gap1.234237.
Atomic4e45 remains exact rollback. Unsafe board BEST32.868729 is still excluded.
Current experiments: two/three raw slots regress CPU; paired distance labels and
immutable bin metadata being measured; no unqualified source selected.
