from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text()
for count in [64,128,256]:
 x=s.replace('B = BOUNDED ? 512 : 2048','B = BOUNDED ? 512 : '+str(count));Path(f'work/variants/prefix12_wide{count}.cpp').write_text(x)
# A zero out-degree source or zero in-degree target proves unreachability.
condition='d >= Labels<uint16_t>::NONE && fwd->off[s]!=fwd->off[s+1] && rev->off[t]!=rev->off[t+1]'
for base,name in [(s,'prefix12_noemptywide'),(Path('work/variants/prefix12_wide64.cpp').read_text(),'prefix12_wide64_guard')]:
 x=base.replace('if (d >= Labels<uint16_t>::NONE)',f'if ({condition})');Path('work/variants/'+name+'.cpp').write_text(x)
x=s.replace('parallel(std::min<size_t>(threads, queries + 1)','parallel(std::min<size_t>(std::min(threads,10u), queries + 1)');assert x!=s;Path('work/variants/prefix12_query10.cpp').write_text(x)
