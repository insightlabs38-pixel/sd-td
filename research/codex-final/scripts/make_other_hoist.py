from pathlib import Path
for name in ['prefix_bins','prefix_coalesce_high']:
 s=Path('work/variants/'+name+'.cpp').read_text();assert '        L *x = dist.slot(v);' in s
 s=s.replace('        L *x = dist.slot(v);','        u64 back=other.dist.get(v);\n        L *x = dist.slot(v);').replace('nd + other.dist.get(v)','nd + back')
 Path('work/variants/other_'+name+'.cpp').write_text(s)
