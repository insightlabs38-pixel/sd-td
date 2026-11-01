# Exactness around the 32-bit label limit: paths whose halves fit 32 bits but whose
# sum does not, paths of exactly 2^32 - 2, 2^32 - 1 and 2^32, and long chains.
import os, random, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import test_d as T
L = (1 << 32) - 1
cases = 0
for seed in range(60):
    rng = random.Random(77 + seed)
    n = rng.randrange(20, 400)
    arcs = []
    for _ in range(n * 3):
        u, v = rng.randrange(n), rng.randrange(n)
        w = rng.choice([0, 1, 2, rng.randrange(1000), (1 << 31) - 1, 1 << 31, L // 2, L // 3, L - 1, L, rng.randrange(L + 1)])
        arcs.append((u, v, w))
    # a chain whose total is exactly L - 1, L or L + 1
    k = rng.randrange(3, 9)
    chain = rng.sample(range(n), k + 1)
    target = L - 1 + rng.randrange(3)
    parts = sorted(rng.randrange(target) for _ in range(k - 1))
    ws = [b - a for a, b in zip([0] + parts, parts + [target])]
    arcs += [(chain[i], chain[i + 1], ws[i]) for i in range(k)]
    rng.shuffle(arcs)
    queries = [(chain[0], chain[-1]), (chain[-1], chain[0])] + [(rng.randrange(n), rng.randrange(n)) for _ in range(40)]
    T.run_case(n, arcs, queries, threads=(1, 3))
    cases += 1
print('PASS boundary', cases)
