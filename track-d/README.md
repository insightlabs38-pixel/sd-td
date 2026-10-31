# Traverse

Exact directed shortest paths on a road-like graph, built for the end-to-end clock: parse, preprocess, answer, write.

Pipeline, all phases parallel unless noted:

1. `graph.txt` is mmapped and cut at line boundaries per thread. Each thread parses (SWAR integers) into 8-byte packed bin entries keyed by the tail's id bucket, avoiding a 12-byte triple array and atomic bin writes. Pages already parsed are returned with `madvise`.
2. Each bucket becomes a CSR slice in cache-sized scratch (raw ids).
3. Multi-seed BFS regions (atomic claim bitmap) renumber nodes so graph neighbours are close in memory; the forward CSR is gathered in that order and the reverse CSR is derived from it. Random relabeling in the input otherwise makes every distance access a cache miss.
4. Edges are 4 bytes: node id in the high bits, weight in the low bits. Weights that do not fit store an all-ones marker and are resolved from a sorted escape table, so any 32-bit weight stays exact.
5. Queries run on independent workers in order of source id. Each runs an exact forward probe (256 settles) and then bidirectional Dijkstra with a width-32 bucket queue (2048 buckets, exact re-draining, binary-heap overflow for larger jumps). Labels live in 128-node pages allocated on first write and recycled per query, so worker memory follows the search, not `n`.

No third-party runtime dependencies. `SD_THREADS` and `SD_PROBE` select thread count and probe length for validation.

Next: confirm worker-count scaling on the official scoring box, evaluate balanced BFS regions, and preserve exact holdout correctness.
