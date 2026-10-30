# Traverse

Exact directed shortest-path distances from CSR and a bidirectional Dijkstra engine with a monotone 64-bit radix heap. Per-query scratch uses generation stamps and independent worker state; a bounded forward probe handles short paths before the bidirectional fallback. Input is read with `mmap`, and answers retain query order.

No third-party runtime dependencies. A one-sided fallback, two-pass parser, probe limit, and thread count can be selected through `SD_BIDI=0`, `SD_TWO_PASS=1`, `SD_PROBE`, and `SD_THREADS` for independent validation.

With another 24 hours: run official seed-family benchmarks, compare a 64-bit radix heap, tune workers on the scoring box, and consider bounded exact reachability preprocessing only if it repays its cost.
