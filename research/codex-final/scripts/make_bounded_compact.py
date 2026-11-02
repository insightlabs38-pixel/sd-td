from pathlib import Path
for name in ['fix_atomic','pure_sse','pure_sse_byte_cap6','phase_g6_q6']:
 s=Path(f'work/variants/{name}.cpp').read_text()
 s=s.replace('struct Queue {\n  static constexpr u32 B = 2048;', 'template <bool BOUNDED> struct Queue {\n  static constexpr u32 B = BOUNDED ? 512 : 2048;')
 s=s.replace('if ((d >> shift) - cur >= B)', 'if (!BOUNDED && (d >> shift) - cur >= B)')
 s=s.replace('bits = occupied[w = (w + 1) % (B / 64)];', 'bits = occupied[w = BOUNDED ? w + 1 : (w + 1) % (B / 64)];')
 s=s.replace('cur += (w * 64 + __builtin_ctzll(bits) - b) % B;', 'cur = BOUNDED ? w * 64 + __builtin_ctzll(bits) : cur + (w * 64 + __builtin_ctzll(bits) - b) % B;')
 s=s.replace('} else if (!far.empty()) {', '} else if (!BOUNDED && !far.empty()) {')
 s=s.replace('for (; !far.empty() && (far.top().first >> shift) - cur < B;', 'for (; !BOUNDED && !far.empty() && (far.top().first >> shift) - cur < B;')
 s=s.replace('  Queue queue;', '  using QueueType = Queue<sizeof(L) == 2>;\n  QueueType queue;')
 s=s.replace('Queue::Bucket &bk', 'typename QueueType::Bucket &bk').replace('Queue::B', 'QueueType::B')
 Path(f'work/variants/compact_bounded_{name}.cpp').write_text(s)
