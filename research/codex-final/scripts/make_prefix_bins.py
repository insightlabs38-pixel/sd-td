from pathlib import Path
base=Path('work/variants/fixed_all_compact_bounded_pure_sse_byte_cap6.cpp').read_text()
a=base.index('struct alignas(64) Bins {');b=base.index('// Parses the edges',a)
new='''struct alignas(64) Bins {
  static constexpr u32 GROUP = 16, bits = 21, shift = 11;
  u32 buckets, cap, stride;
  Entry *pool;
  std::vector<u32> fill;
  std::vector<std::vector<Entry>> extra;
  std::vector<std::pair<u64, u64>> heavy;
  Bins(u32 n, u32 cap, unsigned, unsigned workers)
      : buckets(n >> shift), cap(cap), stride(workers * cap), fill(buckets + 1), extra(buckets + 1) {}
  void add(u32 u, u32 v, u64 w) {
    u32 b = u >> shift, i = fill[b]++;
    if (w >= 0xFFFF) heavy.push_back({u64(b) << 32 | i, w});
    Entry e{(u & ((1u << shift) - 1)) << bits | v, uint16_t(std::min<u64>(w, 0xFFFF))};
    if (i < cap) pool[b * stride + i] = e;
    else extra[b].push_back(e);
  }
  template <class F> void each(u32 b, F f) const {
    u32 end = std::min(fill[b], cap);
    u64 key = u64(b) << 32;
    const Entry *first = pool + b * stride;
    for (u32 i = 0; i < end; ++i) f(first[i], key | i);
    for (u32 i = cap; i < fill[b]; ++i) f(extra[b][i - cap], key | i);
  }
};

'''
base=base[:a]+new+base[b:]
a=base.index('  size_t most = 0;');b=base.index('  std::vector<Bins> bins;',a)
base=base[:a]+'''  u32 cap = (m / threads / ((n >> 11) + 1) / 256 + 1) * 256;
'''+base[b:]
base=base.replace('Entry *pool = alloc<Entry>(size_t(buckets / Bins::GROUP + 1) * threads * cap);','Entry *pool = alloc<Entry>(size_t(buckets + 1) * threads * cap);')
base=base.replace('    bin.pool = pool;', '    bin.pool = pool + size_t(t) * cap;')
base=base.replace('bin.each(b, [&](Entry e, u32 i)', 'bin.each(b, [&](Entry e, u64 i)')
base=base.replace('''      if (--left[b / Bins::GROUP] == 0)
        release(pool + size_t(b / Bins::GROUP) * threads * cap, threads * cap);''','''      for (Bins &bin : bins) std::vector<Entry>().swap(bin.extra[b]);
      if (--left[b / Bins::GROUP] == 0) {
        u32 first = b / Bins::GROUP * Bins::GROUP;
        release(pool + size_t(first) * threads * cap,
                size_t(std::min(Bins::GROUP, buckets + 1 - first)) * threads * cap);
      }''')
Path('work/variants/prefix_bins.cpp').write_text(base)
# A higher common-case reserve leaves the exact overflow path unchanged.
Path('work/variants/prefix_bins512.cpp').write_text(base.replace('/ 256 + 1) * 256','/ 512 + 1) * 512'))
