#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
artifact=devdocs/internals/jit-performance-iterations-2026-09-09
study=/tmp/sqgi-precise-native-reference-study
candidate=build-jit-audit-20260909/precise-native-reference-v13/sqgi
gdb -q -batch -x "$study/profiles/dump.gdb" "$candidate" > "$study/profiles/dump.log" 2>&1
python3 "$artifact/run_scalar_array_study.py" timings --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
python3 "$artifact/summarize_study.py" "$study" > /tmp/sqgi-precise-v13-study-summary.log
for suite in owners methods members; do
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v12=build-jit-audit-20260909/precise-native-cache-v12/sqgi --sqgi "v13=$candidate" --runs 5 --warmups 4 --iterations 200000 --cpu 4 --output "$study/$suite-v12-v13-w4.json" > "$study/$suite-v12-v13-w4.log" 2>&1
done
for mode in profitability profiles; do
 python3 "$artifact/run_scalar_array_study.py" "$mode" --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
done
