#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
out=/tmp/sqgi-v28-buffer-pc-profile
gdb -q -batch -x "$out/capture.gdb" build-jit-audit-20260909/shared-helper-v28/sqgi > "$out/capture.log" 2>&1
perf report --stdio -g none --no-children --percent-limit 0.1 -i "$out/cycles.data" > "$out/flat.log" 2>&1
perf script -F ip -i "$out/cycles.data" > "$out/sample-ips.txt" 2> "$out/perf-script.log"
