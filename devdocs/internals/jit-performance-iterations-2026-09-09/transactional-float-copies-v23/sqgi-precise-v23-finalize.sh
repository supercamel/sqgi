#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
python3 - <<'NOTE'
from pathlib import Path
D=Path('devdocs/internals/jit-performance-iterations-2026-09-09/transactional-float-copies-v23');p=D/'WORK-IN-PROGRESS.md'
if p.exists():
 (D/'measurement-progress-log.md').write_text('Historical progress note; superseded by README.md and final validation.\n\n'+p.read_text());p.unlink()
NOTE
python3 /tmp/sqgi-v23-archive.py > /tmp/sqgi-precise-v23-archive.log 2>&1
python3 - <<'PY'
from pathlib import Path
import shutil,subprocess,os
R=Path.cwd();A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'transactional-float-copies-v23';W=D/'receiver-publication';W.mkdir()
for name in ['witness','witness.cpp']:shutil.copy2(A/'local-slot-forwarding-v22/receiver-publication'/name,W/name)
for label,version in [('v22','local-slot-forwarding-v22'),('candidate','transactional-float-copies-v23')]:
 p=subprocess.run([str(W/'witness')],env=dict(os.environ,LD_LIBRARY_PATH=str(R/f'build-jit-audit-20260909/{version}/native-validation')),capture_output=True,text=True)
 (W/f'{label}.log').write_text(p.stdout+p.stderr);assert p.returncode==0 and 'status=0 releases=0 callback_sum=-1 frame_sum=0' in p.stdout
shutil.copy2('/tmp/sqgi-precise-intrinsic-design.md',D/'next-intrinsic-experiment.md')
PY
python3 /tmp/sqgi-v23-report.py > /tmp/sqgi-precise-v23-report.log 2>&1
python3 /tmp/sqgi-v23-seal.py > /tmp/sqgi-precise-v23-seal.log 2>&1
python3 /tmp/sqgi-v23-verify.py > /tmp/sqgi-precise-v23-verify.log 2>&1
