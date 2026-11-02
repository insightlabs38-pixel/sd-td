from pathlib import Path
s=Path('work/make_dynamic.py').read_text()
s=s.replace("base=base.replace('#include <numeric>','#include <numeric>\\n#include <memory>')", "base=base.replace('#include <numeric>','#include <numeric>\\n#include <memory>\\n#include <mutex>\\n#include <condition_variable>\\n#include <deque>')")
s=s.replace('  std::vector<std::atomic<bool>> busy(parts), finished(parts);','  std::deque<u32> jobs;\n  std::mutex mutex;\n  std::condition_variable ready;\n  unsigned active = 0;\n  bool stopped = false;')
s=s.replace('    cursor[r] = cut(n, r, parts);','    jobs.push_back(r);\n    cursor[r] = cut(n, r, parts);')
a=s.index('  std::atomic<u32> next{0}, left{parts};');b=s.index('  growers.clear();',a)
s=s[:a]+'''  parallel(threads, [&](unsigned) {
    for (;;) {
      unsigned r;
      {
        std::unique_lock<std::mutex> lock(mutex);
        ready.wait(lock, [&] { return stopped || !jobs.empty(); });
        if (stopped) return;
        r = jobs.front(), jobs.pop_front(), ++active;
      }
      Region &reg = regions[r];
      Grower &grower = *growers[r];
      u32 end = cut(n, r+1, parts);
      while (done[r] == reg.len && cursor[r] < end) {
        u32 z = cursor[r]++;
        if (!test(bypass, z)) grower.claim(z);
      }
      u32 last = std::min(reg.len, done[r] + QUANTUM);
      grower.grow(done[r], last), done[r] = last;
      {
        std::lock_guard<std::mutex> lock(mutex);
        if (done[r] < reg.len || cursor[r] < end) jobs.push_back(r);
        --active;
        stopped = jobs.empty() && active == 0;
        if (stopped) ready.notify_all();
        else ready.notify_one();
      }
    }
  });
'''+s[b:]
s=s.replace("[(2,128),(4,128),(2,512),(4,512),(4,2048)]", "[(1,512),(2,512),(4,512),(4,2048)]")
s=s.replace("dynamic{factor}_{quantum}","dynamic_cv{factor}_{quantum}")
exec(compile(s,'dynamic_cv_generation','exec'))
