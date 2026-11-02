# Final official trials and selection discipline

All sources below are race-safe; the historical racing PR23 is excluded.
Selected champion before the final nonalias trials: PR36 solver02e0764ef534a8a6694006b12911776e0a9f2860,
Docker8eabe09b96a60131ce5bfda3f098011e1f0863e6, no PGO helper.
Run3cf937618e77: K33.672416/T.083599/M57802752/S683/D1, all scorer gates.

| Candidate | Official commit | Run | K | T | M | S | Decision |
|---|---|---|---:|---:|---:|---:|---|
| Wide128/query10 | b58f45364e243eb6832baef3dce43bf67db0e9fc | run-9d277af3f049 |31.337779|.098|55582720|684|reject|
| Wide128 |d7c92b48e07e413d8c90ac8d8dbfb6198c478f51|run-37c8e633dca8|33.627070|.084061|57397248|683|reject|
| BMI/BMI2 align32 |b5ebfde23ac6268f89a38cb2d31c5fb26ad49076|run-f8d39a16d7a4|33.583278|.084103|57700352|683|reject|
| Counted C++ PGO |c6fac935a48f93be49454bf3d81d51d1f34ef39f|run-7a06ee6ddcc4|32.446648|.087918|58298368|731|reject|
| PGO+BMI |5a3f03750ecd283f2e63a93465e448a94ad3e12e|run-e19032dfddcb|31.072955|.096391|57503744|731|reject|
| Nonalias member |3c16d17670caa0740e89f803a9279eac9f78c1b6|run-13f2958e8c41|32.601432|.089139|57745408|685|reject|

Nonalias member dev c32c7946b9cd506f93c4c997f52274c2ac97e5a3,
solver8fe0643256d5771f27e5805530a6d1df10c69f27,
CI41454634557 all four jobs success. Exact pinned binary
f83dc4f04bcd420ad0e9a4de63c86335b404b661e62446c005ba731b83d4ea8c.
Helper dev41d445f2491bfe47b36c7a407662561dd3094073,
solver7b4b872edde4b529449ce6413755f0b84230b0f2,
CI41454639180 all four jobs success. Binary
8156892a29d2208e6bb0590b7031ab2c4e7c87c2372dbcc9ff90081d1382436c.
Both original Docker; S685/member, S689/helper, D1. Canonical count excludes TOML.

Member local complete-K matrix: 7/9 wins, diagnostic geometric mean1.006509;
12workers seeds1/7/17 ratios1.01448/1.00634/1.01370. Helper4/9,
geomean.998350; default12 ratios.97082/1.00262/.98421. Every output exact.
These are local two-CPU diagnostics, not official K projections. Independent
runner comparisons improve all nine timing cells for both, but official scores
supersede local measurements. Parent cgroup maximum peak across5 and trimmed
middle3 timings saved in champion-restrict-docker.jsonl and complete-K.json.
Debug assembly .text bytes were verified identical to optimized binaries.

All final trial source/build/helper files, CI logs and raw board snapshots are
archived separately. PGO counted the synthetic generator and expanded Docker;
restoration must remove pgo_train_graph.cpp as well as restoring original Docker.

Remaining research hypotheses require a new qualification window: stronger exact
hierarchical overlays with cheaper construction, graph/label placement specialized
to the official six physical cores, and ownership scheduling that reduces raw
construction peak without random atomic writes. These are hypotheses, not measured
gains. Compact CSR, direct atomic construction, paired/low-address labels,
coalesced queues, partial draining, prefetch, sparse claims, temporary reclamation,
and compiler/PGO alternatives have actual negative or inconclusive receipts.

Final matched 12-worker controls: immutable pinned PR24/PR33/champion binaries,
full seeds1/7/17, five interleaved runs per cell, warmed inputs, tmpfs outputs,
restricted offline Docker and parent-cgroup maximum memory.peak across five.
45 exact full executions. See final-controls-docker.jsonl and two complete-K JSONs.
Against PR24 S647, champion S683: T−11.13/−9.77/−9.35%,
M−4.56/−6.19/−5.60%, local complete-K ratios1.06206/1.05763/1.05389.
Against PR33 S674: T−3.64/−7.95/−3.65%, M−.84/−.78/−1.10%,
ratios1.01838/1.04185/1.01900. Official hardware differs; these do not project K.
The actual official best difference PR33→champion is K33.161862→33.672416,
T.086295→.083599, M58208256→57802752, S674→683, D1 unchanged.

Relative to Claude PR17/18: retained compatible region-local reverse CSR with
cross-region edge mailing and prefetched renaming. Added globally atomic unique
claims, prefix raw-bin allocation, fixed legal-domain packed graph representation,
byte degrees with exact escapes, exact narrow-distance labels with wide fallback,
bounded narrow queues, bidirectional query policy, twelve query workers, streamed
SSSE3 decimal conversion and256-entry label pages. These are combined in PR36;
Claude's active branches were not modified. Experiments remain separate branches.

Scored champion directory contains only d_traverse.cpp and six-line Dockerfile as
scored code, plus excluded Markdown and unchanged D metadata. No PGO generator.
Rollback is a D-only forward commit restoring both exact blobs, deleting any
training helper; never restore an old whole submission tree or racing PR23.

Helper official run run-9e3c75401896, commit43fde5142405617c74ce52a910450e7e4eb780f0: K32.850288/T.087790/M57499648/S689/D1, all gates passed; rejected. Final D-only restoration pushed at14:53UTC, commit6426b26362d036a1784498591de0fa4c9956285e. No losing trial selected. The14:00handoff was missed; correction and independent remote verification completed before15:00freeze.
