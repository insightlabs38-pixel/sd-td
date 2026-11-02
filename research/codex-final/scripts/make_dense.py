from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('template <class L> struct Labels');b=s.index('// One direction with saturating',a)
s=s[:a]+'''template <class L> struct Labels {
  static constexpr L NONE = std::min<u64>(INF, L(-1));
  L *store;
  std::vector<u32> used;
  std::vector<uint8_t> dirty;
  explicit Labels(u32 n) : store(alloc<L>(n + 128)), dirty(n / 128 + 1) {
    std::fill_n(store, n + 128, NONE);
  }
  L *at(u32 v) const { return store + v; }
  u64 get(u32 v) const { return store[v]; }
  L *slot(u32 v) {
    if (!dirty[v / 128]) {
      dirty[v / 128] = 1;
      used.push_back(v / 128);
    }
    return store + v;
  }
  void reset() {
    for (u32 page : used) {
      std::fill_n(store + page * 128, 128, NONE);
      dirty[page] = 0;
    }
    used.clear();
  }
};

'''+s[b:]
Path('work/variants/dense_labels.cpp').write_text(s)
for cap in [4,6]:
 q=s.replace('parallel(std::min<size_t>(threads, queries + 1)',f'parallel(std::min<size_t>(std::min(threads, {cap}u), queries + 1)')
 Path(f'work/variants/dense_labels{cap}.cpp').write_text(q)
# Reset only actually improved vertices; cheaper at small query radii.
a=s.index('  L *slot(u32 v) {');b=s.index('\n};',a)
t=s[:a]+'''  L *slot(u32 v) {
    if (store[v] == NONE) used.push_back(v);
    return store + v;
  }
  void reset() {
    for (u32 v : used) store[v] = NONE;
    used.clear();
  }
'''+s[b:]
Path('work/variants/dense_vertices.cpp').write_text(t)
Path('work/variants/dense_vertices6.cpp').write_text(t.replace('parallel(std::min<size_t>(threads, queries + 1)','parallel(std::min<size_t>(std::min(threads, 6u), queries + 1)'))
