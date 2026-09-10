# V23: transactional float-copy conversion

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

The unchanged equal-weight 56-component mix is **1.791497689× faster than audit**.
Geometric time ratios are **8.547046× Node / 5.651919× GJS**;
nearest-rank p90 ratios are **24.339757× / 13.629196×**.

| Suite | Speedup over audit |
|---|---:|
| kernels-seed17 | 1.144966× |
| applications-seed17 | 0.997241× |
| roots-seed17 | 1.590834× |
| members | 1.045383× |
| owners | 6.324052× |
| methods | 2.512550× |
| floats | 1.914902× |

Second application seed/count speedup: 0.994612×.
Second-seed cases more than 5% slower than audit:
none in this batch.
Full56 regressions remain in the score:

No full56 component is more than 5% slower than audit in this batch.

JIT-on/off time ratios are owners **0.454121**,
methods **1.044766**, and integer root
**0.264997**. The 2× milestone,
final Node/GJS targets, existing x64 failures and fresh matched PGO/LTO remain open.

## Regression controls

Five rotating rounds retain all eight applications, both seeds/counts and both
warmup histories, with audit, V22, V23 and an identical V23 repeat. All interpreter
checksum references agree. Controls do not replace or reweight full56 results.

| Filter seed | Warmups | Audit ns | V22 ns | V23 ns | V23 repeat ns | V23/V22 |
|---|---:|---:|---:|---:|---:|---:|
| 17 | w4 | 54.985 | 58.280 | 56.170 | 56.140 | 0.963795 |
| 17 | w5 | 55.110 | 58.085 | 55.950 | 56.165 | 0.963244 |
| 83 | w4 | 55.077 | 58.422 | 56.690 | 56.710 | 0.970345 |
| 83 | w5 | 54.907 | 58.490 | 56.352 | 56.290 | 0.963455 |

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
| array_append | 4 | 125.150 | 127.263 | 127.056 | 125.825 |
| direct_call | 4 | 34.186 | 25.664 | 25.673 | 25.668 |
| branch_call | 4 | 31.597 | 21.347 | 21.373 | 21.405 |
| channels_4 | 4 | 78.170 | 35.015 | 35.015 | 35.040 |
| pressure_8 | 4 | 153.480 | 93.690 | 93.620 | 93.745 |
| branching | 4 | 31.425 | 17.890 | 17.915 | 17.940 |
| records_4096 seed17 | 4 | 237.150 | 248.025 | 245.245 | 265.870 |
| records_4096 seed83 | 4 | 233.268 | 230.028 | 230.998 | 226.751 |
| array_append | 5 | 127.531 | 125.850 | 130.456 | 127.544 |
| direct_call | 5 | 34.225 | 25.702 | 25.692 | 25.693 |
| branch_call | 5 | 31.893 | 21.411 | 21.408 | 21.452 |
| channels_4 | 5 | 78.625 | 35.040 | 35.070 | 35.035 |
| pressure_8 | 5 | 153.055 | 93.715 | 93.720 | 93.800 |
| branching | 5 | 31.505 | 17.920 | 17.950 | 17.980 |
| records_4096 seed17 | 5 | 238.300 | 240.500 | 246.895 | 237.565 |
| records_4096 seed83 | 5 | 229.771 | 223.713 | 225.443 | 228.203 |

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
The binary SHA256 is `a4307d1afa1edf202037e36e4be345d6ccb06143ae65fa1b4c465080d6e89c9f`. Frozen executable,
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
