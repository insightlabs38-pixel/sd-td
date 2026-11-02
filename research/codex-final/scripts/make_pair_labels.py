from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
a=s.index('template <class L> struct Labels {');b=s.index('// One direction with',a)
s=s[:a]+'''template <class L> struct Labels {
  static constexpr L NONE = std::min<u64>(INF, L(-1));
  struct Cell { L lane[2]; };
  std::vector<Cell *> dir;
  std::vector<u32> used;
  Cell *store, blank[128];
  explicit Labels(u32 n) : dir(n / 128 + 1, blank), store(alloc<Cell>(n + 128)) {
    std::fill(blank, blank + 128, Cell{{NONE,NONE}});
  }
  Cell *at(u32 v) const { return dir[v / 128] + v % 128; }
  u64 get(u32 v, unsigned lane) const { return at(v)->lane[lane]; }
  Cell *slot(u32 v) {
    if (dir[v / 128] == blank) {
      dir[v / 128] = std::fill_n(store + used.size() * 128, 128, Cell{{NONE,NONE}}) - 128;
      used.push_back(v / 128);
    }
    return at(v);
  }
  void reset() {
    for (u32 page : used) dir[page] = blank;
    used.clear();
  }
};

'''+s[b:]
s=s.replace('  Labels<L> dist;','  Labels<L> &dist;\n  const unsigned lane;')
s=s.replace('explicit Side(const Graph &g) : g(g), dist(g.n), queue(g.n) {}','Side(const Graph &g, Labels<L> &dist, unsigned lane) : g(g), dist(dist), lane(lane), queue(g.n) {}')
s=s.replace('dist.reset(), queue.clear();','queue.clear();').replace('*dist.slot(s) = 0','dist.slot(s)->lane[lane] = 0')
s=s.replace('dist.get(u) != d','dist.get(u,lane) != d').replace('L *x = dist.slot(v);','auto *x = dist.slot(v);')
s=s.replace('old = *x;','old = x->lane[lane];').replace('*x = L(std::min(nd, old));','x->lane[lane] = L(std::min(nd, old));').replace('other.dist.get(v)','x->lane[1-lane]')
s=s.replace('  Side<L> fwd, bwd;','  Labels<L> labels;\n  Side<L> fwd, bwd;\n  Worker(const Graph &a, const Graph &b) : labels(a.n), fwd(a,labels,0), bwd(b,labels,1) {}')
s=s.replace('    fwd.start(s), bwd.start(t);','    labels.reset();\n    fwd.start(s), bwd.start(t);')
s=s.replace('Worker<uint16_t> narrow{Side<uint16_t>(*fwd), Side<uint16_t>(*rev)}','Worker<uint16_t> narrow{*fwd, *rev}').replace('Worker<u64>{Side<u64>(*fwd), Side<u64>(*rev)}','Worker<u64>{*fwd, *rev}')
Path('work/variants/prefix_pair.cpp').write_text(s)
