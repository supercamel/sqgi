from pathlib import Path
import json, hashlib, shutil, subprocess

R=Path('/home/sam/Programming/sqgi')
A=R/'devdocs/internals/jit-performance-iterations-2026-09-09'
D=A/'shared-helper-tail-v29'
S=Path('/tmp/sqgi-shared-helper-tail-study')
B=R/'build-jit-audit-20260909/shared-helper-tail-v29'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
subprocess.run(['python3','/tmp/sqgi-v29-verify-study.py'],check=True,cwd=R)
v=json.loads((S/'study-verification.json').read_text())
assert v['performance_acceptance_checks_pass'],v
assert not v['control_regressions_over_5pct'], 'Investigate flags explicitly before acceptance'
assert not (D/'study').exists(), 'Do not overwrite a completed archive'
for name in ['buffer-probe','budget-preservation','tail-budget','emission-tier-probe','allocation-fault']:
    assert json.loads(Path('/tmp/sqgi-v29-'+name+'/verification.json').read_text())['verified']
shutil.copytree(S,D/'study')
shutil.copytree(S/'results',D/'results')
for p in Path('/tmp').glob('sqgi-v29-*'):
    if p.is_file() and p.suffix in ['.py','.sh','.log']:
        shutil.copy2(p,D/p.name)
for name in ['buffer-probe','budget-preservation','tail-budget','emission-tier-probe']:
    shutil.copytree(Path('/tmp/sqgi-v29-'+name),D/name)
shutil.copy2(S/'study-verification.json',D)
settings={}
for line in Path('/tmp/sqgi-scalar-leaf-20260909/CMakeCache.txt').read_text().splitlines():
    if '=' not in line or line.startswith(('#','//')): continue
    key,value=line.split('=',1); name=key.split(':',1)[0]
    if name.startswith(('CMAKE_CXX_FLAGS','CMAKE_BUILD_TYPE','CMAKE_CXX_COMPILER','SQGI_PGO','SQGI_ENABLE_LTO','SQGI_ENABLE_ASAN','SQ_ENABLE_JIT')):
        settings[name]=value
(D/'release-build-settings.json').write_text(json.dumps(settings,indent=2)+'\n')
r=v['runtime_ratios']; p=v['profitability']; speed=v['full56_speedup_over_audit']
pilots=json.loads((S/'pilot-verification.json').read_text())
ratios=[value[label] for key,row in pilots['groups'].items() if key.startswith('members')
        for name,value in row['per_case'].items() if name.startswith('buffers_')
        for label in ['v29','v29_repeat']]
body=f'''# V29 shared helper tail branch — accepted performance iteration

Frozen binary SHA256: `{v['binary_sha256']}`.

The unchanged 56-component, five-round study measures **{speed:.9f}× audit**
speedup. Node/GJS geometric runtime ratios are **{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**;
p90 ratios are **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No full56 component
regresses by more than 5% versus the audit. Application seed83 remains separate
and unweighted. [Full results](results/summary.json) retain all 56 components.

All fourteen paired control groups have no greater-than-5% flag against V28.
Both baseline and candidate copies are retained; primary-baseline flags are
not suppressed by the supplemental paired-copy ratios. Both application
seeds/counts and warmup histories remain in the controls.

The shared helper block prepares canonical arguments and tail-branches through
x16, allowing the checked helper to return directly to the original call site.
It shrinks from 40 to 24 bytes; rotate_buffers shrinks 7408→7392 bytes at the
same tier. Its body is pointer-normalized equal and its actual helper count
remains 1244 over four successful native returns. The buffer pilots across both warmup histories
and candidate copies use {min(ratios):.6f}–{max(ratios):.6f} of V28 runtime.
All seventeen unrelated native captures and sixteen previously fitting
boundary layouts retain pointer-normalized code.

All 24 tail-budget fixtures execute natively. Twelve tail-only overflow
attempts retry lower tiers; the 8192/8196-byte boundary is covered. Thirteen
resource cases cover reference behavior, allocation/install failure and retry,
including rich and compact shared code. Six native captures verify 137 exact
resume guards. All four 100-test release/strict sanitizer runs and both 41-case
holdout sets pass; 15 native groups execute. x64 retains its 32 known assertions.
All 96 source and 88 unchanged benchmark hashes are verified. Seven fresh
profiles have zero lost samples. [Profile and tail review](study/profile-followup.md).

JIT-on/off geometric runtime ratios are owners **{p['owners']['geomean_on_over_off']:.6f}**,
methods **{p['methods']['geomean_on_over_off']:.6f}**, and root_integer
**{p['roots']['per_case_on_over_off']['root_integer']:.6f}**.
[Per-case profitability](study-verification.json) retains remaining interpreter
regressions. First milestone met: **{v['first_milestone_met']}**.
Engine ratio targets met: **{v['goal_targets_met']}**. Fresh matched PGO/LTO
remains outstanding; this iteration does not complete the goal.
'''
(D/'README.md').write_text(body)
report=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md'
old=report.read_text(); start=old.index('\n## V29:')
assert '\n## V30:' not in old
report.write_text(old[:start]+f'''
## V29: shared helper tail branch

V29 is accepted. The shared helper block shrinks from 40 to 24 bytes and
returns directly to the original call-site continuation. Buffer runtime falls
by about 4.3–4.6% in the pilots. Full56 speedup is **{speed:.9f}× audit**;
Node/GJS geometric runtime ratios are **{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**,
p90 **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. All fourteen paired control
groups have no >5% flag against V28, retaining both versions' repeats and both
application seeds/counts and warmup histories. Semantic and native gates pass;
x64 retains the same 32 known assertions.

[V29 evidence](jit-performance-iterations-2026-09-09/shared-helper-tail-v29/README.md)
retains full results, seven fresh profiles, exact native captures, source and
binary identities, resource/budget probes and interpreter profitability.
V29 is the latest accepted full result. First milestone: {v['first_milestone_met']};
engine targets: {v['goal_targets_met']}. Matched PGO/LTO remains outstanding.
''')
manifest={str(p.relative_to(D)):h(p) for p in sorted(D.rglob('*'))
          if p.is_file() and p.name!='artifact-manifest.json'}
(D/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(h(D/path)==want for path,want in manifest.items())
print('V29 accepted and locally sealed',len(manifest),'files; global reseal remains separate')
