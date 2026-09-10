from pathlib import Path
import hashlib,json,collections,tempfile,shutil,subprocess,math,statistics,os
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'scalar-loop-entry-guards-v20';B=R/'build-jit-audit-20260909/scalar-loop-entry-guards-v20';O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for p,s in json.loads((A/'SHA256SUMS.json').read_text()).items():assert h(R/p)==s,p
manifest=json.loads((D/'source-manifest.json').read_text());assert len(manifest)==95
for p,s in manifest.items():assert h(R/p)==s,p
originals=json.loads((D/'unchanged-benchmarks-and-scripts.json').read_text());assert len(originals)==88
for p,s in originals.items():assert h(R/p)==s,p
changed=[p for p in manifest if not (O/p).exists() or h(O/p)!=h(R/p)];assert len(changed)==28
with tempfile.TemporaryDirectory(prefix='sqgi-v20-final-reconstruct-') as td:
 t=Path(td)
 for p in changed:
  if (O/p).exists():(t/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/p,t/p)
 subprocess.run(['patch','-p1','--batch','-i',str(D/'audit-runtime-tests.patch')],cwd=t,check=True,stdout=subprocess.DEVNULL)
 for p in changed:assert h(t/p)==manifest[p],p
assert h(B/'sqgi')==(D/'binary.sha256').read_text().strip()
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  log=(D/f'sqgi-precise-v20-{mode}-{enabled}-tests.log').read_text();assert '100% tests passed, 0 tests failed out of 100' in log
  detail=(D/f'sqgi-precise-v20-{mode}-{enabled}-ctest-detail.log').read_text()
  for marker in ['[coverage] executed 10 AArch64 generated-code groups','[coverage] executed AArch64 loop adaptation and lifetime contracts','[coverage] executed AArch64 native closure lifetime contract','[coverage] executed AArch64 scalar loop entry guard contracts']:assert marker in detail
  if mode=='release':assert '(address reuse=1)' in detail
  assert 'FAIL:' not in detail and 'runtime error:' not in detail and 'ERROR: AddressSanitizer' not in detail
 d=json.loads((D/f'{mode}-holdouts/results.json').read_text());assert sum(len(rows[0]['rows']) for rows in d['suites'].values())==41
 if mode=='release':assert d['sha256']==h(B/'sqgi')
fails=lambda p:collections.Counter(l.strip() for l in p.read_text().splitlines() if l.startswith('FAIL:'))
x=fails(D/'sqgi-precise-v20-x64-tests.log');assert sum(x.values())==32 and x==fails(A/'closure-witness-guards-v19/sqgi-precise-v19-x64-tests.log')
route={label:json.loads((D/'route'/f'{label}-entry.json').read_text()) for label in ['control','candidate']}
counts={label:collections.Counter(r['name'] for r in v['helpers']) for label,v in route.items()}
assert counts['control']['entry_root']==126 and counts['candidate']['entry_root']==3
assert route['candidate']['entries']=={'entry_root':3,'entry_parameter':3}
assert counts['candidate']['entry_parameter']==3
assert all(r['result']==1 for r in route['candidate']['helpers'])
r=json.loads((D/'route/entry-route-summary.json').read_text());assert r['candidate']['total_loop_attempts']==r['candidate']['total_loop_successes']==6 and r['candidate']['total_loop_guard_failures']==0
assert r['control']['parameter_including_alternate']=={'failures':11,'attempts':12,'successes':1,'compiles':2}
cs=json.loads((D/'entry-code-summary.json').read_text());assert len(cs)==8
assert all(r['normalized_core_matches'] for r in cs.values())
assert cs['pressure-loop']['bypassed_sites']==8 and cs['pressure-loop']['unique_entry_checks']==1
assert all(r['hoisted']==(k!='array_append_kernel-entry') for k,r in cs.items())
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
  d=json.loads((D/f'{suite}-v19-v20-w{w}.json').read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
 d=json.loads((D/f'kernel-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 for raw in d['raw'][1:]:assert '--warmups='+str(w) in raw['command']
 d=json.loads((D/f'floats-control-w{w}.json').read_text());assert d['metadata']['runs']==5
 assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
for label,engine,expected in [('candidate',B/'native-validation',1),('v19',R/'build-jit-audit-20260909/closure-witness-guards-v19/native-validation',0)]:
 p=subprocess.run([str(D/'receiver-publication/witness')],env=dict(os.environ,LD_LIBRARY_PATH=str(engine)),capture_output=True,text=True)
 assert p.returncode==expected,(label,p.returncode,p.stdout,p.stderr)
 assert ('status=1 releases=1 callback_sum=28 frame_sum=28' if label=='candidate' else 'status=0 releases=0 callback_sum=-1 frame_sum=0') in p.stdout
assert '**Rejected after measurement:**' in (D/'README.md').read_text()
print('VERIFIED REJECTED V20 archive: frozen evidence, full timings/profiles and prior gates preserved; the additional publication witness fails V20 and passes V19. V20 is not accepted. Goal remains active.')
