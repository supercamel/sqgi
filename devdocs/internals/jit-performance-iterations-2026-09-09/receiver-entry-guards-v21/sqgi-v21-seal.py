from pathlib import Path
import hashlib,json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'receiver-entry-guards-v21';B=R/'build-jit-audit-20260909/receiver-entry-guards-v21'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
p=A/'SHA256SUMS.json';old=json.loads(p.read_text())
mutable={'devdocs/internals/jit-performance-iterations-2026-09-09.md','devdocs/internals/jit-performance-iterations-2026-09-09/precise-next-steps.md'}
for key,value in old.items():
 path=R/key
 if key not in mutable and not path.is_relative_to(D) and not path.is_relative_to(B):assert h(path)==value,key
new=dict(old)
for key in mutable:new[key]=h(R/key)
for folder in [D,B]:
 for path in folder.rglob('*'):
  if path.is_file():new[str(path.relative_to(R))]=h(path)
p.write_text(json.dumps(dict(sorted(new.items())),indent=2)+'\n')
print('Sealed global manifest:',len(new),'entries; older frozen evidence unchanged')
