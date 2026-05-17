#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build"
SQGI_BIN="${BUILD_DIR}/sqgi"

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  cat <<'EOF'
Usage: test/run_tests.sh [--no-build]

Runs all .nut tests with the local sqgi binary.
By default, configures/builds first.
EOF
  exit 0
fi

DO_BUILD=1
if [[ "${1:-}" == "--no-build" ]]; then
  DO_BUILD=0
fi

if [[ ${DO_BUILD} -eq 1 ]]; then
  echo "==> Configuring project"
  cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" >/dev/null
  echo "==> Building project"
  cmake --build "${BUILD_DIR}" -j"$(nproc)" >/dev/null
fi

if [[ ! -x "${SQGI_BIN}" ]]; then
  echo "ERROR: sqgi binary not found at ${SQGI_BIN}" >&2
  echo "Run: cmake -S . -B build && cmake --build build" >&2
  exit 1
fi

export LD_LIBRARY_PATH="${BUILD_DIR}/Squirrel3/squirrel:${BUILD_DIR}/Squirrel3/sqstdlib:${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

TESTS=(
  "test_glib.nut"
  "test_glib_recipes.nut"
  "test_gobject.nut"
  "test_signals.nut"
  "test_import_nut.nut"
  "test_async.nut"
  "test_async_jsstyle.nut"
  "test_async_reentrancy.nut"
  "test_application.nut"
  "test_application_command_line.nut"
  "test_vget_download.nut"
  "test_soup_server.nut"
  "test_gio_recipes.nut"
  "test_gstreamer_recipes.nut"
  "test_gdkpixbuf_recipes.nut"
  "test_application_run_crash_regression.nut"
)

PASS_COUNT=0
FAIL_COUNT=0

for test_file in "${TESTS[@]}"; do
  echo "==> Running ${test_file}"
  if "${SQGI_BIN}" "${ROOT_DIR}/test/${test_file}"; then
    echo "PASS: ${test_file}"
    PASS_COUNT=$((PASS_COUNT + 1))
  else
    echo "FAIL: ${test_file}"
    FAIL_COUNT=$((FAIL_COUNT + 1))
  fi
  echo
done

echo "Summary: ${PASS_COUNT} passed, ${FAIL_COUNT} failed"

if [[ ${FAIL_COUNT} -ne 0 ]]; then
  exit 1
fi
