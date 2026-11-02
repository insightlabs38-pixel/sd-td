# Track D worker-local claim-cache experiment (2026-11-02)

Status: REJECTED, keep the atomic-claim baseline. Experimental branch only.
Base source blob: `4e45be05890b6228c8df88702da48f51a15fc712` (PR #24).
Candidate source blob: `04571765529ce93b0e43b6dc497e9170742db930`.
Candidate adds a per-worker local bitmap before the relaxed global atomic claim.

[Successful pinned GCC15 qualification and tournament](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41374456413):
88 differential fixtures, 60 boundary cases, 110 saturation cases, 20 stress seeds,
forced stale-read schedule at 1,000 and 1,740,512 vertices, and official full
seed-1/7 exact-output comparisons passed. Full seed-1 SHA matched organizer.
Eleven randomized matched rounds per cell; whole-process wall medians:

| Seed | Workers | Base (s) | Cache (s) | Cache delta | Paired cache wins |
|---|---:|---:|---:|---:|---:|
| 1 | 4 | 0.217829 | 0.218927 | +0.50% | 3/11 |
| 1 | 6 | 0.227832 | 0.226293 | -0.68% | 4/11 |
| 1 | 12 | 0.230368 | 0.235907 | +2.40% | 2/11 |
| 7 | 4 | 0.220154 | 0.222410 | +1.02% | 3/11 |
| 7 | 6 | 0.230940 | 0.228727 | -0.96% | 7/11 |
| 7 | 12 | 0.231130 | 0.233542 | +1.04% | 2/11 |

Six-worker gains are not convincing in paired wins, and four/twelve-worker
regressions plus per-worker bitmap memory and source lines outweigh them.
No official submission change or scoring-box K claim. The forced-schedule
test wrapper was adapted for the extra aggregate field and local early exit.
