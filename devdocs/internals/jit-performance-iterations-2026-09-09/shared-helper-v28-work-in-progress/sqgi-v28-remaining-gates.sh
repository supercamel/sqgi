#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
for mode in enabled default; do
 if [ "$mode" = enabled ]; then export SQGI_JIT_PRECISE_EXITS=1; else unset SQGI_JIT_PRECISE_EXITS; fi
 if [ "$mode" = default ]; then
  ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 -j4 -E '^sqgi_test_sqgipkg$' --output-on-failure > /tmp/sqgi-v28-release-default-tests.log 2>&1
  cp /tmp/sqgi-scalar-leaf-20260909/Testing/Temporary/LastTest.log /tmp/sqgi-v28-release-default-ctest-detail.log
 else
  test -f /tmp/sqgi-v28-release-enabled-ctest-detail.log
 fi
done
SQGI_JIT_PRECISE_EXITS=1 python3 devdocs/internals/jit-performance-iterations-2026-09-09/check_holdouts.py --binary /tmp/sqgi-scalar-leaf-20260909/sqgi --output /tmp/sqgi-v28-release-holdouts > /tmp/sqgi-v28-release-holdouts.log 2>&1
cmake --build /tmp/sqgi-leaf-asan-strict-20260909.M32jMl -j4 > /tmp/sqgi-v28-asan-build.log 2>&1
for mode in enabled default; do
 if [ "$mode" = enabled ]; then export SQGI_JIT_PRECISE_EXITS=1; else unset SQGI_JIT_PRECISE_EXITS; fi
 ctest --test-dir /tmp/sqgi-leaf-asan-strict-20260909.M32jMl -j4 -E '^sqgi_test_sqgipkg$' --output-on-failure > "/tmp/sqgi-v28-asan-$mode-tests.log" 2>&1
 cp /tmp/sqgi-leaf-asan-strict-20260909.M32jMl/Testing/Temporary/LastTest.log "/tmp/sqgi-v28-asan-$mode-ctest-detail.log"
done
SQGI_JIT_PRECISE_EXITS=1 python3 devdocs/internals/jit-performance-iterations-2026-09-09/check_holdouts.py --binary /tmp/sqgi-leaf-asan-strict-20260909.M32jMl/sqgi --output /tmp/sqgi-v28-asan-holdouts > /tmp/sqgi-v28-asan-holdouts.log 2>&1
cmake --build /tmp/sqgi-release-barrier-x64-20260909.ldnWJI/build -j4 > /tmp/sqgi-v28-x64-build.log 2>&1
set +e
ctest --test-dir /tmp/sqgi-release-barrier-x64-20260909.ldnWJI/build -j4 --output-on-failure > /tmp/sqgi-v28-x64-tests.log 2>&1
status=$?
set -e
[ "$status" = 8 ]
python3 - <<'PY'
from pathlib import Path
from collections import Counter
f=lambda p:Counter(x.strip() for x in Path(p).read_text().splitlines() if x.startswith('FAIL:'))
a=f('/tmp/sqgi-precise-v23-x64-tests.log');b=f('/tmp/sqgi-v28-x64-tests.log');assert a==b and sum(b.values())==32,(a,b)
print('V28 GATES COMPLETE; x64 same 32 known assertions')
PY
