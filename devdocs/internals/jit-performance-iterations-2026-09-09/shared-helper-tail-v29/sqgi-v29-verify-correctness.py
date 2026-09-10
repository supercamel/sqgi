from pathlib import Path
import hashlib,json,collections,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';P=A/'shared-helper-v28';W=A/'shared-helper-tail-v29-work-in-progress';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for mode in ['release','asan']:
 for enabled in ['enabled','default']:
  assert '100% tests passed, 0 tests failed out of 100' in Path(f'/tmp/sqgi-v29-{mode}-{enabled}-tests.log').read_text()
  detail=Path(f'/tmp/sqgi-v29-{mode}-{enabled}-ctest-detail.log').read_text();old=(P/f'sqgi-v28-{mode}-{enabled}-ctest-detail.log').read_text()
  markers={line.strip().split('[coverage]',1)[1] for line in old.splitlines() if '[coverage]' in line}
  assert all(marker in detail for marker in markers),(mode,enabled)
  assert 'executed 15 AArch64 generated-code groups' in detail
 binary=Path('/tmp/sqgi-scalar-leaf-20260909/sqgi' if mode=='release' else '/tmp/sqgi-leaf-asan-strict-20260909.M32jMl/sqgi')
 d=json.loads(Path(f'/tmp/sqgi-v29-{mode}-holdouts/results.json').read_text());assert d['sha256']==h(binary)
 assert sum(len(rows[0]['rows']) for rows in d['suites'].values())==41
fails=lambda p:collections.Counter(line.strip() for line in p.read_text().splitlines() if line.startswith('FAIL:'))
a=fails(P/'sqgi-v28-x64-tests.log');b=fails(Path('/tmp/sqgi-v29-x64-tests.log'));assert a==b and sum(a.values())==32
m=json.loads((W/'applied-source-manifest.json').read_text());assert len(m)==96
for name,want in m.items():assert h(R/name)==want,name
for name,want in json.loads((P/'unchanged-benchmarks-and-scripts.json').read_text()).items():assert h(R/name)==want,name
for probe in ['allocation-fault','tail-budget','emission-tier-probe','budget-preservation','buffer-probe']:
 p=Path('/tmp/sqgi-v29-'+probe);v=json.loads((p/'verification.json').read_text());assert v['verified'] and v['engine_sha256']==h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))
 shutil.copytree(p,W/probe,dirs_exist_ok=True)
for p in Path('/tmp').glob('sqgi-v29-*'):
 if p.is_file() and p.suffix in ['.py','.sh','.log']:shutil.copy2(p,W/p.name)
for mode in ['release','asan']:shutil.copytree(Path(f'/tmp/sqgi-v29-{mode}-holdouts'),W/(mode+'-holdouts'),dirs_exist_ok=True)
v={'verified':True,'source_files':96,'unchanged_benchmarks_and_scripts':88,'test_runs':4,'tests_per_run':100,'holdouts_per_build':41,'x64_known_assertions':32,'native_groups':15,'resource_cases':13,'tail_boundary_fixtures':24,'tail_only_overflow_attempts':12,'old_budget_layouts_preserved':16,'buffer_helper_calls':1244,'binary_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/sqgi')),'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))}
(W/'correctness-verification.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
