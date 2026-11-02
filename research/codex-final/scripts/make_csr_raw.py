from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text();old=Path('work/variants/final.cpp').read_text()
a=s.index('Graph *read_graph(');b=s.index('// ---------------------------------------------------------------- ordering',a)
c=old.index('Graph *read_graph(');d=old.index('// ---------------------------------------------------------------- ordering',c)
read=old[c:d].replace('  Graph *g = new Graph(n, m);','  u32 *storage = alloc<u32>(size_t(2) * n + m + 1);\n  Graph *g = new Graph(n, m, storage, storage + n + 1);')
s=s[:a]+read+s[b:]
a=s.index('// The edge indices');b=s.index('// One worker',a)
s=s[:a]+s[b:]
pos=s.index('  template <class F> void each(u32 b, F f) const')
s=s[:pos]+'''  u32 size(u32 b) const {
    return chunks[b].size() * CHUNK - (CHUNK - fill[b] % CHUNK) % CHUNK;
  }
'''+s[pos:]
# Retain safe atomic claiming and adapt only raw row accesses/prefetches.
s=s.replace('    auto [i, end] = row(raw, w.at);','    u32 i = raw.off[w.at], end = raw.off[w.at + 1];')
s=s.replace('    for (auto [i, end] = row(raw, u); i < end; ++i) {','    for (u32 i = raw.off[u]; i < raw.off[u + 1]; ++i) {')
s=s.replace('__builtin_prefetch(&raw.adj[4 * size_t(next)])','__builtin_prefetch(&raw.off[next])')
s=s.replace('__builtin_prefetch(&raw.adj[4 * size_t(y)])','__builtin_prefetch(&raw.off[y])')
s=s.replace('__builtin_prefetch(&raw.adj[4 * size_t(reg.order[h])]);', '''__builtin_prefetch(&raw.off[reg.order[h]]);
      for (u32 h = lo; h < std::min(reg.len, hi + BATCH); ++h)
        __builtin_prefetch(&raw.adj[raw.off[reg.order[h]]]);''')
s=s.replace('__builtin_prefetch(&raw.adj[4 * size_t(walks[i].at)]);','__builtin_prefetch(&raw.adj[raw.off[walks[i].at]]);')
s=s.replace('u32 *where = raw->adj, *spare = where + n;','u32 *where = raw->off, *spare = where + n;')
Path('work/variants/csr_raw_recycled.cpp').write_text(s)
# Wider bins simplify the parser overflow path with the same lifetime scheme.
bin8=Path('work/variants/bin8_simple.cpp').read_text()
a=s.index('struct __attribute__((packed)) Entry {');b=s.index('// Parses the edges',a)
c=bin8.index('struct Entry {');d=bin8.index('// Parses the edges',c)
shape=bin8[c:d]
pos=shape.index('  template <class F> void each')
shape=shape[:pos]+'''  u32 size(u32 b) const {
    return chunks[b].size() * CHUNK - (CHUNK - fill[b] % CHUNK) % CHUNK;
  }
'''+shape[pos:]
s=s[:a]+shape+s[b:]
s=s.replace('    std::sort(bin.heavy.begin(), bin.heavy.end());\n','')
s=s.replace('''          if (w == 0xFFFF)
            w = std::lower_bound(bin.heavy.begin(), bin.heavy.end(),
                                 std::pair(i, u64(0)))
                    ->second;
''','')
Path('work/variants/csr_raw_recycled_bin8.cpp').write_text(s)
