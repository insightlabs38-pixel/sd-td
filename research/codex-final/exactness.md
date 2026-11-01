Narrow labels saturate: assignment is min(nd, old) with old <= NONE, so no distance wraps.
Every nd < NONE uses a real directed path; an absent opposite label contributes NONE and cannot create a candidate best < NONE.
Every optimal path of total length < NONE has all its nonnegative prefixes and suffixes < NONE, so saturation cannot discard it.
Therefore any returned d < NONE is exact, regardless of an unrelated relaxation >= NONE.
All other results may be rerun with u64 labels. Retaining overflow flags avoids reruns for certified unreachable queries; removing them is also exact but may rerun unreachable searches.
