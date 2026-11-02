# Track D selected valid champion — 2026-11-02 12:05 UTC

Official branch speed-demon selects ONLY D solver `02e0764ef534a8a6694006b12911776e0a9f2860`, Docker `8eabe09b96a60131ce5bfda3f098011e1f0863e6`, commit `55bc81024955ea5dda6d289fb7d6192f13c4b92f`.
Official run `run-3cf937618e77`: **K33.672416**, T0.083599, M57,802,752, S683, D1, every gate passed.
Development branch `prize/d-codex-final-prefix-simd-pages`, commit `9a28cc082325714126385578db85c6c1617bc617`.
Qualification https://github.com/insightlabs38-pixel/sd-td/actions/runs/41434298002 passes all required pinned Docker/oracle/sanitizer/forced-schedule gates. Exact binary SHA256 `0927ee891e16dc991f20aac9ff27235bf4b2f4957d55c799fc67f26963a027d6`.

Prior safe rollback: solver `5d56a5bebdf1d82633e6e643801213f5df987578` (PR33), same Docker. Its strongest source-identical run is now `run-f085dc929155`, commit002ba5754699462d56beb61f2e58b1419064dacf, K33.161862/T0.086295/M58,208,256/S674/D1. Observed champion/control axes: T−3.12%, M−0.70%, S+1.34%; these are actual official runs, not a statistical guarantee or a projected K. Atomic PR24 remains older rollback; racing PR23 is excluded.

The new source combines region-local reverse construction with our exact16-bit labels, atomic unique claims, bounded queues, fixed legal-domain packing, prefix raw bins, streamed SSSE3 decimals and256-entry label pages. No unrelated A/B/C or shared config changes. Current best leader34.168125; valid gap0.495709.

Three combinations are qualifying against THIS immutable champion: wide128 metadata, ten query workers, both. Do not substitute them before all gates and official results. Current source remains selected while those run. Stop submission changes at15:00 UTC; select strongest qualified source by14:00.

Rejected experiments preserved with actual code/receipts: three-byte relative CSR (exact indexed escapes and word loads still slower), direct atomic raw builder (S634 but roughly2× runtime), paired/low-address label directories (flat or slower), coalesced16-bit queues (branchless flat, branchful slower), partial bucket drains and neighbour-label prefetch (slower), sparse atomic claim layouts (612 exact independent full executions, no convincing gain). Local BFS chunks are only a modest CPU change; not yet a qualified promotion. Page-only and SIMD-only official trials lost individually; their combination is the current actual official champion, demonstrating why combined measurements are required.
