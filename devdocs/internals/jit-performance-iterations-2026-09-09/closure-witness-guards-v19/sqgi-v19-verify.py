from pathlib import Path
import hashlib,json,collections,tempfile,shutil,subprocess,math,statistics
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'closure-witness-guards-v19';B=R/'build-jit-audit-20260909/closure-witness-guards-v19';O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for p,s in json.loads((A/'SHA256SUMS.json').read_text()).items():assert h(R/p)==s,p
manifest=json.loads((D/'source-manifest.json').read_text());assert len(manifest)==95
for p,s in manifest.items():assert h(R/p)==s,p
originals=json.loads((D/'unchanged-benchmarks-and-scripts.json').read_text());assert len(originals)==88
for p,s in originals.items():assert h(R/p)==s,p
changed=[p for p in manifest if not (O/p).exists() or h(O/p)!=h(R/p)];assert len(changed)==28
with tempfile.TemporaryDirectory(prefix='sqgi-v19-final-reconstruct-') as td:
 t=Path(td)
 for p in changed:
  if (O/p).exists():(t/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/p,t/p)
 subprocess.run(['patch','-p1','--batch','-i',str(D/'audit-runtime-tests.patch')],cwd=t,check=True,stdout=subprocess.DEVNULL)
 for p in changed:assert h(t/p)==manifest[p],p
assert h(B/'sqgi')==(D/'binary.sha256').read_text().strip()
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  log=(D/f'sqgi-precise-v19-{mode}-{enabled}-tests.log').read_text();assert '100% tests passed, 0 tests failed out of 100' in log
  detail=(D/f'sqgi-precise-v19-{mode}-{enabled}-ctest-detail.log').read_text()
  for marker in ['[coverage] executed 10 AArch64 generated-code groups','[coverage] executed AArch64 loop adaptation and lifetime contracts','[coverage] executed AArch64 native closure lifetime contract']:assert marker in detail
  if mode=='release':assert '(address reuse=1)' in detail
  assert 'FAIL:' not in detail and 'runtime error:' not in detail and 'ERROR: AddressSanitizer' not in detail
 d=json.loads((D/f'{mode}-holdouts/results.json').read_text());assert sum(len(rows[0]['rows']) for rows in d['suites'].values())==41
 if mode=='release':assert d['sha256']==h(B/'sqgi')
fails=lambda p:collections.Counter(l.strip() for l in p.read_text().splitlines() if l.startswith('FAIL:'))
x=fails(D/'sqgi-precise-v19-x64-tests.log');assert sum(x.values())==32 and x==fails(A/'precise-integer-compare-v18/sqgi-precise-v18-x64-tests.log')
for name in ['contracts','intrinsics']:
 rows=json.loads((D/'witness-route'/f'{name}.json').read_text());dead=[r for r in rows if r['type']=='OT_NULL']
 assert dead and all(r['result']==0 and r['referent']==0 for r in dead)
 assert any(r['result']==1 for r in rows)
 assert 'WITNESS_GUARD_ROUTE_VERIFIED' in (D/'witness-route'/f'{name}.log').read_text()
cs=[]
for location in ['call-regression-captures','call-regression-captures/extra']:
 d=json.loads((D/location/'code-comparison.json').read_text());cs.extend(d)
 for name,row in d.items():
  assert row['normalized_rest_matches']
  assert row['old_instructions']-row['new_instructions']==row['removed_instructions']
  assert len(row['weak_witness_arguments'])==len(row['weak_guard_sites'])
assert len(cs)==8
exit_codes=json.loads((D/'profiles/exit-code-verification.json').read_text());assert len(exit_codes)==5
assert sum(x['guard_count'] for x in exit_codes.values())==87
profiles=json.loads((D/'profiles/manifest.json').read_text());assert len(profiles)==7
for p,s in profiles.items():assert h(R/p)==s,p
for p,s in json.loads((D/'native-validation-manifest.json').read_text()).items():assert h(R/p)==s,p
s=json.loads((D/'results/summary.json').read_text());assert len(s['rows'])==56
assert math.isclose(s['speedup'],statistics.geometric_mean(r['speedup'] for r in s['rows']),rel_tol=1e-12)
f=json.loads((D/'followup-summary.json').read_text());assert len(f['profiles'])==7 and all(v['lost_samples']==0 for v in f['profiles'].values())
for w in [4,5]:
 for suite in ['owners','methods','members']:
  d=json.loads((D/f'{suite}-v18-v19-w{w}.json').read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
 d=json.loads((D/f'kernel-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 for raw in d['raw'][1:]:assert '--warmups='+str(w) in raw['command']
 d=json.loads((D/f'floats-control-w{w}.json').read_text());assert d['metadata']['runs']==5
 assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
print('VERIFIED V19: frozen source/binary/28-file audit patch; 4x100 tests, 2x41 holdouts; native weak lifetime routes; eight code comparisons; exact exits; seven profiles; unchanged full56 and both histories. Goal remains active.')
