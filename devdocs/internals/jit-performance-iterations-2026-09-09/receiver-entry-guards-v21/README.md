# V21: receiver entry guards

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

The unchanged equal-weight 56-component mix is **1.756968834× faster than audit**.
Geometric time ratios are **8.716162× Node / 5.762824× GJS**;
nearest-rank p90 ratios are **25.024323× / 13.794949×**.
These are fresh V21 measurements, not the rejected V20 results.

| Suite | Speedup over audit |
|---|---:|
| kernels-seed17 | 1.140993× |
| applications-seed17 | 1.018146× |
| roots-seed17 | 1.606284× |
| members | 1.045078× |
| owners | 6.269308× |
| methods | 2.515538× |
| floats | 1.622288× |

Second application seed/count speedup: 0.975971×.
Full56 regressions stay in the score:

- kernels-seed17/array_append: 7.910% slower than audit.

JIT-on/off time ratios are owners **0.457710**,
methods **1.044566**, and integer root
**0.264291**. The goal remains active;
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
| direct_call | 4 | 34.173 | 35.182 | 25.033 | 25.126 | 0.711529 |
| float_call | 4 | 21.013 | 21.535 | 13.015 | 13.021 | 0.604365 |
| branch_call | 4 | 31.859 | 33.045 | 20.578 | 20.572 | 0.622727 |
| array_append | 4 | 124.406 | 121.200 | 121.163 | 121.200 | 0.999695 |
| filter | 4 | 23.460 | 24.065 | 13.705 | 13.695 | 0.569499 |
| channels_4 | 4 | 78.140 | 80.840 | 59.760 | 59.850 | 0.739238 |
| pressure_8 | 4 | 152.490 | 172.595 | 139.610 | 139.430 | 0.808888 |
| retained_input | 4 | 44.415 | 46.270 | 26.400 | 26.335 | 0.570564 |
| direct_call | 5 | 34.171 | 35.328 | 25.147 | 25.099 | 0.711815 |
| float_call | 5 | 21.339 | 21.730 | 12.995 | 12.993 | 0.598021 |
| branch_call | 5 | 32.085 | 33.105 | 20.577 | 20.580 | 0.621568 |
| array_append | 5 | 136.813 | 128.150 | 126.362 | 125.700 | 0.986048 |
| filter | 5 | 23.165 | 24.195 | 14.575 | 13.680 | 0.602397 |
| channels_4 | 5 | 77.985 | 81.370 | 60.755 | 60.730 | 0.746651 |
| pressure_8 | 5 | 153.850 | 168.025 | 139.360 | 139.475 | 0.829400 |
| retained_input | 5 | 44.930 | 46.095 | 26.400 | 26.725 | 0.572730 |

The original seed83/count400003 run has a 14.035% `records_4096` slowdown
against audit, with candidate samples spanning roughly 246–308 ns. The extra
unchanged eight-application controls use five rotating rounds of audit, V19, V21
and an identical V21 repeat at each warmup history:

| Warmups | Audit ns | V19 ns | V21 ns | Same V21 repeat ns |
|---|---:|---:|---:|---:|
| w4 | 257.993 | 247.351 | 275.008 | 254.371 |
| w5 | 256.498 | 266.016 | 248.411 | 261.006 |

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
