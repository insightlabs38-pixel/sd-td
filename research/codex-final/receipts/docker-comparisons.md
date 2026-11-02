# Local parent-cgroup score-axis comparison

Primary T is the official trimmed mean of the first five preassigned runs; M is their maximum parent-cgroup memory.peak. Seven randomized interleaved repetitions are retained as a robustness check. All runs use exact pinned GCC15 non-PGO binaries, organizer sd-timer, warmed inputs, tmpfs work directories, network disabled, read-only rootfs, 8 GB limit and uid 65534. This two-CPU-quota guest is not the official six-physical-core system. Ratios are local comparisons, not official K projections.

| seed | workers | control | candidate | T change | M change | S | local K ratio | paired wins |
|---|---:|---|---|---:|---:|---|---:|---:|
| 1 | 4 | pr17 | final | -10.79% | +0.02% | 607→605 | 1.0592 | 7/7 |
| 1 | 4 | pr18 | final_cap4 | -9.60% | -0.35% | 609→607 | 1.0530 | 6/7 |
| 1 | 4 | pr15 | final | -14.50% | +0.09% | 592→605 | 1.0777 | 7/7 |
| 1 | 4 | pr15 | final_cap4 | -12.80% | -0.05% | 592→607 | 1.0670 | 6/7 |
| 1 | 6 | pr17 | final | -3.81% | -0.14% | 607→605 | 1.0204 | 6/7 |
| 1 | 6 | pr18 | final_cap4 | -8.89% | +0.25% | 609→607 | 1.0477 | 6/7 |
| 1 | 6 | pr15 | final | -10.68% | +0.11% | 592→605 | 1.0544 | 7/7 |
| 1 | 6 | pr15 | final_cap4 | -14.66% | -0.62% | 592→607 | 1.0798 | 7/7 |
| 1 | 12 | pr17 | final | -9.50% | +0.01% | 607→605 | 1.0517 | 6/7 |
| 1 | 12 | pr18 | final_cap4 | -4.51% | -2.92% | 609→607 | 1.0300 | 6/7 |
| 1 | 12 | pr15 | final | -15.42% | -0.56% | 592→605 | 1.0850 | 7/7 |
| 1 | 12 | pr15 | final_cap4 | -18.34% | -4.27% | 592→607 | 1.1121 | 7/7 |
| 7 | 4 | pr17 | final | -3.77% | -0.32% | 607→605 | 1.0205 | 6/7 |
| 7 | 4 | pr18 | final_cap4 | -6.28% | +0.09% | 609→607 | 1.0333 | 7/7 |
| 7 | 4 | pr15 | final | -10.06% | -0.13% | 592→605 | 1.0513 | 6/7 |
| 7 | 4 | pr15 | final_cap4 | -12.71% | -0.02% | 592→607 | 1.0664 | 7/7 |
| 7 | 6 | pr17 | final | -4.04% | +0.13% | 607→605 | 1.0211 | 4/7 |
| 7 | 6 | pr18 | final_cap4 | -7.71% | +0.14% | 609→607 | 1.0411 | 6/7 |
| 7 | 6 | pr15 | final | -12.83% | -0.05% | 592→605 | 1.0677 | 6/7 |
| 7 | 6 | pr15 | final_cap4 | -15.04% | -0.99% | 592→607 | 1.0830 | 7/7 |
| 7 | 12 | pr17 | final | -2.48% | +0.26% | 607→605 | 1.0126 | 5/7 |
| 7 | 12 | pr18 | final_cap4 | -3.41% | -2.32% | 609→607 | 1.0228 | 5/7 |
| 7 | 12 | pr15 | final | -9.76% | -0.72% | 592→605 | 1.0508 | 7/7 |
| 7 | 12 | pr15 | final_cap4 | -10.43% | -4.56% | 592→607 | 1.0625 | 7/7 |
| 17 | 4 | pr17 | final | -5.88% | +0.29% | 607→605 | 1.0307 | 7/7 |
| 17 | 4 | pr18 | final_cap4 | -4.52% | +0.09% | 609→607 | 1.0237 | 7/7 |
| 17 | 4 | pr15 | final | -16.59% | +0.11% | 592→605 | 1.0911 | 7/7 |
| 17 | 4 | pr15 | final_cap4 | -16.09% | +0.12% | 592→607 | 1.0873 | 7/7 |
| 17 | 6 | pr17 | final | -5.19% | +0.36% | 607→605 | 1.0268 | 7/7 |
| 17 | 6 | pr18 | final_cap4 | -9.05% | -0.10% | 609→607 | 1.0493 | 7/7 |
| 17 | 6 | pr15 | final | -10.34% | +0.11% | 592→605 | 1.0524 | 7/7 |
| 17 | 6 | pr15 | final_cap4 | -11.23% | -1.37% | 592→607 | 1.0603 | 7/7 |
| 17 | 12 | pr17 | final | -7.47% | -0.15% | 607→605 | 1.0404 | 6/7 |
| 17 | 12 | pr18 | final_cap4 | -0.86% | -2.70% | 609→607 | 1.0103 | 5/7 |
| 17 | 12 | pr15 | final | -13.16% | -0.22% | 592→605 | 1.0701 | 6/7 |
| 17 | 12 | pr15 | final_cap4 | -12.18% | -3.95% | 592→607 | 1.0717 | 7/7 |

K ratio = (T_control/T_candidate)^0.5 × (M_control/M_candidate)^0.2 × (S_control/S_candidate)^0.15; D=1 throughout, and the source clamp is active for both sources. Raw T/M values and separate factors are in the accompanying JSON/CSV.
