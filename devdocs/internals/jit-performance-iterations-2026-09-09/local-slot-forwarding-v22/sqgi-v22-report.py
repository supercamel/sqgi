from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'local-slot-forwarding-v22'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());c=json.loads((D/'regression-control-summary.json').read_text());rat=s['totals']['sqgi'];native=json.loads((D/'native-instructions/summary.json').read_text());app=json.loads((D/'application-control-summary.json').read_text())
seed17=json.loads((D/'application-seed17-control-summary.json').read_text());ablation=json.loads((D/'filter-copy-ablation/summary.json').read_text())
filter_controls='\n'.join(f"| {seed} | {w} | {r['medians_ns']['audit']:.3f} | {r['medians_ns']['v21']:.3f} | {r['medians_ns']['v22']:.3f} | {r['medians_ns']['v22_repeat']:.3f} |" for seed,rr in [(17,seed17),(83,app)] for w,allrows in rr.items() for r in [allrows['filter_stream']])
ablation_rows='\n'.join(f"| {k} | {v['medians_ns']['fp']:.3f} | {v['medians_ns']['gp']:.3f} | {v['medians_ns']['fp_repeat']:.3f} | {v['medians_ns']['gp_repeat']:.3f} | {v['gp_over_fp']:.6f} |" for k,v in ablation.items())
rows='\n'.join(f"| {name} | {v['speedup']:.6f}× |" for name,v in s['groups'].items())
regs='\n'.join(f"- {r['suite']}/{r['name']}: {(1/r['speedup']-1)*100:.3f}% slower than audit." for r in s['regressions_over_5pct']) or 'No full56 component exceeds a 5% slowdown against audit in this batch.'
controls=[]
for w in [4,5]:
 for suite,names in [('kernel',['direct_call','float_call','branch_call','array_append']),('floats',['filter','channels_4','pressure_8','retained_input','branching'])]:
  for name in names:
   r=c[f'{suite}-w{w}']['per_case'][name];m=r['medians_ns']
   controls.append(f"| {name} | {w} | {m['audit']:.3f} | {m['v21']:.3f} | {m['v22']:.3f} | {m['v22_repeat']:.3f} | {r['v22_over_v21']:.6f} |")
