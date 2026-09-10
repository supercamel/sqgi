from pathlib import Path
import json,hashlib,tempfile,subprocess,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-native-copy-v14';O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
patch=D/'audit-runtime-tests.patch';paths=[s[6:] for s in patch.read_text().splitlines() if s.startswith('+++ b/')];assert len(paths)==27
with tempfile.TemporaryDirectory(prefix='sqgi-v14-final-reconstruction-') as td:
 t=Path(td)
 for p in paths:
  if (O/p).exists():(t/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/p,t/p)
 subprocess.run(['patch','-p1','--batch','-i',str(patch)],cwd=t,check=True,stdout=subprocess.DEVNULL)
 for p in paths:assert h(t/p)==h(R/p),p
for file,n in [('source-manifest.json',94),('unchanged-benchmarks-and-scripts.json',88)]:
 d=json.loads((D/file).read_text());assert len(d)==n
 for p,s in d.items():assert h(R/p)==s,p
for p in ['release-holdouts/results.json','asan-holdouts/results.json']:
 d=json.loads((D/p).read_text());assert sum(len(v[0]['rows']) for v in d['suites'].values())==41
s=json.loads((D/'results/summary.json').read_text());assert len(s['rows'])==56 and not s['regressions_over_5pct']
f=json.loads((D/'followup-summary.json').read_text());assert len(f['profiles'])==7 and all(v['lost_samples']==0 for v in f['profiles'].values())
assert 'pending' not in (D/'README.md').read_text()
old=json.loads((A/'SHA256SUMS.json').read_text());changed={'devdocs/internals/jit-performance-iterations-2026-09-09.md','devdocs/internals/jit-performance-iterations-2026-09-09/precise-next-steps.md'}
for p,s in old.items():
 if p not in changed:assert h(R/p)==s,p
with (D/'patch-verification.txt').open('a') as f:f.write('Final combined 27-file patch reapplied and verified byte-exact after all measurements. All 94 source and 88 original benchmark/driver hashes match.\n')
shutil.copy2(__file__,D/'sqgi-precise-v14-verify.py')
files={R/p for p in old};files.update(p for p in D.rglob('*') if p.is_file());files.update(p for p in (R/'build-jit-audit-20260909/precise-native-copy-v14').rglob('*') if p.is_file());files.update(R/p for p in changed)
manifest={str(p.relative_to(R)):h(p) for p in sorted(files)};(A/'SHA256SUMS.json').write_text(json.dumps(manifest,indent=2)+'\n')
for p,s in manifest.items():assert h(R/p)==s,p
print('PASS: 27-file reconstruction; 94 source hashes; 88 unchanged benchmark/driver hashes; full56; all holdouts; 7 zero-loss profiles;',len(manifest),'global artifact hashes.')
