from pathlib import Path
s=Path('work/variants/packed_order_trim_tail.cpp').read_text()
parser=Path('work/variants/stream_parser64.cpp').read_text()
a=s.index('// Bit i is set when');b=s.index('// Maps a file read-only',a)
c=parser.index('// Bit i is set when');d=parser.index('// Maps a file read-only',c)
s=s[:a]+parser[c:d]+s[b:]
Path('work/variants/packed_stream.cpp').write_text(s)
q=Path('work/variants/queue_stash.cpp').read_text()
a=s.index('struct Queue {');b=s.index('// Labels in pages',a)
c=q.index('struct Queue {');d=q.index('// Labels in pages',c)
s=s[:a]+q[c:d]+s[b:]
s=s.replace('    queue.near -= bk.size, bk.size = 0;', '    queue.near -= bk.size;\n    queue.recycle(bk);')
Path('work/variants/packed_stream_stash.cpp').write_text(s)
