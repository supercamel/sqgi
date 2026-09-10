# V25 identity-preserving publication — accepted performance iteration

Frozen binary SHA256: `10d209d2d40cd5114412c691c362f94753b06196280e5c78c80c87b728d75699`.

The unchanged 56-component, five-round study measures **1.825291247× audit**
speedup. Node/GJS geometric runtime ratios are **8.382561/5.554487**;
p90 ratios are **24.228039/13.532819**. No full56 component regresses by more
than 5% versus the audit. These results remain outside the goal targets.
[Full results](results/summary.json) retain all 56 equally weighted components;
application seed83 is retained separately. Profitability, all seven ordinary profiles and broader paired controls are
complete. Both warmup histories and identical-binary repeats show no >5%
regression against V23. V25 is the latest accepted full performance result.

A complete type/pointer equality check avoids a journal round trip when an
unstaged reference assignment would leave the same owning object in the same
VM slot. Changed objects still use the full journal checks; staged writes and
GET temporary swaps retain their original behavior. V24's release-order fixes
and precise length coverage remain intact.

Both five-round kernel controls (warmups4/5) restore array_append to ~126 ns,
versus V24's ~167 ns, with identical-binary repeats agreeing. The math intrinsic
gain remains. No >5% kernel regression versus V23 appears in either control or
repeat. The full-study append result is 125.913 ns versus audit 125.138 ns.
The [isolated verification](append-regression/identity-verification.json) checks
all six added instructions and their exact branch targets: 319 native appends
across two native invocations now require only two receiver publications instead
of 319. Both isolated profiles have zero lost samples; process addresses are
never joined between debugger and profiler runs.

Fresh code captures retain existing math code and loops; five established
precise functions are byte-equivalent after masking only pointer materialization.
Six precise functions verify 137 exact resume guards. rotate_buffers remains
7884 bytes; the changed append entry grows from 1496 to 1520 bytes.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Nine independent AArch64 coverage markers execute, including twelve
native groups in the side-exit suite. The new group covers repeated receivers,
final/nonfinal/marked owners, ancestor pins, weak death and late-failure rollback.
Resource-failure probes verify fallback and retry. x64 retains the same 32 known
assertions. The 96-file source manifest, 88 unchanged benchmarks/scripts and
30-file audit reconstruction are verified by freeze.py.

The next post-increment candidate starts from this frozen source; its work is
tracked in the sibling owning-postincrement-v26-work-in-progress directory. The full
performance goal and fresh matched PGO/LTO remain open.

Completed profitability: owners JIT-on/off geometric ratio 0.454679;
methods 1.042785; root_integer 0.265103. The method regression versus the
interpreter remains. All seven ordinary profiles have zero lost samples.
Owner PINCL remains a measured hotspot at 13.71%; method VM Execute is 47.33%.
All paired controls pass with no >5% regression against V23. See
[the complete control summary](study/regression-control-summary.json).

All raw timings, controls, profiling data, trace logs and native captures are
retained in study/. Kernel pilot binaries are byte-identical to the final frozen
candidate, so their already completed controls were retained without rerunning.
The seven full profiles have zero lost samples. No historical V23/V24 outlier
or rejected result is removed or reweighted by accepting this iteration.
