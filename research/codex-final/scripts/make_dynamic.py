from pathlib import Path
base=Path('work/variants/fix_atomic.cpp').read_text()
base=base.replace('#include <numeric>','#include <numeric>\n#include <memory>')
a=base.index('  void grow(u32 z) {');b=base.index('\n};',a)
g=base[a:b].replace('  void grow(u32 z) {\n    u32 lo = reg.len, hi;\n    for (claim(z); lo < reg.len; lo = hi) {\n      hi = std::min(reg.len, lo + BATCH);','  void grow(u32 lo, u32 end) {\n    for (u32 hi; lo < end; lo = hi) {\n      hi = std::min(end, lo + BATCH);')
base=base[:a]+g+base[b:]
a=base.index('  std::vector<Region> regions(threads);',base.index('std::pair<Graph *, Graph *> contract'))
b=base.index('  u32 wbits = raw->wbits',a)
base=base[:a]+'''  unsigned parts = threads * FACTOR;
  std::vector<Region> regions(parts);
  std::vector<std::unique_ptr<Grower>> growers;
  std::vector<u32> done(parts), cursor(parts);
  std::vector<std::atomic<bool>> busy(parts), finished(parts);
  for (unsigned r = 0; r < parts; ++r) {
    Region &reg = regions[r];
    reg.order = alloc<u32>(n), reg.ends = alloc<u32>(n), reg.out = alloc<u32>(m);
    growers.emplace_back(new Grower{*raw, bypass, claimed, reg});
    cursor[r] = cut(n, r, parts);
    u32 end = cut(n, r+1, parts);
    while (cursor[r] < end && test(bypass, cursor[r])) ++cursor[r];
    if (cursor[r] < end) growers[r]->claim(cursor[r]++);
  }
  std::atomic<u32> next{0}, left{parts};
  parallel(threads, [&](unsigned) {
    while (left.load(std::memory_order_relaxed)) {
      unsigned r = next.fetch_add(1, std::memory_order_relaxed) % parts;
      if (busy[r].exchange(true, std::memory_order_acquire)) continue;
      if (!finished[r].load(std::memory_order_relaxed)) {
        Region &reg = regions[r];
        Grower &grower = *growers[r];
        u32 end = cut(n, r+1, parts);
        while (done[r] == reg.len && cursor[r] < end) {
          u32 z = cursor[r]++;
          if (!test(bypass, z)) grower.claim(z);
        }
        u32 last = std::min(reg.len, done[r] + QUANTUM);
        grower.grow(done[r], last), done[r] = last;
        if (done[r] == reg.len && cursor[r] == end) {
          finished[r].store(true, std::memory_order_relaxed);
          left.fetch_sub(1, std::memory_order_relaxed);
        }
      }
      busy[r].store(false, std::memory_order_release);
    }
  });
  growers.clear();
'''+base[b:]
a=base.index('  u32 wbits = raw->wbits',base.index('std::pair<Graph *, Graph *> contract'));b=base.index('// ---------------------------------------------------------------- queries',a)
s=base[a:b]
s=s.replace('base(threads + 1, 0), edges(threads + 1, 0)','base(parts + 1, 0), edges(parts + 1, 0)')
s=s.replace('for (unsigned t = 0; t < threads; ++t)', 'for (unsigned t = 0; t < parts; ++t)')
s=s.replace('base[threads]','base[parts]').replace('edges[threads]','edges[parts]')
base=base[:a]+s+base[b:]
for factor,quantum in [(2,128),(4,128),(2,512),(4,512),(4,2048)]:
 s=base.replace('FACTOR',str(factor)).replace('QUANTUM',str(quantum)+'u')
 Path(f'work/variants/dynamic{factor}_{quantum}.cpp').write_text(s)
