from pathlib import Path
script=Path('work/profile.py').read_text()
for name in ['pr17','final']:
 local=script if name=='pr17' else script.replace("'work/controls/pr17/d_traverse.cpp'","'work/variants/final.cpp'")
 local=local.replace("'work/variants/profile.cpp'",repr('work/variants/phase_'+name+'.cpp'))
 exec(compile(local,'phase_generation','exec'))
 p=Path('work/variants/phase_'+name+'.cpp');s=p.read_text()
 s='\n'.join(line for line in s.splitlines() if 'thread_local uint64_t pops=' not in line and '"query pops=' not in line)+'\n'
 s=s.replace('      ++pops;\n','').replace('if (dist.get(u) != d) { ++stale; continue; }','if (dist.get(u) != d) continue;').replace('        ++arcs;changes+=nd<old;\n','')
 old=' fprintf(stderr,"%s wall_ms=%.3f cpu_ms=%.3f rss_kib=%ld\\n",phase,std::chrono::duration<double,std::milli>(now-previous).count(),(cpu-cpu_previous)*1000,r.ru_maxrss);'
 new=''' unsigned long current=0, peak=0;
 FILE *f=fopen("/sys/fs/cgroup/memory.current","r");
 if(f) { fscanf(f,"%lu",&current); fclose(f); }
 f=fopen("/sys/fs/cgroup/memory.peak","r");
 if(f) { fscanf(f,"%lu",&peak); fclose(f); }
 fprintf(stderr,"%s wall_ms=%.3f cpu_ms=%.3f rss_kib=%ld cg_current=%lu cg_peak=%lu\\n",phase,std::chrono::duration<double,std::milli>(now-previous).count(),(cpu-cpu_previous)*1000,r.ru_maxrss,current,peak);'''
 assert old in s;s=s.replace(old,new);p.write_text(s)
