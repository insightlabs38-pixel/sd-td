#!/bin/bash
set -eu
mkdir -p work/runtime-context/bin
for p in pr15 pr17 pr18 final final_cap4 outline_esc merged6; do cp "work/bin/$p" work/runtime-context/bin/; done
chmod 755 work/runtime-context/bin work/runtime-context/bin/*
cc -O2 -static -s -o work/runtime-context/bin/sd-timer work/official/harness/timer/sd-timer.c
chmod 755 work/runtime-context/bin/sd-timer
cat > work/runtime-context/Dockerfile <<'EOF'
FROM debian:13-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
COPY bin/ /
ENTRYPOINT ["/pr17"]
EOF
docker build -t sd-codex-runtime:final work/runtime-context
