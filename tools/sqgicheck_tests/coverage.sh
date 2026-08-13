#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: coverage.sh BUILD_DIR" >&2
  exit 2
fi

BUILD_DIR="$(cd "$1" && pwd)"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
REPORT_DIR="${BUILD_DIR}/sqgicheck-coverage"
MIN_LINES="${SQGICHECK_MIN_LINE_COVERAGE:-100}"
MIN_FUNCTIONS="${SQGICHECK_MIN_FUNCTION_COVERAGE:-100}"
MIN_BRANCHES="${SQGICHECK_MIN_BRANCH_COVERAGE:-95}"

if [[ ! -f "${BUILD_DIR}/CMakeCache.txt" ]]; then
  echo "sqgicheck coverage: not a CMake build: ${BUILD_DIR}" >&2
  exit 2
fi
if ! grep -q '^SQGICHECK_ENABLE_COVERAGE:BOOL=ON$' \
    "${BUILD_DIR}/CMakeCache.txt"; then
  echo "sqgicheck coverage: configure with -DSQGICHECK_ENABLE_COVERAGE=ON" >&2
  exit 2
fi
command -v gcov >/dev/null || {
  echo "sqgicheck coverage: gcov is required" >&2
  exit 2
}

find "${BUILD_DIR}" -type f -name '*.gcda' -delete
ctest --test-dir "${BUILD_DIR}" -R sqgicheck --output-on-failure

rm -rf "${REPORT_DIR}"
mkdir -p "${REPORT_DIR}"

notes=(
  "${BUILD_DIR}/CMakeFiles/sqgicheck-core.dir/tools/sqgicheck/analyzer.cpp.gcno"
  "${BUILD_DIR}/CMakeFiles/sqgicheck-core.dir/tools/sqgicheck/metadata.cpp.gcno"
  "${BUILD_DIR}/CMakeFiles/sqgicheck-core.dir/tools/sqgicheck/project.cpp.gcno"
  "${BUILD_DIR}/CMakeFiles/sqgicheck-bin.dir/tools/sqgicheck/main.cpp.gcno"
)
for note in "${notes[@]}"; do
  [[ -f "${note}" ]] || {
    echo "sqgicheck coverage: missing notes file: ${note}" >&2
    exit 2
  }
  (
    cd "${REPORT_DIR}"
    gcov --json-format --branch-probabilities --branch-counts \
      "${note}" >/dev/null
  )
done

python3 "${SOURCE_DIR}/tools/sqgicheck_tests/coverage_gate.py" \
  --source-root "${SOURCE_DIR}" \
  --report-dir "${REPORT_DIR}" \
  --exclusions "${SOURCE_DIR}/tools/sqgicheck_tests/coverage_exclusions.json" \
  --min-lines "${MIN_LINES}" \
  --min-functions "${MIN_FUNCTIONS}" \
  --min-branches "${MIN_BRANCHES}"
