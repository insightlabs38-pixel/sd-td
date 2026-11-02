#!/bin/bash
set -eu
work/compile.sh fix_atomic fix_bytes
mkdir -p work/runtime-safe/bin
cp work/bin/b_control work/runtime-safe/bin/control23
cp work/bin/fix_atomic work/bin/fix_bytes work/runtime-safe/bin/
cp work/runtime-context/bin/sd-timer work/runtime-safe/bin/
chmod 755 work/runtime-safe/bin work/runtime-safe/bin/*
cat > work/runtime-safe/Dockerfile <<'EOF'
FROM debian:13-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
COPY bin/ /
ENTRYPOINT ["/control23"]
EOF
docker build -t sd-codex-runtime:safe work/runtime-safe
