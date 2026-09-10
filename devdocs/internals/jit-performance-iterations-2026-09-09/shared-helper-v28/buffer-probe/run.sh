#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
gdb -q -batch -x /tmp/sqgi-v28-buffer-probe/v27/capture.gdb build-jit-audit-20260909/cold-literal-lookup-v27/sqgi > /tmp/sqgi-v28-buffer-probe/v27/capture.log 2>&1
gdb -q -batch -x /tmp/sqgi-v28-buffer-probe/v28/capture.gdb /tmp/sqgi-scalar-leaf-20260909/sqgi > /tmp/sqgi-v28-buffer-probe/v28/capture.log 2>&1
