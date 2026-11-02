from pathlib import Path
for name in ['fix_atomic','pure_sse']:
 s=Path(f'work/variants/{name}.cpp').read_text()
 s=s.replace('struct Queue {\n  static constexpr u32 B = 2048;', 'template <bool BOUNDED> struct Queue {\n  static constexpr u32 B = BOUNDED ? 512 : 2048;')
 s=s.replace('''    if ((d >> shift) - cur >= B) {
      if (take)
        far.push({d, v});
      return;
    }''','''    if constexpr (!BOUNDED) {
      if ((d >> shift) - cur >= B) {
        if (take) far.push({d, v});
        return;
      }
    }''')
 a=s.index('  u64 lower_bound() {',s.index('template <bool BOUNDED> struct Queue'))
 b=s.index('\n};',a)
 s=s[:a]+'''  u64 lower_bound() {
    if (near) {
      u32 b = cur % B, w = b / 64;
      u64 bits = occupied[w] & (~u64(0) << b % 64);
      while (!bits) {
        if constexpr (BOUNDED) ++w;
        else w = (w + 1) % (B / 64);
        bits = occupied[w];
      }
      if constexpr (BOUNDED) cur = w * 64 + __builtin_ctzll(bits);
      else cur += (w * 64 + __builtin_ctzll(bits) - b) % B;
    } else {
      if constexpr (BOUNDED) return INF;
      else {
        if (far.empty()) return INF;
        cur = far.top().first >> shift;
      }
    }
    if constexpr (!BOUNDED)
      for (; !far.empty() && (far.top().first >> shift) - cur < B; far.pop())
        push(far.top().first, far.top().second);
    return cur << shift;
  }
'''+s[b:]
 s=s.replace('  Queue queue;', '  using QueueType = Queue<sizeof(L) == 2>;\n  QueueType queue;')
 s=s.replace('Queue::Bucket &bk', 'typename QueueType::Bucket &bk').replace('Queue::B', 'QueueType::B')
 Path(f'work/variants/bounded_{name}.cpp').write_text(s)
