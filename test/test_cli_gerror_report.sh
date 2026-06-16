#!/usr/bin/env bash
set -u

SQGI_BIN="${1:?sqgi binary required}"

output="$("${SQGI_BIN}" -e 'throw sqgi.GError("demo", 7, "cute")' 2>&1)"
status=$?

printf '%s\n' "${output}"

if [ "${status}" -eq 0 ]; then
    echo "expected sqgi to exit non-zero for an unhandled error" >&2
    exit 1
fi

case "${output}" in
    *"AN ERROR HAS OCCURRED [demo:7: cute]"*) ;;
    *)
        echo "expected sqgi.GError to be stringified in the top-level error report" >&2
        exit 1
        ;;
esac

case "${output}" in
    *"AN ERROR HAS OCCURRED [unknown]"*)
        echo "top-level error report still fell back to [unknown]" >&2
        exit 1
        ;;
esac
