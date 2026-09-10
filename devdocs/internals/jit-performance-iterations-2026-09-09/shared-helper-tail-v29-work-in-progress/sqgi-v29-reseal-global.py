from pathlib import Path
import hashlib,json,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';P=A/'SHA256SUMS.json';D=A/'shared-helper-tail-v29'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert json.loads((D/'study-verification.json').read_text())['performance_acceptance_checks_pass']
for name in ['precise-length-v24','identity-publication-v25','owning-postincrement-v26','cold-literal-lookup-v27','shared-helper-v28','shared-helper-tail-v29']:
 d=A/name;manifest=json.loads((d/'artifact-manifest.json').read_text());assert all(h(d/p)==want for p,want in manifest.items()),name
old=json.loads(P.read_text());mismatches={}
for path,want in old.items():
 p=R/path;actual=h(p) if p.is_file() else None
 if actual!=want:mismatches[path]={'before':want,'after':actual}
allowed={str(A.relative_to(R)/'precise-next-steps.md'),'devdocs/internals/jit-performance-iterations-2026-09-09.md'}
prefix=str(A.relative_to(R)/'shared-helper-tail-v29-work-in-progress')+'/'
assert all(path in allowed or path.startswith(prefix) for path in mismatches),mismatches
backup=Path('/tmp/sqgi-before-v29-acceptance-SHA256SUMS.json');assert not backup.exists()
shutil.copy2(P,backup);shutil.copy2(P,A/'v29-prior-global-manifest.json')
(A/'v29-global-manifest-audit.json').write_text(json.dumps({'previous_entries':len(old),'authorized_mutable_changes':mismatches,'previous_manifest_sha256':h(backup)},indent=2)+'\n')
paths={R/p for p in old}
paths.update(p for p in A.rglob('*') if p.is_file() and p!=P)
paths.update(p for p in (R/'build-jit-audit-20260909/shared-helper-tail-v29').rglob('*') if p.is_file())
new={str(p.relative_to(R)):h(p) for p in sorted(paths)};P.write_text(json.dumps(new,indent=2)+'\n')
assert all(h(R/path)==want for path,want in new.items())
print('Verified global entries',len(new),'and unchanged V24/V25/V26/V27 plus final V29 local seals')
