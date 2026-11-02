# Bound construction with monotone byte claims and checked capacity

This independent alternative to PR #24 starts from PR #23 source `e11b09e30d2ac0fdfada01317b5dce3deae5f6dd`. Each vertex has an atomic byte flag that only changes from zero to one. A worker's subsequent load cannot see zero after its own store, so each region visits every vertex at most once and its n/m buffers are bounded. The stores remain unlocked.

Racing workers can still retain separate copies. The forward allocation therefore checks the actual vertex/edge totals and enlarges the recycled raw mapping with checked mremap when necessary. The normal generator path needs no enlargement. Query packing remains bounded by twelve regions times the legal input size; the exact saturated query engine is unchanged.

Two deterministic regression schedules are included: a delayed bitmap update that formerly repeated a worker's high-degree vertex, and three simultaneous high-degree claims that overflowed the recycled forward storage even after per-worker visits were bounded. Both use the production Grower/contract paths at full dimensions and check guards plus exact distances. This byte+capacity version completes both. The minimal globally unique atomic fix in PR #24 also completes both without needing dynamic capacity.

[Reproducer and receipts](https://github.com/insightlabs38-pixel/sd-td/tree/prize/d-codex-final-query/research/codex-final/claims). Pinned full qualification is running. Initial two-CPU measurements trade approximately 1.5 MB of peak storage against fewer locked operations; they are not official K evidence. Keep the source- and memory-smaller PR #24 as an alternative. Do not select affected PR #19/#23 solely from ordinary CI or official samples.
