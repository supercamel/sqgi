#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: run_tests.sh /path/to/sqgicheck" >&2
  exit 2
fi

SQGICHECK="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/sqgicheck-tests.XXXXXX")"
trap 'rm -rf "${WORK_DIR}"' EXIT

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_contains() {
  local file="$1" text="$2"
  if ! grep -Fq -- "$text" "$file"; then
    sed -n '1,160p' "$file" >&2 || true
    fail "expected '$text' in $file"
  fi
}

run_status() {
  local expected="$1" name="$2"
  shift 2
  set +e
  "$@" >"${WORK_DIR}/${name}.out" 2>"${WORK_DIR}/${name}.err"
  local actual=$?
  set -e
  [[ ${actual} -eq ${expected} ]] ||
    fail "${name}: expected status ${expected}, got ${actual}"
}

run_status 0 help-long "${SQGICHECK}" --help
run_status 0 help-short "${SQGICHECK}" -h
assert_contains "${WORK_DIR}/help-long.out" "Usage: sqgicheck"
assert_contains "${WORK_DIR}/help-long.out" "--format=FORMAT"
assert_contains "${WORK_DIR}/help-long.out" "--summary"
[[ ! -s "${WORK_DIR}/help-long.err" ]] || fail "help wrote stderr"
run_status 0 version-long "${SQGICHECK}" --version
run_status 0 version-short "${SQGICHECK}" -v
assert_contains "${WORK_DIR}/version-long.out" "sqgicheck "

run_status 2 no-input "${SQGICHECK}"
run_status 1 empty-path "${SQGICHECK}" ""
assert_contains "${WORK_DIR}/no-input.err" "no input files"
[[ ! -s "${WORK_DIR}/no-input.out" ]] || fail "usage error wrote stdout"
run_status 2 unknown "${SQGICHECK}" --unknown
assert_contains "${WORK_DIR}/unknown.err" "unknown option"
run_status 2 bad-format "${SQGICHECK}" --format=yaml /dev/null
run_status 2 missing-format "${SQGICHECK}" --format
assert_contains "${WORK_DIR}/missing-format.err" "requires text or json"

cat >"${WORK_DIR}/clean.nut" <<'EOF'
local Gio = import("Gio")
local file = Gio.File.new_for_path("/tmp/example")
print(file.get_path())
EOF
run_status 0 clean "${SQGICHECK}" "${WORK_DIR}/clean.nut"
[[ ! -s "${WORK_DIR}/clean.out" ]] || fail "clean file emitted diagnostics"
[[ ! -s "${WORK_DIR}/clean.err" ]] || fail "clean file wrote stderr"

cat >"${WORK_DIR}/bad.nut" <<'EOF'
local Gio = import("Gio")
local file = Gio.File.new_for_path("/tmp/example")
file.get_paht()
EOF
run_status 1 bad "${SQGICHECK}" "${WORK_DIR}/bad.nut"
assert_contains "${WORK_DIR}/bad.out" "SQGI102"
assert_contains "${WORK_DIR}/bad.out" "did you mean 'get_path'?"
[[ ! -s "${WORK_DIR}/bad.err" ]] || fail "source diagnostic wrote stderr"

run_status 1 bad-json "${SQGICHECK}" --format=json "${WORK_DIR}/bad.nut"
python3 - "${WORK_DIR}/bad-json.out" <<'PY'
import json, pathlib, sys
data = json.loads(pathlib.Path(sys.argv[1]).read_text())
assert len(data) == 1
assert data[0]["code"] == "SQGI102"
assert data[0]["severity"] == "error"
assert set(data[0]) == {"path", "line", "column", "severity", "code",
                        "message", "help"}
PY
run_status 0 clean-json "${SQGICHECK}" --format json "${WORK_DIR}/clean.nut"
[[ "$(<"${WORK_DIR}/clean-json.out")" == "[]" ]] || fail "clean JSON is not []"
run_status 0 clean-summary "${SQGICHECK}" --summary "${WORK_DIR}/clean.nut"
[[ ! -s "${WORK_DIR}/clean-summary.out" ]] || fail "clean summary wrote stdout"
assert_contains "${WORK_DIR}/clean-summary.err" "checked 1 file; 0 diagnostics;"
assert_contains "${WORK_DIR}/clean-summary.err" "skipped for unknown values"
run_status 0 clean-json-summary "${SQGICHECK}" --format=json --summary \
  "${WORK_DIR}/clean.nut"
[[ "$(<"${WORK_DIR}/clean-json-summary.out")" == "[]" ]] || \
  fail "summary corrupted clean JSON"
assert_contains "${WORK_DIR}/clean-json-summary.err" "checked 1 file"

cat >"${WORK_DIR}/syntax.nut" <<'EOF'
local value = @
EOF
run_status 1 syntax "${SQGICHECK}" "${WORK_DIR}/syntax.nut"
assert_contains "${WORK_DIR}/syntax.out" "SQGI001"
cat >"${WORK_DIR}/missing-gi.nut" <<'EOF'
local Nope = import("DefinitelyMissingSqgi")
EOF
run_status 1 missing-gi "${SQGICHECK}" "${WORK_DIR}/missing-gi.nut"
assert_contains "${WORK_DIR}/missing-gi.out" "SQGI100"

