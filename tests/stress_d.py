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


def chains(rng):
    # Long two-way paths, one-way rings with an entrance, diamonds, hubs and heavy edges: all contraction shapes.
    arcs, n = [], 0
    def w():
        return rng.choice([0, 1, 7, 100, 2046, 2047, 5000, U, U - 1, rng.randrange(1000)])
    for length in (3, 70, 150):
        for k in range(length - 1):
            a, b = n + k, n + k + 1
            arcs += [(a, b, w()), (b, a, w())]
        n += length
    ring = list(range(n, n + 6)); n += 6
    arcs += [(ring[i], ring[(i + 1) % 6], w()) for i in range(6)] + [(0, ring[0], w()), (ring[3], 1, w())]
    top = n; n += 7
    arcs += [(top, top + 1, w()), (top, top + 2, w()), (top + 1, top + 3, w()), (top + 2, top + 3, w()), (top + 3, top + 4, w()), (top + 4, top + 5, w()), (top + 4, top + 6, w()), (top + 5, top, w()), (top + 6, 2, w())]
    arcs += [(top + 1, top + 1, 3), (top, top + 1, w()), (5, 5, 2)]
    for hub in range(n, n + 3):
        arcs += [(hub, rng.randrange(n), w()) for _ in range(4)] + [(rng.randrange(n), hub, w()) for _ in range(4)]
    n += 3
    rng.shuffle(arcs)
    return n + 2, arcs


def main(seeds):
    for seed in range(seeds):
        rng = random.Random(1000 + seed)
        n, arcs = lattice(rng, rng.randrange(2, 25), rng.randrange(2, 25))
        n += rng.randrange(0, 4)
        queries = [(rng.randrange(n), rng.randrange(n)) for _ in range(120)]
        T.run_case(n, arcs, queries, threads=(1, 5))
    for seed in range(seeds):
        rng = random.Random(5000 + seed)
        n, arcs = chains(rng)
        perm = list(range(n))
        rng.shuffle(perm)
        arcs = [(perm[u], perm[v], c) for u, v, c in arcs]
        queries = [(rng.randrange(n), rng.randrange(n)) for _ in range(150)]
        T.run_case(n, arcs, queries, threads=(1, 4, 12))
    print('PASS stress', seeds)


if __name__ == '__main__':
    main(int(sys.argv[1]) if len(sys.argv) > 1 else 60)
