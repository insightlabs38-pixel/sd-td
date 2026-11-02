from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
s=s.replace('k.data[k.size] = v | u32(d & ((1u << shift) - 1)) << node_bits;','k.data[k.size] = v;')
s=s.replace('static constexpr L NONE = std::min<u64>(INF, L(-1));','static constexpr L NONE = std::min<u64>(INF, L(-1) >> 1);')
s=s.replace('std::fill(blank, blank + 128, NONE);','std::fill(blank, blank + 128, L(-1));').replace('std::fill_n(store + used.size() * 128, 128, NONE)','std::fill_n(store + used.size() * 128, 128, L(-1))')
s=s.replace('u64 get(u32 v) const { return *at(v); }','u64 get(u32 v) const { return *at(v) >> 1; }').replace('*dist.slot(s) = 0','*dist.slot(s) = 1')
s=s.replace('u32 mask = (1u << queue.node_bits) - 1;','u32 mask = ~0u;')
s=s.replace('''      u64 d = queue.cur << queue.shift | bk.data[k] >> queue.node_bits;
      if (dist.get(u) != d)
        continue;''','''      L *label=dist.at(u);
      u64 d=*label>>1;
      if(!(*label&1) || (d>>queue.shift)!=queue.cur) continue;
      *label&=~L(1);''')
s=s.replace('''        u64 nd = d + (w == mask ? g.weight(i) : w), old = *x;
        *x = L(std::min(nd, old));
        queue.push(nd, v, nd < old);''','''        u64 nd = d + (w == mask ? g.weight(i) : w), state=*x,old=state>>1;
        bool insert=(nd<old)&((!(state&1))|((nd>>queue.shift)!=(old>>queue.shift)));
        *x=nd<old ? L(nd<<1)|1 : state;
        queue.push(nd, v, insert);''')
assert 'u64 d=*label>>1;' in s and 'bool insert=' in s
Path('work/variants/prefix_coalesce16.cpp').write_text(s)
x=s.replace('*x=nd<old ? L(nd<<1)|1 : state;','if(nd<old) *x=L(nd<<1)|1;')
Path('work/variants/prefix_coalesce16branch.cpp').write_text(x)
