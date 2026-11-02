from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
for look in [2,4]:
 for own in [False,True]:
  x=s;old='      u32 u = bk.data[k] & mask;'
  new=f'''      ahead = bk.data[std::min(k + {look}, bk.size - 1)] & mask;
      for (u32 e = g.off[ahead]; e < g.off[ahead+1]; ++e) {{
        u32 v = g.head(g.adj[e]);
        __builtin_prefetch(other.dist.at(v));
'''+('        __builtin_prefetch(dist.at(v));\n' if own else '')+'''      }
'''+old
  assert old in x;x=x.replace(old,new)
  Path(f'work/variants/prefix_prefetch{look}_{int(own)}.cpp').write_text(x)