record_controls='\n'.join(f"| {w} | {r['medians_ns']['audit']:.3f} | {r['medians_ns']['v21']:.3f} | {r['medians_ns']['v22']:.3f} | {r['medians_ns']['v22_repeat']:.3f} |" for w,rr in app.items() for r in [rr['records_4096']])
text=f'''# V22: private local-slot forwarding

V22 reduces private-stack traffic in proven scalar native loops. A transactional
AArch64 postpass forwards 64-bit local values through caller-clobbered d16–d31
within straight-line regions. It materializes the private frame before branches,
helper calls, unknown operations, SP changes and possible aliasing accesses.
Dead overwritten stores disappear; final writes with no later use stay in memory.
Float copies use FP registers to avoid unnecessary integer/FP transfers.

The whole scalar-loop proof remains required. Cached slots include inlined callee
temporaries but exclude journal/control storage beyond MAX_FUNC_STACKSIZE. Code
that uses unknown FP operations/scratch registers, unsupported PC-relative operands,
invalid branches or too much output space retains its original bytes. All branch
displacements are rebuilt. This adds no frame storage and preserves the existing
precise-tier/legacy-loop separation and V21's receiver release guards.

Two rejected preliminary pilots and their binaries/source snapshots are retained.
Caching caller slots alone missed the hot inlined temporaries and regressed most
float cases. Including those temporaries improved pressure/channels but retained
extra work in other cases. The final pass considers the next slot access and
keeps typed float copies in FP registers. Pilot results are diagnostic only;
the following figures come from a fresh frozen build and full measurement.

## Fresh full benchmark result

The unchanged equal-weight 56-component mix is **{s['speedup']:.9f}× faster than audit**.
Geometric time ratios are **{rat['node']['geomean']:.6f}× Node / {rat['gjs']['geomean']:.6f}× GJS**;
nearest-rank p90 ratios are **{rat['node']['p90']:.6f}× / {rat['gjs']['p90']:.6f}×**.

| Suite | Speedup over audit |
|---|---:|
{rows}

Second application seed/count speedup: {f['applications_seed83']['speedup']:.6f}×.
Full56 regressions remain in the score:

{regs}

JIT-on/off time ratios are owners **{f['profitability']['owners']['geomean_on_off']:.6f}**,
methods **{f['profitability']['methods']['geomean_on_off']:.6f}**, and integer root
**{f['profitability']['roots']['per_case']['root_integer']:.6f}**. The complete goal
remains active; the 2× milestone, Node/GJS targets, existing x64 defects and fresh
matched PGO/LTO are not declared complete.

## Rotating controls

Five rounds cover both warmup histories and interpreter checksum references.
The unchanged 15-kernel controls include audit, V21, V22 and an identical V22 repeat
(40 processes); float controls add Node (50 processes). The full eight-application
controls retain both seed17/count200000 and seed83/count400003, each with both
warmup histories (80 processes in total).
No control replaces or reweights the main measurements.

| Case | Warmups | Audit ns | V21 ns | V22 ns | Same V22 repeat ns | V22/V21 |
|---|---:|---:|---:|---:|---:|---:|
{chr(10).join(controls)}

Large-record controls:

| Warmups | Audit ns | V21 ns | V22 ns | Same V22 repeat ns |
|---|---:|---:|---:|---:|
{record_controls}

Array append and large-record variance remain visible in all raw samples and
summaries. A favorable control does not resolve their causes or erase a slower
main measurement. Branch-call and branching-float results remain explicit because
preliminary forwarding variants increased their instruction/move costs.

## Filter-stream regression and isolated ablation

The full56 filter_stream result is 5.160% slower than audit; the second seed is
5.956% slower. The regression repeats in the matched controls below, with V22
about 2.5–3.1% slower than V21. It is not dismissed as variance.

| Seed | Warmups | Audit ns | V21 ns | V22 ns | Same V22 repeat ns |
|---|---:|---:|---:|---:|---:|
{filter_controls}

Paired native captures show ten changed instructions: five adjacent load/store
pairs now use D0 instead of X9. The entire remaining 1192-byte loop matches after
masking relocation constants. This loop does not meet the scalar-region proof,
so forwarding itself does not apply; the typed-copy change applies more broadly.

A separate diagnostic preload matches that complete normalized code signature
and restores only those ten captured V21 instructions. Both modes use the same
frozen V22 executable and preload, including the same permission transitions,
cache synchronization, matching and logging. Five rotating rounds include two
copies of each mode, all eight unchanged applications, both seeds/counts and
warmup histories. Every run must match exactly one generated mapping and all
interpreter checksums. This benchmark-specific diagnostic is not production code
or accepted performance; it tests a proposed cause without rebuilding the runtime.

| Seed/warmups | FP ns | Restored GP ns | FP repeat ns | GP repeat ns | GP/FP |
|---|---:|---:|---:|---:|---:|
{ablation_rows}

The raw ablation, source and matched instruction specification are retained in
`filter-copy-ablation`. Its results guide a general compiler fix; they do not
remove the regression from V22's full score or prove the remaining audit gap's
cause. The next candidate should restrict typed-copy changes to regions whose
forwarding succeeds, then rerun the uninstrumented gates and full benchmark mix.

## Correctness and generated code

- Release and strict ASan/UBSan each pass 100 selected tests with precise exits
  enabled and with defaults: four 100/100 runs. Both binaries pass all 41 holdouts.
  Independent AArch64 host checks require all prior generated-code/lifetime groups
  and the new forwarding group to actually execute.
- New native contracts compare original and forwarded code for exact integer/float
  bit copies (including signed zero and NaN payloads), helpers that overwrite a
  private slot and clobber all scratch FP registers, flags, forward branches,
  backedges, unreachable-block spills, cache eviction, derived aliases and partial-
  width writes. Refused transforms leave the entire input buffer unchanged.
- A same-process capture records ten pre/post transformations and their exact
  installed bytes. Its independent decoder checks every branch condition/target,
  all non-slot instructions, helper calls and return counts. Pressure's private
  memory instructions fall from 194 to 88; channels from 105 to 52. Code size
  grows from 2796 to 2980 bytes for pressure and 1724 to 1816 for channels.
  These are static instruction counts, not a claimed cycle reduction.
- Eight paired benchmark captures retain the entry lifetime guards and weak
  witnesses; the array-append artifact remains unchanged. The root/parameter
  route probe has six successful entries, six helper checks and zero guard
  failures in both V21 and V22. V21's raw receiver-publication witness still passes.
- Five precise functions retain all 87 exact exits and native stores/comparison.
  Seven ordinary profiles have zero lost samples. x64/QEMU retains the same
  32 known assertions (27 release-order and five member-result coverage), with
  six of seven executables passing; this is not an x64 pass.

## Fresh instruction profile

The separate [native instruction capture](native-instructions/README.md) attributes
{native['native_samples']} of {native['total_samples']} samples to live generated mappings.
{native['stack_load_store_samples']} native sampled IPs are stack load/store instructions
({native['stack_load_store_samples']/native['native_samples']:.2%}). FMOV samples are now
reported separately as register moves. Raw code bytes, mapping lifetimes, sampled
IPs, instruction listings and plain-run checksum/overhead checks are retained.
This diagnostic preload is absent from accepted timing and the seven ordinary
profiles. Structural function labels never join addresses across processes.
Sampled IPs, PMU skid and instrumentation overhead limit instruction-cost claims.

## Reproduction

The 96-file source manifest, unchanged original 88 benchmark/script hashes,
four-file V21 delta and reconstructed 30-file audit patch identify this build.
The emitter test is newly included in the manifest; its pre-V22 hash exactly
matches the audited source. Frozen executable, raw profiles and native-validation
binaries are under `build-jit-audit-20260909/local-slot-forwarding-v22`.
Retained engine-dependent tests use that directory's `native-validation` in
`LD_LIBRARY_PATH`; the standalone emitter test is retained as well.

Gate, freeze, measurement, route, transformation, decoder and analysis scripts
are archived. Accepted timing ran serially without builds, tests, profiles or
GDB. Configuration remains GCC13.3 Release O3/DNDEBUG/debug symbols, int64/double,
AArch64 CPU4, threshold1 and `SQGI_JIT_PRECISE_EXITS=1`, without PGO/LTO. The precise
tier stays disabled by default. Previous frozen hashes are verified before the
mutable progress notes change.
'''
(D/'README.md').write_text(text)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';main.write_text(main.read_text()+f'''\n\n## V22: private local-slot forwarding\n\nV22 forwards private 64-bit slots through scratch FP registers inside proven
scalar native regions, including inlined callee temporaries. Branch/call/alias
boundaries materialize the original frame; typed float copies and next-use checks
avoid unnecessary register transfers. Native bit/alias/helper-clobber/branch tests,
all four 100-test runs and both 41-holdout sets pass.

