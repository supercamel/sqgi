#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
g++ -std=gnu++11 -O2 -g -DSQ_ENABLE_JIT -I Squirrel3/include -I Squirrel3/squirrel /tmp/sqgi-v29-allocation-fault/probe.cpp -L/tmp/sqgi-scalar-leaf-20260909 -Wl,-rpath,/tmp/sqgi-scalar-leaf-20260909 -lsqgi -o /tmp/sqgi-v29-allocation-fault/probe
bash /tmp/sqgi-v29-run-faults.sh > /tmp/sqgi-v29-fault-verification.log 2>&1
for probe in tail-budget emission-tier-probe budget-preservation buffer-probe; do
 gdb -q -batch -x "/tmp/sqgi-v29-$probe/capture.gdb" /tmp/sqgi-scalar-leaf-20260909/sqgi > "/tmp/sqgi-v29-$probe/capture.log" 2>&1
done
python3 /tmp/sqgi-v29-verify-tail.py > /tmp/sqgi-v29-tail-verification.log 2>&1
python3 /tmp/sqgi-v29-verify-probes.py > /tmp/sqgi-v29-probe-verification.log 2>&1
python3 - <<'PY'
from pathlib import Path
import json,hashlib
P=Path('/tmp/sqgi-v29-buffer-probe');B=Path('/home/sam/Programming/sqgi/devdocs/internals/jit-performance-iterations-2026-09-09/shared-helper-v28/buffer-probe/v28');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=json.loads((B/'metadata.json').read_text());b=json.loads((P/'metadata.json').read_text())
assert a['helper_calls']==b['helper_calls'] and sum(b['helper_calls'].values())==1244
assert b['entries']==a['entries']=={'rotate_buffers':4} and b['return_statuses']==a['return_statuses']=={'rotate_buffers:1':4}
(P/'verification.json').write_text(json.dumps({'verified':True,'native_successful_returns':4,'helper_calls':1244,'unchanged_helper_calls':True,'metadata_sha256':h(P/'metadata.json'),'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))},indent=2)+'\n')
print('V29 helpers unchanged; tail ABI returns correctly')
PY
