# Deterministic region-buffer overflow in PR #19/#23

Affected PR #23 source: `e11b09e30d2ac0fdfada01317b5dce3deae5f6dd`; the claim mechanism also exists in PR #19. PR #20's private visited bitmap prevents this within-worker replay.

The shared bitmap uses a relaxed load followed by a relaxed store of `seen | bit`. Another worker's delayed store can erase bits set after its read. Without the private visited guard, a worker can enqueue and expand its own vertices again. Its order/ends buffers hold n entries and its edge buffer holds m entries. The packed-key bound also assumed once-per-worker visits.

The reproducer executes the production Grower with two legal pauses around its atomic claim operations. It uses 1,740,512 vertices, 5,000,000 directed edges, and unit weights: a directed two-neighbor ring, one seed redirected to vertex 1, and the remaining legal parallel arcs from vertex 0 to vertex 2. The slow worker claims its seed, reads the first bitmap word before vertex 1 is claimed, and pauses. The fast worker visits n-1 vertices. The slow store then erases earlier claims in that word. Re-expanding the high-degree vertex overruns the m-edge region buffer.

The buffers use the production mmap size/rounding, with a guard page immediately afterward. Only scheduling hooks and guard pages are added; the Grower algorithm is unchanged. Both the small fixture and full-dimension fixture terminate with SIGSEGV. This is a forced legal interleaving, not a claim that the organizer's seed normally crashes. TSan does not report logical lost updates among atomic accesses.

Reproduce from this directory:

```
python claim_schedule_d.py --source unsafe-e11b09e.cpp --expect-fault
```

Fix controls tested under the same schedule: (1) atomic fetch-or, checking its returned previous value before appending, gives globally unique claims; (2) per-vertex monotone byte flags give once-per-worker claims. Both complete the full schedule without crossing a guard. The byte approach also needs a forward-storage capacity check, because inter-worker duplicates may exceed the recycled raw allocation's spare capacity. The atomic approach bounds total vertices and edges by n and m, satisfying that capacity directly.

Do not select the affected construction solely because random tests, sanitizers and official samples passed. The independent minimal atomic fix is being qualified; `sd-sm` and Claude's branches were not modified.
