from pathlib import Path
s=Path('work/variants/final.cpp').read_text()
a=s.index('    for (u32 k = 0; k < bk.size; ++k) {',s.index('size_t drain_bits'))
b=s.index('      if (dist.get(u) != d)',a)
s=s[:a]+'''    for (u32 pos = 0; pos < bk.size;) {
      constexpr u32 BATCH = 8;
      u32 count = std::min(BATCH, bk.size - pos), entries[BATCH];
      memcpy(entries, bk.data + pos, count * sizeof(u32));
      pos += count;
      for (u32 k = 0; k < count; ++k) {
        u32 v = entries[k] & mask;
        __builtin_prefetch(&g.off[v]), __builtin_prefetch(dist.at(v));
      }
      for (u32 k = 0; k < count; ++k)
        __builtin_prefetch(&g.adj[g.off[entries[k] & mask]]);
      for (u32 k = 0; k < count; ++k) {
        u32 u = entries[k] & mask;
        u64 d = queue.cur << queue.shift | entries[k] >> queue.node_bits;
'''+s[b:]
a=s.index('    queue.near -= bk.size',a)
s=s[:a]+'    }\n'+s[a:]
for n in [4,8,16,32]:Path(f'work/variants/batch{n}.cpp').write_text(s.replace('constexpr u32 BATCH = 8','constexpr u32 BATCH = '+str(n)))
