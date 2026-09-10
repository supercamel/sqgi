from pathlib import Path
import json,statistics
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'scalar-loop-entry-guards-v20'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());c=json.loads((D/'regression-control-summary.json').read_text());code=json.loads((D/'entry-code-summary.json').read_text());rat=s['totals']['sqgi']
rows='\n'.join(f"| {name} | {v['speedup']:.6f}× |" for name,v in s['groups'].items())
regs='\n'.join(f"- {r['suite']}/{r['name']}: {(1/r['speedup']-1)*100:.3f}% slower than audit." for r in s['regressions_over_5pct']) or 'No full56 component exceeds a 5% slowdown against audit in this batch.'
controls=[]
for w in [4,5]:
 for suite,names in [('kernel',['direct_call','float_call','branch_call','array_append']),('floats',['filter','channels_4','pressure_8','retained_input'])]:
  for name in names:
   r=c[f'{suite}-w{w}']['per_case'][name];m=r['medians_ns']
   controls.append(f"| {name} | {w} | {m['audit']:.3f} | {m['v19']:.3f} | {m['v20']:.3f} | {m['v20_repeat']:.3f} | {r['v20_over_v19']:.6f} |")
text=f'''# V20 (rejected): scalar loop entry guards

**Rejected after measurement:** the additional raw-frame receiver-publication
witness found a release-order regression. V20 must not be promoted; the hardened
replacement still needs validation and fresh timing. See [the failure evidence](receiver-publication/README.md).

V20 moves fixed root/parameter callee guards out of repeated scalar loop execution.
It validates the same retained weak lifetime with the existing lookup helper at
entry, deduplicates equal guards, and bypasses their in-loop copies. A conservative
whole-loop and inlined-callee proof excludes mutation, heap reads, allocation and
reentry. An existing direct-parameter-call receiver preparation defect is also
fixed for scalar leaves that do not use `this`.

See [implementation and safety limits](implementation-notes.md) for the exact
proof, optional code-size fallback, late-effect recompilation, test-fixture
corrections, and preserved pre-fix evidence. This does not enable private-spill
loop takeover for precise whole functions. V18's corrected generated-code and
lifetime groups remain required; earlier skipped-test claims stay withdrawn.

## Full benchmark result

The measured, unaccepted 56-component mix is **{s['speedup']:.9f}× faster than audit**.
Geometric time ratios are **{rat['node']['geomean']:.6f}× Node / {rat['gjs']['geomean']:.6f}× GJS**;
nearest-rank p90 ratios are **{rat['node']['p90']:.6f}× / {rat['gjs']['p90']:.6f}×**.

| Suite | Speedup over audit |
|---|---:|
{rows}

Second application seed/count speedup: {f['applications_seed83']['speedup']:.6f}×.
Full56 regressions are retained in the score:

{regs}

JIT-on/off time ratios are owners **{f['profitability']['owners']['geomean_on_off']:.6f}**,
methods **{f['profitability']['methods']['geomean_on_off']:.6f}**, and integer root
**{f['profitability']['roots']['per_case']['root_integer']:.6f}**. The original goal,
including the 2× milestone and method profitability, remains active. The full
Node/GJS targets, open x64 defects, and matched fresh PGO/LTO are not complete.

## Paired controls and variance

Both warmup histories use five rotating rounds and interpreter checksum references.
The unchanged full 15-kernel controls contain audit, V19, V20 and an identical V20
repeat (40 timed processes); the seven-float controls add Node (50 timed processes).
These controls neither replace nor reweight the full56 result.

| Case | Warmups | Audit ns | V19 ns | V20 ns | Same V20 repeat ns | V20/V19 |
|---|---:|---:|---:|---:|---:|---:|
{chr(10).join(controls)}

All cases and raw samples are in `regression-control-summary.json`, the underlying
control JSON files, and `results/summary.json`. Earlier array-append variance
remains open; a favorable sample is not proof of its cause being resolved.

## Correctness and native evidence

The additional receiver-publication witness fails V20 and passes V19. The
following successful gates therefore do not establish overall correctness.

- Release and strict ASan/UBSan: four runs of 100/100 selected tests, with precise
  exits enabled and default settings. Both binaries pass all 41 holdouts.
- Independent host checks require the scalar entry-guard group, ten precise
  generated-code groups, and loop adaptation/lifetime contracts. Native intrinsic
  lifetime tests additionally require an actual hoisted guard. Release forces
  both closure and native-closure address reuse; sanitizer permits quarantine.
- Tests require native success for root and parameter call loops and for the
  mutation-negative fixtures. Rebinding to a callee that reads `this`, zero-loop
  invalid callees, aliased root stores and inlined effects preserve semantics.
  A later effectful callee restores the explicit unsupported-loop fallback.
- The separate route probe uses 7/19/37 iterations: V19 performs **126 root lookup
  helpers across three entries**, V20 **three across three entries**. The parameter
  fixture changes from twelve attempts (eleven failures, one success including
  the alternate mapping) to three successful entries, each with one helper. All six candidate helper checks succeed; runtime/native-success
  observations and test assertions accompany code installation evidence.
- Eight paired benchmark captures verify entry transfers, exact copied guard
  arguments, deduplication, identical failure continuations, call-site bypasses,
  and return to the loop. Pressure bypasses eight sites with one entry check.
  Remaining code matches after masking relocated constants and branch offsets;
  copied entry-guard constants match exactly. The array append artifact is
  unchanged. Original bypassed bytes remain mapped, and mapping/code growth is
  reported in `entry-code-summary.json`.
- Five precise function captures retain all 87 exact exits and native stores/
  comparison. All seven fresh profiles report zero lost samples.
- x64/QEMU retains the same 32 known assertions (27 release-order and five native
  member-result coverage failures), with six of seven executables passing.

## Reproduction

`binary.sha256`, the 95-file source manifest, unchanged original 88 benchmark/script
hashes, three-file V19 delta and reconstructable 28-file audit patch identify the
build. The frozen executable and seven raw profiles are under
`build-jit-audit-20260909/scalar-loop-entry-guards-v20`. Retained native test binaries
load their retained engine using that build's `native-validation` directory in
`LD_LIBRARY_PATH`; dependency output and hashes are included.

Archived gate, freeze, measurement, route, decoder, analysis and verification
scripts reproduce the work from the repository root. Accepted timing never
shared a run with builds, tests, GDB or profiles. The setup remains GCC 13.3
Release O3/DNDEBUG/debug symbols, int64/double, AArch64 CPU 4, threshold 1 and
`SQGI_JIT_PRECISE_EXITS=1`, without PGO/LTO. The precise tier remains experimental
and disabled by default. Previous frozen artifact hashes were verified before
updating the mutable progress report.
'''
(D/'README.md').write_text(text)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md'
main.write_text(main.read_text()+f'''\n\n## V20 rejected: scalar loop entry guards\n\nV20 is rejected after an additional raw-frame release-order witness. Its measured
1.749× speedup is provisional, and V19 remains the previous validated candidate.
See the V20 receiver-publication failure evidence. V20 validates invariant callees
once per proven scalar-loop activation, preserving\nweak lifetime and existing fallback semantics. A direct closure parameter's unused\nreceiver can now remain private until its scalar result overwrite. The native\nroute probe reduces 126 root lookups to three across three entries; explicit\nmutation, rebinding, address-reuse and native-coverage contracts pass.\n\nFull56 speedup is {s['speedup']:.9f}× audit. Node/GJS geometric time ratios are\n{rat['node']['geomean']:.6f}/{rat['gjs']['geomean']:.6f}, and p90 ratios are\n{rat['node']['p90']:.6f}/{rat['gjs']['p90']:.6f}. See [the V20 evidence](jit-performance-iterations-2026-09-09/scalar-loop-entry-guards-v20/README.md)\nfor all per-case controls, regressions, both application seeds, profiles and limits.\nFour 100-test runs and both 41-holdout sets pass. Existing x64 failures and matched\nfresh PGO/LTO remain open; the full performance goal remains active.\n''')
p=A/'precise-next-steps.md';p.write_text(p.read_text()+'''\n\n## V20 rejection and required hardening\n\nV20 is not accepted: its new unused-receiver path releases a final-owned old
temporary after publishing the loop result. Add an entry non-reference guard for
every elided receiver/result destination and prove an unchanged parameter owns
the receiver. Require the new raw-frame publication witness and fresh gates and
timing before promotion. V19 remains the previous validated candidate.

The V20 prototype validates fixed root/parameter callees once per activation.\nThe full loop and all inlined callees must preserve the documented no-effect\nproof; do not extend it to unknown calls or mutations. Keep the new entry guard\nand unused-receiver tests, actual closure/native-closure address reuse, and V18's\nactivated groups. The paired decoder and lookup counts are in the V20 evidence.\n\nChoose the next implementation from fresh profiles and the unchanged full56\nresults. Reference-destination PINCL, scalar register residency, and wider precise\nloop/call coverage remain candidates; method interpreter overhead remains a major\ngap. Preserve pressure and array-append controls and all open x64/PGO requirements.\n''')
print('Wrote V20 report and progress notes')
