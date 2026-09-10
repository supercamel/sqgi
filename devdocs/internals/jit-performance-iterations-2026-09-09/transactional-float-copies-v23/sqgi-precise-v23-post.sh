#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
for name in analyze native-summary exit-code control-summary application-summary application-seed17-summary; do
 python3 /tmp/sqgi-precise-v23-$name.py > /tmp/sqgi-precise-v23-$name.log 2>&1
done
python3 /tmp/sqgi-v23-paired-code.py > /tmp/sqgi-precise-v23-paired-code.log 2>&1
python3 /tmp/sqgi-v23-coverage-probe.py
gdb -q -batch -x /tmp/sqgi-transactional-float-copies-study/coverage-gaps/capture.gdb build-jit-audit-20260909/transactional-float-copies-v23/sqgi > /tmp/sqgi-transactional-float-copies-study/coverage-gaps/capture.log 2>&1
