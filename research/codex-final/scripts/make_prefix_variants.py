from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
for shift in [9,10]:
 q=1<<(shift-3); group=1<<(15-shift)
 x=s.replace('GROUP = 16, bits = 21, shift = 11',f'GROUP = {group}, bits = 21, shift = {shift}')
 x=x.replace('(m / threads / ((n >> 11) + 1) / 256 + 1) * 256',f'(m / threads / ((n >> {shift}) + 1) / {q} + 1) * {q}')
 Path(f'work/variants/prefix_shift{shift}.cpp').write_text(x)
x=s.replace('GROUP = 16','GROUP = 32').replace('(m / threads / ((n >> 11) + 1) / 256 + 1) * 256','(size_t(m) * 11 / 10 / threads / ((n >> 11) + 1) / 128 + 1) * 128')
Path('work/variants/prefix_spare.cpp').write_text(x)
x=s.replace('struct __attribute__((packed)) Entry','struct Entry').replace('  uint16_t w;','  u32 w;')
Path('work/variants/prefix_eight.cpp').write_text(x)
# Packed directory offsets: zero selects the shared blank page.
a=s.index('template <class L> struct Labels {'); b=s.index('// One direction with',a)
labels=s[a:b]
x=labels.replace('std::vector<L *> dir;','std::vector<u32> dir;').replace('L *store, blank[128];','L *store;').replace('dir(n / 128 + 1, blank), store(alloc<L>(n + 128))','dir(n / 128 + 1), store(alloc<L>(n + 256))').replace('std::fill(blank, blank + 128, NONE);','std::fill(store, store + 128, NONE);').replace('return dir[v / 128] + v % 128;','return store + dir[v / 128] + v % 128;').replace('dir[v / 128] == blank','dir[v / 128] == 0').replace('dir[v / 128] = std::fill_n(store + used.size() * 128, 128, NONE) - 128;','dir[v / 128] = (used.size() + 1) * 128;\n      std::fill_n(store + dir[v / 128], 128, NONE);').replace('dir[page] = blank;','dir[page] = 0;')
Path('work/variants/prefix_offsets.cpp').write_text(s[:a]+x+s[b:])
for p in [32,64]:
 x=Path('work/variants/prefix_pair.cpp').read_text();a=x.index('template <class L> struct Labels {');b=x.index('// One direction with',a);x=x[:a]+x[a:b].replace('128',str(p))+x[b:];Path(f'work/variants/prefix_pair{p}.cpp').write_text(x)
