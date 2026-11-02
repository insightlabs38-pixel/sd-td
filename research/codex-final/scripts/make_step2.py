from pathlib import Path
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('    auto [i, end] = row(raw, w.at);');b=s.index('    if (ahead > 1)',a)
s=s[:a]+'''    // Every active walk is at a bypass vertex, whose raw degree is <= 2.
    u32 i = 4 * w.at, e0 = raw.adj[i], e1 = raw.adj[i + 1];
    u32 h0 = e0 == NONE ? w.at : raw.head(e0);
    u32 h1 = e1 == NONE ? w.at : raw.head(e1);
    bool a = h0 != w.prev && h0 != w.at, b = h1 != w.prev && h1 != w.at;
    u32 ahead = a + b, next = a ? h0 : h1, which = i + !a;
'''+s[b:]
Path('work/variants/step_two.cpp').write_text(s)
# SSE2 classification of the two inline packed heads.
a=s.index('    u32 i = 4 * w.at,');b=s.index('    if (ahead > 1)',a)
t=s[:a]+'''    u32 i = 4 * w.at;
    __m128i edges = _mm_loadu_si128((const __m128i *)(raw.adj + i));
    __m128i heads = _mm_srl_epi32(edges, _mm_cvtsi32_si128(raw.wbits));
    __m128i skip = _mm_or_si128(_mm_cmpeq_epi32(heads, _mm_set1_epi32(w.prev)),
                               _mm_cmpeq_epi32(heads, _mm_set1_epi32(w.at)));
    skip = _mm_or_si128(skip, _mm_cmpeq_epi32(edges, _mm_set1_epi32(-1)));
    u32 valid = ~u32(_mm_movemask_ps(_mm_castsi128_ps(skip))) & 3;
    u32 ahead = (valid & 1) + (valid >> 1), which = i + !(valid & 1);
    u32 next = raw.head(raw.adj[which]);
'''+s[b:]
Path('work/variants/step_two_sse.cpp').write_text(t)
