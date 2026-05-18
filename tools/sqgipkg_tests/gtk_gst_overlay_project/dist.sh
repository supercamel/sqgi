#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${PROJECT_DIR}/../../.." && pwd)"
BUILD_DIR="$ROOT_DIR/build"
SQGI_BIN="${SQGI_BIN:-${ROOT_DIR}/build/sqgi}"
SQGIPKG="${SQGIPKG:-${ROOT_DIR}/tools/sqgipkg}"
OUT_DIR="${OUT_DIR:-${PROJECT_DIR}/dist}"

if [[ ! -x "${SQGI_BIN}" ]]; then
  echo "sqgi not found at ${SQGI_BIN}" >&2
  echo "Build first: cmake -S ${ROOT_DIR} -B ${ROOT_DIR}/build && cmake --build ${ROOT_DIR}/build" >&2
  exit 1
fi

export LD_LIBRARY_PATH="${ROOT_DIR}/build${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

"${SQGI_BIN}" "${SQGIPKG}" \
  --build-dir ${BUILD_DIR} \
  --manifest "${PROJECT_DIR}/sqgipkg.json" \
  --output "${OUT_DIR}" \
  "$@"

echo "Wrote ${OUT_DIR}/GtkGstOverlay.AppImage"
echo "Try: APPIMAGE_EXTRACT_AND_RUN=1 ${OUT_DIR}/GtkGstOverlay.AppImage --timeout=5"
