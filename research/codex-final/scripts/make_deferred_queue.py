from pathlib import Path
for base_name in ['fix_atomic','pure_sse']:
 base=Path(f'work/variants/{base_name}.cpp').read_text()
 for mode in ['near','bits']:
  s=base.replace('  void push(u64 d, u32 v, bool take = true) {','  template <bool DEFER = false> bool push(u64 d, u32 v, bool take = true, u64 *bits = nullptr) {')
  s=s.replace('''      return;
    }
    u32 b = (d >> shift) % B;''','''      return false;
    }
    u32 b = (d >> shift) % B;''')
  s=s.replace('    k.size += take, near += take;', '    k.size += take;\n    if (!DEFER) near += take;')
  old='    occupied[b / 64] |= u64(take) << b % 64;\n  }'
  if mode=='bits':
   new='''    if (DEFER && b / 64 == cur % B / 64) *bits |= u64(take) << b % 64;
    else occupied[b / 64] |= u64(take) << b % 64;
    return take;
  }'''
  else:new='    occupied[b / 64] |= u64(take) << b % 64;\n    return take;\n  }'
  assert old in s;s=s.replace(old,new)
  s=s.replace('    Queue::Bucket &bk = queue.bucket[queue.cur % Queue::B];','    Queue::Bucket &bk = queue.bucket[queue.cur % Queue::B];\n    u64 added = 0, bits = 0;')
  s=s.replace('        queue.push(nd, v, nd < old);','        added += queue.push<true>(nd, v, nd < old, &bits);')
  s=s.replace('    queue.near -= bk.size, bk.size = 0;', '    queue.near += added;\n    queue.near -= bk.size, bk.size = 0;')
  if mode=='bits':
   s=s.replace('    queue.near += added;', '    queue.occupied[queue.cur % Queue::B / 64] |= bits;\n    queue.near += added;')
  Path(f'work/variants/deferred_{base_name}_{mode}.cpp').write_text(s)
