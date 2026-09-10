#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
artifact=devdocs/internals/jit-performance-iterations-2026-09-09
study=/tmp/sqgi-constant-division-study
candidate=build-jit-audit-20260909/constant-division-v30/sqgi
python3 "$artifact/run_scalar_array_study.py" timings --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
python3 "$artifact/summarize_study.py" "$study" > /tmp/sqgi-v30-study-summary.log
python3 "$artifact/run_scalar_array_study.py" profitability --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
python3 "$artifact/run_scalar_array_study.py" profiles --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
