# Independent final D campaign

Research in progress; no official K claim. Base PR #17, immutable controls in `controls.json`. PR #18 is a separate control and only adds a construction-worker cap. `sd-sm` remains read-only.

Environment: managed Linux guest with two-CPU cgroup quota, SMT/topology not equivalent to the official six-core system. Every measured solver uses the exact GCC 15 image compiler, `-O3 -std=c++17 -pthread -flto -static -s`, without PGO. Because Docker's VFS layers exhausted the 8 GB disk, the compiler filesystem was reconstructed from digest-verified official image layers and used read-only through a small container; source Dockerfile is unchanged. `gcc-manifest.json` records the verified layer identities. Full restricted runtime and parent-cgroup gates follow separately.

`variants/` preserves actual experimental source. `receipts/` contains raw exact-hash runs, CPU/wall/RSS, tests and phase logs. RSS is diagnostic, never a substitute for the scoring memory axis. `scripts/bench.py` interleaves randomized matched runs, checks every full output, and captures `wait4` CPU/RSS. Timing jobs serialize through a lock. Source counts use organizer-pinned clang-format 23.1.3 and scc 4.1.0, including six Dockerfile code lines.

Completed alternatives: pending-label coalescing at four bucket widths (exact, materially slower); one 64-bit engine (no persuasive full-score win); shared recyclable queue chunks (exact, slower); u16 labels with unchanged overflow policy (extra fallbacks, slower); constant queue key packing/common-weight specialization (modest positive); corrected overflow fallback gate (positive with u16 labels). Saturating narrow searches without per-edge overflow flags, smaller constant bucket widths and a shared six-byte adjacency union remain under evaluation.

Hardware performance counters are unavailable and software perf sampling is denied; generated assembly, phase CPU clocks, and Valgrind instruction/cache simulation are the available attribution tools. Do not infer hardware cache misses or official gains from simulation.

The constant seven-bit queue packing relies on the legal input bound and at most twelve construction regions: each region visits an input vertex at most once, and `12 * 1,740,512 < 2^25`. A promoted version must cap the worker override at twelve or retain a generic fallback. Experimental sources intentionally retain the control's worker override until selection.
