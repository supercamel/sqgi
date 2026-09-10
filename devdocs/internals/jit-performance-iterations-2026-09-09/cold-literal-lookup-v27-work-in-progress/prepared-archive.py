from pathlib import Path
import json,hashlib,shutil,subprocess
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'cold-literal-lookup-v27';S=Path('/tmp/sqgi-cold-literal-lookup-study');B=R/'build-jit-audit-20260909/cold-literal-lookup-v27'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
subprocess.run(['python3','/tmp/sqgi-v27-verify-study.py'],check=True,cwd=R)
v=json.loads((S/'study-verification.json').read_text());assert v['performance_acceptance_checks_pass'],v
assert json.loads(Path('/tmp/sqgi-v27-emission-tier-probe/verification.json').read_text())['verified']
assert not (D/'study').exists(),'Do not overwrite a completed archive'
shutil.copytree(S,D/'study');shutil.copytree(S/'results',D/'results')
for p in Path('/tmp').glob('sqgi-v27-*'):
 if p.is_file() and p.suffix in ['.py','.sh','.log']:shutil.copy2(p,D/p.name)
for name in ['method-probe','budget-probes','budget-refined','emission-tier-probe']:
 shutil.copytree(Path('/tmp/sqgi-v27-'+name),D/name)
shutil.copy2(S/'study-verification.json',D)
settings={}
for line in Path('/tmp/sqgi-scalar-leaf-20260909/CMakeCache.txt').read_text().splitlines():
 if '=' not in line or line.startswith(('#','//')):continue
 key,value=line.split('=',1);name=key.split(':',1)[0]
 if name.startswith(('CMAKE_CXX_FLAGS','CMAKE_BUILD_TYPE','CMAKE_CXX_COMPILER','SQGI_PGO','SQGI_ENABLE_LTO','SQGI_ENABLE_ASAN','SQ_ENABLE_JIT')):settings[name]=value
(D/'release-build-settings.json').write_text(json.dumps(settings,indent=2)+'\n')
r=v['runtime_ratios'];p=v['profitability'];speed=v['full56_speedup_over_audit']
pilots=json.loads((S/'pilot-verification.json').read_text());method_ratios=[row['geomean'][label] for key,row in pilots['groups'].items() if key.startswith('methods') for label in ['v27','v27_repeat']]
(D/'README.md').write_text(f'''# V27 cold literal lookup — accepted performance iteration

Frozen binary SHA256: `{v['binary_sha256']}`.

The unchanged 56-component, five-round study measures **{speed:.9f}× audit**
speedup. Node/GJS geometric runtime ratios are **{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**;
p90 ratios are **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No full56 component regresses
by more than 5% versus the audit. V27 is the latest accepted performance result.
[Full results](results/summary.json) retain all 56 equally weighted components;
application seed83 remains separate and unweighted.

Cold immutable string/integer/boolean keys now check the current table or
instance-class first bucket directly. Full type and identity checks precede
slot access, and instance fields also check member encoding and bounds. A
successful lookup fills only the activation-local borrowed cache. Collisions,
equal non-interned strings, missing fields, class methods and unsuitable
receivers use the existing checked helper. Existing weak-value, temporary-swap,
nonfinal-release, ancestor-journal and precise-exit behavior is preserved.

Methods pilots use {min(method_ratios):.6f}–{max(method_ratios):.6f} of V26 time
across both warmup histories and identical-binary repeats. All fourteen paired
control groups pass, including both application seeds and identical repeats;
no >5% regression versus V26 appears. See [controls](study/regression-control-summary.json).

An actual native trace verifies 84 successful native returns from transfer and
publish: constant GET/GETK/SET helper calls fall from 252 to zero. All 56 code-size
fixtures execute natively; fourteen prove that the larger lookup code falls back
to the original layout at the same optimization tier. Resource-failure probes
cover nine cases, including cold lookup installation and later retry. Diagnostic
setup failures and their corrections are retained. Six fresh native captures
verify 137 exact resume guards; [code comparison](study/native-code-comparison.json)
records size changes and pointer-normalized comparisons. The separate emission
tier probe verifies that rotate_buffers tries tiers6/5/4/3 before fitting tier2
at7884 bytes. All six probe captures match independent native captures after
pointer normalization. [Fresh profile and tail evidence](study/profile-followup.md)
retains the remaining engine gaps and helper costs.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Eleven AArch64 coverage markers execute, including fourteen native groups
in the side-exit suite. x64 retains the same 32 known assertions. All 96 source
hashes and 88 unchanged benchmark/script hashes are verified; the audit source
reconstruction remains reproducible. All seven fresh profiles have zero lost samples.

JIT-on/off geometric runtime ratios are owners **{p['owners']['geomean_on_over_off']:.6f}** and
methods **{p['methods']['geomean_on_over_off']:.6f}**; root_integer is **{p['roots']['per_case_on_over_off']['root_integer']:.6f}**.
First milestone met: **{v['first_milestone_met']}**. Engine ratio targets met:
**{v['goal_targets_met']}**. Fresh matched PGO/LTO remains outstanding; this
iteration does not complete the full goal.
''')
report=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';assert '\n## V27:' not in report.read_text()
report.write_text(report.read_text()+f'''\n\n## V27: guarded cold literal lookup

Cold constant-key table and instance-field access now probes the current first
bucket, preserving full type/identity/bounds checks and checked helper fallback.
Tracing verifies 252 helper calls eliminated across 84 successful native returns.
All four 100-test runs, both 41-case holdouts, resource probes and 137 exact native
resume guards pass; x64 keeps its 32 known assertions. All fourteen paired
control groups pass with no >5% regression against V26.

Fresh full56 speedup is **{speed:.9f}× audit**; Node/GJS geometric ratios are
**{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**, p90 **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No component regresses >5% versus
the audit. [V27 evidence](jit-performance-iterations-2026-09-09/cold-literal-lookup-v27/README.md)
retains all timings, seven profiles, controls, source/binary identities and native
probes. V27 is the latest accepted performance result. Methods use
{p['methods']['geomean_on_over_off']:.6f}× JIT-off time. First milestone met:
{v['first_milestone_met']}; engine ratio targets met: {v['goal_targets_met']}.
Matched PGO/LTO remains outstanding.
''')
next_steps=A/'precise-next-steps.md';next_steps.write_text(next_steps.read_text()+f'''\nV27 acceptance is complete. Latest full56 is {speed:.9f}×audit;
Node/GJS geo {r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}, p90
{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}. All controls and seven profiles pass.
Use fresh profile evidence to select the next general improvement; preserve
precise ownership/exit checks and same-tier code-size fallback. Matched PGO/LTO
and the full goal remain outstanding.\n''')
W=A/'cold-literal-lookup-v27-work-in-progress/README.md';W.write_text(W.read_text()+'''\nV27 is now accepted. Completed immutable evidence lives in the sibling
cold-literal-lookup-v27 directory; this directory preserves draft diagnostics.\n''')
(D/'pending-acceptance.md').write_text('V27 acceptance has completed. See README.md and study-verification.json. The full performance goal remains active.\n')
manifest={str(p.relative_to(D)):h(p) for p in sorted(D.rglob('*')) if p.is_file() and p.name!='artifact-manifest.json'}
(D/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for path,want in manifest.items():assert h(D/path)==want,path
print('ACCEPTED V27; sealed',len(manifest),'artifact files')
