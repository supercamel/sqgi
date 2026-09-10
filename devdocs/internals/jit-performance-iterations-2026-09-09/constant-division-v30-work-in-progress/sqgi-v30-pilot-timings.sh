#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
out=/tmp/sqgi-constant-division-study
mkdir -p "$out"
for warmups in 5 4; do
 for suite in methods members owners; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v29=build-jit-audit-20260909/shared-helper-tail-v29/sqgi --sqgi v30=/tmp/sqgi-v30-pilot/sqgi --sqgi v29_repeat=build-jit-audit-20260909/shared-helper-tail-v29/sqgi --sqgi v30_repeat=/tmp/sqgi-v30-pilot/sqgi --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$out/$suite-pilot-w$warmups.json" > "$out/$suite-pilot-w$warmups.log" 2>&1
 done
done
