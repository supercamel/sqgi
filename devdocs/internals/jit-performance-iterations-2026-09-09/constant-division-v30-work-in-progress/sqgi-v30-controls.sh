#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
study=/tmp/sqgi-constant-division-study
candidate=build-jit-audit-20260909/constant-division-v30/sqgi
for warmups in 5 4; do
 for suite in floats; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v29=build-jit-audit-20260909/shared-helper-tail-v29/sqgi --sqgi "v30=$candidate" --sqgi v29_repeat=build-jit-audit-20260909/shared-helper-tail-v29/sqgi --sqgi "v30_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-control-w${warmups}.json" > "$study/$suite-control-w${warmups}.log" 2>&1
 done
done
python3 /tmp/sqgi-v30-kernel-control.py > /tmp/sqgi-v30-kernel-control.log 2>&1
python3 /tmp/sqgi-v30-application-control.py > /tmp/sqgi-v30-application-control.log 2>&1
python3 /tmp/sqgi-v30-application-seed17-control.py > /tmp/sqgi-v30-application-seed17-control.log 2>&1
python3 /tmp/sqgi-v30-summarize-controls.py > /tmp/sqgi-v30-control-summary.log
