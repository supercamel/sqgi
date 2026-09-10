from pathlib import Path
import json,hashlib,shutil,subprocess,difflib,collections,tempfile
R=Path('/home/sam/Programming/sqgi'); A=R/'devdocs/internals/jit-performance-iterations-2026-09-09'; P=A/'precise-cache-proofs-v17'; D=A/'precise-integer-compare-v18'; B=R/'build-jit-audit-20260909/precise-integer-compare-v18'; S=Path('/tmp/sqgi-precise-integer-compare-study'); O=Path('/tmp/sqgi-profile-20260909/source')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  assert '100% tests passed, 0 tests failed out of 100' in Path(f'/tmp/sqgi-precise-v18-{mode}-{enabled}-tests.log').read_text()
 binary=Path('/tmp/sqgi-scalar-leaf-20260909/sqgi' if mode=='release' else '/tmp/sqgi-leaf-asan-strict-20260909.M32jMl/sqgi')
 d=json.loads(Path(f'/tmp/sqgi-precise-v18-{mode}-holdouts/results.json').read_text()); assert d['sha256']==h(binary)
 assert sum(len(rows[0]['rows']) for rows in d['suites'].values())==41
fails=lambda p:collections.Counter(line.strip() for line in p.read_text().splitlines() if line.startswith('FAIL:'))
a=fails(P/'sqgi-precise-v17-x64-tests.log'); b=fails(Path('/tmp/sqgi-precise-v18-x64-tests.log'));assert a==b and sum(a.values())==32,(a,b)
previous=json.loads((P/'source-manifest.json').read_text()); changed=[p for p,s in previous.items() if h(R/p)!=s]; assert len(changed)==5,changed
for p in changed:assert h(Path('/tmp/sqgi-precise-before-v18')/p)==previous[p]
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  detail=Path(f'/tmp/sqgi-precise-v18-{mode}-{enabled}-ctest-detail.log').read_text()
  assert '[coverage] executed 10 AArch64 generated-code groups' in detail
  assert '[coverage] executed AArch64 loop adaptation and lifetime contracts' in detail
originals=json.loads((P/'unchanged-benchmarks-and-scripts.json').read_text());assert len(originals)==88
for p,s in originals.items():assert h(R/p)==s,p
assert not D.exists() and not B.exists();D.mkdir();B.mkdir();shutil.copy2('/tmp/sqgi-scalar-leaf-20260909/sqgi',B/'sqgi')
for p in changed:
 dest=D/'source'/p;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(R/p,dest)
manifest={p:h(R/p) for p in previous};assert len(manifest)==94
(D/'source-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');shutil.copy2(P/'unchanged-benchmarks-and-scripts.json',D)
patch=''.join(''.join(difflib.unified_diff((Path('/tmp/sqgi-precise-before-v18')/p).read_text().splitlines(True),(R/p).read_text().splitlines(True),'a/'+p,'b/'+p)) for p in changed)
(D/'integer-compare-delta.patch').write_text(patch)
audit_changed=[p for p in manifest if not (O/p).exists() or h(O/p)!=h(R/p)]
patch=''.join(''.join(difflib.unified_diff((O/p).read_text().splitlines(True) if (O/p).exists() else [],(R/p).read_text().splitlines(True),'a/'+p if (O/p).exists() else '/dev/null','b/'+p)) for p in audit_changed)
(D/'audit-runtime-tests.patch').write_text(patch)
with tempfile.TemporaryDirectory(prefix='sqgi-v18-reconstruct-') as td:
 t=Path(td)
 for p in audit_changed:
  if (O/p).exists(): (t/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/p,t/p)
 subprocess.run(['patch','-p1','--batch','-i',str(D/'audit-runtime-tests.patch')],cwd=t,check=True,stdout=subprocess.DEVNULL)
 for p in audit_changed:assert h(t/p)==h(R/p),p
(D/'patch-verification.txt').write_text(f'Reconstructed all {len(audit_changed)} changed runtime/test files exactly from the original audited working tree.\n')
for p in Path('/tmp').glob('sqgi-precise-v18-*.log'):shutil.copy2(p,D/p.name)
for mode in ['release','asan']:shutil.copytree(Path(f'/tmp/sqgi-precise-v18-{mode}-holdouts'),D/f'{mode}-holdouts')
shutil.copytree(S/'route',D/'route')
(D/'binary-dependencies.txt').write_text(subprocess.check_output(['ldd',str(B/'sqgi')],text=True))
shutil.copy2(__file__,D/'freeze.py')
(D/'binary.sha256').write_text(h(B/'sqgi')+'\n')
print('FROZEN',h(B/'sqgi'),'sourcefiles',len(manifest),'auditpatch',len(audit_changed),'x64failures',sum(a.values()))
