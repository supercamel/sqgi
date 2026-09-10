#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
study=/tmp/sqgi-precise-integer-compare-study
python3 /tmp/sqgi-precise-v18-kernel-control.py > /tmp/sqgi-precise-v18-kernel-control.log 2>&1
for warmups in 5 4; do
 python3 tools/run_member_benchmarks.py --suite floats --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v17=build-jit-audit-20260909/precise-cache-proofs-v17/sqgi --sqgi v18=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --sqgi v18_repeat=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/floats-control-w${warmups}.json" > "$study/floats-control-w${warmups}.log" 2>&1
done
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/precise-cache-proofs-v17/sqgi; else binary=build-jit-audit-20260909/precise-integer-compare-v18/sqgi; fi
 gdb -q -batch -x "$study/call-regression-captures/$label.gdb" "$binary" > "$study/call-regression-captures/$label.log" 2>&1
done
