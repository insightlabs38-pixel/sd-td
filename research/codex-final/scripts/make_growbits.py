from pathlib import Path
s=Path('work/variants/final.cpp').read_text().replace('#include <thread>','#include <thread>\n#include <type_traits>')
s=s.replace('struct Grower {','template <unsigned W = 0> struct Grower {')
a=s.index('template <unsigned W = 0> struct Grower');b=s.index('// The reverse of a graph',a)
x=s[a:b]
x=x.replace('raw.head(raw.adj[i])','(raw.adj[i] >> (W ? W : raw.wbits))')
x=x.replace('raw.weight(which)','weight(which)').replace('raw.weight(i)','weight(i)')
x=x.replace('  void put(u32 pos, u32 z, u64 w) {\n    if (w >= raw.mask)','  u64 weight(u32 i) const {\n    u32 mask = W ? (1u << W) - 1 : raw.mask;\n    u64 w = raw.adj[i] & mask;\n    return w == mask ? raw.weight(i) : w;\n  }\n  void put(u32 pos, u32 z, u64 w) {\n    u32 mask = W ? (1u << W) - 1 : raw.mask;\n    if (w >= mask)')
x=x.replace('z << raw.wbits | std::min<u64>(w, raw.mask)','z << (W ? W : raw.wbits) | std::min<u64>(w, mask)')
s=s[:a]+x+s[b:]
old='''    Grower grower{*raw, bypass, claimed, Bits(claimed.size()), reg};
    for (u32 x = cut(n, t, threads); x < cut(n, t + 1, threads); ++x)
      if (!test(bypass, x))
        grower.grow(x);'''
new='''    auto grow = [&](auto width) {
      Grower<decltype(width)::value> grower{*raw, bypass, claimed, Bits(claimed.size()), reg};
      for (u32 x = cut(n, t, threads); x < cut(n, t + 1, threads); ++x)
        if (!test(bypass, x)) grower.grow(x);
    };
    if (raw->wbits == 11) grow(std::integral_constant<unsigned, 11>{});
    else grow(std::integral_constant<unsigned, 0>{});'''
assert old in s;s=s.replace(old,new)
Path('work/variants/growbits.cpp').write_text(s)
