from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('  } bucket[B];','  } bucket[B], spare;')
a=s.index('  void clear() {',s.index('struct Queue'))
s=s[:a]+'''  void recycle(Bucket &k) {
    if (k.cap > spare.cap) std::swap(k, spare);
    free(k.data), k = {}, spare.size = 0;
  }
'''+s[a:]
s=s.replace('      bucket[w * 64 + __builtin_ctzll(bits)].size = 0;', '      recycle(bucket[w * 64 + __builtin_ctzll(bits)]);')
s=s.replace('''    if (k.size == k.cap)
      k.data = (u32 *)realloc(k.data, (k.cap = std::max(16u, 2 * k.cap)) * 4);''','''    if (k.size == k.cap) {
      if (!take) return;
      if (!k.cap && spare.cap) k = spare, spare = {};
      else k.data = (u32 *)realloc(k.data, (k.cap = std::max(16u, 2 * k.cap)) * 4);
    }''')
s=s.replace('    queue.near -= bk.size, bk.size = 0;','    queue.near -= bk.size;\n    queue.recycle(bk);')
Path('work/variants/queue_stash.cpp').write_text(s)
# Glibc pool-only comparison isolates allocation lifetime from the spare buffer.
s=s.replace('    if (k.cap > spare.cap) std::swap(k, spare);\n','')
Path('work/variants/queue_free.cpp').write_text(s)
