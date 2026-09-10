#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
study=/tmp/sqgi-shared-helper-study
candidate=build-jit-audit-20260909/shared-helper-v28/sqgi
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/cold-literal-lookup-v27/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/intrinsic-captures/$label.gdb" "$binary" > "$study/intrinsic-captures/$label.log" 2>&1
 gdb -q -batch -x "$study/call-regression-captures/$label.gdb" "$binary" > "$study/call-regression-captures/$label.log" 2>&1
 gdb -q -batch -x "$study/call-regression-captures/extra/$label.gdb" "$binary" > "$study/call-regression-captures/extra/$label.log" 2>&1
done
gdb -q -batch -x "$study/profiles/dump.gdb" "$candidate" > "$study/profiles/dump.log" 2>&1
python3 /tmp/sqgi-v28-verify-exit-code.py > /tmp/sqgi-v28-exit-code.log
python3 /tmp/sqgi-v28-compare-code.py > /tmp/sqgi-v28-code-comparison.log
