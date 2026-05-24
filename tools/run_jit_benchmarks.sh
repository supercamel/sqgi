#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ITERATIONS="${1:-2000}"
THRESHOLD="${SQGI_JIT_THRESHOLD:-1}"

if [[ -n "${SQGI_BIN:-}" ]]; then
    SQGI="${SQGI_BIN}"
elif [[ -x "${ROOT_DIR}/build-jit-release/sqgi" ]]; then
    SQGI="${ROOT_DIR}/build-jit-release/sqgi"
elif [[ -x "${ROOT_DIR}/build/sqgi" ]]; then
    SQGI="${ROOT_DIR}/build/sqgi"
elif command -v sqgi >/dev/null 2>&1; then
    SQGI="$(command -v sqgi)"
else
    echo "error: set SQGI_BIN or build sqgi first" >&2
    exit 1
fi

if [[ ! "${ITERATIONS}" =~ ^[0-9]+$ ]] || [[ "${ITERATIONS}" -le 0 ]]; then
    echo "error: iterations must be a positive integer" >&2
    exit 1
fi

TEST_FILE="${ROOT_DIR}/test/test_jit_perf_correctness.nut"
OFF_OUT="$(mktemp)"
ON_OUT="$(mktemp)"
trap 'rm -f "${OFF_OUT}" "${ON_OUT}"' EXIT

echo "sqgi: ${SQGI}"
echo "test: ${TEST_FILE}"
echo "iterations: ${ITERATIONS}"
echo

SQGI_JIT=0 SQGI_JIT_THRESHOLD="${THRESHOLD}" SQGI_JIT_TRACE=0 \
    "${SQGI}" "${TEST_FILE}" --bench --iterations="${ITERATIONS}" >"${OFF_OUT}"
SQGI_JIT=1 SQGI_JIT_THRESHOLD="${THRESHOLD}" SQGI_JIT_TRACE=0 \
    "${SQGI}" "${TEST_FILE}" --bench --iterations="${ITERATIONS}" >"${ON_OUT}"

echo "JIT off"
grep '^BENCH' "${OFF_OUT}"
echo
echo "JIT on"
grep '^BENCH' "${ON_OUT}"
echo
echo "Summary"
awk -F '\t' '
    FNR == NR && $1 == "BENCH" {
        off[$2] = $4
        next
    }
    $1 == "BENCH" {
        speedup = off[$2] / $4
        printf("SUMMARY\t%s\toff_us=%.6f\ton_us=%.6f\tspeedup=%.3fx\n",
            $2, off[$2], $4, speedup)
    }
' "${OFF_OUT}" "${ON_OUT}"
