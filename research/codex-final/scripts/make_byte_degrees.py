from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('u32 *order, *ends, *out, len = 0, edges = 0;','u32 *order, *out, len = 0, edges = 0;\n  uint8_t *ends;')
s=s.replace('''      for (u32 h = lo; h < hi; ++h)
        expand(reg.order[h], walking), reg.ends[h] = reg.edges;''','''      for (u32 h = lo; h < hi; ++h) {
        u32 before = reg.edges;
        expand(reg.order[h], walking);
        u32 degree = reg.edges - before;
        reg.ends[h] = std::min(degree, 255u);
        if (degree >= 255) reg.esc.push_back({~size_t(0) - h, degree});
      }''')
s=s.replace('reg.ends = alloc<u32>(n)', 'reg.ends = alloc<uint8_t>(n)')
s=s.replace('u32 pos = lo ? reg.ends[lo - 1] : 0, shift = edges[t];','''u32 pos = std::accumulate(reg.ends, reg.ends + lo, 0u), shift = edges[t];
      for (auto it = std::lower_bound(reg.esc.begin(), reg.esc.end(), std::pair(~size_t(0) - reg.len, 0ul)); it != reg.esc.end(); ++it)
        if (~it->first < lo) pos += it->second - 255;''')
s=s.replace('''        for (; pos < reg.ends[i]; ++pos) {''','''        u32 degree = reg.ends[i];
        if (degree == 255)
          degree = std::lower_bound(reg.esc.begin(), reg.esc.end(), std::pair(~size_t(0) - i, 0ul))->second;
        for (u32 end = pos + degree; pos < end; ++pos) {''')
Path('work/variants/byte_degrees.cpp').write_text(s)
# Independent phase combination: parser + byte degrees + allocator trim + raw-map shrink.
parser=Path('work/variants/stream_parser64.cpp').read_text()
a=s.index('// Bit i is set when');b=s.index('// Maps a file read-only',a)
c=parser.index('// Bit i is set when');d=parser.index('// Maps a file read-only',c)
s=s[:a]+parser[c:d]+s[b:]
s=s.replace('#include <numeric>','#include <numeric>\n#include <malloc.h>')
s=s.replace('  auto [fwd, rev] = contract(raw, bypass, threads, ends);','  malloc_trim(0);\n  auto [fwd, rev] = contract(raw, bypass, threads, ends);')
pos=s.index('  // Raw id -> new id.')
s=s[:pos]+'''  if (mremap(where, (size_t(4) * n + m) * 4 + 64,
             (size_t(n) + total + edges[threads] + 1) * 4 + 64, 0) == MAP_FAILED) exit(2);
'''+s[pos:]
Path('work/variants/byte_stream.cpp').write_text(s)
q=Path('work/variants/queue_stash.cpp').read_text()
a=s.index('struct Queue {');b=s.index('// Labels in pages',a)
c=q.index('struct Queue {');d=q.index('// Labels in pages',c)
s=s[:a]+q[c:d]+s[b:]
s=s.replace('    queue.near -= bk.size, bk.size = 0;', '    queue.near -= bk.size;\n    queue.recycle(bk);')
Path('work/variants/byte_stream_stash.cpp').write_text(s)
