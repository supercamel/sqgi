#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
out=/tmp/sqgi-shared-helper-tail-study
mkdir -p "$out"
for warmups in 5 4; do
 for suite in methods members owners; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v28=build-jit-audit-20260909/shared-helper-v28/sqgi --sqgi v29=/tmp/sqgi-v29-pilot/sqgi --sqgi v28_repeat=build-jit-audit-20260909/shared-helper-v28/sqgi --sqgi v29_repeat=/tmp/sqgi-v29-pilot/sqgi --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$out/$suite-pilot-w$warmups.json" > "$out/$suite-pilot-w$warmups.log" 2>&1
 done
done
