# Bound construction buffers with globally unique claims

This minimal independent fix starts from PR #23 source `e11b09e30d2ac0fdfada01317b5dce3deae5f6dd`. It replaces the stale bitmap store with a relaxed atomic fetch-or and appends only when the returned previous value lacked the bit. A preliminary load retains the fast path for already claimed vertices.

Claims are now globally unique. Each region visits each raw vertex at most once, each raw edge is expanded at most once in total, region buffers fit n/m, and recycled forward storage fits its existing allocation. No query algorithm changes; the 16-bit saturation engine remains exact with 64-bit retries.

[Deterministic full-dimension reproducer and raw receipts](https://github.com/insightlabs38-pixel/sd-td/tree/prize/d-codex-final-query/research/codex-final/claims). `tests/claim_schedule_d.py` adds the forced schedule to qualification. It completes without a guard fault on this fix; the original source reaches SIGSEGV. Random seeds and sanitizers alone do not expose the logical lost update.

Initial two-CPU measurements suggest a small CPU cost for the locked operations. This is a correctness candidate, not an official performance claim. A monotone-byte alternative is being compared independently and needs an additional recycled-storage capacity guard. Do not modify the official repository or Claude's active branches to evaluate this PR.
