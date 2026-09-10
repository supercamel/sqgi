# V24 — rejected performance candidate; correctness fixes retained

Frozen binary SHA256: `321747879be6301d431d9118a1bbfb138887e14e930e0d90e2f0ba6cfd1223f7`.

The unchanged 56-component, five-round study measures **1.806949370×** audit
speedup. Node/GJS geometric runtime ratios are **8.455109/5.589492**;
p90 ratios are **24.873326/13.421299**. These remain outside the goal targets.
See [full results](study/results/summary.json) and
[paired controls](study/regression-control-summary.json). Application seed83 is
retained separately and does not change the 56-component weights.

Array append regresses consistently: 165.513 ns versus audit 126.475 ns in the
full study. Warmups4/5 controls reproduce 30.5–31.6% more time than V23, including
identical-binary repeats. Math intrinsic improves by roughly 46% versus V23;
member buffers improve by roughly 14% versus audit. Other controls show no
consistent >5% regression; seed17/w5 records_4096 has a repeat-only outlier.
No timing was discarded or repeated to repair the reporting script: the float
control additionally includes Node, which its original assertion overlooked.

[Isolated append captures](study/append-regression/candidate.json) confirm 319
receiver-publication helper calls for 319 actual native appends, versus none
at that site in V23. Both isolated profiles have zero lost samples. V24's profile
attributes 11.16% to CanRelease, 10.97% to FinishStackWrite, 10.58% to
RecordStackSlot, and 7.28% to PublishStackWrite. These are sampled proportions,
not independently additive estimates of the regression. GDB captures and perf
runs are separate; their addresses are not joined across processes.

All seven full-suite profiles have zero lost samples. Six captured precise
functions verify 137 exact resume guards. Five preexisting precise functions
and seven preexisting loops retain normalized code. rotate_buffers now has an
actual precise native entry (7884 bytes). Math intrinsic's gain accompanies
legacy native loop coverage after a guarded whole-function attempt; it is not
a successful faster whole-function execution. See the retained native-code and
exit-code verification JSON files in study/.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Current-revision logs have the `sqgi-v24-callee-` prefix; earlier logs
record the superseded receiver-only pilot. Eight independent AArch64 coverage
markers execute. Allocation and executable-memory failure probes verify safe
fallback and retry. x64 retains the same 32 known assertions.

V24 fixes observable private prepared-receiver/callee and length-result release
ordering, and extends precise equality/default-length coverage. The correctness
fixes stay; V23 remains the last accepted performance result. V25 will test an
exact-object identity check before redundant private reference publication,
while retaining full journal behavior for changed destinations and GET swaps.
Full targets, existing x64 defects and fresh matched PGO/LTO remain open.
