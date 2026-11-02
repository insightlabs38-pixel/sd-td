from pathlib import Path
s=Path('work/variants/prefix12_stream_ssse3.cpp').read_text();a=s.index('__attribute__((target("ssse3"))) u32 decimal(');b=s.index('// Calls emit',a)
x='''__attribute__((target("ssse3"))) std::pair<u32,u32>
decimal(const char *a,const char *b,const char *c,const char *d,const char *file) {
  auto scalar=[](const char *p,const char *end) {
    u32 v=0;for(;p<end;++p)v=v*10+(*p-'0');return v;
  };
  if(b-a>8 || d-c>8 || b-file<8 || d-file<8) {
    u32 u=scalar(a,b);
    return {u,(a==c && b==d)?u:scalar(c,d)};
  }
  u64 u,v;
  memcpy(&u,b-8,8);memcpy(&v,d-8,8);
  u&=(~u64(0)<<(64-8*(b-a)))&0x0f0f0f0f0f0f0f0f;
  v&=(~u64(0)<<(64-8*(d-c)))&0x0f0f0f0f0f0f0f0f;
  __m128i digits=_mm_set_epi64x(v,u);
  __m128i pairs=_mm_maddubs_epi16(digits,_mm_set1_epi16(0x010a));
  __m128i quads=_mm_madd_epi16(pairs,_mm_set1_epi32(0x00010064));
  __m128i values=_mm_madd_epi16(_mm_packs_epi32(quads,_mm_setzero_si128()),_mm_set1_epi32(0x00012710));
  u64 result=_mm_cvtsi128_si64(values);
  return {u32(result),u32(result>>32)};
}

'''
s=s[:a]+x+s[b:]
s=s.replace('    u32 u = decimal(field, a, lo), v = decimal(a + 1, b, lo);\n    u32 w = decimal(b + 1, c, lo);','    auto [u,v]=decimal(field,a,a+1,b,lo);\n    u32 w=decimal(b+1,c,b+1,c,lo).first;')
assert 'u32 u = decimal(' not in s
Path('work/variants/prefix12_pair_decimal.cpp').write_text(s)
