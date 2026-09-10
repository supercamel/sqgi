from pathlib import Path
import hashlib,json,shutil,subprocess,os
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'receiver-entry-guards-v21';B=R/'build-jit-audit-20260909/receiver-entry-guards-v21';S=Path('/tmp/sqgi-receiver-entry-guard-study')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=json.loads((A/'SHA256SUMS.json').read_text())
for p,s in old.items():assert h(R/p)==s,p
for manifest in ['source-manifest.json','unchanged-benchmarks-and-scripts.json']:
 for p,s in json.loads((D/manifest).read_text()).items():assert h(R/p)==s,p
assert h(B/'sqgi')==(D/'binary.sha256').read_text().strip()
assert len(json.loads((S/'results/summary.json').read_text())['rows'])==56
assert len(json.loads((S/'followup-summary.json').read_text())['profiles'])==7
shutil.copytree(S,D,dirs_exist_ok=True,ignore=shutil.ignore_patterns('*.data','*.data.old'))
(B/'profiles').mkdir(exist_ok=True);manifest={}
for p in (S/'profiles').glob('*.data'):
 q=B/'profiles'/p.name;shutil.copy2(p,q);manifest[str(q.relative_to(R))]=h(q)
assert len(manifest)==7
(D/'profiles/manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for glob in ['sqgi-precise-v21-*','sqgi-v21-*.py','sqgi-freeze-v21.py']:
 for p in Path('/tmp').glob(glob):
  if p.is_file():shutil.copy2(p,D/p.name)
validation=B/'native-validation';validation.mkdir(exist_ok=True);manifest={}
for source,name in [('libsqgi.so.1.0.0','libsqgi.so.1')]+[(f'sqgi_test_cpp_sqjit_{s}',f'sqgi_test_cpp_sqjit_{s}') for s in ['side_exit','contracts','intrinsics']]:
 q=validation/name;shutil.copy2(Path('/tmp/sqgi-scalar-leaf-20260909')/source,q);manifest[str(q.relative_to(R))]=h(q)
(D/'native-validation-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
env=dict(os.environ,LD_LIBRARY_PATH=str(validation))
(D/'native-validation-ldd.log').write_text(subprocess.check_output(['ldd',str(validation/'sqgi_test_cpp_sqjit_intrinsics')],env=env,text=True))
assert str(validation/'libsqgi.so.1') in (D/'native-validation-ldd.log').read_text()
print('Archived V21; verified',len(old),'prior hashes. Reports and global manifest pending.')
