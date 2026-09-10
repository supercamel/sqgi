from pathlib import Path
import json,hashlib,shutil,difflib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';P=A/'owning-postincrement-v26';W=A/'cold-literal-lookup-v27-work-in-progress';D=Path('/tmp/sqgi-v27-draft');backup=Path('/tmp/sqgi-precise-before-v27')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert (P/'artifact-manifest.json').exists(),'Finish V26 acceptance before applying the next iteration'
assert json.loads((P/'study-verification.json').read_text())['performance_acceptance_checks_pass']
manifest=json.loads((P/'source-manifest.json').read_text());assert len(manifest)==96
for p,want in manifest.items():assert h(R/p)==want,p
assert not backup.exists();backup.mkdir()
for p,want in manifest.items():
 target=backup/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(R/p,target);assert h(target)==want,p
files={'sqjit_backend_aarch64_precise.inc':'Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc','test_sqjit_side_exit.cpp':'test/cpp/test_sqjit_side_exit.cpp'}
for name,path in files.items():
 assert h(D/name)==h(W/name),(name,'draft differs from reviewed archived copy')
 shutil.copy2(D/name,R/path)
changed=[p for p,want in manifest.items() if h(R/p)!=want];assert set(changed)==set(files.values())
(W/'applied-delta.patch').write_text(''.join(''.join(difflib.unified_diff((backup/p).read_text().splitlines(True),(R/p).read_text().splitlines(True),'a/'+p,'b/'+p)) for p in changed))
(W/'applied-source-manifest.json').write_text(json.dumps({p:h(R/p) for p in manifest},indent=2)+'\n')
(W/'application-status.json').write_text(json.dumps({'applied':True,'compiled':False,'base':'owning-postincrement-v26','backup':str(backup),'changed_files':changed},indent=2)+'\n')
print('Applied V27 two-file draft; verified backup of all 96 V26 source files')
