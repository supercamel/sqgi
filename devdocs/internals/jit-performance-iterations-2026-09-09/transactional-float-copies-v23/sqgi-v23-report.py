from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'transactional-float-copies-v23'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());rat=s['totals']['sqgi'];c=json.loads((D/'regression-control-summary.json').read_text())
apps={17:json.loads((D/'application-seed17-control-summary.json').read_text()),83:json.loads((D/'application-control-summary.json').read_text())}
rows='\n'.join(f"| {name} | {v['speedup']:.6f}× |" for name,v in s['groups'].items())
regs='\n'.join(f"- {r['suite']}/{r['name']}: {(1/r['speedup']-1)*100:.3f}% slower than audit." for r in s['regressions_over_5pct']) or 'No full56 component is more than 5% slower than audit in this batch.'
filter_rows='\n'.join(f"| {seed} | {w} | {r['medians_ns']['audit']:.3f} | {r['medians_ns']['v22']:.3f} | {r['medians_ns']['v23']:.3f} | {r['medians_ns']['v23_repeat']:.3f} | {r['v23_over_v22']:.6f} |" for seed,controls in apps.items() for w,cases in controls.items() for r in [cases['filter_stream']])
tail_rows=[]
for w in [4,5]:
 for suite,names in [('kernel',['array_append','direct_call','branch_call']),('floats',['channels_4','pressure_8','branching'])]:
  for name in names:
   r=c[f'{suite}-w{w}']['per_case'][name];m=r['medians_ns'];tail_rows.append(f"| {name} | {w} | {m['audit']:.3f} | {m['v22']:.3f} | {m['v23']:.3f} | {m['v23_repeat']:.3f} |")
 for seed,cases in apps.items():
  r=cases[f'w{w}']['records_4096'];m=r['medians_ns'];tail_rows.append(f"| records_4096 seed{seed} | {w} | {m['audit']:.3f} | {m['v22']:.3f} | {m['v23']:.3f} | {m['v23_repeat']:.3f} |")