cat >"${WORK_DIR}/main.nut" <<'EOF'
local helper = import("helper.nut")
EOF
cat >"${WORK_DIR}/helper.nut" <<'EOF'
local Gio = import("Gio")
Gio.Fiel
EOF
run_status 1 recursive "${SQGICHECK}" "${WORK_DIR}/main.nut"
assert_contains "${WORK_DIR}/recursive.out" "helper.nut"
assert_contains "${WORK_DIR}/recursive.out" "SQGI101"
run_status 0 shallow "${SQGICHECK}" --no-recursive "${WORK_DIR}/main.nut"
run_status 1 precedence-one "${SQGICHECK}" --no-recursive --recursive \
  "${WORK_DIR}/main.nut"
run_status 0 precedence-two "${SQGICHECK}" --recursive --no-recursive \
  "${WORK_DIR}/main.nut"

cat >"${WORK_DIR}/module.nut" <<'EOF'
class Base {
  function inherited(value) { return value }
}
class Thing extends Base {
  static function create() { return Thing("made") }
  constructor(path) {}
  function good(value = null) { return value }
}
return { Thing = Thing, make = function(value) { return value }, state = {} }
EOF
cat >"${WORK_DIR}/module-valid.nut" <<'EOF'
local M = import("module.nut")
local thing = M.Thing("path")
thing.good()
thing.inherited(1)
M.Thing.create()
M.make(1)
M.state.runtime_member
EOF
run_status 0 module-valid "${SQGICHECK}" --summary \
  "${WORK_DIR}/module-valid.nut"
assert_contains "${WORK_DIR}/module-valid.err" "checked 2 files; 0 diagnostics;"
cat >"${WORK_DIR}/module-bad.nut" <<'EOF'
local M = import("module.nut")
local thing = M.Thing()
thing.bad()
thing.create()
M.Thing.good()
thing.inherited()
M.Thing.create(1)
M.make()
M.missing()
EOF
run_status 1 module-bad "${SQGICHECK}" --format=json --summary \
  "${WORK_DIR}/module-bad.nut"
python3 - "${WORK_DIR}/module-bad.out" <<'PY'
import json, pathlib, sys
data = json.loads(pathlib.Path(sys.argv[1]).read_text())
assert len(data) == 8, data
assert sum(item["code"] == "SQGI103" for item in data) == 4
assert sum(item["code"] in {"SQGI101", "SQGI102"} for item in data) == 4
PY
assert_contains "${WORK_DIR}/module-bad.err" "checked 2 files; 8 diagnostics;"
run_status 0 module-shallow "${SQGICHECK}" --no-recursive --summary \
  "${WORK_DIR}/module-bad.nut"
assert_contains "${WORK_DIR}/module-shallow.err" "checked 1 file; 0 diagnostics;"

cat >"${WORK_DIR}/missing-local.nut" <<'EOF'
import("does-not-exist.nut")
EOF
run_status 1 missing-local "${SQGICHECK}" "${WORK_DIR}/missing-local.nut"
assert_contains "${WORK_DIR}/missing-local.out" "SQGI110"
cat >"${WORK_DIR}/a.nut" <<'EOF'
import("b.nut")
EOF
cat >"${WORK_DIR}/b.nut" <<'EOF'
import("a.nut")
EOF
run_status 1 cycle "${SQGICHECK}" "${WORK_DIR}/a.nut"
assert_contains "${WORK_DIR}/cycle.out" "SQGI111"
assert_contains "${WORK_DIR}/cycle.out" "${WORK_DIR}/b.nut"
run_status 1 absent "${SQGICHECK}" "${WORK_DIR}/absent.nut"
assert_contains "${WORK_DIR}/absent.out" "SQGI110"

cp "${WORK_DIR}/clean.nut" "${WORK_DIR}/-dash.nut"
(
  cd "${WORK_DIR}"
  run_status 0 dash "${SQGICHECK}" -- -dash.nut
)
run_status 0 multiple "${SQGICHECK}" "${WORK_DIR}/clean.nut" \
  "${WORK_DIR}/clean.nut"

# These statements would hang or create a marker if the checker executed either
# an entry point or an imported module. Static analysis must finish cleanly.
MARKER="${WORK_DIR}/executed-marker"
cat >"${WORK_DIR}/side-effect.nut" <<EOF
local GLib = import("GLib")
GLib.file_set_contents("${MARKER}", "executed", -1)
while (true) {}
EOF
run_status 0 nonexecution "${SQGICHECK}" "${WORK_DIR}/side-effect.nut"
[[ ! -e "${MARKER}" ]] || fail "entry source executed"
cat >"${WORK_DIR}/side-main.nut" <<'EOF'
import("side-effect.nut")
EOF
run_status 0 imported-nonexecution "${SQGICHECK}" "${WORK_DIR}/side-main.nut"
[[ ! -e "${MARKER}" ]] || fail "imported source executed"

echo "sqgicheck CLI tests passed"
