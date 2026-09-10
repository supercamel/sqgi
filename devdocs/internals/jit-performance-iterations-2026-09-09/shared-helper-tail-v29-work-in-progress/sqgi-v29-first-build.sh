#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
cmake --build /tmp/sqgi-scalar-leaf-20260909 -j4 > /tmp/sqgi-v29-first-build.log 2>&1
SQGI_JIT_PRECISE_EXITS=1 ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 -R '^sqgi_test_cpp_sqjit_side_exit$' -V > /tmp/sqgi-v29-first-side-exit.log 2>&1
python3 - <<'PY'
from pathlib import Path
s=Path('/tmp/sqgi-v29-first-side-exit.log').read_text()
assert '100% tests passed' in s and 'executed 15 AArch64 generated-code groups' in s and '[coverage] executed AArch64 shared precise helper contracts' in s
print('V29 FIRST BUILD AND 15 NATIVE GROUPS PASS')
PY
