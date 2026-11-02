from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('  void clear() {',s.index('struct Queue'))
s=s[:a]+'''  static void order(Bucket &bk) {
    u32 next[128], end[128] = {};
    for (u32 i = 0; i < bk.size; ++i) ++end[bk.data[i] >> node_bits];
    u32 sum = 0;
    for (unsigned r = 0; r < 128; ++r) {
      next[r] = sum;
      sum += end[r], end[r] = sum;
    }
    for (unsigned r = 0; r < 128; ++r)
      while (next[r] < end[r]) {
        u32 e = bk.data[next[r]], key = e >> node_bits;
        if (key == r) ++next[r];
        else std::swap(bk.data[next[r]], bk.data[next[key]++]);
      }
  }
'''+s[a:]
s=s.replace('    u32 mask = (1u << queue.node_bits) - 1, settled = 0;', '''    if (bk.size >= SORT_MIN) Queue::order(bk);
    u32 mask = (1u << queue.node_bits) - 1, settled = 0;''')
for threshold in [32,128,512]:
 Path(f'work/variants/radixbucket{threshold}.cpp').write_text(s.replace('SORT_MIN',str(threshold)))
