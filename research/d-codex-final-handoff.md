# Exact saturated query engine (qualification in progress)

Base PR #17 solver `79617b5c40b01613797138b294a33c0a7b5c6e44`; Dockerfile unchanged at `8eabe09b96a60131ce5bfda3f098011e1f0863e6`. This branch changes only the query engine and caps the environment worker override at twelve to preserve the documented key-packing bound. It can combine directly with PR #18's independent four-worker construction cap.

The engine saturates labels at 65535 and retries every unproven result using exact 64-bit labels. Nonnegative weights guarantee that every path shorter than 65535 survives saturation; a missing opposite label contributes 65535, so an answer below it always represents a real path. Saturation never wraps. This removes per-edge overflow bookkeeping and unnecessary restarts for certified short answers. Constant queue packing follows from `12 * 1,740,512 < 2^25`; the common packed-weight width has a specialized inner loop, with a generic-width fallback.

Organizer-pinned clang-format 23.1.3 and scc 4.1.0 count 599 C++ code lines plus six Dockerfile lines: S=605, D=1. Controls: PR #15 S=592, #17 S=607, #18 S=609. This is a modest structural simplification, not the aspirational 450–520-line rewrite.

Initial randomized interleaved full-seed-1 comparisons on the managed guest (two-CPU quota, at 4/6/12 workers) show roughly 3–4% lower whole-program wall time than PR #17, with matching outputs and lower CPU work. No official K improvement is claimed. Source-identical qualification run [41364856103](https://github.com/insightlabs38-pixel/sd-td/actions/runs/41364856103) has passed ASan/UBSan and TSan; original pinned Docker and organizer-reference qualification is ongoing. This clean branch also adds explicit 16-bit saturation-boundary oracle tests and reruns qualification.

Full campaign code, raw randomized benchmark receipts, controls and rejected alternatives are preserved separately on [`prize/d-codex-final-query`](https://github.com/insightlabs38-pixel/sd-td/tree/prize/d-codex-final-query/research/codex-final). Tested families include pending-label coalescing, shared chunk pools, a single u64 engine, compact shared forward/reverse adjacency, copied queue batches, and multiple label/page/key widths. Timing, memory-peak and independent-seed selection remain in progress. Final source hashes and measured score-axis ratios will be appended before recommending integration.

Rollback: retain PR #17, or PR #18 for the cap4 combination. `sd-sm` is read-only; Luna owns official evaluation and integration.
