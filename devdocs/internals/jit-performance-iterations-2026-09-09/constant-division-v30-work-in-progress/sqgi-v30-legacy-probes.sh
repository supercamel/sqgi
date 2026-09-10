#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
g++ -std=gnu++11 -O2 -g -DSQ_ENABLE_JIT -I Squirrel3/include -I Squirrel3/squirrel /tmp/sqgi-v30-allocation-fault/probe.cpp -L/tmp/sqgi-scalar-leaf-20260909 -Wl,-rpath,/tmp/sqgi-scalar-leaf-20260909 -lsqgi -o /tmp/sqgi-v30-allocation-fault/probe
bash /tmp/sqgi-v30-run-faults.sh > /tmp/sqgi-v30-fault-verification.log 2>&1
for probe in tail-budget emission-tier-probe budget-preservation buffer-probe; do
 gdb -q -batch -x "/tmp/sqgi-v30-$probe/capture.gdb" /tmp/sqgi-scalar-leaf-20260909/sqgi > "/tmp/sqgi-v30-$probe/capture.log" 2>&1
done
python3 /tmp/sqgi-v30-verify-tail.py > /tmp/sqgi-v30-tail-verification.log 2>&1
