#!/usr/bin/env bash
# Run the full .nut test suite under AddressSanitizer + LeakSanitizer.
#
# Requires a build with -DSQGI_ENABLE_ASAN=ON, e.g.:
#   cmake -S . -B build-asan -DSQGI_ENABLE_ASAN=ON && cmake --build build-asan
#
# Library-internal residual leaks (libgio worker threads, GStreamer factory
# caches) are filtered via test/lsan.supp. Anything beyond those is treated
# as a regression.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${SQGI_ASAN_BUILD:-${ROOT_DIR}/build-asan}"
SQGI_BIN="${BUILD_DIR}/sqgi"

if [[ ! -x "${SQGI_BIN}" ]]; then
  echo "ERROR: ASan-instrumented sqgi binary not found at ${SQGI_BIN}" >&2
  echo "Build it with: cmake -S . -B build-asan -DSQGI_ENABLE_ASAN=ON && cmake --build build-asan" >&2
  exit 1
fi

export LD_LIBRARY_PATH="${BUILD_DIR}/Squirrel3/squirrel:${BUILD_DIR}/Squirrel3/sqstdlib:${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export ASAN_OPTIONS="${ASAN_OPTIONS:-detect_leaks=1:abort_on_error=0:halt_on_error=0:exitcode=23}"
export LSAN_OPTIONS="${LSAN_OPTIONS:-suppressions=${ROOT_DIR}/test/lsan.supp:print_suppressions=0}"

TESTS=(
  test_glib.nut
  test_glib_recipes.nut
  test_gobject.nut
  test_signals.nut
  test_import_nut.nut
  test_async.nut
  test_async_jsstyle.nut
  test_async_reentrancy.nut
  test_application.nut
  test_application_command_line.nut
  test_gio_recipes.nut
  test_gstreamer_recipes.nut
  test_gdkpixbuf_recipes.nut
  test_application_run_crash_regression.nut
)

PASS=0
FAIL=0
for t in "${TESTS[@]}"; do
  printf "==> %-45s " "$t"
  log="/tmp/sqgi_asan_$t.log"
  if "${SQGI_BIN}" "${ROOT_DIR}/test/${t}" >"$log" 2>&1; then
    echo "clean"
    PASS=$((PASS+1))
  else
    echo "LEAK or FAILURE (see $log)"
    grep -E "SUMMARY|ERROR" "$log" | head -3 || true
    FAIL=$((FAIL+1))
  fi
done

echo
echo "ASan summary: ${PASS} clean, ${FAIL} with findings"
[[ ${FAIL} -eq 0 ]]
