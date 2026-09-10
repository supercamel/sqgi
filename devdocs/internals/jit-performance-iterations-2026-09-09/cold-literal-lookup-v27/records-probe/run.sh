#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
gdb -q -batch -x /tmp/sqgi-v27-records-probe/control.gdb build-jit-audit-20260909/owning-postincrement-v26/sqgi > /tmp/sqgi-v27-records-probe/control.log 2>&1
gdb -q -batch -x /tmp/sqgi-v27-records-probe/candidate.gdb build-jit-audit-20260909/cold-literal-lookup-v27/sqgi > /tmp/sqgi-v27-records-probe/candidate.log 2>&1
