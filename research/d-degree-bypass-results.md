# Degree-three/four bypass tournament, rejected

Compared original PR #24 atomic-claim construction (degree <=2) against otherwise identical degree <=3 and <=4 builds, pinned GCC 15 Dockerfile flags.
Run: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41389415367
All candidates passed official seed-1 output SHA and full seed-7 baseline byte comparisons, across 4/6/12 workers; 180 full executions.
Degree 3: seed 1 median wall regressions +10.23%/+8.68%/+7.78%; seed 7 +8.72%/+9.03%/+8.13% (4/6/12 workers).
Degree 4: seed 1 +14.13%/+12.81%/+12.07%; seed 7 +11.96%/+12.29%/+11.80%.
Both challengers lost all 54/54 paired comparisons to degree 2.
Degree 3 passed 88 differential, 60 boundary, 110 saturation, 30 stress, full-dimension forced stale-claim and capacity schedules.
Degree 4 passed 88 differential and 60 boundary cases.
Decision: retain degree 2. No submission or development main change; candidate remains isolated on this experimental branch.
