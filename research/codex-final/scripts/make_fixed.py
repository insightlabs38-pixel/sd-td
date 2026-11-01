from pathlib import Path
s=Path('work/controls/pr17/d_traverse.cpp').read_text()
s=s.replace('  u32 shift, node_bits;', '  static constexpr u32 shift = 7, node_bits = 25;')
s=s.replace('  explicit Queue(u32 n) : shift(std::min(7u, 32 - id_bits(n))) {\n    node_bits = 32 - shift;\n  }','  explicit Queue(u32) {}')
Path('work/variants/fixed.cpp').write_text(s)
# Compile-time packed graph weight field specialization, retain generic fallback.
x=s.replace('  size_t drain(const Side &other, u64 &best) {','  template <unsigned W = 0> size_t drain_bits(const Side &other, u64 &best) {')
x=x.replace('u32 v = g.head(g.adj[i]);','u32 v = g.adj[i] >> (W ? W : g.wbits);')
x=x.replace('u64 nd = d + g.weight(i), old = *x;','u32 mask = W ? (1u << W) - 1 : g.mask;\n        u64 w = g.adj[i] & mask;\n        u64 nd = d + (w == mask ? g.weight(i) : w), old = *x;')
pos=x.index('\n};\n\n// An exact forward probe')
x=x[:pos]+'''\n  size_t drain(const Side &other, u64 &best) {
    return g.wbits == 11 ? drain_bits<11>(other, best) : drain_bits<>(other, best);
  }
'''+x[pos:]
Path('work/variants/fixed_weight.cpp').write_text(x)
