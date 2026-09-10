from pathlib import Path
import json,hashlib,shutil,subprocess
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'shared-helper-v28';S=Path('/tmp/sqgi-shared-helper-study');B=R/'build-jit-audit-20260909/shared-helper-v28'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
subprocess.run(['python3','/tmp/sqgi-v28-verify-study.py'],check=True,cwd=R)
v=json.loads((S/'study-verification.json').read_text());assert v['performance_acceptance_checks_pass'],v
assert json.loads(Path('/tmp/sqgi-v28-emission-tier-probe/verification.json').read_text())['verified']
assert not (D/'study').exists(),'Do not overwrite a completed archive'
shutil.copytree(S,D/'study');shutil.copytree(S/'results',D/'results')
for p in Path('/tmp').glob('sqgi-v28-*'):
 if p.is_file() and p.suffix in ['.py','.sh','.log']:shutil.copy2(p,D/p.name)
for name in ['buffer-probe','budget-preservation','tail-budget','emission-tier-probe','shared-helper-fit','shared-helper-fit-refined','records-probe','buffer-pc-profile']:
 shutil.copytree(Path('/tmp/sqgi-v28-'+name),D/name)
shutil.copy2(S/'study-verification.json',D)
settings={}
for line in Path('/tmp/sqgi-scalar-leaf-20260909/CMakeCache.txt').read_text().splitlines():
 if '=' not in line or line.startswith(('#','//')):continue
 key,value=line.split('=',1);name=key.split(':',1)[0]
 if name.startswith(('CMAKE_CXX_FLAGS','CMAKE_BUILD_TYPE','CMAKE_CXX_COMPILER','SQGI_PGO','SQGI_ENABLE_LTO','SQGI_ENABLE_ASAN','SQ_ENABLE_JIT')):settings[name]=value
(D/'release-build-settings.json').write_text(json.dumps(settings,indent=2)+'\n')
r=v['runtime_ratios'];p=v['profitability'];speed=v['full56_speedup_over_audit']
control_note='All fourteen paired controls have no greater-than-5% flag against V27.'
if v['control_regressions_over_5pct']:
 assert v['control_regression_resolution'] and not v['unresolved_control_regressions']
 control_note=('Initial records_4096 controls flagged +6.79% in the seed83 repeat and '
  '+8.59%/+8.82% in both seed17 copies with five warmups. A fixed four-block '
  'replication retains all eight cases, both seeds/counts, both warmup histories '
  'and identical repeats of both versions (40 new samples per version/history/seed). '
  'For every case/seed/history, both new-only and original-plus-new 95% paired '
  'bootstrap upper bounds are <=1.05. Original flags and raw data remain in '
  '[controls](study/regression-control-summary.json) and '
  '[replication](study/records-replication/analysis.json). This resolves the flags '
  'under the predeclared measured criterion; it does not rule out every host or runtime effect.')
pilots=json.loads((S/'pilot-verification.json').read_text())
ratios=[value[label] for key,row in pilots['groups'].items() if key.startswith('members') for name,value in row['per_case'].items() if name.startswith('buffers_') for label in ['v28','v28_repeat']]
text=f'''# V28 shared helper setup — accepted performance iteration

Frozen binary SHA256: `{v['binary_sha256']}`.

The unchanged 56-component, five-round study measures **{speed:.9f}× audit**
speedup. Node/GJS geometric runtime ratios are **{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**;
p90 ratios are **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No full56 component regresses
by more than 5% versus the audit. Application seed83 remains
separate and unweighted. [Full results](results/summary.json) retain all 56 cases.

{control_note}

Shared helper argument setup preserves native fast paths when the original
layout exhausts the existing 8192-byte budget. All original layouts are attempted
at each tier before shared setup. Buffer rotation now fits tier 3 at 7408 bytes,
versus tier 2 at 7884 bytes. Its actual trace makes four successful native returns
per version: checked helper calls fall 1772→1244 (GETK 464→8; GET 76→4).
Buffer pilots use {min(ratios):.6f}–{max(ratios):.6f} of V27 time across both
warmup histories and identical-binary repeats. The other five canonical
captures and all 16 previous boundary layouts preserve pointer-normalized code.

All 24 tail-budget fixtures execute natively; 20 observed tail-only overflow
attempts retry lower tiers. The 8192/8196-byte boundary is covered. Eleven
resource cases verify reference behavior and failure/retry, including shared
rich code. Diagnostics retain setup failures and their corrections. Six fresh
native captures verify 137 exact resume guards. All four 100-test release/strict
sanitizer runs and both 41-case holdout sets pass; 15 native groups execute.
x64 retains the same 32 known assertions. All 96 source and 88 unchanged benchmark
hashes are verified. All seven fresh profiles have zero lost samples.

An additional diagnostic captures code and PC samples in the same process.
Across four successful buffer native calls it records 2801 samples, with 172
(6.14%) in the shared helper block. These samples can skid and are not causal
speedup estimates. Boundary debugger stops and zero warmups make this separate
from accepted timings. Setup failures and their fixes remain archived.

JIT-on/off geometric runtime ratios are owners **{p['owners']['geomean_on_over_off']:.6f}** and
methods **{p['methods']['geomean_on_over_off']:.6f}**; root_integer is **{p['roots']['per_case_on_over_off']['root_integer']:.6f}**.
[Per-case profitability and acceptance](study-verification.json) retain every
remaining interpreter regression. First milestone met: **{v['first_milestone_met']}**.
Engine ratio targets met: **{v['goal_targets_met']}**. Fresh matched PGO/LTO remains
outstanding; this iteration does not complete the full goal.
'''
(D/'README.md').write_text(text)
report=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';prior=report.read_text();start=prior.index('\n## V28:');assert '\n## V29:' not in prior
report.write_text(prior[:start]+f'''\n## V28: shared helper setup

Shared helper setup retains tier 3 native member reads within the unchanged
8192-byte buffer. Actual checked helper calls fall 1772→1244, with code shrinking
7884→7408 bytes. Both warmup histories and candidate repeats agree on the buffer
improvement. All control flags have been investigated and resolved under the
predeclared fixed-replication criterion; original results are retained.
Semantic and native gates pass.

Fresh full56 speedup is **{speed:.9f}× audit**; Node/GJS geometric ratios are
**{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**, p90 **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**.
[V28 evidence](jit-performance-iterations-2026-09-09/shared-helper-v28/README.md)
retains unchanged full56/both-seed timings, seven profiles, source and binary
identities, resource/boundary probes, and interpreter profitability. V28 is the
latest accepted performance result. First milestone: {v['first_milestone_met']};
engine targets: {v['goal_targets_met']}. Matched PGO/LTO remains outstanding.
''')
# Seal only after every local artifact has its final content.
manifest={str(p.relative_to(D)):h(p) for p in sorted(D.rglob('*')) if p.is_file() and p.name!='artifact-manifest.json'}
(D/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(h(D/path)==want for path,want in manifest.items())
print('V28 accepted and locally sealed',len(manifest),'files; global reseal remains separate')
