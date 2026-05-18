#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: test_shebang.sh /path/to/sqgi" >&2
  exit 2
fi

SQGI_BIN="$1"
script="$(mktemp "${TMPDIR:-/tmp}/sqgi-shebang.XXXXXX")"
trap 'rm -f "$script"' EXIT

cat >"$script" <<EOF
#!${SQGI_BIN}
if (vargv.len() != 2) {
    print("expected 2 args, got " + vargv.len() + "\\n")
    return 1
}
if (vargv[0] != "alpha" || vargv[1] != "beta") {
    print("unexpected args: " + vargv[0] + ", " + vargv[1] + "\\n")
    return 1
}
print("test_shebang.nut passed\\n")
EOF

chmod +x "$script"
"$script" alpha beta
