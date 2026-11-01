#!/usr/bin/env python3
"""Instrument independent full-system architectures without editing their sources."""
from pathlib import Path
import subprocess

files = {
  "base": ("track-d/d_traverse.cpp", ""),
  "lazy": ("/tmp/d-lazy-shortcuts.cpp", "-DSD_LAZY_DEG=3 -DSD_LAZY_DEPTH=1"),
  "forward": ("/tmp/d-forward-only.cpp", ""),
  "partial": ("/tmp/d-partial-ch.cpp", "-DSD_OVERLAY_DEG=3 -DSD_OVERLAY_BUDGET=0"),
  "partial4": ("/tmp/d-partial-ch.cpp", "-DSD_OVERLAY_DEG=3 -DSD_OVERLAY_BUDGET=4"),
}
for name, (path, flags) in files.items():
    s = Path(path).read_text()
    s = s.replace("#include <algorithm>", "#include <algorithm>\n#include <chrono>\n#include <sys/resource.h>", 1)
    s = s.replace("int main() {",
       "int main() {\n  auto clk=[](){ return std::chrono::steady_clock::now(); };\n"
       "  auto ms=[](auto a, auto b){ return std::chrono::duration<double,std::milli>(b-a).count(); };\n"
       "  const auto p0=clk();", 1)
    needle = '  Graph g = read_graph(data + "/graph.txt", queries, build_threads);'
    assert needle in s
    s = s.replace(needle, needle+"\n  const auto p1=clk();", 1)
    if "  add_reverse(g, build_threads);" in s:
        needle = "  add_reverse(g, build_threads);"
        s = s.replace(needle, needle + "\n  const auto p2=clk();", 1)
    else:
        s = s.replace("  const auto p1=clk();", "  const auto p1=clk();\n  const auto p2=clk();", 1)
    if "  partial_hierarchy(g, queries, build_threads);" in s:
        needle = "  partial_hierarchy(g, queries, build_threads);"
        s = s.replace(needle, needle+"\n  const auto p3=clk();", 1)
    else:
        s = s.replace("  const auto p2=clk();", "  const auto p2=clk();\n  const auto p3=clk();", 1)
    s = s.replace("  std::string text;", "  const auto p4=clk();\n  std::string text;", 1)
    needle = "  std::exit(0);"
    assert needle in s
    diag = ("  const auto p5=clk();\n"
            "  struct rusage usage{}; getrusage(RUSAGE_SELF,&usage);\n"
            f'  fprintf(stderr,"D_PHASE_ARCH mode={name} graph_ms=%.3f transpose_ms=%.3f overlay_ms=%.3f query_ms=%.3f output_ms=%.3f total_ms=%.3f rss_kib=%ld\\n",'
            "ms(p0,p1),ms(p1,p2),ms(p2,p3),ms(p3,p4),ms(p4,p5),ms(p0,p5),usage.ru_maxrss);\n"
            "  std::exit(0);")
    s = s.replace(needle, diag, 1)
    dst = Path(f"/tmp/d-phase-{name}.cpp")
    dst.write_text(s)
    cmd = ["g++","-O3","-std=c++17","-pthread","-flto","-static","-s"] + flags.split() + ["-o",f"/tmp/d-phase-{name}",str(dst)]
    print("COMPILING",name,flush=True)
    subprocess.run(cmd,check=True)
