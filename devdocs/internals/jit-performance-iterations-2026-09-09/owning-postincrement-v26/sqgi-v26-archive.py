from pathlib import Path
import json,hashlib,shutil,subprocess
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'owning-postincrement-v26';S=Path('/tmp/sqgi-owning-postincrement-study');B=R/'build-jit-audit-20260909/owning-postincrement-v26'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
subprocess.run(['python3','/tmp/sqgi-v26-verify-study.py'],check=True,cwd=R)
v=json.loads((S/'study-verification.json').read_text());assert v['performance_acceptance_checks_pass'],v
assert not (D/'study').exists(),'Do not overwrite a completed archive'
shutil.copytree(S,D/'study');shutil.copytree(S/'results',D/'results')
for p in Path('/tmp').glob('sqgi-v26-*'):
 if p.is_file() and p.suffix in ['.py','.sh','.log']:shutil.copy2(p,D/p.name)
shutil.copy2(S/'study-verification.json',D)
# Capture relevant build settings without changing benchmark metadata midway.
settings={}
for line in Path('/tmp/sqgi-scalar-leaf-20260909/CMakeCache.txt').read_text().splitlines():
 if '=' not in line or line.startswith(('#','//')):continue
 key,value=line.split('=',1);name=key.split(':',1)[0]
 if name.startswith(('CMAKE_CXX_FLAGS','CMAKE_BUILD_TYPE','CMAKE_CXX_COMPILER','SQGI_PGO','SQGI_ENABLE_LTO','SQGI_ENABLE_ASAN','SQ_ENABLE_JIT')):settings[name]=value
(D/'release-build-settings.json').write_text(json.dumps(settings,indent=2)+'\n')
r=v['runtime_ratios'];p=v['profitability'];speed=v['full56_speedup_over_audit']
(D/'README.md').write_text(f'''# V26 owning post-increment — accepted performance iteration

Frozen binary SHA256: `{v['binary_sha256']}`.

The unchanged 56-component, five-round study measures **{speed:.9f}× audit**
speedup. Node/GJS geometric runtime ratios are **{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**;
p90 ratios are **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No full56 component regresses
by more than 5% versus the audit. V26 is the latest accepted performance result.
[Full results](results/summary.json) retain all 56 equally weighted components;
application seed83 remains separate and unweighted.

The new precise integer post-increment path checks its source and proves a
nonfinal old-result drop before either bytecode write. It preserves mark bits,
source/result aliases and machine-word wrap. Final owners, active ancestor
journals and non-integer sources retain the checked helper and exact resume IP.
Richer emission first falls back to the original layout at the same tier;
only buffer exhaustion permits that retry, never resource failure.

Owner pilots use 0.869–0.870 of V25 time across both warmup histories and
identical-binary repeats. The full owner group measures 7.288826× audit, at
122.72–123.38 ns per operation. Member pilots remain unchanged. All fourteen
paired control groups pass, including both warmup histories, both application
seeds and identical candidate repeats; no >5% regression versus V25 appears.
See [the control summary](study/regression-control-summary.json).

An actual native trace verifies 20 owner invocations and 380 loop iterations:
PINCL helper calls fall from 380 to zero, while recycle grows 48 bytes to 7344.
All 112 budget fixtures execute natively; twelve prove that richer code exceeding
8192 bytes preserves the old layout at the same tier. Six fresh native captures
verify 137 exact resume guards. Other captured precise functions, math entries,
loops and append code remain unchanged after masking pointer materialization.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Ten independent AArch64 coverage markers execute, including thirteen
native groups in the side-exit suite. Resource-failure probes cover the new
post-increment install path and preserve later retry. x64 retains the same
32 known assertions. All 96 source hashes and 88 unchanged benchmark/script
hashes are verified; the 30-file audit reconstruction remains reproducible.

JIT-on/off geometric runtime ratios are owners **{p['owners']['geomean_on_over_off']:.6f}** and
methods **{p['methods']['geomean_on_over_off']:.6f}**; root_integer is **{p['roots']['per_case_on_over_off']['root_integer']:.6f}**.
The first milestone remains unmet: aggregate speedup is below 2× and methods
still regress versus the interpreter. Both final engine-ratio targets and fresh
matched PGO/LTO remain open. This iteration does not complete the full goal.

All seven ordinary profiles have zero lost samples. DLOAD now leads owner helper
cost at 12.04%; method VM Execute is 48.66%. Follow-up tracing verifies 252 cold
member helper calls with current first-bucket matches. Application route/pricing/
filter calls already complete in native loops with no native-closure call helper.
See [follow-up evidence](follow-up-evidence.md), including retained diagnostic
failures and their corrections. The next cold literal lookup draft is not yet
applied or compiled.
''')
report=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md'
assert '\n## V26:' not in report.read_text()
report.write_text(report.read_text()+f'''\n\n## V26: guarded owning post-increment

V26 eliminates the checked PINCL helper when an integer post-increment can
release its old result owner without callbacks. All guards precede both VM
writes. A richer layout falls back to the existing layout at the same code tier;
resource failures retain later retry. Actual tracing removes 380 helper calls
across 380 native loop iterations. Four 100-test runs, both 41-holdout sets,
resource probes and 137 exact native resume guards pass; x64 keeps its 32 known
assertions. All fourteen paired control groups pass with no >5% regression.

Fresh full56 speedup is **{speed:.9f}× audit**; Node/GJS geometric ratios are
**{r['node']['geomean']:.6f}/{r['gjs']['geomean']:.6f}**, p90 **{r['node']['p90']:.6f}/{r['gjs']['p90']:.6f}**. No component regresses >5% versus
the audit. [V26 evidence](jit-performance-iterations-2026-09-09/owning-postincrement-v26/README.md)
retains all timings, profiles, controls, source/binary identities and native
probes. V26 is the latest accepted performance result. Methods remain
{p['methods']['geomean_on_over_off']:.6f}× JIT-off time; the first milestone and full engine targets remain
unmet. Matched PGO/LTO remains outstanding.
''')
next_steps=A/'precise-next-steps.md';next_steps.write_text(next_steps.read_text()+'''\nV26 acceptance is complete: all controls and seven profiles pass, with no >5%\nfull56 or paired-control regression. Latest accepted full56 is1.866476378×audit;\nNode/GJS geo8.186695/5.425420,p9024.987213/13.449750. The V27 cold literal lookup\ndraft remains outside production. Next verify the frozen base and back it up,\napply the two-file draft, build and debug the new native contracts, then verify\nhelper elimination, same-tier budget fallback and resource retry before pilots.\n''')
W=A/'owning-postincrement-v26-work-in-progress/README.md';W.write_text(W.read_text()+'''\nV26 is now accepted. The completed immutable evidence lives in the sibling\nowning-postincrement-v26 directory; this work-in-progress directory preserves\nthe preliminary drafts, diagnostics and pilot history.\n''')
(D/'pending-acceptance.md').write_text('V26 acceptance has completed. The prior pending steps are resolved; see README.md and study-verification.json for final results. The separate V27 draft remains unapplied and uncompiled.\n')
# Seal the newly completed iteration only after its final documentation exists.
manifest={str(p.relative_to(D)):h(p) for p in sorted(D.rglob('*')) if p.is_file() and p.name!='artifact-manifest.json'}
(D/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for path,want in manifest.items():assert h(D/path)==want,path
print('ACCEPTED V26; sealed',len(manifest),'artifact files')
