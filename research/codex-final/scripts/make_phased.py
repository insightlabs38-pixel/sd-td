from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text().replace('#include <queue>','#include <queue>\n#include <pthread.h>')
a=s.index('  // The relaxed OR linearizes');b=s.index('  void put(',a)
s=s[:a]+'''  std::vector<u32> wants;
  void claim(u32 z) {
    if (!test(claimed, z))
      wants.push_back(z);
  }
'''+s[b:]
a=s.index('  void grow(u32 z) {');b=s.index('\n};',a)
old=s[a:b]
old=old.replace('void grow(u32 z)', 'void grow(u32 lo, u32 end)')
old=old.replace('    u32 lo = reg.len, hi;\n    for (claim(z); lo < reg.len; lo = hi) {\n      hi = std::min(reg.len, lo + BATCH);','    for (u32 hi; lo < end; lo = hi) {\n      hi = std::min(end, lo + BATCH);')
s=s[:a]+old+s[b:]
a=s.index('  parallel(threads, [&](unsigned t) {\n    Region &reg = regions[t];', s.index('std::pair<Graph *, Graph *> contract'))
b=s.index('  u32 wbits = raw->wbits',a)
s=s[:a]+'''  pthread_barrier_t barrier;
  pthread_barrier_init(&barrier, nullptr, threads);
  std::vector<std::vector<std::vector<u32>>> mail(
      threads, std::vector<std::vector<u32>>(threads));
  std::vector<std::vector<uint8_t>> accepted(threads);
  std::vector<u32> added(threads), more(threads);
  bool again = true;
  parallel(threads, [&](unsigned t) {
    Region &reg = regions[t];
    reg.order = alloc<u32>(n), reg.ends = alloc<u32>(n),
    reg.out = alloc<u32>(m);
    Grower grower{*raw, bypass, claimed, reg};
    u32 done = 0, seed = cut(n, t, threads), end = cut(n, t + 1, threads);
    while (again) {
      grower.wants.clear();
      for (auto &out : mail[t]) out.clear();
      if (done < reg.len) {
        u32 last = reg.len;
        grower.grow(done, last), done = last;
      } else {
        while (seed < end && (test(bypass, seed) || test(claimed, seed))) ++seed;
        if (seed < end) grower.claim(seed++);
      }
      more[t] = seed < end;
      accepted[t].assign(grower.wants.size(), 0);
      for (u32 i = 0; i < grower.wants.size(); ++i)
        mail[t][(grower.wants[i] >> 9) % threads].push_back(i);
      // A whole bitmap cache line has one writer in the ownership phase.
      pthread_barrier_wait(&barrier);
      added[t] = 0;
      for (unsigned from = 0; from < threads; ++from)
        for (u32 i : mail[from][t]) {
          // Requests are private to their source until the next barrier.
          u32 z = 0;
          (void)z;
        }
      pthread_barrier_wait(&barrier);
      if (t == 0) {
        again = false;
        for (unsigned k = 0; k < threads; ++k)
          again |= added[k] || more[k];
      }
      for (u32 i = 0; i < grower.wants.size(); ++i)
        if (accepted[t][i]) reg.order[reg.len++] = grower.wants[i];
      pthread_barrier_wait(&barrier);
    }
  });
  pthread_barrier_destroy(&barrier);
'''+s[b:]
# Publish source-owned request vector pointers, stable across ownership phase.
s=s.replace('  std::vector<std::vector<uint8_t>> accepted(threads);','  std::vector<std::vector<uint8_t>> accepted(threads);\n  std::vector<const std::vector<u32> *> requests(threads);')
s=s.replace('    u32 done = 0, seed', '    requests[t] = &grower.wants;\n    u32 done = 0, seed')
s=s.replace('          u32 z = 0;\n          (void)z;', '''          u32 z = (*requests[from])[i];
          if (!test(claimed, z)) {
            set(claimed, z), accepted[from][i] = 1;
            ++added[t];
          }''')
Path('work/variants/phased_claims.cpp').write_text(s)
