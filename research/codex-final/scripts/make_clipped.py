from pathlib import Path
for name in ['pr17','fixed_weight','u16128','u16_fixed128']:
 s=Path('work/controls/pr17/d_traverse.cpp').read_text() if name=='pr17' else Path('work/variants/'+name+'.cpp').read_text()
 ty='uint16_t' if name.startswith('u16') else 'u32'
 for line in ['  bool wide = false;\n','    bool overflow = false;\n',f'        overflow |= nd >= Labels<L>::NONE;\n','    wide |= overflow;\n','    fwd.wide = bwd.wide = false;\n']:
  assert line in s;s=s.replace(line,'')
 old=f'if (narrow.fwd.wide || narrow.bwd.wide ||\n          (d >= Labels<{ty}>::NONE && d < INF))'
 assert old in s;s=s.replace(old,f'if (d >= Labels<{ty}>::NONE)')
 Path('work/variants/'+name+'_clipped.cpp').write_text(s)
