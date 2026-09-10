from pathlib import Path
import shutil,difflib,json,hashlib
root=Path('/home/sam/Programming/sqgi');out=root/'devdocs/internals/jit-performance-iterations-2026-09-09/precise-length-v24-work-in-progress'
out.mkdir(exist_ok=True)
files=['Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc','Squirrel3/squirrel/jit/sqjit_backend_aarch64_compile_proto.inc','test/cpp/test_sqjit_side_exit.cpp']
base=Path('/tmp/sqgi-precise-before-v24');v23=root/'devdocs/internals/jit-performance-iterations-2026-09-09/transactional-float-copies-v23'
manifest23=json.loads((v23/'source-manifest.json').read_text())
hashfile=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for name,sha in manifest23.items(): assert hashfile(base/name)==sha,name
changed=[name for name,sha in manifest23.items() if hashfile(root/name)!=sha]
assert sorted(changed)==sorted(files),changed
patch=[];manifest={}
for name in files:
    p=root/name;dst=out/'source'/name;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,dst)
    manifest[name]=hashfile(p)
    patch.extend(difflib.unified_diff((base/name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+name,tofile='b/'+name))
(out/'changes-from-v23.patch').write_text(''.join(patch));(out/'source-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
logs=out/'development-logs';logs.mkdir(exist_ok=True)
for pattern in ['sqgi-v24-*.log','sqgi-precise-v24-*.log']:
    for p in Path('/tmp').glob(pattern): shutil.copy2(p,logs/p.name)
shutil.copytree('/tmp/sqgi-v24-allocation-fault',out/'allocation-fault',dirs_exist_ok=True)
w=out/'pre-fix-witness';w.mkdir(exist_ok=True)
for name in ['sqgi-v24-before-receiver-fix-test','sqgi-v24-before-receiver-fix-test.cpp','sqgi-v24-before-receiver-fix-proto.inc']:
    shutil.copy2(Path('/tmp')/name,w/name)
for kind in ['release','asan','callee-release','callee-asan']:
    holdouts=Path('/tmp')/('sqgi-v24-'+kind+'-holdouts')
    if holdouts.exists(): shutil.copytree(holdouts,out/(kind+'-holdouts'),dirs_exist_ok=True)
shutil.copy2(__file__,out/'archive-development.py')
(out/'source-verification.json').write_text(json.dumps({'v23_backup_files_verified':len(manifest23),'unchanged_source_files':len(manifest23)-len(changed),'changed_files':changed},indent=2)+'\n')
print(out)
