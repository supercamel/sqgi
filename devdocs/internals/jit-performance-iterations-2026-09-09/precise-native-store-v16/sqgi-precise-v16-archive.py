from pathlib import Path
import json,hashlib,shutil,subprocess
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-native-store-v16';B=R/'build-jit-audit-20260909/precise-native-store-v16';S=Path('/tmp/sqgi-precise-native-store-study')
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
for p in Path('/tmp').glob('sqgi-precise-v16-*.log'):shutil.copy2(p,D/p.name)
for name in ['sqgi-precise-v16-measure.sh','sqgi-precise-v16-analyze.py','sqgi-precise-v16-native-summary.py','sqgi-precise-v16-archive.py','sqgi-precise-v16-exit-code.py','sqgi-precise-v16-gates.sh','sqgi-precise-v16-kernel-control.py','sqgi-precise-v16-kernel-control-initial.py','sqgi-precise-v16-control-summary.py','sqgi-precise-v16-report.py','sqgi-precise-v16-array-summary.py']:shutil.copy2(Path('/tmp')/name,D/name)
print('Archived complete V16 study; reports and global manifest still to update')
