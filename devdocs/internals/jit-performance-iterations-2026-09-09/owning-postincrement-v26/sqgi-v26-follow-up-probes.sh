#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
candidate=build-jit-audit-20260909/owning-postincrement-v26/sqgi
gdb -q -batch -x /tmp/sqgi-v26-method-probe-complete/capture.gdb "$candidate" > /tmp/sqgi-v26-method-probe-complete/capture.log 2>&1
python3 - <<'PY'
from pathlib import Path
import json
p=Path('/tmp/sqgi-v26-method-probe-complete');t=(p/'capture.log').read_text();assert 'Python Exception' not in t and 'Traceback' not in t,t[-5000:]
d=json.loads((p/'metadata.json').read_text());assert d['entries']=={'transfer':42,'publish':42};assert len(d['sites'])==6
assert sum(d['helper_calls'].values())==252
assert all(x['bucket_hits']==42 and x['bucket_misses']==x['nonfield']==0 for x in d['sites'].values())
print('VERIFIED 252 constant member helper calls in 84 native method invocations; all first-bucket matches')
PY
gdb -q -batch -x /tmp/sqgi-v26-application-call-probe/capture.gdb "$candidate" > /tmp/sqgi-v26-application-call-probe/capture.log 2>&1
python3 - <<'PY'
from pathlib import Path
import json
p=Path('/tmp/sqgi-v26-application-call-probe');t=(p/'capture.log').read_text();assert 'Python Exception' not in t and 'Traceback' not in t,t[-5000:]
d=json.loads((p/'metadata.json').read_text());print(json.dumps({k:v for k,v in d.items() if k!='captures'},indent=2))
PY
