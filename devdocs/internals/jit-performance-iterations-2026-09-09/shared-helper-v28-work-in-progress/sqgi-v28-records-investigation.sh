#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
python3 /tmp/sqgi-v28-records-replication.py > /tmp/sqgi-v28-records-replication.log 2>&1
python3 /tmp/sqgi-v28-analyze-records-replication.py > /tmp/sqgi-v28-records-replication-analysis.log 2>&1
