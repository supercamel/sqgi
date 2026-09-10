#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
while kill -0 524903 2>/dev/null; do sleep 3; done
python3 - <<'PY'
from pathlib import Path
import json
r=Path('/tmp/sqgi-precise-loop-variants-study/results')
for n in ['kernels-seed17','applications-seed17','applications-seed83','roots-seed17','members','owners','methods','floats']:
 d=json.loads((r/(n+'.json')).read_text());assert 'medians' in d,n
PY
export SQGI_JIT_PRECISE_EXITS=1
artifact=devdocs/internals/jit-performance-iterations-2026-09-09
study=/tmp/sqgi-precise-loop-variants-study
candidate=build-jit-audit-20260909/precise-loop-variants-v9/sqgi
python3 "$artifact/summarize_study.py" "$study" > "$study-summary.log"
for suite in owners methods members; do
 echo "START warmups4 $suite"
 python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi v8=build-jit-audit-20260909/precise-context-release-v8/sqgi --sqgi "v9=$candidate" --runs 5 --warmups 4 --iterations 200000 --cpu 4 --output "$study/$suite-v8-v9-w4.json" > "$study/$suite-v8-v9-w4.log" 2>&1
 echo "DONE warmups4 $suite"
done
for mode in profiles profitability; do
 python3 "$artifact/run_scalar_array_study.py" "$mode" --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
done
