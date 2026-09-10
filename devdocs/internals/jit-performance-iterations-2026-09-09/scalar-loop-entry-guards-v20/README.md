# V20 (rejected): scalar loop entry guards

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

The measured, unaccepted 56-component mix is **1.749222226× faster than audit**.
Geometric time ratios are **8.738534× Node / 5.755491× GJS**;
nearest-rank p90 ratios are **24.952637× / 13.948677×**.

| Suite | Speedup over audit |
|---|---:|
| kernels-seed17 | 1.137577× |
| applications-seed17 | 1.003804× |
| roots-seed17 | 1.580071× |
| members | 1.041147× |
| owners | 6.292346× |
| methods | 2.505663× |
| floats | 1.619131× |

Second application seed/count speedup: 0.991914×.
Full56 regressions are retained in the score:

- kernels-seed17/array_append: 9.618% slower than audit.

JIT-on/off time ratios are owners **0.460144**,
methods **1.051188**, and integer root
**0.264358**. The original goal,
including the 2× milestone and method profitability, remains active. The full
Node/GJS targets, open x64 defects, and matched fresh PGO/LTO are not complete.

## Paired controls and variance

Both warmup histories use five rotating rounds and interpreter checksum references.
The unchanged full 15-kernel controls contain audit, V19, V20 and an identical V20
repeat (40 timed processes); the seven-float controls add Node (50 timed processes).
These controls neither replace nor reweight the full56 result.

| Case | Warmups | Audit ns | V19 ns | V20 ns | Same V20 repeat ns | V20/V19 |
|---|---:|---:|---:|---:|---:|---:|
| direct_call | 4 | 34.158 | 35.341 | 25.142 | 24.958 | 0.711412 |
| float_call | 4 | 21.135 | 21.746 | 13.022 | 13.013 | 0.598823 |
| branch_call | 4 | 31.989 | 33.032 | 20.525 | 20.643 | 0.621367 |
| array_append | 4 | 128.550 | 142.669 | 131.294 | 132.681 | 0.920270 |
| filter | 4 | 23.565 | 23.945 | 14.040 | 13.755 | 0.586344 |
| channels_4 | 4 | 78.560 | 80.930 | 60.765 | 59.690 | 0.750834 |
| pressure_8 | 4 | 152.725 | 168.680 | 139.440 | 139.455 | 0.826654 |
| retained_input | 4 | 44.930 | 46.815 | 26.425 | 26.515 | 0.564456 |
| direct_call | 5 | 34.174 | 35.081 | 24.977 | 24.907 | 0.711981 |
| float_call | 5 | 21.452 | 21.470 | 13.013 | 13.006 | 0.606102 |
| branch_call | 5 | 32.110 | 33.192 | 20.582 | 20.502 | 0.620089 |
| array_append | 5 | 110.356 | 125.031 | 117.231 | 134.331 | 0.937615 |
| filter | 5 | 23.400 | 24.125 | 13.700 | 13.730 | 0.567876 |
| channels_4 | 5 | 78.605 | 81.215 | 59.790 | 60.780 | 0.736194 |
| pressure_8 | 5 | 152.275 | 165.770 | 139.515 | 139.355 | 0.841618 |
| retained_input | 5 | 45.020 | 46.590 | 26.670 | 26.495 | 0.572440 |

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
