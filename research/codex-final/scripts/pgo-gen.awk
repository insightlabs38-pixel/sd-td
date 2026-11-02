function id(u) { return u < n ? (u * 1664525 + 1013904223) % n : u }
function edge(u, v, w) { if (!pass) m++; else print id(u), id(v), w > graph }
BEGIN {
  n = 262144; side = 512; graph = out "/graph.txt"; queries = out "/queries.txt";
  for (pass = 0; pass < 2; pass++) {
    for (u = 0; u < n; u++) {
      for (axis = 0; axis < 2; axis++) {
        v = u + (axis ? side : 1);
        h = (u * 1103515245 + axis * 12345) % 2147483647;
        if (v < n && (axis || u % side != side - 1) && h % 100 < 71) {
          w = 15 + h % 150; edge(u, v, w); edge(v, u, w + h % 13);
        }
      }
    }
    edge(n, n+1, 4294967295); edge(n+1, n+2, 4294967295);
    edge(n+3, n+4, 0); edge(n+4, n+5, 0);
    if (!pass) print n + 6, m > graph;
  }
  for (i = 0; i < 2000; i++) {
    s = (i * 1103515245 + 12345) % n; t = (s + 2 ^ (i % 15)) % n;
    print id(s), id(t) > queries;
  }
  print n, n+2 > queries; print n+3, n+5 > queries;
}
