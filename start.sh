#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# If a virtualenv exists at ./venv, activate it
if [ -f "venv/bin/activate" ]; then
  # shellcheck disable=SC1091
  source venv/bin/activate
fi

PYTHON=${PYTHON:-python3}
if ! command -v "$PYTHON" >/dev/null 2>&1; then
  echo "Python not found: $PYTHON" >&2
  exit 1
fi

echo "Starting fastloop_trader.py"
exec "$PYTHON" -u fastloop_trader.py "$@"
