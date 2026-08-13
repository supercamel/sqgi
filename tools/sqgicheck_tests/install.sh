#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: install.sh BUILD_DIR SOURCE_DIR" >&2
  exit 2
fi

BUILD_DIR="$(cd "$1" && pwd)"
SOURCE_DIR="$(cd "$2" && pwd)"
STAGE="$(mktemp -d "${TMPDIR:-/tmp}/sqgicheck-install.XXXXXX")"
trap 'rm -rf "${STAGE}"' EXIT

cmake --install "${BUILD_DIR}" --prefix "${STAGE}" >/dev/null
for command in sqgi sqgicheck sqgipkg; do
  [[ -x "${STAGE}/bin/${command}" ]] || {
    echo "sqgicheck install: missing ${STAGE}/bin/${command}" >&2
    exit 1
  }
done

(
  cd "${STAGE}"
  bin/sqgicheck --help >/dev/null
  bin/sqgicheck --version >/dev/null
  bin/sqgicheck "${SOURCE_DIR}/demo/gio/stat.nut" >/dev/null
)

if command -v ldd >/dev/null; then
  if ldd "${STAGE}/bin/sqgicheck" | grep -Fq "libsqgi"; then
    echo "sqgicheck install: installed checker depends on libsqgi" >&2
    exit 1
  fi
fi

echo "sqgicheck install tests passed"
