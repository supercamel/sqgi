from pathlib import Path
import hashlib,json,collections,tempfile,shutil,subprocess,math,statistics,os
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'local-slot-forwarding-v22';B=R/'build-jit-audit-20260909/local-slot-forwarding-v22';O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for p,s in json.loads((A/'SHA256SUMS.json').read_text()).items():assert h(R/p)==s,p
manifest=json.loads((D/'source-manifest.json').read_text());assert len(manifest)==96
for p,s in manifest.items():assert h(R/p)==s,p
originals=json.loads((D/'unchanged-benchmarks-and-scripts.json').read_text());assert len(originals)==88
for p,s in originals.items():assert h(R/p)==s,p
changed=[p for p in manifest if not (O/p).exists() or h(O/p)!=h(R/p)];assert len(changed)==30
with tempfile.TemporaryDirectory(prefix='sqgi-v22-final-reconstruct-') as td:
 t=Path(td)
 for p in changed:
  if (O/p).exists():(t/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/p,t/p)
 subprocess.run(['patch','-p1','--batch','-i',str(D/'audit-runtime-tests.patch')],cwd=t,check=True,stdout=subprocess.DEVNULL)
 for p in changed:assert h(t/p)==manifest[p],p
assert h(B/'sqgi')==(D/'binary.sha256').read_text().strip()
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  log=(D/f'sqgi-precise-v22-{mode}-{enabled}-tests.log').read_text();assert '100% tests passed, 0 tests failed out of 100' in log
  detail=(D/f'sqgi-precise-v22-{mode}-{enabled}-ctest-detail.log').read_text()
  for marker in ['[coverage] executed 10 AArch64 generated-code groups','[coverage] executed AArch64 loop adaptation and lifetime contracts','[coverage] executed AArch64 native closure lifetime contract','[coverage] executed AArch64 scalar loop entry guard contracts','[coverage] executed AArch64 receiver publication contracts (scalar, final, nonfinal, ancestors)','[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)']:assert marker in detail
  if mode=='release':assert '(address reuse=1)' in detail
  assert 'FAIL:' not in detail and 'runtime error:' not in detail and 'ERROR: AddressSanitizer' not in detail
 d=json.loads((D/f'{mode}-holdouts/results.json').read_text());assert sum(len(rows[0]['rows']) for rows in d['suites'].values())==41
 if mode=='release':assert d['sha256']==h(B/'sqgi')
fails=lambda p:collections.Counter(l.strip() for l in p.read_text().splitlines() if l.startswith('FAIL:'))
x=fails(D/'sqgi-precise-v22-x64-tests.log');assert sum(x.values())==32 and x==fails(A/'receiver-entry-guards-v21/sqgi-precise-v21-x64-tests.log')
route={label:json.loads((D/'route'/f'{label}-entry.json').read_text()) for label in ['control','candidate']}
counts={label:collections.Counter(r['name'] for r in v['helpers']) for label,v in route.items()}
assert counts['control']['entry_root']==3 and counts['candidate']['entry_root']==3
assert route['candidate']['entries']=={'entry_root':3,'entry_parameter':3}
assert counts['candidate']['entry_parameter']==3
assert all(r['result']==1 for r in route['candidate']['helpers'])
r=json.loads((D/'route/entry-route-summary.json').read_text())
for label in ['control','candidate']:
 assert r[label]['loop_attempts']==r[label]['loop_successes']==6 and r[label]['guard_failures']==0
 assert r[label]['helper_calls']=={'entry_root':3,'entry_parameter':3}
code=json.loads((D/'forwarding-captures/code-verification.json').read_text());assert len(code)==10
assert all(v['installed_bytes_match'] and v['cache_moves']>0 for v in code.values())
assert code['pressure']['private_memory_instructions_before']==194 and code['pressure']['private_memory_instructions_after']==88
paired=json.loads((D/'paired-code-summary.json').read_text());assert len(paired)==8
assert paired['array_append_kernel-entry']['array_artifact_unchanged']
assert all(v['scratch_moves']>0 and v['entry_guard_preserved'] for k,v in paired.items() if k!='array_append_kernel-entry')
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
  d=json.loads((D/f'{suite}-v21-v22-w{w}.json').read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
 d=json.loads((D/f'kernel-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 for raw in d['raw'][1:]:assert '--warmups='+str(w) in raw['command']
 d=json.loads((D/f'floats-control-w{w}.json').read_text());assert d['metadata']['runs']==5
 assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
for w in [4,5]:
 d=json.loads((D/f'application-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 assert len(d['samples'])==8 and d['metadata']['seed']==83 and d['metadata']['iterations']==400003
 assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
for w in [4,5]:
 d=json.loads((D/f'application-seed17-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 assert len(d['samples'])==8 and d['metadata']['seed']==17 and d['metadata']['iterations']==200000
 assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
filter_code=json.loads((D/'filter-stream-captures/code-comparison.json').read_text())
assert filter_code['code_bytes']==1192 and filter_code['forwarding_scratch_moves']==0
assert len(filter_code['typed_float_copy_instruction_changes'])==10 and filter_code['remaining_code_matches_after_relocation_mask']
for seed,n in [(17,200000),(83,400003)]:
 for w in [4,5]:
  d=json.loads((D/f'filter-copy-ablation/seed{seed}-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
  assert d['metadata']['seed']==seed and d['metadata']['iterations']==n and len(d['samples'])==8
  assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
  for raw in d['raw'][1:]:assert raw['stderr'].count('[copy-ablation] exact code matched;')==1
ablation_code=json.loads((D/'filter-copy-ablation/installed-code-verification.json').read_text());assert ablation_code['exact_ten_instruction_ablation'] and len(ablation_code['changed_offsets'])==10
lifetime=json.loads((D/'native-instructions/lifetime/summary.json').read_text());assert lifetime['native_lifetime_contract_passed'] and lifetime['reused_load_addresses']>0
native=json.loads((D/'native-instructions/summary.json').read_text());assert native['lost_samples']==0 and native['native_samples']>100
assert json.loads((D/'native-instructions/overhead.json').read_text())['larger_profile_checksums_match']
for p,s in json.loads((D/'native-instructions/perf-manifest.json').read_text()).items():assert h(R/p)==s,p
for label,engine in [('candidate',B/'native-validation'),('v21',R/'build-jit-audit-20260909/receiver-entry-guards-v21/native-validation')]:
 p=subprocess.run([str(D/'receiver-publication/witness')],env=dict(os.environ,LD_LIBRARY_PATH=str(engine)),capture_output=True,text=True)
 assert p.returncode==0,(label,p.returncode,p.stdout,p.stderr)
 assert 'status=0 releases=0 callback_sum=-1 frame_sum=0' in p.stdout
for pilot in ['pilot1','pilot2']:
 for p,s in json.loads((D/'rejected-pilots'/pilot/'manifest.json').read_text()).items():assert h(R/p)==s,p
assert 'four-file V21 delta' in (D/'README.md').read_text()
assert (B/'native-validation/sqgi_test_cpp_sqjit_aarch64_emit').exists()
print('VERIFIED V22: complete selected gates, unchanged benchmarks, exact branch/instruction/installed-code checks, retained lifetime regressions, full fresh timings and profiles. Goal remains active.')
