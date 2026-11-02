from pathlib import Path
s=Path('work/variants/prefix_bins.cpp').read_text()
for chunk in [8,32,128]:
 x=s.replace('u32 *data = nullptr, size = 0, cap = 0;','u32 *data = nullptr, size = 0, cap = 0, head = 0;')
 x=x.replace('bucket[w * 64 + __builtin_ctzll(bits)].size = 0;','bucket[w * 64 + __builtin_ctzll(bits)].head = bucket[w * 64 + __builtin_ctzll(bits)].size = 0;')
 old='for (u32 k = 0; k < bk.size; ++k) {'
 new=f'u32 before = bk.head, k = before;\n    for (; k < bk.size && k - before < {chunk}; ++k) {{'
 assert old in x;x=x.replace(old,new)
 old='queue.near -= bk.size, bk.size = 0;\n    queue.occupied[queue.cur % QueueType::B / 64] &= ~(u64(1) << queue.cur % 64);'
 new='''queue.near -= k - before;
    bk.head = k;
    if (k == bk.size) {
      bk.head = bk.size = 0;
      queue.occupied[queue.cur % QueueType::B / 64] &= ~(u64(1) << queue.cur % 64);
    }'''
 assert old in x;x=x.replace(old,new)
 Path(f'work/variants/prefix_chunk{chunk}.cpp').write_text(x)
