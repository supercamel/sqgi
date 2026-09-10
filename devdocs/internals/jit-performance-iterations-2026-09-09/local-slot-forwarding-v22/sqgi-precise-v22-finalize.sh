#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
python3 - <<'PY'
from pathlib import Path
import shutil,json
D=Path('/tmp/sqgi-v22-filter-ablation');assert json.loads((D/'installed-code-verification.json').read_text())['exact_ten_instruction_ablation']
shutil.copytree(D,Path('/tmp/sqgi-local-slot-forwarding-study/filter-copy-ablation'))
PY
python3 /tmp/sqgi-v22-archive.py > /tmp/sqgi-precise-v22-archive.log 2>&1
python3 /tmp/sqgi-v22-native-profile/archive.py > /tmp/sqgi-precise-v22-native-instruction-archive.log 2>&1
python3 /tmp/sqgi-v22-retain-pilots.py > /tmp/sqgi-precise-v22-retain-pilots.log 2>&1
python3 - <<'PY'
from pathlib import Path
import shutil,subprocess,os
R=Path.cwd();A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'local-slot-forwarding-v22/receiver-publication';D.mkdir()
for name in ['witness','witness.cpp']:shutil.copy2(A/'receiver-entry-guards-v21/receiver-publication'/name,D/name)
for label,version in [('v21','receiver-entry-guards-v21'),('candidate','local-slot-forwarding-v22')]:
 p=subprocess.run([str(D/'witness')],env=dict(os.environ,LD_LIBRARY_PATH=str(R/f'build-jit-audit-20260909/{version}/native-validation')),capture_output=True,text=True)
 (D/f'{label}.log').write_text(p.stdout+p.stderr);assert p.returncode==0 and 'status=0 releases=0 callback_sum=-1 frame_sum=0' in p.stdout
PY
python3 /tmp/sqgi-v22-report.py > /tmp/sqgi-precise-v22-report.log 2>&1
python3 /tmp/sqgi-v22-seal.py > /tmp/sqgi-precise-v22-seal.log 2>&1
python3 /tmp/sqgi-v22-verify.py > /tmp/sqgi-precise-v22-verify.log 2>&1
