from pathlib import Path
s=Path('work/variants/prefix_twelve.cpp').read_text()
p=Path('work/stream-qualify/track-d/d_traverse.cpp').read_text();a=p.index('template <class Emit>');b=p.index('u32 scan(',a)
a0=s.index('template <class Emit>');b0=s.index('u32 scan(',a0)
stream=s[:a0]+p[a:b]+s[b0:]
Path('work/variants/prefix12_stream.cpp').write_text(stream)
for base,name in [(s,'prefix12'),(stream,'prefix12_stream')]:
 for isa in ['sse2','ssse3']:
  x=base
  a=x.index('  x = x * 10 + (x >> 8);');b=x.index('\n}',a)
  c='''  __m128i z=_mm_setzero_si128(), digits=_mm_cvtsi64_si128(x);
'''
  if isa=='sse2':
   c+='''  __m128i pairs=_mm_madd_epi16(_mm_unpacklo_epi8(digits,z),_mm_set1_epi32(0x0001000a));
  __m128i quads=_mm_madd_epi16(_mm_packs_epi32(pairs,z),_mm_set1_epi32(0x00010064));
'''
  else:
   c+='''  __m128i pairs=_mm_maddubs_epi16(digits,_mm_set1_epi16(0x010a));
  __m128i quads=_mm_madd_epi16(pairs,_mm_set1_epi32(0x00010064));
'''
  c+='''  return u32(_mm_cvtsi128_si32(quads))*10000+u32(_mm_cvtsi128_si32(_mm_srli_si128(quads,4)));'''
  x=x[:a]+c+x[b:]
  if isa=='ssse3':
   x=x.replace('#include <emmintrin.h>','#include <emmintrin.h>\n#include <tmmintrin.h>')
   x=x.replace('u32 decimal(', '__attribute__((target("ssse3"))) u32 decimal(')
   x=x.replace('void parse(', '__attribute__((target("ssse3"))) void parse(')
   x=x.replace('auto next = [&] {','auto next = [&]() __attribute__((target("ssse3"))) {')
  Path(f'work/variants/{name}_{isa}.cpp').write_text(x)
