"""Force a stale construction-claim read, then check bounded growth."""
import argparse
import os
import pathlib
import subprocess
import tempfile

parser = argparse.ArgumentParser()
parser.add_argument('--source', type=pathlib.Path)
parser.add_argument('--expect-fault', action='store_true')
args = parser.parse_args()
here = pathlib.Path(__file__).resolve().parent
source = args.source or here.parent / 'track-d' / 'd_traverse.cpp'
text = source.read_text()
a = text.index('  void claim(', text.index('struct Grower'))
b = text.index('  void put(', a)
body = text[a:b].replace('__atomic_load_n(', 'claim_load(').replace('__atomic_store_n(', 'claim_store(').replace('__atomic_fetch_or(', 'claim_or(')
if 'Bits &claimed, mine;' in text:
    body = body.replace('    u64 &local = mine[z >> 6];',
                        '    if (role == 1) (void)claim_load(word, __ATOMIC_RELAXED);\n    u64 &local = mine[z >> 6];')
text = text[:a] + body + text[b:]
harness = (here / 'claim_schedule_d.cpp').read_text().replace('"b_instrumented.cpp"', '"solver.cpp"')
if not args.expect_fault:
    harness = '#define EXPECT_FIXED\n' + harness
if 'std::vector<uint8_t> &claimed' in text:
    harness = '#define CLAIM_BYTES\n' + harness
if 'Bits &claimed, mine;' in text:
    harness = harness.replace('Grower fast{raw,bypass,claimed,a},slow{raw,bypass,claimed,b};',
                              'Grower fast{raw,bypass,claimed,Bits(claimed.size()),a},slow{raw,bypass,claimed,Bits(claimed.size()),b};')
with tempfile.TemporaryDirectory() as directory:
    root = pathlib.Path(directory)
    (root / 'solver.cpp').write_text(text)
    (root / 'test.cpp').write_text(harness)
    binary = root / 'test'
    subprocess.run([os.getenv('CXX', 'g++'), '-O2', '-std=c++17', '-pthread', str(root / 'test.cpp'), '-o', str(binary)], check=True)
    for size in ([], ['full']):
        subprocess.run([str(binary)] + size, check=True, timeout=120)
print('PASS forced stale-claim schedule: small and full dimensions')
