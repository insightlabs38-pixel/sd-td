import os, random, subprocess, sys, tempfile, pathlib
sys.path.insert(0, os.path.dirname(__file__))
import test_d as T

U = T.U


def lattice(rng, w, h):
    n = w * h
    arcs = []
    for y in range(h):
        for x in range(w):
            for dx, dy in ((1, 0), (0, 1), (1, 1)):
                if x + dx < w and y + dy < h and rng.random() < 0.9:
                    a, b = y * w + x, (y + dy) * w + x + dx
                    base = rng.choice([0, 1, 2, 5, 50, 700, 2046, 2047, 2048, 5000, U - 1, U])
                    for u, v in ((a, b), (b, a)) if rng.random() < 0.8 else (((a, b),) if rng.random() < 0.5 else ((b, a),)):
                        arcs.append((u, v, base if rng.random() < 0.5 else rng.choice([1, 3, 90, 2047, rng.randrange(1 << 20)])))
    for _ in range(n // 20):
        u = rng.randrange(n)
        arcs.append((u, u, rng.randrange(100)))
    for _ in range(n // 10 and len(arcs) // 10):
        arcs.append(rng.choice(arcs))
    rng.shuffle(arcs)
    perm = list(range(n))
    rng.shuffle(perm)
    return n, [(perm[u], perm[v], c) for u, v, c in arcs]


def main(seeds):
    for seed in range(seeds):
        rng = random.Random(1000 + seed)
        n, arcs = lattice(rng, rng.randrange(2, 25), rng.randrange(2, 25))
        n += rng.randrange(0, 4)
        queries = [(rng.randrange(n), rng.randrange(n)) for _ in range(120)]
        T.run_case(n, arcs, queries, threads=(1, 5))
    print('PASS stress', seeds)


if __name__ == '__main__':
    main(int(sys.argv[1]) if len(sys.argv) > 1 else 60)
