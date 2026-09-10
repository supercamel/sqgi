#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
artifact=devdocs/internals/jit-performance-iterations-2026-09-09
study=/tmp/sqgi-closure-witness-guard-study
candidate=build-jit-audit-20260909/closure-witness-guards-v19/sqgi
for warmups in 5; do
for suite in owners methods members; do
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v18=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --sqgi "v19=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-v18-v19-w${warmups}.json" > "$study/$suite-v18-v19-w${warmups}.log" 2>&1
done
done
python3 "$artifact/run_scalar_array_study.py" timings --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
python3 "$artifact/summarize_study.py" "$study" > /tmp/sqgi-precise-v19-study-summary.log
for warmups in 4; do
for suite in owners methods members; do
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v18=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --sqgi "v19=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-v18-v19-w${warmups}.json" > "$study/$suite-v18-v19-w${warmups}.log" 2>&1
done
done
for mode in profitability; do
 python3 "$artifact/run_scalar_array_study.py" "$mode" --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
done
python3 /tmp/sqgi-precise-v19-kernel-control.py > /tmp/sqgi-precise-v19-kernel-control.log 2>&1
for warmups in 5 4; do
 python3 tools/run_member_benchmarks.py --suite floats --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v18=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --sqgi "v19=$candidate" --sqgi "v19_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/floats-control-w${warmups}.json" > "$study/floats-control-w${warmups}.log" 2>&1
done
python3 "$artifact/run_scalar_array_study.py" profiles --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
gdb -q -batch -x "$study/profiles/dump.gdb" "$candidate" > "$study/profiles/dump.log" 2>&1
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/precise-integer-compare-v18/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/call-regression-captures/$label.gdb" "$binary" > "$study/call-regression-captures/$label.log" 2>&1
 gdb -q -batch -x "$study/call-regression-captures/extra/$label.gdb" "$binary" > "$study/call-regression-captures/extra/$label.log" 2>&1
done
