from pathlib import Path
import json,hashlib,shutil,subprocess
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-integer-compare-v18';B=R/'build-jit-audit-20260909/precise-integer-compare-v18';S=Path('/tmp/sqgi-precise-integer-compare-study')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert h(B/'sqgi')==(D/'binary.sha256').read_text().strip()
for p,s in json.loads((D/'source-manifest.json').read_text()).items():assert h(R/p)==s,p
for p,s in json.loads((D/'unchanged-benchmarks-and-scripts.json').read_text()).items():assert h(R/p)==s,p
old=json.loads((A/'SHA256SUMS.json').read_text())
for p,s in old.items():assert h(R/p)==s,p
print('Verified',len(old),'existing artifact hashes')
assert json.loads((S/'results/summary.json').read_text())['aggregation'].startswith('56 equally weighted')
assert len(json.loads((S/'followup-summary.json').read_text())['profiles'])==7
assert len(json.loads((S/'profiles/native-summary.json').read_text()))==5
shutil.copytree(S,D,dirs_exist_ok=True,ignore=shutil.ignore_patterns('*.data','*.data.old'))
(B/'profiles').mkdir(exist_ok=True);manifest={}
for p in (S/'profiles').glob('*.data'):
 q=B/'profiles'/p.name;shutil.copy2(p,q);manifest[str(q.relative_to(R))]=h(q)
assert len(manifest)==7
(D/'profiles/manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for p in Path('/tmp').glob('sqgi-precise-v18-*.log'):shutil.copy2(p,D/p.name)
for name in ['sqgi-precise-v18-measure.sh','sqgi-precise-v18-analyze.py','sqgi-precise-v18-native-summary.py','sqgi-precise-v18-archive.py','sqgi-precise-v18-exit-code.py','sqgi-precise-v18-gates.sh','sqgi-precise-v18-report.py','sqgi-precise-v18-edit.py','sqgi-precise-v18-tests.txt','sqgi-freeze-v18.py','sqgi-precise-v18-route.py','sqgi-precise-v18-scaffold.py','sqgi-precise-v18-fixtures.py','sqgi-precise-v18-activation.py','sqgi-precise-v18-closure-lifetime.py','sqgi-precise-v18-compact.py','sqgi-precise-v18-compact-probe.py','sqgi-precise-v18-compact-verify.py','sqgi-precise-v18-kernel-control.py','sqgi-precise-v18-controls.sh','sqgi-precise-v18-call-capture.py','sqgi-precise-v18-control-summary.py','sqgi-precise-v18-call-code.py','sqgi-precise-v18-extra-call-capture.py','sqgi-precise-v18-extra-call-code.py','sqgi-precise-v18-extra-call-code-initial.py','sqgi-precise-v18-control-report.py']:shutil.copy2(Path('/tmp')/name,D/name)
# Preserve the newly activated test executables with their exact shared engine.
validation=B/'native-validation';validation.mkdir(exist_ok=True);validation_hashes={}
for source,name in [('libsqgi.so.1.0.0','libsqgi.so.1'),('sqgi_test_cpp_sqjit_side_exit','sqgi_test_cpp_sqjit_side_exit'),('sqgi_test_cpp_sqjit_contracts','sqgi_test_cpp_sqjit_contracts')]:
 q=validation/name;shutil.copy2(Path('/tmp/sqgi-scalar-leaf-20260909')/source,q);validation_hashes[str(q.relative_to(R))]=h(q)
(D/'native-validation-manifest.json').write_text(json.dumps(validation_hashes,indent=2)+'\n')
(D/'native-validation.txt').write_text('The retained Release test executables load the retained engine with LD_LIBRARY_PATH='+str(validation)+'. Their source hashes match the frozen V18 snapshot.\n')
print('Archived complete V18 study; reports and global manifest still to update')
