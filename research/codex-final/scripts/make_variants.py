from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
v=Path('work/variants');v.mkdir(exist_ok=True)
# Single exact 64-bit engine removes restart policy and overflow tracking.
x=s.replace('template <class L> struct Labels {','struct Labels {\n  using L = u64;').replace('template <class L> struct Side {','struct Side {\n  using L = u64;').replace('template <class L> struct Worker {','struct Worker {\n  using L = u64;')
x=x.replace('Labels<L>','Labels').replace('Side<L>','Side').replace('  bool wide = false;\n','').replace('    bool overflow = false;\n','').replace('        overflow |= nd >= Labels::NONE;\n','').replace('    wide |= overflow;\n','').replace('    fwd.wide = bwd.wide = false;\n','')
a=x.index('    Worker<u32> narrow');b=x.index('    for (size_t k;',a)
x=x[:a]+'    Worker worker{Side(*fwd), Side(*rev)};\n'+x[b:]
a=x.index('      u64 d = narrow.solve');b=x.index('      answers[i]',a)
x=x[:a]+'      u64 d = worker.solve(s, t);\n'+x[b:]
v.joinpath('wide.cpp').write_text(x)
# Coalesced in-bucket pending labels. Low bit marks pending; other bits distance.
x=s.replace('std::min<u64>(INF, L(-1))','std::min<u64>(INF, L(-1) >> 1)')
x=x.replace('std::fill(blank, blank + 128, NONE)','std::fill(blank, blank + 128, L(-1))').replace('128, NONE) - 128','128, L(-1)) - 128').replace('return *at(v);','return *at(v) >> 1;')
x=x.replace('*dist.slot(s) = 0','*dist.slot(s) = 1')
x=x.replace('v | u32(d & ((1u << shift) - 1)) << node_bits','v')
x=x.replace('      u64 d = queue.cur << queue.shift | bk.data[k] >> queue.node_bits;\n      if (dist.get(u) != d)\n        continue;','      L *label = dist.at(u);\n      u64 d = *label >> 1;\n      if (!(*label & 1) || (d >> queue.shift) != queue.cur)\n        continue;\n      *label &= ~L(1);')
x=x.replace('u64 nd = d + g.weight(i), old = *x;\n        *x = L(std::min(nd, old));','u64 nd = d + g.weight(i), old = *x >> 1;\n        bool insert = nd < old && (!(*x & 1) || (nd >> queue.shift) != (old >> queue.shift));\n        if (nd < old)\n          *x = L(nd << 1) | 1;')
x=x.replace('queue.push(nd, v, nd < old);','queue.push(nd, v, insert);')
x=x.replace('u32 mask = (1u << queue.node_bits) - 1, settled = 0;', 'u32 mask = ~u32(0), settled = 0;')
for width in (5,7,9,11):
 y=x.replace('shift(std::min(7u, 32 - id_bits(n)))','shift('+str(width)+')')
 v.joinpath('coalesce'+str(width)+'.cpp').write_text(y)
