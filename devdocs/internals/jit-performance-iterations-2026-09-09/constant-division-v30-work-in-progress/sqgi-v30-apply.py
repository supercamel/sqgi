from pathlib import Path
import json,hashlib,shutil,difflib
R=Path('/home/sam/Programming/sqgi')
A=R/'devdocs/internals/jit-performance-iterations-2026-09-09'
P=A/'shared-helper-tail-v29';W=A/'constant-division-v30-work-in-progress'
D=Path('/tmp/sqgi-v30-constant-division-draft');B=Path('/tmp/sqgi-precise-before-v30')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert json.loads((P/'study-verification.json').read_text())['performance_acceptance_checks_pass']
seal=json.loads((P/'artifact-manifest.json').read_text())
assert all(h(P/p)==want for p,want in seal.items()),'Accepted V29 seal changed'
manifest=json.loads((P/'source-manifest.json').read_text());assert len(manifest)==96
assert all(h(R/p)==want for p,want in manifest.items()),'Production source drifted from V29'
inputs=json.loads((D/'input-manifest.json').read_text())
outputs=json.loads((D/'draft-manifest.json').read_text())
assert len(inputs)==8 and inputs.keys()==outputs.keys()
extra={p:want for p,want in inputs.items() if p not in manifest}
assert set(extra)=={'test/cpp/test_sqjit_arithmetic.cpp'}
for p,want in extra.items():
    original=Path('/tmp/sqgi-profile-20260909/source')/p
    assert h(original)==want and h(R/p)==want,p
manifest.update(extra)
assert len(manifest)==97
for p,want in inputs.items(): assert h(R/p)==want and manifest[p]==want,p
for p,want in outputs.items(): assert h(D/p)==want,p
preflight=json.loads(Path('/tmp/sqgi-v30-lowlevel-preflight/verification.json').read_text())
assert preflight['verified']
for p,want in preflight['inputs'].items(): assert h(D/p)==want,p
assert not B.exists();B.mkdir()
for p in manifest:
    dest=B/p;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(R/p,dest)
for p in outputs: (R/p).write_bytes((D/p).read_bytes())
current={p:h(R/p) for p in manifest}
assert {p for p in manifest if current[p]!=manifest[p]}==set(outputs)
(W/'additional-source-inputs.json').write_text(json.dumps({'source':'original audit snapshot, unchanged since audit','files':extra},indent=2)+'\n')
(W/'applied-source-manifest.json').write_text(json.dumps(current,indent=2)+'\n')
(W/'applied-delta.patch').write_text(''.join(''.join(difflib.unified_diff(
    (B/p).read_text().splitlines(True),(R/p).read_text().splitlines(True),'a/'+p,'b/'+p)) for p in outputs))
(W/'application-status.json').write_text(json.dumps({'applied':True,'compiled':False,'measured':False,
    'accepted_base':'shared-helper-tail-v29','backup':str(B),'changed_files':list(outputs),
    'native_groups_expected':16,'lowlevel_preflight_verified':True},indent=2)+'\n')
shutil.copy2(__file__,W/'apply.py')
print('Applied V30 after preserving all 96 accepted V29 source files plus the unchanged audit arithmetic test; full compiler validation pending')
