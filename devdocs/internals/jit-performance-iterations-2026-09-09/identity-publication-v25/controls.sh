#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
study=/tmp/sqgi-v25-self-publication-study
candidate=build-jit-audit-20260909/identity-publication-v25/sqgi
for warmups in 5 4; do
 for suite in owners methods members; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v23=build-jit-audit-20260909/transactional-float-copies-v23/sqgi --sqgi "v25=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-v23-v25-w${warmups}.json" > "$study/$suite-v23-v25-w${warmups}.log" 2>&1
 done
done
for warmups in 5 4; do
 python3 tools/run_member_benchmarks.py --suite floats --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v23=build-jit-audit-20260909/transactional-float-copies-v23/sqgi --sqgi "v25=$candidate" --sqgi "v25_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/floats-control-w${warmups}.json" > "$study/floats-control-w${warmups}.log" 2>&1
done
python3 /tmp/sqgi-v25-application-control.py > /tmp/sqgi-v25-application-control.log 2>&1
python3 /tmp/sqgi-v25-application-seed17-control.py > /tmp/sqgi-v25-application-seed17-control.log 2>&1
python3 /tmp/sqgi-v25-summarize-controls.py > /tmp/sqgi-v25-control-summary.log
