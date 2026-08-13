#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 5 ]]; then
  echo "Usage: mutation.sh ARITY_TEST MERGE_TEST PRECEDENCE_TEST METADATA_TEST EXIT_BIN" >&2
  exit 2
fi

WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/sqgicheck-mutation.XXXXXX")"
trap 'rm -rf "${WORK_DIR}"' EXIT

kill_native_mutant() {
  local name="$1"
  local executable="$2"
  local output="${WORK_DIR}/${name}.log"
  set +e
  "${executable}" >"${output}" 2>&1
  local status=$?
  set -e
  if [[ ${status} -eq 0 ]]; then
    echo "sqgicheck mutation: ${name} survived" >&2
    cat "${output}" >&2
    exit 1
  fi
  if ! grep -q '^FAIL:' "${output}"; then
    echo "sqgicheck mutation: ${name} died without a test assertion" >&2
    cat "${output}" >&2
    exit 1
  fi
  case "${name}" in
    arity)
      grep -q 'valid program has no diagnostics\|valid-arities' "${output}" ;;
    state-merge)
      grep -q 'merge' "${output}" ;;
    resolution-precedence)
      grep -q 'working-directory import wins' "${output}" ;;
    metadata-category)
      grep -q 'constant metadata' "${output}" ;;
  esac || {
    echo "sqgicheck mutation: ${name} was not killed by its contract test" >&2
    cat "${output}" >&2
    exit 1
  }
  echo "sqgicheck mutation: ${name} killed"
}

kill_native_mutant arity "$1"
kill_native_mutant state-merge "$2"
kill_native_mutant resolution-precedence "$3"
kill_native_mutant metadata-category "$4"

cat >"${WORK_DIR}/clean.nut" <<'EOF'
local Gio = import("Gio", "2.0")
Gio.File.new_for_path("/tmp/example")
EOF
set +e
"$5" "${WORK_DIR}/clean.nut" >"${WORK_DIR}/exit.log" 2>&1
exit_status=$?
set -e
if [[ ${exit_status} -eq 0 ]]; then
  echo "sqgicheck mutation: exit-status survived" >&2
  cat "${WORK_DIR}/exit.log" >&2
  exit 1
fi
echo "sqgicheck mutation: exit-status killed"
echo "sqgicheck mutation: all 5 mutants killed"
