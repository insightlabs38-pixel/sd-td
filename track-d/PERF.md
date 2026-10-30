# Track D evidence

Local exact oracle: official worked-example SHA-256 `2e9871bba1d5013144ceff48d806a28da0e3f203b29118a89d98d8f654c3f6a0`.
Independent differential tests: 83 cases across one-/two-pass parsing and 1/4 workers; ASan/UBSan passed. Independent Python reference on a 176,410-node synthetic graph: SHA-256 `7ecd1c595ca370bcdf8d0526efcb88a597897be6c42a7ed13174dc64c7367fb2`.
Synthetic 1,742,512-node, 5,000,000-edge, 2,000-query benchmark (not organizer data): forward-only 6.66 s / 210 MB, bidirectional 4.60 s / 264 MB; dual CSR + 256-settle probe + binary heap approximately 4.1–4.5 s / 264 MB, measured on the Chat execution host, not the scoring box. No official PERF run ID or official Docker result yet.
