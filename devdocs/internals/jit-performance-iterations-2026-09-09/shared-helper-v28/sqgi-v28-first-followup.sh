#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
gdb -q -batch -x /tmp/sqgi-v28-emission-tier-probe/capture.gdb /tmp/sqgi-scalar-leaf-20260909/sqgi > /tmp/sqgi-v28-emission-tier-probe/capture.log 2>&1
python3 /tmp/sqgi-v28-verify-emission-tiers.py > /tmp/sqgi-v28-emission-tier-verification.log
SQGI_JIT_PRECISE_EXITS=1 ctest --test-dir /tmp/sqgi-scalar-leaf-20260909 -j4 -E '^sqgi_test_sqgipkg$' --output-on-failure > /tmp/sqgi-v28-release-enabled-tests.log 2>&1
cp /tmp/sqgi-scalar-leaf-20260909/Testing/Temporary/LastTest.log /tmp/sqgi-v28-release-enabled-ctest-detail.log
