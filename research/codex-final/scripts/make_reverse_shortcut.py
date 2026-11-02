from pathlib import Path
s=Path('work/variants/pure_sse_walk24.cpp').read_text()
s=s.replace('u32 pos, root, prev, at;', 'u32 pos, root, prev, at, back;')
s=s.replace('  void claim(u32 z) {','  bool claim(u32 z) {')
s=s.replace('''    if (seen & bit)
      return;
    if (!(__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit))
      reg.order[reg.len++] = z;''','''    if (seen & bit) return false;
    if (__atomic_fetch_or(word, bit, __ATOMIC_RELAXED) & bit) return false;
    reg.order[reg.len++] = z;
    return true;''')
s=s.replace('''    } else {
      w.w += raw.weight(which), w.prev = w.at, w.at = next;''','''    } else {
      if (w.back != NONE) {
        u32 edge = raw.adj[i + (valid & 1)], back = edge & raw.mask;
        if (raw.head(edge) != w.prev || back == raw.mask || w.back + back >= raw.mask)
          w.back = NONE;
        else w.back += back;
      }
      w.w += raw.weight(which), w.prev = w.at, w.at = next;''')
s=s.replace('''    if (next != w.root)
      claim(next);
    put(w.pos & 0xFFFFFF, next, w.w);''','''    if (next != w.root && claim(next) && w.back != NONE && !test(bypass, next)) {
      // A fresh non-bypass vertex belongs exclusively to this worker. Its
      // row has not been expanded, and other walks never read that row.
      // Replace its return arc by the verified reverse of this chain.
      auto [first, end] = row(raw, next);
      if (end - first <= 16)
        for (u32 k = first; k < end; ++k) {
          u32 edge = raw.adj[k], back = edge & raw.mask;
          if (raw.head(edge) == w.prev && back < raw.mask - w.back)
            raw.adj[k] = w.root << raw.wbits | (back + w.back);
        }
    }
    put(w.pos & 0xFFFFFF, next, w.w);''')
s=s.replace('{pos, u, u, y, raw.weight(i)}','{pos, u, u, y, test(bypass, u) ? NONE : 0, raw.weight(i)}')
Path('work/variants/reverse_shortcut.cpp').write_text(s)
# Traditional probe control isolates the rewrite from frontier policy.
q=Path('work/variants/fix_atomic.cpp').read_text();a=q.index('// ---------------------------------------------------------------- queries');b=q.index('\nint main()',a)
c=s.index('// ---------------------------------------------------------------- queries');d=s.index('\nint main()',c)
Path('work/variants/reverse_shortcut_probe.cpp').write_text(s[:c]+q[a:b]+s[d:])
