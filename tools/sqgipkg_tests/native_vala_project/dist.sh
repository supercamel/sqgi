#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${PROJECT_DIR}/../../.." && pwd)"
SQGI_BIN="${SQGI_BIN:-${ROOT_DIR}/build/sqgi}"

"${SQGI_BIN}" "${ROOT_DIR}/tools/sqgipkg" \
  --manifest "${PROJECT_DIR}/sqgipkg.json" \
  --smoke-test "" \
  "$@"
