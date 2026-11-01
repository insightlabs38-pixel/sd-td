from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
a=s.index('  struct Bucket {',s.index('struct Queue'));b=s.index('  u64 occupied',a)
s=s[:a]+'''  static constexpr u32 CHUNK = 128;
  struct Bucket { u32 head = 0, tail = 0; } bucket[B];
  struct Block { u32 data[CHUNK], size = 0, next = 0; };
  std::vector<Block *> blocks{nullptr};
  u32 free = 0;
  u32 fresh() {
    u32 i = free;
    if (i) free = blocks[i]->next;
    else { i = blocks.size(); blocks.push_back(new Block); }
    blocks[i]->size = blocks[i]->next = 0;
    return i;
  }
  void recycle(u32 i) { blocks[i]->next = free; free = i; }
'''+s[b:]
a=s.index('  void clear() {',s.index('struct Queue'));b=s.index('  // Moves cur',a)
s=s[:a]+'''  void clear() {
    for (u32 w = 0; w < B / 64; occupied[w++] = 0)
      for (u64 bits = occupied[w]; bits; bits &= bits - 1) {
        Bucket &k = bucket[w * 64 + __builtin_ctzll(bits)];
        while (k.head) {
          u32 old = k.head; k.head = blocks[old]->next; recycle(old);
        }
        k.tail = 0;
      }
    far = {}, cur = near = 0;
  }
  void push(u64 d, u32 v, bool take = true) {
    if (!take) return;
    if ((d >> shift) - cur >= B) { far.push({d, v}); return; }
    u32 b = (d >> shift) % B;
    Bucket &k = bucket[b];
    if (!k.tail) k.head = k.tail = fresh();
    if (blocks[k.tail]->size == CHUNK) {
      u32 i = fresh(); blocks[k.tail]->next = i; k.tail = i;
    }
    Block &p = *blocks[k.tail];
    p.data[p.size++] = v | u32(d & ((1u << shift) - 1)) << node_bits;
    ++near; occupied[b / 64] |= u64(1) << b % 64;
  }
'''+s[b:]
s=s.replace('    for (u32 k = 0; k < bk.size; ++k) {','    while (bk.head) {\n      u32 index = bk.head;\n      Queue::Block &part = *queue.blocks[index];\n      for (u32 k = 0; k < part.size; ++k) {')
s=s.replace('bk.data','part.data').replace('bk.size - 1','part.size - 1')
s=s.replace('    queue.near -= bk.size, bk.size = 0;','      queue.near -= part.size;\n      bk.head = part.next;\n      queue.recycle(index);\n    }\n    bk.tail = 0;')
for chunk in (32,128,512):
 Path(f'work/variants/chunks{chunk}.cpp').write_text(s.replace('CHUNK = 128','CHUNK = '+str(chunk)))
