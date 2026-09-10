#!/bin/bash
set -euo pipefail
cd /tmp/sqgi-v26-allocation-fault
./probe reference > reference.log 2>&1
./probe strict-reference > strict-reference.log 2>&1
./probe post-reference > post-reference.log 2>&1
LD_PRELOAD=/tmp/sqgi-v26-allocation-fault/fail_exec.so ./probe exec > exec.log 2>&1
LD_PRELOAD=/tmp/sqgi-v26-allocation-fault/fail_exec.so ./probe strict-exec > strict-exec.log 2>&1
LD_PRELOAD=/tmp/sqgi-v26-allocation-fault/fail_exec.so ./probe post-exec > post-exec.log 2>&1
gdb -q -batch -x inject.gdb ./probe > new.log 2>&1
python3 - <<'PY'
from pathlib import Path
import hashlib,json
p=Path('.');h=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
names=['reference.log','strict-reference.log','exec.log','strict-exec.log','new.log','post-reference.log','post-exec.log']
for n in names:
 s=(p/n).read_text();assert 'FAULT_PROBE_EXIT=0' in s,n
 if n in ['exec.log','strict-exec.log','new.log','post-exec.log']:
  assert 'ATTEMPT 0 compiled=0 retryable=1 category=11 count=1 native=0' in s,n
  assert 'ATTEMPT 1 compiled=1 retryable=0 category=0 count=2 native=1' in s,n
 else:assert 'ATTEMPT 0 compiled=1 retryable=0 category=0 count=1 native=1' in s,n
 if n in ['exec.log','strict-exec.log','post-exec.log']:assert 'EXEC_FAILURES=1 EXEC_ATTEMPTS=2' in s,n
 if n=='new.log':assert 'SQGI_NEW_FAULTS=1' in s and 'EXPANDED_NEW_FAULT_INJECTED True' in s
(p/'verification.json').write_text(json.dumps({'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1')),'probe_sha256':h(p/'probe'),'log_hashes':{n:h(p/n) for n in names},'verified':True},indent=2)+'\n')
print('V26 allocation failures verified against current engine')
PY
