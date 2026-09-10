#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
cmake --build /tmp/sqgi-scalar-leaf-20260909 -j4 > /tmp/sqgi-v27-first-build.log 2>&1
SQGI_JIT_PRECISE_EXITS=1 ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 -R '^sqgi_test_cpp_sqjit_side_exit$' --no-tests=error -V --output-on-failure > /tmp/sqgi-v27-first-side-exit.log 2>&1
python3 - <<'PY2'
from pathlib import Path
s=Path('/tmp/sqgi-v27-first-side-exit.log').read_text()
assert '100% tests passed, 0 tests failed out of 1' in s
assert '[coverage] executed 14 AArch64 generated-code groups' in s
assert '[coverage] executed AArch64 cold literal lookup contracts' in s
print('V27 FIRST BUILD AND 14 NATIVE GROUPS PASS')
PY2
