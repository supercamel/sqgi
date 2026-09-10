#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
gdb -q -batch -x /tmp/sqgi-v27-budget-refined/control.gdb build-jit-audit-20260909/owning-postincrement-v26/sqgi > /tmp/sqgi-v27-budget-refined/control.log 2>&1
gdb -q -batch -x /tmp/sqgi-v27-budget-refined/candidate.gdb /tmp/sqgi-scalar-leaf-20260909/sqgi > /tmp/sqgi-v27-budget-refined/candidate.log 2>&1
