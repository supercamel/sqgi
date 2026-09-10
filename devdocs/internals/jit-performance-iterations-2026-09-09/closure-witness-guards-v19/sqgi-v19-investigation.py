from pathlib import Path
import json
S=Path('/tmp/sqgi-closure-witness-guard-study');c=json.loads((S/'regression-control-summary.json').read_text());summary=json.loads((S/'results/summary.json').read_text());f=json.loads((S/'followup-summary.json').read_text())
lines=[]
for w in [4,5]:
 for suite,names in [('kernel',['direct_call','float_call','branch_call','array_append']),('floats',['filter','channels_4','pressure_8','retained_input'])]:
  d=c[f'{suite}-w{w}']
  for name in names:
   r=d['per_case'][name];m=r['medians_ns']
   lines.append(f"| {suite}/{name} | {w} | {m['audit']:.3f} | {m['v18']:.3f} | {m['v19']:.3f} | {m['v19_repeat']:.3f} | {r['v19_over_v18']:.6f} |")
text='''# V19 regression investigation: mixed call-guard result

V19 is approximately flat in the unchanged full56 aggregate (1.612804330× audit
versus the separately measured V18 1.610484881×). Do not treat that cross-batch
0.14% difference as a demonstrated aggregate improvement. Same-batch controls
show modest call gains and a repeatable pressure penalty; the implementation is
retained as a measured iteration, with the original goal still active.

The full56 pressure_8 result is 172.870 ns versus audit 153.520 ns (+12.604%).
Its five candidate samples range 164.385–174.045 ns. Both repeat histories confirm
a penalty: V19 is 2.31–3.39% slower than V18 and 8.06–9.40% slower than audit.
The identical V19 repeat differs by only 0.35–0.47% for pressure. This does not
support dismissing the penalty as solely random measurement variation. Preserve
all original samples; controls do not replace the full56 result.

| Case | Warmups | Audit ns | V18 ns | V19 ns | Same V19 repeat ns | V19/V18 |
|---|---:|---:|---:|---:|---:|---:|
'''+ '\n'.join(lines)+'''

Both full 15-kernel control histories use four SQGI labels, five rotating rounds,
and exact/floating-tolerance interpreter references: 40 timed processes. Both
full seven-float histories use those four labels plus Node: 50 timed processes.
Their geometric V19/V18 time ratios are 0.995460/0.988640 (kernel w4/w5) and
0.976853/0.981125 (float w4/w5). These gains do not erase pressure's regression.

## Native evidence and limits

Eight paired captures identify the structural change. Direct/float/branch-call
and filter loops lose 32 bytes each; channels loses 128, retained loses 64, and
pressure loses 256. Their weak witnesses remain retained and are passed as
existing helper arguments. The array append artifact loses no instructions and
remains structurally unchanged. All mappings are still 4096 bytes. The normalized
comparison masks relocated wide constants and branch displacements, so it does
not prove arbitrary masked values are interchangeable.

`helper-code` retains objdump captures for all five affected helpers in both
binaries. The root/member closure helper still has a 64-byte frame. V19 checks
the weak payload's type before lookup and loads the weak referent for its final
identity comparison. It has 56 disassembled instructions versus V18's 60, while
removing eight caller instructions per guard. Shorter code therefore does not
establish lower latency. Additional data dependencies and changed code layout
are possible contributors to pressure's cost; these measurements do not separate
them, and no exact causal attribution is claimed.

The fresh full-float profile has 16.16% self cycles in borrowed member lookup and
10.08% in the closure guard helper. Owner PINCL/DLOAD helpers contribute
13.02%/8.60%; the methods profile remains dominated by SQVM::Execute (47.34%).
All seven profiles have zero lost samples. This supports investigating repeated
pure-loop guards and broader native method-loop coverage rather than expecting
this instruction-count reduction to achieve the original target by itself.

`loop-guard-followup.md` records a conservative purity/identity requirement for
possible activation-level guards. `weak-identity-followup.md` records a possible
comparison against a live closure's retained weak backpointer. Neither is
implemented or measured. Preserve ordinary/final releases, mutation order,
closure/native-closure address-reuse coverage, both histories, and the full goal.
Array-append instability from previous iterations remains unresolved despite
these controls; no workload or result is removed from the score.
'''
(S/'regression-investigation.md').write_text(text)
print('Recorded mixed results, pressure controls, native evidence, and attribution limits')
