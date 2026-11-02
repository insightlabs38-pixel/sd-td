# Final Track D selection — 2026-11-02 14:54 UTC

**Keep PR36 selected.** Official branch `speed-demon` was fetched after push and independently verified at14:53:42UTC:
commit `6426b26362d036a1784498591de0fa4c9956285e`, solver `02e0764ef534a8a6694006b12911776e0a9f2860`, Docker `8eabe09b96a60131ce5bfda3f098011e1f0863e6`.
No `pgo_train_graph.cpp`; scored code is CPP677+Docker6=S683, D1.
Only track-d paths changed; A/B/C/shared configuration preserved, author vikyath, normal push.
The14:00handoff deadline was missed; this final restoration occurred before15:00freeze.

Development PR36: https://github.com/insightlabs38-pixel/sd-td/pull/36
Branch `prize/d-codex-final-prefix-simd-pages`, commit `9a28cc082325714126385578db85c6c1617bc617`.
Actual official best for these exact source/build blobs: **K33.672416**, run `run-3cf937618e77`, commit `55bc81024955ea5dda6d289fb7d6192f13c4b92f`, T.083599, M57802752, S683, D1, all gates passed. Final restoration is source-identical, not a new K claim.
Pinned qualification https://github.com/insightlabs38-pixel/sd-td/actions/runs/41434298002:
all four jobs success, including88 differential,60 boundaries,110 saturation,
adversarial stress, full-size stale-claim/capacity/high-bin regressions,
ASan/UBSan/TSan, organizer tiny/sample/full hashes, full seeds1/7/17 at4/6/12 workers,
and306 exact independent matched full executions.
Exact pinned binary SHA256 `0927ee891e16dc991f20aac9ff27235bf4b2f4957d55c799fc67f26963a027d6`.

Final fresh local complete-K comparison:45 exact full runs, seeds1/7/17,
12workers, warmed inputs/tmpfs, restricted offline Docker, parent-cgroup maximum
memory.peak across5. Versus PR24 S647: T−11.13/−9.77/−9.35%,
M−4.56/−6.19/−5.60%, complete-K ratios1.06206/1.05763/1.05389.
Versus PR33 S674: T−3.64/−7.95/−3.65%, M−.84/−.78/−1.10%,
ratios1.01838/1.04185/1.01900. This local two-CPU evidence does not project official K.
Actual strongest PR33 score33.161862 → champion33.672416 (+1.54%);
T.086295→.083599, M58208256→57802752, S674→683, D1 unchanged.

Relative to Claude PR17/18, compatible region-local reverse construction remains;
our unique atomic claims, prefix raw bins, exact narrow labels/queues,
bidirectional query policy, fixed packing, byte degrees, twelve query workers,
streamed SSSE3 parsing and256-entry label pages form the selected combined source.
Claude's active branches were preserved. Final nonalias variants separately passed
all gates and improved independent runner timing cells; their official results
lost (member32.601432, helper32.850288). PGO/BMI also lost31.072955 with fully
counted S731. None remains selected.

See FINAL-TRIALS.md for commits, source/build hashes, raw receipts, rejected
architectures and remaining hypotheses. `receipts/final-remote-verification.json`
records exact pushed selection; final-controls* contains matched score axes.
`variants/` and `scripts/` preserve actual implementations and reproduction.

Rollback sources: PR33 `5d56a5bebdf1d82633e6e643801213f5df987578` or atomic PR24
`4e45be05890b6228c8df88702da48f51a15fc712`, same original Docker. Restore only D
paths in a new forward commit; remove any PGO helper. Never restore racing PR23.
Latest observed leader LippInc K38.090527, gap4.418111. K34–35 target was not reached.
Stop all submission changes at15:00UTC; retain this qualified champion.
