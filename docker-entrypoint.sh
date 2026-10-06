#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"
AUTH="${CODE_SERVER_AUTH:-none}"
PROJECT="${CODE_SERVER_PROJECT:-/home/coder/project}"
PASSWORD="${PASSWORD:-}"

mkdir -p "$PROJECT"

ARGS=(
  --bind-addr "0.0.0.0:${PORT}"
  --auth "$AUTH"
  --disable-telemetry
)

if [[ "$AUTH" == "password" && -n "$PASSWORD" ]]; then
  export PASSWORD
fi

echo "[chieta-code-server] Serving on 0.0.0.0:${PORT} (auth=${AUTH})"
exec code-server "${ARGS[@]}" "$PROJECT"
