from pathlib import Path
import json,hashlib,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'local-slot-forwarding-v22';B=R/'build-jit-audit-20260909/local-slot-forwarding-v22';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for name in ['pilot1','pilot2']:
 source=Path('/tmp/sqgi-v22-'+name);dest=D/'rejected-pilots'/name;dest.mkdir(parents=True);binary=B/'rejected-pilots'/name;binary.mkdir(parents=True)
 for p in source.rglob('*'):
  if p.is_file():
   q=(binary if p.name=='sqgi' and p.parent==source else dest)/p.relative_to(source);q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q)
 manifest={str(p.relative_to(R)):h(p) for folder in [dest,binary] for p in folder.rglob('*') if p.is_file()}
 (dest/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 (dest/'README.md').write_text('Rejected preliminary float pilot. Its three-round diagnostic timings and frozen executable/source snapshot are retained. It was not accepted and did not replace any full56 measurement. Pilot1 cached caller slots only and missed inlined temporaries. Pilot2 included temporaries but still paid unnecessary scratch/spill and integer/FP transfer costs. The final V22 candidate adds next-access decisions and typed float copies.\n')
print('Retained both rejected preliminary pilots')
