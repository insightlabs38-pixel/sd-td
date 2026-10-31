# D: terminal-protected directed shortcuts and total-K construction economics

**Research only; unqualified.** Branch forked from main `a5e6ad2aa70adb6c0c4355b694aa51f705ded01e`, source blob `d53a4e39a379c744724d4aac87b6a3925411d9cf`. Official `sd-sm` D champion source blob `be15ac2e635af157cc8db71d2df5e218d0a78446` remains untouched.

## Findings, no official scores claimed

On an 8,836-node, 28,064-directed-arc synthetic road-like graph, exact sequential elimination of non-query terminals with in/out degree ≤3, bounded shortcut fill, removed 1,766 vertices and reduced Dijkstra settled-vertex totals to 875,279; degree ≤4 removed 2,701 and reduced settles to 765,498. Baseline mean settled 4,131.2 over 260 queries. Zero shortest-path mismatches across all 260 tests; a separate 48-pair smoke test covers directed heavy uint32 weights, zero edges, loops, parallel-min behavior and islands. **These queries are not rank-distributed like the frozen benchmark.** Python construction took 7.5ms/15.6ms for limits3/4 on only 8.8k vertices, so full-task preprocessing could dominate K.

An independent balanced bidirectional ALT prototype on 8,836 vertices/34,806 arcs reduced total expansions from 140,833 (ordinary bidirectional) to 49,449 (four landmarks), all 260 answers exact. But Python query processing was slower and eight full landmark sweeps had ~0.2s preprocessing even on this tiny graph. Four forward+reverse u32 landmark arrays per direction would require at least ~55.7MB at full size if u32 were exact, otherwise exact u64 storage ~111.4MB. ALT is **not** a currently demonstrated complete-K win.

CSR build on separately generated shuffled 200k/600k graph: straightforward two-pass exact CSR 22.8–25.2ms / 18,136KiB process peak versus bucket-accumulate 16.9–20.6ms / ~24,660KiB peak, same checksum 1979599079628, five runs. Building a direct CSR in two passes is **not** automatically a score improvement.

## Research design

1. Phase-attribute the exact present 12-worker champion: parse/bin, raw CSR, degree2 contraction, BFS region, gather, reverse, query workers, output, cgroup peak. Historical 4-worker breakdown ~30+15+35+8+22+23+150ms, not a scored-box profile.
2. Test a **terminal-protected, directed, bounded-fill elimination** engine. For incoming (u,v,a) and outgoing (v,w,b), add u→w at min(existing,a+b), remove v. Selfloops can be discarded because weights are nonnegative. Keep both endpoints of all 2k queries; use exact u64 saturated addition. Skip a candidate whose net fill exceeds a prespecified budget; independent-set batching or region-local contiguous fill lists are needed for concurrency. Compare whole build and query cost, not just settled vertices. Existing in-place degree2 contraction is highly optimized and should remain the baseline.
3. In a separate variant, shorten overlap of temporary bin pool, raw CSR, ways snapshot, BFS order/degree, permutation and forward/reverse CSR physical residency. Use coarse page reclamation only: earlier progressive per-page madvise reduced RSS but regressed wall 8–9%.
4. ALT secondary: two carefully selected directed landmarks at most for the first fast pilot. The lower bound h_t(v)=max(0,d(L,t)-d(L,v),d(v,L)-d(t,L)) is admissible; use feasible balanced forward/reverse potentials and the exact stop condition min_f+min_b≥2·best. No geometric heuristic without a certified weight-model inequality.
5. Directed exact gates: unreachable, zero weights, parallel arcs, self-loop, s=t, 2^32 extremes, high accumulated distances, protected terminal contraction, arbitrary contraction order. Use differential tiny/medium cases first; regular developer owns full seeded CI and integrator official trial.

The recent developer main already rejected WCC prefilter (33/33 paired losses with ~50ms extra graph traversal), probe 0/32 vs256 (sub-0.5% noise), LIFO BFS layout, adjacency order reversal and alternate queue microtuning. **Do not spend effort rerunning those.**

## Whole-K decision

Official D BEST at inspection: `run-68c15954870c` K=24.163880, T=122.315ms, M=98.51MB, S=862, D=1. A redesign at S=1050/M=110MB needs whole-process T below ~110ms just to break even; at M=155MB it needs <~96ms. A +40ms construction penalty cannot be offset by merely 20% fewer query settles if the old query phase is a fraction of total T. Stop or radically redesign any candidate that cannot meet this accounting.

**Handoff:** Use a new independent branch for any actual implementation. Do not change scheduled development branches, main, or `sd-sm`. Full report and reproducible D Python/C++ probes are in the research artifact produced in chat.
