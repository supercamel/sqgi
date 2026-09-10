#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 SQGI_JIT_PRECISE_EXITS=1 SQGI_JIT_TRACE=0
out=/tmp/sqgi-v25-self-publication-study/append-regression
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/precise-length-v24/sqgi; else binary=/tmp/sqgi-v25-pilot/sqgi; fi
 gdb -q -batch -x "$out/$label.gdb" "$binary" > "$out/$label-gdb.log" 2>&1
 perf record -e cycles:u -F 499 --call-graph dwarf,8192 -o "$out/$label.data" -- taskset -c 4 "$binary" "$out/only-array_append.nut" --bench --iterations=2000000 --warmups=5 --seed=17 > "$out/$label-record.log" 2>&1
 perf report --stdio -g none --no-children --percent-limit 0.25 -i "$out/$label.data" > "$out/$label-flat.log" 2>&1
 perf report --stdio --children --percent-limit 1 -i "$out/$label.data" > "$out/$label-stacks.log" 2>&1
done
