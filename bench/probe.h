// Phase timing + cgroup memory sampler, active only when compiled with -DPROBE.
#pragma once
#ifdef PROBE
#include <atomic>
#include <chrono>
#include <cstdio>
#include <thread>
#include <unistd.h>
namespace probe {
inline std::atomic<int> phase{0};
inline const char *names[32];
inline double t0, at[32];
inline long peak[32], cur[32];
inline FILE *cgf;
inline std::atomic<bool> stop{false};
inline double now() {
  return std::chrono::duration<double>(std::chrono::steady_clock::now().time_since_epoch()).count();
}
inline long usage(FILE *f) {
  long v = 0; rewind(f); if (fscanf(f, "%ld", &v) != 1) v = 0; fflush(f); return v;
}
inline std::thread *sampler;
inline void start() {
  t0 = now(); names[0] = "start";
  const char *path = getenv("SD_CG");
  if (!path) return;
  cgf = fopen(path, "r"); setvbuf(cgf, nullptr, _IONBF, 0);
  sampler = new std::thread([path] {
    FILE *f = fopen(path, "r");
    if (!f) return;
    while (!stop) {
      setvbuf(f, nullptr, _IONBF, 0);
      long v = usage(f); int p = phase;
      if (v > peak[p]) peak[p] = v;
      usleep(200);
    }
  });
}
inline void mark(int p, const char *name) { at[phase] = now(); if (cgf) cur[p] = usage(cgf); names[p] = name; phase = p; }
inline void finish() {
  at[phase] = now(); stop = true; if (sampler) sampler->join();
  double prev = t0;
  for (int p = 0; p <= phase; ++p) {
    fprintf(stderr, "%-10s %7.2f ms  start %6.2f peak %6.2f MB\n", names[p], (at[p] - prev) * 1e3, cur[p] / 1e6, peak[p] / 1e6);
    prev = at[p];
  }
  fprintf(stderr, "total      %7.2f ms\n", (at[phase] - t0) * 1e3);
}
}
#define PSTART() probe::start()
#define PMARK(p, n) probe::mark(p, n)
#define PFINISH() probe::finish()
#else
#define PSTART()
#define PMARK(p, n)
#define PFINISH()
#endif
