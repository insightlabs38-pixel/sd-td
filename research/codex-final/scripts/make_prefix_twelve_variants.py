from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text()
a=s.index('template <class L> struct Labels {');b=s.index('// One direction with',a)
for p in [32,64,256]:
 x=s[:a]+s[a:b].replace('128',str(p))+s[b:];Path(f'work/variants/prefix12_page{p}.cpp').write_text(x)
for n in ['prefix_coalesce16','prefix_coalesce_high','other_prefix_bins','prefix_trim']:
 x=Path('work/variants/'+n+'.cpp').read_text().replace('std::min(threads, 6u)','threads');Path('work/variants/'+n+'12.cpp').write_text(x)
