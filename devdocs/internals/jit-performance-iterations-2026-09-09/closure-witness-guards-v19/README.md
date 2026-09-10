# V19: fold closure lifetime checks into existing identity helpers

V19 removes the separate eight-instruction lifetime check at guarded closure lookups.
The existing C++ helper receives a retained SQWeakRef instead of the raw expected
closure pointer. It validates the weak object's type before borrowing the current
member and comparing identities. A dead witness remains dead if the allocator
reuses the former closure's address. Guards stay at their existing execution point,
without strong closure pins or new effects. Direct whole-prototype calls retain
the earlier separate check before argument materialization.

This follows the V18 regression investigation. The corrected, activated tests
remain authoritative; see [V18's correction](../precise-integer-compare-v18/validation-correction.md)
before relying on earlier targeted-test claims. Existing frozen evidence is unchanged.

## Measurement

The unchanged equal-weight 56-component mix is **1.612804330× faster than audit**.
This is nearly flat against V18; the 0.14% cross-batch aggregate difference is not
a demonstrated overall gain. Paired controls show small call improvements but
pressure is 2.3–3.4% slower than V18. See [the regression investigation](regression-investigation.md).
Time ratios to Node/GJS are **9.482733× / 6.278747×**;
nearest-rank p90 ratios are **24.846929× / 14.043077×**.
The original performance goal remains active, including the 2× first milestone,
interpreter profitability, full target, x64 repairs, and matched fresh PGO/LTO.

| Suite | Speedup over audit |
|---|---:|
| kernels-seed17 | 1.057797× |
| applications-seed17 | 0.998826× |
| roots-seed17 | 1.585761× |
| members | 1.045776× |
| owners | 6.354130× |
| methods | 2.512593× |
| floats | 0.972026× |

Second application seed/count speedup: 0.990599×.
Full-mix regressions remain in the score:

- floats/pressure_8: 12.604% slower than audit.

Both four- and five-warmup controls use five rotating rounds, the unchanged full
15-kernel and seven-float scripts, interpreter references, and identical-candidate
repeat labels. These are diagnostic controls, not replacement score components.

- kernel-w4: geometric time ratio V19/V18 0.995460; cases over 5% slower: none.
- floats-w4: geometric time ratio V19/V18 0.976853; cases over 5% slower: none.
- kernel-w5: geometric time ratio V19/V18 0.988640; cases over 5% slower: none.
- floats-w5: geometric time ratio V19/V18 0.981125; cases over 5% slower: none.

JIT-on/off time ratios: owners 0.456739,
methods 1.049228, integer root
0.264960. The source and all
56 per-case values, tails, rounds, host snapshots, and both application seeds
are retained. Array-append variability from earlier iterations remains open.

## Correctness and route evidence

- Release and strict ASan/UBSan: 100/100 tests with precise exits enabled and
  default settings, in each configuration. Both binaries pass all 41 holdouts.
- Detailed test logs require the ten generated-code groups, loop adaptation and
  lifetime contracts, and the new native-closure lifetime marker. Release actually
  reuses the removed native closure address; sanitizer permits allocator quarantine.
- The new native test warms a real compiled math loop, releases its observed
  native closure, checks weak death, installs a different native function at the
  reused address, and requires a native guard failure and the replacement result.
- GDB observes 2221 helper calls across the existing closure and new native
  lifetime tests, including 38 null/dead witnesses; every dead witness returns
  guard failure. No helper treats recycled raw addresses as live identities.
- Eight benchmark code captures compare V18/V19: retained weak witnesses become
  existing helper arguments and redundant emitted guards disappear. The array
  append artifact remains structurally unchanged. Comparisons mask relocated wide
  constants and branch offsets; they are structural evidence, not equivalence
  proofs for arbitrary masked constants.
- Five canonical precise functions retain their decoded exact exits and native
  stores/comparison. Seven fresh profiles report zero lost samples.
- x64/QEMU retains the same 32 known assertions (27 release order, five member
  result coverage), with six of seven executables passing. This is an open defect,
  not a passing cross-backend claim.

## Reproduction and retained artifacts

`binary.sha256`, 95-file `source-manifest.json`, unchanged original 88 benchmark/
script hashes, the four-file V18 delta, and the reconstructable 28-file combined
runtime/test patch identify the build. The additional tracked source is the
previously unchanged intrinsic test. The frozen executable and raw profiles live
in `build-jit-audit-20260909/closure-witness-guards-v19`.

Use the archived gates and measurement scripts from the repository root. Builds,
tests, GDB and sampling profiles did not overlap accepted timing. Retained native
test executables use their retained engine through `LD_LIBRARY_PATH` pointing to
that build's `native-validation` directory; its resolved dependency and hashes
are included. Release uses GCC 13.3, O3/DNDEBUG/debug symbols, int64/double on
AArch64 CPU 4. No PGO/LTO is included. All earlier artifact hashes were verified
before updating the mutable progress report.
