from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'receiver-entry-guards-v21'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());c=json.loads((D/'regression-control-summary.json').read_text());rat=s['totals']['sqgi']
rows='\n'.join(f"| {name} | {v['speedup']:.6f}× |" for name,v in s['groups'].items())
regs='\n'.join(f"- {r['suite']}/{r['name']}: {(1/r['speedup']-1)*100:.3f}% slower than audit." for r in s['regressions_over_5pct']) or 'No full56 component exceeds a 5% slowdown against audit in this batch.'
controls=[]
for w in [4,5]:
 for suite,names in [('kernel',['direct_call','float_call','branch_call','array_append']),('floats',['filter','channels_4','pressure_8','retained_input'])]:
  for name in names:
   r=c[f'{suite}-w{w}']['per_case'][name];m=r['medians_ns']
   controls.append(f"| {name} | {w} | {m['audit']:.3f} | {m['v19']:.3f} | {m['v21']:.3f} | {m['v21_repeat']:.3f} | {r['v21_over_v19']:.6f} |")
seed83=json.loads((D/'results/applications-seed83.json').read_text());record_slowdown=(seed83['medians']['records_4096']['sqgi']/seed83['medians']['records_4096']['sqgi_baseline']-1)*100
application=json.loads((D/'application-control-summary.json').read_text())
record_controls='\n'.join(f"| {w} | {r['medians_ns']['audit']:.3f} | {r['medians_ns']['v19']:.3f} | {r['medians_ns']['v21']:.3f} | {r['medians_ns']['v21_repeat']:.3f} |" for w,rr in application.items() for r in [rr['records_4096']])
text=f'''# V21: receiver entry guards

**Validated replacement for rejected V20.** V20's additional raw-frame witness
showed that eliding an unused receiver copy could defer the old temporary's final
release until after publishing loop results. V21 rejects any owning receiver/result
destination at entry, before loop effects, and only elides a receiver copy whose
source is retained by an unchanged canonical parameter. Mandatory checks that do
not fit the code buffer restore the prior lowering; they are never omitted.

The V20 scalar-region proof, retained weak callee lifetime checks, and entry-only
lookup optimization remain. Unknown calls, mutation, allocation, heap reads and
reentry still prevent the whole-region optimization. Later discovered effects
force recompilation before installation. This does not enable legacy private-spill
loop takeover for precise whole functions. The precise tier remains disabled by
default and was explicitly enabled for this experiment.

## Fresh full benchmark result

The unchanged equal-weight 56-component mix is **{s['speedup']:.9f}× faster than audit**.
Geometric time ratios are **{rat['node']['geomean']:.6f}× Node / {rat['gjs']['geomean']:.6f}× GJS**;
nearest-rank p90 ratios are **{rat['node']['p90']:.6f}× / {rat['gjs']['p90']:.6f}×**.
These are fresh V21 measurements, not the rejected V20 results.

| Suite | Speedup over audit |
|---|---:|
{rows}

Second application seed/count speedup: {f['applications_seed83']['speedup']:.6f}×.
Full56 regressions stay in the score:

{regs}

JIT-on/off time ratios are owners **{f['profitability']['owners']['geomean_on_off']:.6f}**,
methods **{f['profitability']['methods']['geomean_on_off']:.6f}**, and integer root
**{f['profitability']['roots']['per_case']['root_integer']:.6f}**. The goal remains active;
the 2× milestone, Node/GJS targets, existing x64 failures and matched fresh PGO/LTO
are not declared complete.

## Paired controls and variance

V19 is the previous validated control. Five rotating rounds cover both warmup
histories, interpreter checksum references, and both application seeds/counts.
The unchanged 15-kernel controls contain audit, V19, V21 and an identical V21 repeat
(40 timed processes); the seven-float controls add Node (50 timed processes).
Controls neither replace nor reweight full56.

| Case | Warmups | Audit ns | V19 ns | V21 ns | Same V21 repeat ns | V21/V19 |
|---|---:|---:|---:|---:|---:|---:|
{chr(10).join(controls)}

The original seed83/count400003 run has a {record_slowdown:.3f}% `records_4096` slowdown
against audit, with candidate samples spanning roughly 246–308 ns. The extra
unchanged eight-application controls use five rotating rounds of audit, V19, V21
and an identical V21 repeat at each warmup history:

| Warmups | Audit ns | V19 ns | V21 ns | Same V21 repeat ns |
|---|---:|---:|---:|---:|
{record_controls}

These diagnostic controls do not replace the original second-seed measurement.
All samples and cases are retained. Earlier array-append variance remains open;
a favorable sample does not establish a cause or resolve it.

## Correctness and native evidence

- The same standalone witness fails frozen V20 and passes frozen V21. The raw
  backend contract now rejects before any hook, loop result, or old-destination
  publication. This is a raw-frame reproduction; no normal-script reproduction
  is claimed.
- New permanent tests cover final ownership, nonfinal ownership, two active
  ancestor journals, weak lifetime, cleanup order, and actual native success with
  a scalar destination. Independent host coverage checks require this group.
- Release and strict ASan/UBSan each pass 100 selected tests with precise exits
  enabled and with defaults: four 100/100 runs. Both binaries pass all 41 holdouts.
  Ten precise generated-code groups, loop adaptation/lifetime tests, scalar entry
  guard tests and native-closure lifetime tests must actually execute. Release
  forces closure and native-closure address reuse; sanitizer allows quarantine.
- Rebinding, zero-iteration invalid callees, aliased mutation, inlined effects,
  fallback restoration and native-route checks are retained. x64/QEMU still has
  the same 32 known assertions (27 release-order and five member-result coverage),
  with six of seven executables passing; this is not an x64 pass.
- The independent 7/19/37-iteration probe reduces root lookup helpers from V19's
  126 across three entries to three across three entries. Parameter execution
  changes from twelve attempts (eleven failures, one success including its
  alternate mapping) to three successful entries, with one helper each.
- The independent parameter code capture adds exactly 8 bytes: a slot5 type
  load and reference-bit branch to the existing failure epilogue, before lookup.
  The root route is unchanged from V20.
- Eight paired benchmark captures verify entry transfers, identical guard
  arguments, deduplication, failure continuations and call-site bypasses. Pressure
  bypasses eight sites with one entry check. Remaining native code matches V19
  after accounting for the entry branch and relocations; array append is unchanged.
- Five precise functions retain all 87 exact exits and native stores/comparison.
  All seven fresh profiles have zero lost samples. Anonymous generated-code samples
  are not joined to unrelated GDB process addresses.

## Additional generated-code profiling

[Diagnostic instruction sampling](native-instructions/README.md) captures executable
bytes and mapping lifetimes in the sampled process itself. It is separate from
accepted timing and the seven ordinary profiles. Retained events, sampled IPs,
disassembly, plain-run checksum references and instrumentation overhead controls
support its analysis; inferred function labels and sampling limitations are explicit.

## Reproduction

The 95-file source manifest, original 88 benchmark/script hashes, two-file V20 delta,
and reconstructable 28-file audit patch identify the source. Frozen executable,
seven raw profiles and retained native test engine/executables are under
`build-jit-audit-20260909/receiver-entry-guards-v21`. Run retained native tests with
that build's `native-validation` directory in `LD_LIBRARY_PATH`.

Gate, freeze, timing, route, analysis, decoder and verification scripts are archived.
Accepted timing did not overlap builds, tests, profiles or GDB. A partial extra
application control accidentally overlapped the final GDB capture, was terminated
and excluded, then restarted after both jobs were terminal. Its quarantine note
and partial log are retained in `discarded-overlap`. Configuration remains
GCC 13.3 Release O3/DNDEBUG/debug symbols, int64/double, AArch64 CPU4, threshold1,
`SQGI_JIT_PRECISE_EXITS=1`, without PGO/LTO. Previous frozen hashes were verified
before updating the mutable report. Rejected V20 evidence is preserved unchanged.
'''
(D/'README.md').write_text(text)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md'
main.write_text(main.read_text()+f'''\n\n## V21: receiver entry guards\n\nV21 fixes the release-order regression that rejected V20. Owning receiver/result
temporaries reject before effects; scalar temporaries still execute natively.
The retained standalone reproducer fails frozen V20 and passes frozen V21, and
permanent native tests cover final/nonfinal owners and ancestor journal pins.
Four 100-test runs and both 41-holdout sets pass, with actual generated-code coverage.

Fresh unchanged full56 speedup: **{s['speedup']:.9f}× audit**. Node/GJS geometric
ratios are {rat['node']['geomean']:.6f}/{rat['gjs']['geomean']:.6f}; p90 ratios are
{rat['node']['p90']:.6f}/{rat['gjs']['p90']:.6f}. See [V21 evidence](jit-performance-iterations-2026-09-09/receiver-entry-guards-v21/README.md)
for controls, regressions, both application seeds, profiles and correctness limits.
The performance goal, existing x64 defects and fresh matched PGO/LTO remain open.
''')
p=A/'precise-next-steps.md';p.write_text(p.read_text()+'''\n\n## V21 validated replacement\n\nV21 adds mandatory entry rejection for owning receiver/result destinations and
requires an unchanged canonical parameter to retain the elided receiver source.
The V20 failure remains archived; the same witness and new native final/nonfinal/
ancestor tests pass V21. Fresh full56 measurements and seven profiles are archived.

Use V21 as the next control. Choose further changes from its measured tail and
profiles. Wider precise call/loop coverage, reference-destination PINCL and scalar
register residency remain candidates. Preserve method profitability, pressure and
array controls, active generated-code groups, all lifetime/rollback gates, and
outstanding cross-backend and matched-PGO requirements. Do not attribute anonymous
native samples to GDB addresses from another process.
''')
print('Wrote V21 report and progress notes')
