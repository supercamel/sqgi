#!/bin/bash
set -euo pipefail
cd /tmp/sqgi-v29-allocation-fault
for mode in reference strict-reference post-reference cold-reference shared-reference compact-reference; do
 ./probe "$mode" > "$mode.log" 2>&1
done
for mode in exec strict-exec post-exec cold-exec shared-exec compact-exec; do
 LD_PRELOAD=/tmp/sqgi-v29-allocation-fault/fail_exec.so ./probe "$mode" > "$mode.log" 2>&1
done
gdb -q -batch -x inject.gdb ./probe > new.log 2>&1
python3 - <<'PY'
from pathlib import Path
import json,hashlib
P=Path('.');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();names=['new']+[prefix+mode for prefix in ['', 'strict-', 'post-', 'cold-', 'shared-', 'compact-'] for mode in ['reference','exec']]
assert len(names)==13
for name in names:
 s=(P/(name+'.log')).read_text();assert 'FAULT_PROBE_EXIT=0' in s,name
 if name=='new' or name.endswith('exec'):
  assert 'ATTEMPT 0 compiled=0 retryable=1 category=11 count=1 native=0' in s,name
  assert 'ATTEMPT 1 compiled=1 retryable=0 category=0 count=2 native=1' in s,name
 else:assert 'ATTEMPT 0 compiled=1 retryable=0 category=0 count=1 native=1' in s,name
 if name.endswith('exec'):assert 'EXEC_FAILURES=1 EXEC_ATTEMPTS=2' in s,name
 if name.startswith('shared-'):assert 'SHARED_RICH_NATIVE=1' in s and 'HELPER_TAIL_BRANCH=1' in s,name
 if name.startswith('compact-'):assert 'SHARED_COMPACT_NATIVE=1' in s and 'HELPER_TAIL_BRANCH=1' in s,name
 if name=='new':assert 'SQGI_NEW_FAULTS=1' in s and 'EXPANDED_NEW_FAULT_INJECTED True' in s
(P/'verification.json').write_text(json.dumps({'verified':True,'cases':13,'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1')),'probe_sha256':h(P/'probe'),'log_hashes':{name+'.log':h(P/(name+'.log')) for name in names}},indent=2)+'\n')
print('13 V29 resource cases passed, including both helper tail forms')
PY
