#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
study=/tmp/sqgi-shared-helper-study
candidate=build-jit-audit-20260909/shared-helper-v28/sqgi
for warmups in 5 4; do
 for suite in floats; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v27=build-jit-audit-20260909/cold-literal-lookup-v27/sqgi --sqgi "v28=$candidate" --sqgi "v28_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-control-w${warmups}.json" > "$study/$suite-control-w${warmups}.log" 2>&1
 done
done
python3 /tmp/sqgi-v28-kernel-control.py > /tmp/sqgi-v28-kernel-control.log 2>&1
python3 /tmp/sqgi-v28-application-control.py > /tmp/sqgi-v28-application-control.log 2>&1
python3 /tmp/sqgi-v28-application-seed17-control.py > /tmp/sqgi-v28-application-seed17-control.log 2>&1
python3 /tmp/sqgi-v28-summarize-controls.py > /tmp/sqgi-v28-control-summary.log
