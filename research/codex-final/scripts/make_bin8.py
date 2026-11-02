from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
s=s.replace('struct __attribute__((packed)) Entry {','struct Entry {').replace('  uint16_t w;','  u32 w;')
s=s.replace('  std::vector<std::pair<u32, u64>> heavy; // pool index -> weight\n','')
s=s.replace('    if (w >= 0xFFFF)\n      heavy.push_back({fill[b], w});\n','')
s=s.replace('pool[fill[b]++] = {key, uint16_t(std::min<u64>(w, 0xFFFF))};','pool[fill[b]++] = {key, u32(w)};')
s=s.replace('    std::sort(bin.heavy.begin(), bin.heavy.end());\n','')
s=s.replace('''          if (w == 0xFFFF)
            w = std::lower_bound(bin.heavy.begin(), bin.heavy.end(),
                                 std::pair(i, u64(0)))
                    ->second;
''','')
Path('work/variants/bin8_simple.cpp').write_text(s)