text=f'''# V23: transactional float-copy conversion

V22's uninstrumented filter_stream results were 5–6% slower than audit and about
2.5–3.1% slower than V21. Its [isolated same-executable experiment](../local-slot-forwarding-v22/filter-copy-ablation/README.md)
restored ten original GP copy instructions and recovered 2.4–3.5%, with all eight
application checksums intact. That result justified this general compiler fix.

The compiler now emits original X9 copies and records their offsets. Only the
private forwarding transaction converts those pairs to D0 copies. Conversion
validates aligned offsets, exact instructions, private-slot bounds and absence of
a branch target at the second instruction. Metadata rejection, no forwarding
benefit or later output-buffer exhaustion leaves the complete original GP artifact
unchanged. Loops outside the scalar proof retain their original GP copies.
Successful scalar forwarding retains V22's optimized FP copies and cache behavior.
There is no workload-name condition or diagnostic preload in the production change.

## Fresh full benchmark result

The unchanged equal-weight 56-component mix is **{s['speedup']:.9f}× faster than audit**.
Geometric time ratios are **{rat['node']['geomean']:.6f}× Node / {rat['gjs']['geomean']:.6f}× GJS**;
nearest-rank p90 ratios are **{rat['node']['p90']:.6f}× / {rat['gjs']['p90']:.6f}×**.

| Suite | Speedup over audit |
|---|---:|
{rows}

Second application seed/count speedup: {f['applications_seed83']['speedup']:.6f}×.
Second-seed cases more than 5% slower than audit:
{', '.join(f['applications_seed83']['regressions_over_5pct']) or 'none in this batch'}.
Full56 regressions remain in the score:

{regs}

JIT-on/off time ratios are owners **{f['profitability']['owners']['geomean_on_off']:.6f}**,
methods **{f['profitability']['methods']['geomean_on_off']:.6f}**, and integer root
**{f['profitability']['roots']['per_case']['root_integer']:.6f}**. The 2× milestone,
final Node/GJS targets, existing x64 failures and fresh matched PGO/LTO remain open.

## Regression controls

Five rotating rounds retain all eight applications, both seeds/counts and both
warmup histories, with audit, V22, V23 and an identical V23 repeat. All interpreter
checksum references agree. Controls do not replace or reweight full56 results.

| Filter seed | Warmups | Audit ns | V22 ns | V23 ns | V23 repeat ns | V23/V22 |
|---|---:|---:|---:|---:|---:|---:|
{filter_rows}

The original fifteen-kernel and seven-float controls also retain five rounds,
warmups4/5 and the identical-candidate repeat. Previously sensitive cases remain
visible, including array append, large records, branch calls and branching floats.
A favorable control does not erase a slower main measurement or prove its cause.
The seed17/warmups4 records_4096 repeat remains a variance warning: its median is
265.870 ns versus 245.245 ns for the identical V23 binary under the first label,
with a 234.860–351.815 ns repeat range. At warmups5 the repeat is faster instead
(237.565 versus 246.895 ns). This remains unresolved variability, not an attributed
compiler regression or a reason to discard either label's samples.

| Case | Warmups | Audit ns | V22 ns | V23 ns | V23 repeat ns |
|---|---:|---:|---:|---:|---:|
{chr(10).join(tail_rows)}

## Correctness and code evidence

- Release and strict ASan/UBSan each pass 100 selected tests in precise-enabled
  and default modes: four 100/100 runs. Both binaries pass all 41 holdouts.
  Seven independent AArch64 markers require the actual native groups to run.
- New tests cover typed-copy conversion with exact integer/float payload bits,
  including signed zero and NaN payloads; malformed metadata, wrong instructions,
  slot bounds, branch entry into a copy pair, no benefit and late output-buffer
  exhaustion. Refused transforms preserve the entire original artifact.
- Ten same-process pre/post/installed captures verify every branch target and
  condition, non-slot instruction, call and return. Pressure remains 194→88 and
  channels 105→52 private memory instructions. These are static counts.
- Eight paired artifacts are entirely unchanged from V22 after masking relocation
  constants, including the forwarded scalar loops and array append. Lifetime
  guards and weak witnesses retain their prior checks. The root/parameter route
  records six successful entries and zero guard failures in each binary.
- Three filter_stream captures show exactly ten restored GP copy instructions;
  V23's entire normalized 1192-byte loop equals V21. This supports the intended
  compiler effect independently of aggregate timing or executable layout.
- Five precise functions retain all 87 exact exits. Seven fresh ordinary profiles
  have zero lost samples. V22's separate diagnostic instruction profile remains
  linked historical evidence; it is not labeled a new V23 measurement.
- The retained raw receiver-publication witness still rejects before effects with
  both V22 and V23 engines. x64/QEMU retains exactly 32 known assertions (27 release
  ordering and five member-result coverage), six of seven executables passing.
  This is not an x64 pass.

The route capture harness initially lacked its symbol manifest and script argument.
Both failed logs are retained, then corrected runs are validated. No timing ran
concurrently with these captures, builds, tests or profiles.

## Reproduction and next work

The 96-file source manifest, unchanged original 88 benchmark/script hashes,
four-file V22 delta and reconstructed 30-file audit patch identify this candidate.
The binary SHA256 is `{(D/'binary.sha256').read_text().strip()}`. Frozen executable,
seven raw profiles and five native-validation artifacts are under
`build-jit-audit-20260909/transactional-float-copies-v23`. Engine-dependent tests use
that directory's `native-validation` in `LD_LIBRARY_PATH`.

Gate, freeze, serial measurement, control, capture and decoder scripts are retained.
Configuration is GCC13.3 Release O3/DNDEBUG/debug symbols, int64/double, AArch64 CPU4,
threshold1 and `SQGI_JIT_PRECISE_EXITS=1`, without PGO/LTO. Precise exits remain
disabled by default. Prior frozen hashes are verified before mutable-note updates.

Use the fresh method/member profiles for broader native coverage, and owner
PINCL/DLOAD and float register moves for bounded follow-ups. Any canonical-frame
loop entry must implement exact continuation semantics; the old private-spill loop
takeover remains forbidden for precise functions. The full objective is unchanged.
'''
(D/'README.md').write_text(text)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';body=main.read_text();assert '\n## V23:' not in body
main.write_text(body+f'''\n\n## V23: transactional float-copy conversion\n\nV23 retains original GP float copies unless the scalar forwarding transaction
succeeds. Failed or inapplicable forwarding preserves the original bytes, including
late buffer exhaustion. Native payload/fallback tests, all four 100-test runs and
both 41-holdout sets pass. Paired captures retain V22's forwarded code and restore
the ten filter_stream GP copy instructions isolated by the prior experiment.

Fresh full56 speedup: **{s['speedup']:.9f}× audit**. Node/GJS geometric ratios are
{rat['node']['geomean']:.6f}/{rat['gjs']['geomean']:.6f}; p90 ratios are
{rat['node']['p90']:.6f}/{rat['gjs']['p90']:.6f}. [V23 evidence](jit-performance-iterations-2026-09-09/transactional-float-copies-v23/README.md)
retains all controls, regressions, code checks and fresh profiles. Full targets,
existing x64 defects and matched PGO/LTO remain open.
''')
p=A/'precise-next-steps.md';p.write_text(p.read_text()+'''\n\n## V23 transactional float-copy conversion\n\nUse V23 as the next control. GP copies remain intact unless scalar forwarding
succeeds; ten filter_stream instructions are restored, and eight paired forwarded/
array artifacts remain unchanged from V22 after relocation masking. Full timings
and both-seed controls are in the V23 artifact; preserve all regressions and tails.

Next use method/member VM samples for broader safe native coverage. Owner
PINCL/DLOAD and float register moves remain concrete local costs. A new canonical-
frame loop entry needs exact continuation and release semantics; do not enable
legacy private-spill takeover. Existing x64 defects and matched PGO/LTO remain open.
''')
print('Wrote V23 report and progress notes')
