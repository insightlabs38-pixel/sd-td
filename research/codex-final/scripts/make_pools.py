from pathlib import Path
base=Path('work/variants/pure_sse.cpp').read_text()
a=base.index('template <class F> void parallel');b=base.index('// ---------------------------------------------------------------- parsing',a)
s=base[:a]+'''struct Team {
  unsigned count;
  pthread_barrier_t gate;
  void *task;
  void (*run)(void *, unsigned);
  Team(unsigned n) {
    pthread_barrier_init(&gate, nullptr, n);
    for (unsigned t = 1; t < n; ++t)
      std::thread([this, t] {
        for (;;) {
          pthread_barrier_wait(&gate);
          if (t < count) run(task, t);
          pthread_barrier_wait(&gate);
        }
      }).detach();
  }
};
Team *team = nullptr;
template <class F> void parallel(unsigned threads, F f) {
  if (!team) team = new Team(threads);
  team->count = threads, team->task = &f;
  team->run = [](void *p, unsigned t) { (*static_cast<F *>(p))(t); };
  pthread_barrier_wait(&team->gate);
  f(0);
  pthread_barrier_wait(&team->gate);
}

'''+base[b:]
s=s.replace('#include <queue>','#include <queue>\n#include <pthread.h>')
Path('work/variants/pthread_pool.cpp').write_text(s)
s=base[:a]+'''template <class F> void parallel(unsigned threads, F f) {
#pragma omp parallel num_threads(threads)
  f(omp_get_thread_num());
}

'''+base[b:]
s=s.replace('#include <queue>','#include <queue>\n#include <omp.h>')
s=s.replace('  size_t qsize, gsize;','  omp_set_dynamic(0);\n  size_t qsize, gsize;')
Path('work/variants/openmp_pool.cpp').write_text(s)
