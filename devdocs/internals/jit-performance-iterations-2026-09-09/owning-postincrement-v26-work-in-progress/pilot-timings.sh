#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
out=/tmp/sqgi-owning-postincrement-study
mkdir -p "$out"
for warmups in 5 4; do
 for suite in owners members; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v25=build-jit-audit-20260909/identity-publication-v25/sqgi --sqgi v26=/tmp/sqgi-v26-pilot/sqgi --sqgi v26_repeat=/tmp/sqgi-v26-pilot/sqgi --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$out/$suite-pilot-w$warmups.json" > "$out/$suite-pilot-w$warmups.log" 2>&1
 done
done
