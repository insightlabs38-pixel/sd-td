from pathlib import Path
base=Path('work/variants/final.cpp').read_text()
def labels(s):
 a=s.index('  // Any finite distance improves a blank label');b=s.index('  void reset() {',a)
 return s[:a]+'''  [[gnu::noinline, gnu::cold]] L *materialize(u32 page) {
    L *p = std::fill_n(store + used.size() * 128, 128, NONE) - 128;
    used.push_back(page);
    return dir[page] = p;
  }
  L *slot(u32 v) {
    L *p = dir[v / 128];
    if (p == blank) p = materialize(v / 128);
    return p + v % 128;
  }
'''+s[b:]
def queue(s):
 a=s.index('  void push(u64 d, u32 v, bool take = true)')
 s=s[:a]+'''  [[gnu::noinline, gnu::cold]] static void grow(Bucket &k) {
    k.data = (u32 *)realloc(k.data, (k.cap = std::max(16u, 2 * k.cap)) * 4);
  }
'''+s[a:]
 old='    if (k.size == k.cap)\n      k.data = (u32 *)realloc(k.data, (k.cap = std::max(16u, 2 * k.cap)) * 4);'
 assert old in s
 return s.replace(old,'    if (k.size == k.cap)\n      grow(k);')
def esc(s):
 a=s.index('  u64 weight(size_t i) const {');b=s.index('  void put(',a)
 return s[:a]+'''  [[gnu::noinline, gnu::cold]] u64 escaped(size_t i) const {
    return std::lower_bound(esc.begin(), esc.end(), std::pair(i, 0ul))->second;
  }
  u64 weight(size_t i) const {
    u32 w = adj[i] & mask;
    return w == mask ? escaped(i) : w;
  }
'''+s[b:]
for name,func in [('outline_labels',labels),('outline_queue',queue),('outline_esc',esc),('outline_all',lambda s:esc(queue(labels(s))))]:
 Path('work/variants/'+name+'.cpp').write_text(func(base))
