#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
SQGI_JIT_PRECISE_EXITS=1 ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 -j4 -E '^sqgi_test_sqgipkg$' --output-on-failure > /tmp/sqgi-v29-release-enabled-tests.log 2>&1
cp /tmp/sqgi-scalar-leaf-20260909/Testing/Temporary/LastTest.log /tmp/sqgi-v29-release-enabled-ctest-detail.log
bash /tmp/sqgi-v29-remaining-gates.sh > /tmp/sqgi-v29-remaining-gates.log 2>&1
