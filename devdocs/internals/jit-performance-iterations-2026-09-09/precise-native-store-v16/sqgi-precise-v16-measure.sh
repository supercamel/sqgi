#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
artifact=devdocs/internals/jit-performance-iterations-2026-09-09
study=/tmp/sqgi-precise-native-store-study
candidate=build-jit-audit-20260909/precise-native-store-v16/sqgi
gdb -q -batch -x "$study/profiles/dump.gdb" "$candidate" > "$study/profiles/dump.log" 2>&1
for warmups in 5; do
for suite in owners methods members; do
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v15=build-jit-audit-20260909/precise-shared-exit-v15/sqgi --sqgi "v16=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-v15-v16-w${warmups}.json" > "$study/$suite-v15-v16-w${warmups}.log" 2>&1
done
done
python3 "$artifact/run_scalar_array_study.py" timings --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
python3 "$artifact/summarize_study.py" "$study" > /tmp/sqgi-precise-v16-study-summary.log
for warmups in 4; do
for suite in owners methods members; do
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v15=build-jit-audit-20260909/precise-shared-exit-v15/sqgi --sqgi "v16=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-v15-v16-w${warmups}.json" > "$study/$suite-v15-v16-w${warmups}.log" 2>&1
done
done
for mode in profitability profiles; do
 python3 "$artifact/run_scalar_array_study.py" "$mode" --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
done
