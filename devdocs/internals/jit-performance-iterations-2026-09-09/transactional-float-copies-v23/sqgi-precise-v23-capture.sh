#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
study=/tmp/sqgi-transactional-float-copies-study
candidate=build-jit-audit-20260909/transactional-float-copies-v23/sqgi
mkdir -p "$study"
python3 /tmp/sqgi-v23-route.py
python3 /tmp/sqgi-v23-forward-capture.py
python3 /tmp/sqgi-precise-v23-call-capture.py
python3 /tmp/sqgi-precise-v23-extra-call-capture.py
python3 /tmp/sqgi-v23-extra-captures.py
gdb -q -batch -x "$study/forwarding-captures/capture.gdb" "$candidate" > "$study/forwarding-captures/capture.log" 2>&1
python3 /tmp/sqgi-v23-forward-code.py > /tmp/sqgi-precise-v23-forward-code.log 2>&1
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/local-slot-forwarding-v22/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/route/$label-entry.gdb" --args "$binary" "$study/route/entry-guards.nut" > "$study/route/$label-entry.log" 2>&1
done
python3 /tmp/sqgi-v23-route-summary.py > /tmp/sqgi-precise-v23-route-summary.log 2>&1
for label in v21 control candidate; do
 if [ "$label" = v21 ]; then binary=build-jit-audit-20260909/receiver-entry-guards-v21/sqgi; elif [ "$label" = control ]; then binary=build-jit-audit-20260909/local-slot-forwarding-v22/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/filter-stream-captures/$label.gdb" "$binary" > "$study/filter-stream-captures/$label.log" 2>&1
done
python3 /tmp/sqgi-v23-filter-code.py > /tmp/sqgi-precise-v23-filter-code.log 2>&1
