# V19 regression investigation: mixed call-guard result

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
| kernel/direct_call | 4 | 34.106 | 35.808 | 35.247 | 35.312 | 0.984333 |
| kernel/float_call | 4 | 20.858 | 22.334 | 21.804 | 21.771 | 0.976269 |
| kernel/branch_call | 4 | 32.145 | 33.307 | 33.127 | 33.148 | 0.994596 |
| kernel/array_append | 4 | 138.969 | 132.763 | 132.125 | 133.225 | 0.995194 |
| floats/filter | 4 | 23.410 | 24.840 | 23.985 | 24.155 | 0.965580 |
| floats/channels_4 | 4 | 78.805 | 84.910 | 80.415 | 80.820 | 0.947062 |
| floats/pressure_8 | 4 | 153.830 | 162.475 | 166.225 | 167.005 | 1.023080 |
| floats/retained_input | 4 | 45.190 | 47.080 | 46.215 | 46.290 | 0.981627 |
| kernel/direct_call | 5 | 34.146 | 35.927 | 35.078 | 35.355 | 0.976369 |
| kernel/float_call | 5 | 21.357 | 22.350 | 21.817 | 21.683 | 0.976152 |
| kernel/branch_call | 5 | 32.114 | 33.357 | 33.009 | 33.088 | 0.989567 |
| kernel/array_append | 5 | 125.469 | 136.831 | 128.044 | 129.488 | 0.935782 |
| floats/filter | 5 | 23.275 | 24.500 | 24.215 | 24.295 | 0.988367 |
| floats/channels_4 | 5 | 78.830 | 84.210 | 80.615 | 80.915 | 0.957309 |
| floats/pressure_8 | 5 | 153.975 | 162.935 | 168.455 | 169.050 | 1.033879 |
| floats/retained_input | 5 | 44.760 | 47.085 | 46.150 | 46.465 | 0.980142 |

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
