#!/bin/bash
set -eu
tag=$1
shift
context=/workspace/work/runtime-$tag
mkdir -p "$context/bin"
for name in "$@"; do cp "/workspace/work/bin/$name" "$context/bin/"; done
cp /workspace/work/runtime-context/bin/sd-timer "$context/bin/"
chmod 755 "$context/bin" "$context/bin/"*
cat > "$context/Dockerfile" <<'EOF'
FROM debian:13-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
COPY bin/ /
EOF
docker build -t "sd-codex-runtime:$tag" "$context"