Fresh full56 speedup: **{s['speedup']:.9f}× audit**. Node/GJS geometric ratios are
{rat['node']['geomean']:.6f}/{rat['gjs']['geomean']:.6f}; p90 ratios are
{rat['node']['p90']:.6f}/{rat['gjs']['p90']:.6f}. See [V22 evidence](jit-performance-iterations-2026-09-09/local-slot-forwarding-v22/README.md)
for the rejected preliminary pilots, controls, static transformation checks,
profiles, regressions and limits. The repeated filter_stream regression is
explicitly retained, with a same-executable ten-instruction ablation to guide the
next general fix. Full targets, existing x64 defects and fresh
matched PGO/LTO remain open.
''')
p=A/'precise-next-steps.md';p.write_text(p.read_text()+'''\n\n## V22 private-slot forwarding\n\nThe next control is V22. The postpass covers caller and inlined-leaf private slots,
materializes at all branches/helper/alias boundaries, retains final direct stores,
and uses typed float copies. Expanded native tests and exact pre/post/installed
captures validate branch relocation, frame materialization and bit preservation.
Do not extend scratch lifetime across calls or joins without additional proof.

First use the repeated filter_stream regression and same-executable float-copy
ablation to restrict typed copies to successfully forwarded regions. Preserve
the full score including this regression. Then use the fresh instruction profile
to choose the next change.
Conditional boundaries and register moves remain potential native costs; owner
PINCL/DLOAD helpers and method VM dispatch remain independent larger gaps. Preserve
method profitability and all tail/regression controls. Existing x64 defects and
matched PGO/LTO remain required; do not redefine the full objective around float
microbenchmarks.
''')
print('Wrote V22 report and progress notes')
