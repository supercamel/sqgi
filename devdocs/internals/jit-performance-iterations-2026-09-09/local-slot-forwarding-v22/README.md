# V22: private local-slot forwarding

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

The unchanged equal-weight 56-component mix is **1.794565216× faster than audit**.
Geometric time ratios are **8.509880× Node / 5.641085× GJS**;
nearest-rank p90 ratios are **24.233821× / 13.762369×**.

| Suite | Speedup over audit |
|---|---:|
| kernels-seed17 | 1.147289× |
| applications-seed17 | 1.008026× |
| roots-seed17 | 1.596144× |
| members | 1.044877× |
| owners | 6.292444× |
| methods | 2.520085× |
| floats | 1.915194× |

Second application seed/count speedup: 0.981675×.
Full56 regressions remain in the score:

- applications-seed17/filter_stream: 5.160% slower than audit.

JIT-on/off time ratios are owners **0.457888**,
methods **1.047602**, and integer root
**0.264388**. The complete goal
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
| direct_call | 4 | 34.185 | 25.106 | 25.663 | 25.644 | 1.022186 |
| float_call | 4 | 21.374 | 13.008 | 12.447 | 12.432 | 0.956873 |
| branch_call | 4 | 32.146 | 20.566 | 21.350 | 21.374 | 1.038121 |
| array_append | 4 | 127.669 | 128.069 | 127.238 | 126.469 | 0.993511 |
| filter | 4 | 23.535 | 13.665 | 13.765 | 13.420 | 1.007318 |
| channels_4 | 4 | 78.870 | 59.770 | 35.015 | 35.025 | 0.585829 |
| pressure_8 | 4 | 152.975 | 139.525 | 93.645 | 93.665 | 0.671170 |
| retained_input | 4 | 44.555 | 26.420 | 24.360 | 24.345 | 0.922029 |
| branching | 4 | 31.250 | 17.515 | 17.985 | 17.980 | 1.026834 |
| direct_call | 5 | 34.202 | 25.055 | 25.656 | 25.660 | 1.023987 |
| float_call | 5 | 21.337 | 12.982 | 12.414 | 12.444 | 0.956247 |
| branch_call | 5 | 31.938 | 20.552 | 21.386 | 21.367 | 1.040580 |
| array_append | 5 | 130.438 | 136.806 | 125.275 | 126.337 | 0.915713 |
| filter | 5 | 23.465 | 13.630 | 13.620 | 13.440 | 0.999266 |
| channels_4 | 5 | 78.120 | 60.795 | 34.970 | 35.045 | 0.575212 |
| pressure_8 | 5 | 153.050 | 139.415 | 93.590 | 93.615 | 0.671305 |
| retained_input | 5 | 44.430 | 26.385 | 24.535 | 24.340 | 0.929884 |
| branching | 5 | 31.365 | 17.505 | 17.930 | 17.910 | 1.024279 |

Large-record controls:

| Warmups | Audit ns | V21 ns | V22 ns | Same V22 repeat ns |
|---|---:|---:|---:|---:|
| w4 | 272.153 | 262.781 | 242.536 | 277.060 |
| w5 | 270.550 | 264.351 | 250.651 | 265.523 |

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
| 17 | w4 | 55.155 | 56.345 | 58.105 | 57.750 |
| 17 | w5 | 55.030 | 56.230 | 57.865 | 57.975 |
| 83 | w4 | 54.970 | 56.532 | 57.965 | 58.572 |
| 83 | w5 | 54.845 | 56.495 | 58.130 | 57.940 |

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
| seed17-w5 | 57.910 | 56.300 | 57.870 | 56.410 | 0.972198 |
| seed17-w4 | 58.045 | 56.280 | 57.720 | 56.090 | 0.969593 |
| seed83-w5 | 58.187 | 56.125 | 58.122 | 56.150 | 0.964554 |
| seed83-w4 | 58.005 | 56.350 | 58.080 | 56.662 | 0.971468 |

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
1576 of 1606 samples to live generated mappings.
442 native sampled IPs are stack load/store instructions
(28.05%). FMOV samples are now
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
