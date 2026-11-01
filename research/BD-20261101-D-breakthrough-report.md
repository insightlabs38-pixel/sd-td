# D breakthrough research: complete-system evidence (2026-11-01)

Research-only. Never merge without an official-style isolated handoff. Main and scheduled developer branches untouched. Exact solver baseline source blob `484ed6182b9d2e0e3482b6818549077f637890a5`. Public spec: `hackathon-raptors/speed-demon-2026/specs/d-traverse.md`.

## First principles and baseline
- The frozen problem requires exact directed shortest paths for 1,740,512 nodes, 5,000,000 shuffled edges, and 2,000 queries; all parsing, preprocessing, queries and output are timed.
- The optimized baseline has fused BFS locality relabeling, degree-2 contraction, packed rows and bidirectional Dial/heap search. A representative four-worker runner profile: parse/bin ~36 ms, raw rows ~19 ms, fused transform ~75 ms, reverse ~21 ms, queries ~90 ms. Stage CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41292688179
- 2,000-query batch is highly skewed: 4-worker per-query p50 ~18us, p99 ~1.8ms. Twelve workers create severe contention, with p99 >10ms on the same host. Query CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41293262279
- Each reported time is a GH-runner matched local native comparison, not an official scoring-box result. All complete-batch seed-1 outputs match published SHA256 `a23dbdf0a3e49cc8901310a9ee1dc6a9a569a85297b6da75c2a7002cb2ed277e`; seed 7 outputs match independent baseline.

## Architectures tested and preserved
| Branch suffix | Family and exact native implementation | Full-seed four-worker medians (baseline/candidate) | Result |
|---|---|---|---|
| `lazy-shortcuts` | Per-relax exact virtual degree-3/4 shortcut expansion, depths 1/3 | seed1 .257/.322-.358s | 20-28% slower |
| `forward-only` | Full reverse-CSR eliminated; forward exact search with zero-in-degree target certificate | seed1 .246/.354s | 31% slower |
| `partial-ch` | Terminal-protected native directed independent-set hierarchy with shortcut edge construction | seed1 .244/.305-.360s | 20-32% slower |
| `dual-bin` | Single parse pass creates original-id forward/reverse bins directly, no BFS, contraction or transpose | seed1 .244/.510s | 52% slower by speedup convention |
| `fused-degree34` | Native directed degree-3/4 shortcuts integrated into existing fused graph gather | seed1 .155/.200s (faster runner) | 22-23% slower |
| `quotient-astar` | Directed quotient-metric balanced A* with exact feasible potentials, no full graph landmark sweeps | seed1 .247/.278s | 11% slower |
| `input-lifetime` | Unmap original 92MB graph file immediately after threaded parsing | seed1 .247/.245s | Near time parity, RSS 150.5 -> 122.6MB |
 
## Root-cause investigation
- Neither terminal-protected shortcut count nor search-settlement reduction establishes a full K win. Separate hierarchy rebuilding costs more than saved query work; deeper lazy shortcuts add branch and adjacency work.
- Random-id direct dual-bin construction destroyed search locality and raised native RSS to ~252MB. The fused BFS transform is not optional without a fundamentally better query representation. Dual CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41292625001
- Fused degree-3 independent-set selection scans the graph separately: ~47 ms for selection, ~80 ms fused gather, ~93 ms query stage, versus baseline ~75 ms gather and ~90 ms queries. It selects 129,215 vertices but yields effectively no query benefit. The only plausible repair is removing selection cost *and* creating a materially stronger contraction; merely optimizing its loops is not enough. Diagnostic CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41293483254
- Directed quotient potentials are provably feasible through the exact quotient edge minima, but their APSP and reduced-cost key processing failed to justify overhead. Full CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41293815003
- Input unmapping is only a positive **native RSS** result, not an official-style cgroup benefit: 18.5% less max RSS with 0.2% regression to 1.0% speedup across two full seeds and two worker settings, all adversarial tests and sanitizer tests passed. Native CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41293952233

## Reproducibility and open gates
- Every family has immutable `research/d-breakthrough-20261101-*` branch commits containing its C++ source, paired full 2,000-query seed 1/7 benchmark and independent exactness workflow.
- Full proofs must include nonnegative directed arcs, all terminals protected during elimination, parallel-min edges, zero arcs, disconnected nodes and u64 sums. No probabilistic answer selection or external shortest-path libraries used.
- **Cgroup memory gate COMPLETED, negative:** pinned GCC15 seed-17 full-graph PGO Docker comparison with five interleaved repetitions at both four and twelve workers, full seed1 official output SHA. Both versions measured approximately 62.4–63.2 million bytes peak in the container's `memory.peak`, with <1% nondirectional differences. Native RSS improvement of 18.5% therefore **does not translate** to a material measured cgroup M gain. No credible scoring K improvement. Isolated CI: https://github.com/insightlabs38-pixel/sd-td/actions/runs/41294295077 . Source and Docker frozen; no promotion.
- **Quotient phase diagnosis COMPLETED, negative:** full runs show ~15ms to construct region-quotient APSP and approximately 102–110ms for queries, compared with baseline approximately 97–105ms. Exact potentials did not make searches cheaper, so improving quotient matrix construction alone cannot beat the current baseline. CI https://github.com/insightlabs38-pixel/sd-td/actions/runs/41294221176 .
- **Input-lifetime TSan COMPLETED, passed:** independent TSAN directed/oracle tests show no warnings; https://github.com/insightlabs38-pixel/sd-td/actions/runs/41294496652 . The exact source change also passes the original main full seed/tiny/sample, pinned PGO Docker at 1/4/12, as an isolated production-path candidate `research/d-breakthrough-20261101-input-handoff`, run https://github.com/insightlabs38-pixel/sd-td/actions/runs/41294569572 . It is **not** a qualified scoring win, so leave unmerged.
- **Fresh architectural hypothesis: overlap reverse-adjacency construction with exact bounded forward queries.** Early forward probes publish only certified Dijkstra answers, while graph construction takes four threads and 1–2 additional workers process the known query batch. There is no extra graph preprocessing; search done concurrently is removed from the later all-query phase. Source and full two-seed A/B benchmarks on `research/d-breakthrough-20261101-overlap-query-reverse`, CI https://github.com/insightlabs38-pixel/sd-td/actions/runs/41294877078 . Await exact results before judging, and measure time, memory, execution contention and source penalty.
- Preserve all failed architectures as research controls; no merge to `main`, `sd-sm` or developer branches.
