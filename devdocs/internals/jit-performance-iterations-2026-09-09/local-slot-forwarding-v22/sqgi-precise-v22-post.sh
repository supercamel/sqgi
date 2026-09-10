#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
study=/tmp/sqgi-local-slot-forwarding-study
native=/tmp/sqgi-v22-native-profile
candidate=build-jit-audit-20260909/local-slot-forwarding-v22/sqgi
python3 /tmp/sqgi-precise-v22-analyze.py > /tmp/sqgi-precise-v22-analysis.log
python3 /tmp/sqgi-precise-v22-native-summary.py > /tmp/sqgi-precise-v22-native-summary.log
python3 /tmp/sqgi-precise-v22-exit-code.py > /tmp/sqgi-precise-v22-exit-code.log
python3 /tmp/sqgi-precise-v22-control-summary.py > /tmp/sqgi-precise-v22-control-summary.log
python3 /tmp/sqgi-precise-v22-application-summary.py > /tmp/sqgi-precise-v22-application-summary.log
python3 /tmp/sqgi-v22-paired-code.py > /tmp/sqgi-precise-v22-paired-code.log
python3 /tmp/sqgi-precise-v22-application-seed17-control.py > /tmp/sqgi-precise-v22-application-seed17-control.log 2>&1
python3 /tmp/sqgi-precise-v22-application-seed17-summary.py > /tmp/sqgi-precise-v22-application-seed17-summary.log
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/receiver-entry-guards-v21/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/filter-stream-captures/$label.gdb" "$binary" > "$study/filter-stream-captures/$label.log" 2>&1
done
python3 /tmp/sqgi-v22-filter-code.py > /tmp/sqgi-precise-v22-filter-code.log 2>&1
bash "$native/run.sh" > /tmp/sqgi-precise-v22-native-instruction-run.log 2>&1
gdb -q -batch -x "$native/gdb-floats/capture.gdb" "$candidate" > "$native/gdb-floats/capture.log" 2>&1
python3 "$native/analyze.py" > /tmp/sqgi-precise-v22-native-instruction-analysis.log 2>&1
python3 "$native/overhead.py" > /tmp/sqgi-precise-v22-native-instruction-overhead.log 2>&1
mkdir "$native/lifetime"
env LD_PRELOAD="$native/capture.so" SQGI_PROFILE_MAP_DIR="$native/lifetime" /tmp/sqgi-scalar-leaf-20260909/sqgi_test_cpp_sqjit_intrinsics > "$native/lifetime/run.log" 2>&1
python3 - <<'PY'
from pathlib import Path
import json
D=Path('/tmp/sqgi-v22-native-profile/lifetime');events=[json.loads(s) for s in (D/'events.jsonl').read_text().splitlines()];assert all(e['ok'] for e in events)
loads=[e for e in events if e['event']=='load'];reused=len(loads)-len({(e['pid'],e['address']) for e in loads});assert reused>0
log=(D/'run.log').read_text();assert '[coverage] executed AArch64 native closure lifetime contract (address reuse=1)' in log and 'FAIL:' not in log
(D/'summary.json').write_text(json.dumps(dict(loads=len(loads),unloads=sum(e['event']=='unload' for e in events),reused_load_addresses=reused,native_lifetime_contract_passed=True),indent=2)+'\n')
print('POST COMPLETE; native instruction capture and lifetime contracts validated')
PY
