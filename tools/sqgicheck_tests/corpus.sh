#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: corpus.sh /path/to/sqgicheck SOURCE_DIR" >&2
  exit 2
fi

SQGICHECK="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
SOURCE_DIR="$(cd "$2" && pwd)"
mapfile -t DEMOS < <(find "${SOURCE_DIR}/demo" -type f -name '*.nut' | sort)
[[ ${#DEMOS[@]} -gt 0 ]] || {
  echo "sqgicheck corpus: no demo files found" >&2
  exit 2
}

WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/sqgicheck-corpus.XXXXXX")"
trap 'rm -rf "${WORK_DIR}"' EXIT
set +e
"${SQGICHECK}" --format=json "${DEMOS[@]}" >"${WORK_DIR}/result.json"
STATUS=$?
set -e
python3 - "${WORK_DIR}/result.json" "${STATUS}" "${#DEMOS[@]}" <<'PY'
import json, pathlib, sys
path, status, count = pathlib.Path(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
try:
    diagnostics = json.loads(path.read_text())
except Exception as error:
    raise SystemExit(f"sqgicheck corpus: invalid JSON: {error}")
optional = {"Gtk", "Gdk", "GdkPixbuf", "Gst", "Soup", "cairo"}
skipped = set()
unreviewed = []
for item in diagnostics:
    message = item.get("message", "")
    namespace = None
    prefix = "GI namespace '"
    if item.get("code") == "SQGI100" and message.startswith(prefix):
        tail = message[len(prefix):]
        namespace = tail.split("'", 1)[0]
    if namespace in optional:
        skipped.add(namespace)
    else:
        unreviewed.append(item)
if unreviewed or (status not in (0, 1)):
    for item in unreviewed:
        print(f"{item['path']}:{item['line']}:{item['column']}: "
              f"{item['code']}: {item['message']}", file=sys.stderr)
    raise SystemExit("sqgicheck corpus: unreviewed demo diagnostic(s)")
suffix = ""
if skipped:
    suffix = "; optional typelibs unavailable: " + ", ".join(sorted(skipped))
print(f"sqgicheck corpus: {count} demos clean{suffix}")
PY
