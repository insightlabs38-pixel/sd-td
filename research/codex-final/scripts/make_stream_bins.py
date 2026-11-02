from pathlib import Path
base=Path('work/variants/pure_sse.cpp').read_text()
base=base.replace('#include <vector>','#include <vector>\n#include <unordered_map>')
a=base.index('struct __attribute__((packed)) Entry');b=base.index('// Parses the edges',a)
new='''struct Entry { u64 key; };
struct Bins {
  static constexpr u32 GROUP = 16, W = 22, MASK = (1u << W) - 1;
  struct Heavy { std::vector<u32> weights; mutable u32 consumed = 0; };
  u32 bits, shift, buckets, capacity, length = 0;
  u64 *data;
  std::vector<u32> start;
  std::unordered_map<u64, Heavy> heavy;
  Bins(u32 n, u32 capacity, unsigned, unsigned)
      : bits(id_bits(n)), shift(SHIFT), buckets(n >> shift), capacity(capacity),
        data(alloc<u64>(capacity)), start(buckets + 2) {}
  void add(u32 u, u32 v, u64 w) {
    u64 key = u64(u) << bits | v;
    if (w >= MASK) heavy[key].weights.push_back(w);
    data[length++] = key << W | std::min<u64>(w, MASK);
    ++start[(u >> shift) + 1];
  }
  void finish() {
    std::partial_sum(start.begin(), start.end(), start.begin());
    std::vector<u32> at = start;
    u64 *sorted = alloc<u64>(length);
    for (u32 i = 0; i < length; ++i) {
      u64 e = data[i];
      sorted[at[e >> (W + bits + shift)]++] = e;
      if ((i & 8191) == 8191) madvise(data + i - 8191, 8192 * 8, MADV_DONTNEED);
    }
    release(data, capacity), data = sorted, capacity = length;
  }
  u64 weight(u32 i) const {
    u64 e = data[i];
    if ((e & MASK) != MASK) return e & MASK;
    const Heavy &h = heavy.find(e >> W)->second;
    return h.weights[h.consumed++];
  }
  template <class F> void each(u32 b, F f) const {
    u64 mask = (u64(1) << (bits + shift)) - 1;
    for (u32 i = start[b], end = start[b+1]; i < end; ++i)
      f(Entry{(data[i] >> W) & mask}, i);
  }
  void discard(u32 group) const {
    u32 a = group * GROUP, b = std::min(a + GROUP, buckets + 1);
    size_t lo = (start[a] * 8ul + 4095) / 4096 * 4096;
    size_t hi = start[b] * 8ul / 4096 * 4096;
    if (hi > lo) madvise((char *)data + lo, hi - lo, MADV_DONTNEED);
  }
};

'''
base=base[:a]+new+base[b:]
base=base.replace('  Entry *pool = alloc<Entry>(size_t(buckets / Bins::GROUP + 1) * threads * cap);\n','')
base=base.replace('    bin.pool = pool;\n','')
base=base.replace('    std::sort(bin.heavy.begin(), bin.heavy.end());','    bin.finish();')
base=base.replace('''          u64 w = e.w;
          if (w == 0xFFFF)
            w = std::lower_bound(bin.heavy.begin(), bin.heavy.end(),
                                 std::pair(i, u64(0)))
                    ->second;''','''          u64 w = bin.weight(i);''')
base=base.replace('''        release(pool + size_t(b / Bins::GROUP) * threads * cap, threads * cap);''','''        for (const Bins &bin : bins) bin.discard(b / Bins::GROUP);''')
# Return all residual boundary pages; the large groups were discarded as built.
base=base.replace('  g->merge(escapes);\n  return g;', '  g->merge(escapes);\n  for (const Bins &bin : bins) release(bin.data, bin.capacity);\n  return g;',1)
for shift in [11,13,15]:
 Path(f'work/variants/stream_bins{shift}.cpp').write_text(base.replace('SHIFT',str(shift)))
