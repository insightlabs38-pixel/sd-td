from pathlib import Path
import re
s=Path('work/variants/fix_atomic.cpp').read_text()
a=s.index('struct Queue {');b=s.index('\nint main()',a)
t=s[a:b]
t=t.replace('static constexpr u32 shift = 7, node_bits = 25;', 'static constexpr u32 node_bits = 25;')
t=re.sub(r'\bshift\b','SHIFT',t)
t=t.replace('  void push(u64 d,','  template <unsigned SHIFT> void push(u64 d,')
t=t.replace('  u64 lower_bound() {','  template <unsigned SHIFT> u64 lower_bound() {')
t=t.replace('      push(far.top().first, far.top().second);','      push<SHIFT>(far.top().first, far.top().second);')
t=t.replace('  void start(u32 s) {','  template <unsigned SHIFT> void start(u32 s) {')
t=t.replace('queue.push(', 'queue.template push<SHIFT>(')
t=t.replace('template <unsigned W = 0> size_t drain_bits','template <unsigned W, unsigned SHIFT> size_t drain_bits')
t=t.replace('queue.SHIFT','SHIFT')
t=t.replace('  size_t drain(const Side &other,', '  template <unsigned SHIFT> size_t drain(const Side &other,')
t=t.replace('drain_bits<11>(', 'drain_bits<11, SHIFT>(').replace('drain_bits<>(', 'drain_bits<0, SHIFT>(')
t=t.replace('  u64 solve(u32 s, u32 t)', '  template <unsigned SHIFT> u64 solve(u32 s, u32 t)')
t=t.replace('fwd.start(s)', 'fwd.template start<SHIFT>(s)').replace('bwd.start(t)','bwd.template start<SHIFT>(t)')
t=t.replace('queue.lower_bound()', 'queue.template lower_bound<SHIFT>()')
t=t.replace('fwd.drain(', 'fwd.template drain<SHIFT>(').replace('bwd.drain(', 'bwd.template drain<SHIFT>(')
s=s[:a]+t+s[b:]
s=s.replace('  std::atomic<size_t> next{0};','''  unsigned gap = getenv("SD_Q_GAP") ? atoi(getenv("SD_Q_GAP")) : GAP;
  std::atomic<size_t> next{0};''')
s=s.replace('u64 d = narrow.solve(s, t);', '''bool close = u32(std::max(s, t) - std::min(s, t)) < gap;
      u64 d = close ? narrow.solve<SMALL>(s, t) : narrow.solve<7>(s, t);''')
s=s.replace('d = wide->solve(s, t);', 'd = wide->solve<7>(s, t);')
for small,gap in [(3,128),(3,1024),(3,4096),(5,128),(5,1024),(5,4096)]:
 Path(f'work/variants/adaptive{small}_{gap}.cpp').write_text(s.replace('GAP',str(gap)).replace('SMALL',str(small)))
# Correct environment key after replacing the GAP placeholder.
for p in Path('work/variants').glob('adaptive*.cpp'):
 x=p.read_text();x=re.sub(r'SD_Q_\d+', 'SD_Q_GAP', x);p.write_text(x)
