#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/identity-publication-v25/sqgi; else binary=/tmp/sqgi-scalar-leaf-20260909/sqgi; fi
 gdb -q -batch -x "/tmp/sqgi-v26-probes/owner/$label.gdb" "$binary" > "/tmp/sqgi-v26-probes/owner/$label.log" 2>&1
 gdb -q -batch -x "/tmp/sqgi-v26-probes/budget/$label.gdb" "$binary" > "/tmp/sqgi-v26-probes/budget/$label.log" 2>&1
done
