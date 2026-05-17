#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
BENCH_DIR="${ROOT_DIR}/demo/benchmarks"
SQGI_BIN="${SQGI_BIN:-${ROOT_DIR}/build/sqgi}"
SQGI_BUILD_DIR="$(cd "$(dirname "${SQGI_BIN}")" && pwd)"
SCALE=1

for arg in "$@"; do
  case "${arg}" in
    --scale=*) SCALE="${arg#--scale=}" ;;
    -h|--help)
      cat <<'EOF'
Usage: demo/benchmarks/run.sh [--scale=N]

Runs comparable benchmark demos for SQGI, Python, Node.js, and GJS when the
corresponding runtime is installed. Output is TSV:

runtime  benchmark  iterations  ms  checksum
EOF
      exit 0
      ;;
    *)
      echo "unknown argument: ${arg}" >&2
      exit 2
      ;;
  esac
done

if [[ ! "${SCALE}" =~ ^[0-9]+$ || "${SCALE}" -lt 1 ]]; then
  echo "--scale must be a positive integer" >&2
  exit 2
fi

export LD_LIBRARY_PATH="${SQGI_BUILD_DIR}/Squirrel3/squirrel:${SQGI_BUILD_DIR}/Squirrel3/sqstdlib:${SQGI_BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

printf "runtime\tbenchmark\titerations\tms\tchecksum\n"

if [[ -x "${SQGI_BIN}" ]]; then
  "${SQGI_BIN}" "${BENCH_DIR}/sqgi_bench.nut" "--scale=${SCALE}"
else
  printf "sqgi\tall\t0\tSKIP\tmissing %s\n" "${SQGI_BIN}"
fi

if command -v python3 >/dev/null 2>&1; then
  python3 "${BENCH_DIR}/python_bench.py" "--scale=${SCALE}"
else
  printf "python\tall\t0\tSKIP\tpython3 not found\n"
fi

if command -v node >/dev/null 2>&1; then
  node "${BENCH_DIR}/node_bench.js" "--scale=${SCALE}"
else
  printf "node\tall\t0\tSKIP\tnode not found\n"
fi

if command -v gjs >/dev/null 2>&1; then
  gjs "${BENCH_DIR}/gjs_bench.js" "--scale=${SCALE}"
else
  printf "gjs\tall\t0\tSKIP\tgjs not found\n"
fi
