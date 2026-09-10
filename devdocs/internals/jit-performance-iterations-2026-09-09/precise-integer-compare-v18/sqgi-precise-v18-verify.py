from pathlib import Path
import json,hashlib,tempfile,subprocess,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-integer-compare-v18';O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
patch=D/'audit-runtime-tests.patch';paths=[s[6:] for s in patch.read_text().splitlines() if s.startswith('+++ b/')];assert len(paths)==27
with tempfile.TemporaryDirectory(prefix='sqgi-v18-final-reconstruction-') as td:
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
for p,digest in json.loads((D/'native-validation-manifest.json').read_text()).items():assert h(R/p)==digest,p
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  t=(D/f'sqgi-precise-v18-{mode}-{enabled}-ctest-detail.log').read_text()
  assert '[coverage] executed 10 AArch64 generated-code groups' in t
  assert '[coverage] executed AArch64 loop adaptation and lifetime contracts' in t
assert 'SQJIT_CPU_AARCH64' not in (R/'test/cpp/test_sqjit_side_exit.cpp').read_text()
assert 'SQJIT_CPU_AARCH64' not in (R/'test/cpp/test_sqjit_contracts.cpp').read_text()
for label,n in [('control',40),('candidate',4)]:
 t=(D/'route'/f'{label}.log').read_text()
 assert 'proto exec attempts=42 success=40 guard_fail=0' in t and 'proto side_exits=0' in t
 assert 'COMPARISON_ROUTE_OK 40' in t and 'exited normally' in t
 assert len(json.loads((D/'route'/f'{label}-hits.json').read_text()))==n
pub=json.loads((D/'route/temporary-publication.json').read_text())
assert len(pub)==76 and all(h['temp_type']=='OT_BOOL' and h['temp_bits']==int(h['result']==11) for h in pub)
exits=json.loads((D/'route/exit-sites.json').read_text())
assert len(exits)==32 and sum(h['result']==0 for h in exits)==24
compact=json.loads((D/'route/compact/verification.json').read_text())
assert set(compact)=={'exit_sites','cached_many'} and all(v['code_bytes']<=8192 for v in compact.values())
assert len(compact['exit_sites']['exact_guard_ips'])==122 and len(compact['cached_many']['exact_guard_ips'])==146
assert 'claims are withdrawn' in (D/'validation-correction.md').read_text()
s=json.loads((D/'results/summary.json').read_text());assert len(s['rows'])==56
assert {(r['suite'],r['name']) for r in s['regressions_over_5pct']}=={('kernels-seed17','direct_call'),('kernels-seed17','float_call'),('floats','channels_4'),('floats','pressure_8'),('floats','retained_input')}
control=json.loads((D/'regression-control-summary.json').read_text())
assert all(k in control for k in ['kernel-w4','kernel-w5','floats-w4','floats-w5','native_call_captures'])
for w in [4,5]:
 d=json.loads((D/f'kernel-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 d=json.loads((D/f'floats-control-w{w}.json').read_text());assert len(d['medians'])==7 and all(len(v)==5 for row in d['samples'].values() for v in row.values())
assert len(control['native_call_captures'])==8
for rel in ['call-regression-captures','call-regression-captures/extra']:
 d=json.loads((D/rel/'code-comparison.json').read_text());assert all(v['normalized_rest_matches'] and (v['added_instructions']==0 if k=='array_append_kernel-entry' else v['added_instructions']>0) for k,v in d.items())

f=json.loads((D/'followup-summary.json').read_text());assert len(f['profiles'])==7 and all(v['lost_samples']==0 for v in f['profiles'].values())
assert 'pending' not in (D/'README.md').read_text()
old=json.loads((A/'SHA256SUMS.json').read_text());changed={'devdocs/internals/jit-performance-iterations-2026-09-09.md','devdocs/internals/jit-performance-iterations-2026-09-09/precise-next-steps.md'}
for p,s in old.items():
 if p not in changed:assert h(R/p)==s,p
with (D/'patch-verification.txt').open('a') as f:f.write('Final combined 27-file patch reapplied and verified byte-exact after all measurements. All 94 source and 88 original benchmark/driver hashes match.\n')
shutil.copy2(__file__,D/'sqgi-precise-v18-verify.py')
files={R/p for p in old};files.update(p for p in D.rglob('*') if p.is_file());files.update(p for p in (R/'build-jit-audit-20260909/precise-integer-compare-v18').rglob('*') if p.is_file());files.update(R/p for p in changed)
manifest={str(p.relative_to(R)):h(p) for p in sorted(files)};(A/'SHA256SUMS.json').write_text(json.dumps(manifest,indent=2)+'\n')
for p,s in manifest.items():assert h(R/p)==s,p
print('PASS: 27-file reconstruction; 94 source hashes; 88 unchanged benchmark/driver hashes; full56; all holdouts; 7 zero-loss profiles;',len(manifest),'global artifact hashes.')
