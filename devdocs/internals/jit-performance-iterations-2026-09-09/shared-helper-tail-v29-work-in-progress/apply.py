from pathlib import Path
import json,hashlib,shutil,difflib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';P=A/'shared-helper-v28';W=A/'shared-helper-tail-v29-work-in-progress';D=Path('/tmp/sqgi-v29-tail-helper-draft');B=Path('/tmp/sqgi-precise-before-v29')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert json.loads((P/'study-verification.json').read_text())['performance_acceptance_checks_pass']
manifest=json.loads((P/'source-manifest.json').read_text());assert len(manifest)==96
for name,want in manifest.items():assert h(R/name)==want,name
m=json.loads((D/'manifest.json').read_text());assert len(m['source_inputs'])==2
for name,want in m['source_inputs'].items():assert h(R/name)==want and manifest[name]==want,name
for name,want in m['source_outputs'].items():assert h(D/name)==want,name
assert not B.exists();B.mkdir()
for name in manifest:
 dest=B/name;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(R/name,dest)
for name in m['source_outputs']:(R/name).write_bytes((D/name).read_bytes())
current={name:h(R/name) for name in manifest};assert {name for name in manifest if current[name]!=manifest[name]}==set(m['source_outputs'])
(W/'applied-source-manifest.json').write_text(json.dumps(current,indent=2)+'\n')
(W/'applied-delta.patch').write_text(''.join(''.join(difflib.unified_diff((B/name).read_text().splitlines(True),(R/name).read_text().splitlines(True),'a/'+name,'b/'+name)) for name in m['source_outputs']))
(W/'application-status.json').write_text(json.dumps({'applied':True,'compiled':False,'measured':False,'accepted_base':'shared-helper-v28','backup':str(B),'changed_files':list(m['source_outputs']),'native_groups_expected':15,'shared_fixture_forms':['24-add rich','56-add compact'],'tail_bytes':24,'tail_branch_instruction':'BR x16','latest_accepted_full56_speedup':1.8813082824683165},indent=2)+'\n')
shutil.copy2(__file__,W/'apply.py')
print('Applied V29 tail-helper change after backing up and verifying all 96 V28 source files')
