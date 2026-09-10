#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
bash /tmp/sqgi-v28-measure-initial.sh > /tmp/sqgi-v28-measure-initial.log 2>&1
bash /tmp/sqgi-v28-captures.sh > /tmp/sqgi-v28-captures.log 2>&1
python3 /tmp/sqgi-v28-profile-followup.py > /tmp/sqgi-v28-profile-followup.log 2>&1
bash /tmp/sqgi-v28-controls.sh > /tmp/sqgi-v28-controls.log 2>&1
python3 /tmp/sqgi-v28-verify-study.py > /tmp/sqgi-v28-study-verification.log 2>&1
