"""Exactness at the narrow-label limit, with independent heap-Dijkstra answers."""
import random
import test_d as T

cases = 0
for limit in (65535, (1 << 32) - 1):
    for delta in (-2, -1, 0, 1, 2):
        total = limit + delta
        length = 96
        weights = [total // length + (i < total % length) for i in range(length)]
        arcs = [(i, i + 1, w) for i, w in enumerate(weights)]
        arcs += [(length + 2, length + 3, 0), (length + 3, length + 2, 0)]
        arcs += [(0, length + 1, T.U), (0, 0, 0), (0, 1, T.U)]
        queries = [(0, length), (length, 0), (0, length + 1), (length + 2, length + 3), (0, length + 2)]
        T.run_case(length + 5, arcs, queries, threads=(4, 6, 12))
        cases += 1
for seed in range(100):
    rng = random.Random(95000 + seed)
    n = rng.randrange(40, 500)
    arcs = [(rng.randrange(n), rng.randrange(n), rng.choice([0, 1, 7, 8191, 16384, 32767, 65534, 65535, 65536, T.U - 1, T.U])) for _ in range(n * 3)]
    # An unrelated large relaxation must not invalidate a certified short path.
    arcs += [(0, 1, T.U), (0, 2, 0), (2, 3, 1), (0, 3, 2)]
    queries = [(0, 3), (3, 0)] + [(rng.randrange(n), rng.randrange(n)) for _ in range(60)]
    T.run_case(n, arcs, queries, threads=(4, 6, 12))
    cases += 1
print('PASS saturation', cases)
