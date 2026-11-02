from pathlib import Path
base=Path('work/variants/pure_sse.cpp').read_text()
a=base.index('template <class L> struct Labels')
base=base[:a]+'''template <class L> struct LabelPool {
  L *store;
  size_t used = 0;
  LabelPool(u32 n, L *memory = nullptr) : store(memory ? memory : alloc<L>(2ul * n + 256)) {}
};
'''+base[a:]
base=base.replace('  L *store, blank[128];','  LabelPool<L> &pool;\n  L blank[128];')
base=base.replace('explicit Labels(u32 n) : dir(n / 128 + 1, blank), store(alloc<L>(n + 128))', 'Labels(u32 n, LabelPool<L> &pool) : dir(n / 128 + 1, blank), pool(pool)')
base=base.replace('store + used.size() * 128','pool.store + pool.used++ * 128')
base=base.replace('explicit Side(const Graph &g) : g(g), dist(g.n), queue(g.n)', 'Side(const Graph &g, LabelPool<L> &pool) : g(g), dist(g.n, pool), queue(g.n)')
base=base.replace('    dist.reset(), queue.clear();','    queue.clear();')
base=base.replace('template <class L> struct Worker {\n  Side<L> fwd, bwd;', '''template <class L> struct Worker {
  LabelPool<L> pool;
  Side<L> fwd, bwd;
  Worker(const Graph &f, const Graph &r, L *memory = nullptr) : pool(f.n, memory), fwd(f, pool), bwd(r, pool) {}''')
base=base.replace('    fwd.start(s), bwd.start(t);','    fwd.dist.reset(), bwd.dist.reset(), pool.used = 0;\n    fwd.start(s), bwd.start(t);')
base=base.replace('Worker<uint16_t> narrow{Side<uint16_t>(*fwd), Side<uint16_t>(*rev)};', 'Worker<uint16_t> narrow(*fwd, *rev);')
base=base.replace('new Worker<u64>{Side<u64>(*fwd), Side<u64>(*rev)}', 'new Worker<u64>(*fwd, *rev)')
Path('work/variants/shared_label_pool.cpp').write_text(base)
s=base.replace('reg.ends = alloc<u32>(n)', 'reg.ends = alloc<u32>(n + 256)')
s=s.replace('unsigned threads, std::vector<u32> &ends) {','unsigned threads, std::vector<u32> &ends, std::vector<u32 *> *scratch = nullptr) {')
s=s.replace('  for (Region &reg : regions)\n    release(reg.ends, n);','  for (Region &reg : regions)\n    if (scratch) scratch->push_back(reg.ends);\n    else release(reg.ends, n + 256);')
s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);', '  std::vector<u32 *> scratch;\n  auto [fwd, rev] = contract(raw, bypass, threads, ends, &scratch);')
s=s.replace('parallel(std::min<size_t>(threads, queries + 1), [&](unsigned) {','parallel(std::min<size_t>(threads, queries + 1), [&](unsigned t) {')
s=s.replace('Worker<uint16_t> narrow(*fwd, *rev);','Worker<uint16_t> narrow(*fwd, *rev, (uint16_t *)scratch[t]);')
Path('work/variants/recycled_label_pool.cpp').write_text(s)
