#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
cmake --build /tmp/sqgi-scalar-leaf-20260909 -j4 > /tmp/sqgi-v30-first-build.log 2>&1
SQGI_JIT_PRECISE_EXITS=1 ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 \
 -R '^sqgi_test_cpp_sqjit_(side_exit|arithmetic|leaf|aarch64_emit)$' -V \
 > /tmp/sqgi-v30-first-native-tests.log 2>&1
python3 - <<'PY'
from pathlib import Path
s=Path('/tmp/sqgi-v30-first-native-tests.log').read_text()
assert '100% tests passed, 0 tests failed out of 4' in s
assert 'executed 16 AArch64 generated-code groups' in s
assert '[coverage] executed AArch64 constant signed division contracts' in s
assert '[coverage] executed AArch64 shared precise helper contracts' in s
assert '[OK] emitted int64 division/remainder: boundaries, multiples and random inputs' in s
print('V30 first build and four native test executables pass, including 16 generated groups')
PY
