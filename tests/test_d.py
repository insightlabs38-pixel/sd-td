import hashlib
import heapq
import os
import pathlib
import random
import subprocess
import tempfile
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
BIN = pathlib.Path(os.environ.get('SD_TEST_BINARY', str(ROOT / 'track-d' / 'd_traverse')))
U = (1 << 32) - 1


def oracle(n, arcs, queries):
    adj = [[] for _ in range(n)]
    for u, v, w in arcs:
        adj[u].append((v, w))
    answers = []
    for s, t in queries:
        if s == t:
            answers.append(0)
            continue
        heap = [(0, s)]
        dist = {s: 0}
        while heap:
            d, u = heapq.heappop(heap)
            if dist[u] != d:
                continue
            if u == t:
                answers.append(d)
                break
            for v, w in adj[u]:
                nd = d + w
                if nd < dist.get(v, 1 << 62):
                    dist[v] = nd
                    heapq.heappush(heap, (nd, v))
        else:
            answers.append(-1)
    return answers


def run_case(n, arcs, queries, expected=None, threads=(1, 4, 12)):
    with tempfile.TemporaryDirectory() as temp:
        p = pathlib.Path(temp)
        (p / 'graph.txt').write_text(f'{n} {len(arcs)}\n' + ''.join(f'{u} {v} {w}\n' for u, v, w in arcs))
        (p / 'queries.txt').write_text(''.join(f'{s} {t}\n' for s, t in queries))
        if expected is None:
            expected = oracle(n, arcs, queries)
        for count in threads:
            for probe in (0, 1, 2, 16, 64, 256):
                env = os.environ.copy()
                env.update(SD_DATA=temp, SD_OUT=temp, SD_THREADS=str(count), SD_PROBE=str(probe))
                subprocess.run([str(BIN)], env=env, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                output = (p / 'distances.txt').read_bytes()
                truth = ''.join(f'{x}\n' for x in expected).encode()
                assert output == truth, (n, len(arcs), len(queries), count, probe, output[:200], truth[:200])
    return True


def random_case(seed, n, m, q):
    rng = random.Random(seed)
    arcs = []
    for i in range(m):
        if i % 23 == 0 and arcs:
            u, v, w = rng.choice(arcs)
        elif i % 29 == 0 and arcs:
            u, v, _ = rng.choice(arcs)
            w = rng.choice([0, 1, U, U - 1, rng.randrange(100000)])
        else:
            u = rng.randrange(n)
            v = rng.randrange(n)
            w = rng.choice([0, 0, 1, 2, 50, 1000, U, U - 1, rng.randrange(10000)])
        arcs.append((u, v, w))
    queries = [(rng.randrange(n), rng.randrange(n)) for _ in range(q)]
    queries += [(i, i) for i in range(min(n, 10))]
    queries += queries[:min(5, len(queries))]
    return arcs, queries


def main():
    t0 = time.monotonic()
    arcs = [(0, 1, 4), (1, 2, 3), (0, 2, 9), (2, 0, 5), (2, 1, 6), (1, 3, 0), (3, 4, 0), (4, 4, 7), (4, 5, U), (2, 1, 2), (5, 6, U), (0, 1, 4)]
    queries = [(0, 2), (2, 1), (1, 4), (4, 4), (7, 7), (0, 6), (4, 5), (6, 0), (0, 7), (1, 0), (2, 1)]
    run_case(8, arcs, queries, [7, 2, 0, 0, 0, 2 * U + 4, U, -1, -1, 8, 2])
    run_case(1, [], [(0, 0)])
    run_case(4, [(0, 1, U), (1, 2, U), (2, 3, U)], [(0, 3), (3, 0), (1, 3), (0, 0)], [3 * U, -1, 2 * U, 0])
    for seed in range(80):
        n = 1 + (seed * 37) % 191
        m = (seed * 119) % (n * 7 + 1)
        arcs, queries = random_case(seed, n, m, 60)
        run_case(n, arcs, queries)

    print('PASS 83 differential cases; thread counts 1/4/12 x 6 probe limits, elapsed %.2fs' % (time.monotonic() - t0))

if __name__ == '__main__':
    main()
