#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
bash /tmp/sqgi-v27-captures.sh > /tmp/sqgi-v27-captures.log 2>&1
gdb -q -batch -x /tmp/sqgi-v27-emission-tier-probe/capture.gdb build-jit-audit-20260909/cold-literal-lookup-v27/sqgi > /tmp/sqgi-v27-emission-tier-probe/capture.log 2>&1
python3 /tmp/sqgi-v27-profile-followup.py > /tmp/sqgi-v27-profile-followup.log
bash /tmp/sqgi-v27-controls.sh > /tmp/sqgi-v27-controls.log 2>&1
