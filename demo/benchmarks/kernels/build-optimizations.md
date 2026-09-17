# JIT, LTO and PGO build comparison

These options optimize different parts of the program:

- `SQ_ENABLE_JIT=ON` builds the experimental Squirrel bytecode JIT. Runtime
  activation additionally requires `SQGI_JIT=1`; the default hot threshold is
  1,000. Unsupported functions/loops fall back to interpretation.
- `CMAKE_BUILD_TYPE=Release` uses GCC's Release optimizations for SQGI itself.
  Earlier kernel benchmarks used RelWithDebInfo. Both use LLVM O3 for kernels.
- `SQGI_ENABLE_LTO=ON` enables interprocedural optimization in Release builds.
- `SQGI_PGO_MODE=GENERATE/USE` collects and consumes GCC profiles for SQGI's
  executable/runtime/compiler implementation. This does not feed profiles into
  the LLVM-generated kernel code or optimize the prebuilt LLVM shared library.

## Reproduction

Use GCC and the LLVM 18 SDK described in the kernel build documentation. Configure
three separate Release builds, all with `SQ_ENABLE_JIT=ON`,
`SQGI_ENABLE_KERNELS=ON` and `SQGI_KERNEL_BACKEND=LLVM`:

| Build | SQGI_ENABLE_LTO | SQGI_PGO_MODE initially |
| --- | --- | --- |
| release | OFF | OFF |
| lto | ON | OFF |
| pgo | ON | GENERATE |

Build `sqgi-bin` in each directory. Train the PGO executable with both
`SQGI_JIT=0` and `SQGI_JIT=1`, running the scripts in `demo/kernels` (except
`support.nut`), `test/test_kernel.nut`, `test/test_typed_modules.nut`,
`test/test_kernel_locals.nut`, `test/test_jit_correctness.nut`,
`test/test_jit_perf_correctness.nut`, and
`demo/benchmarks/kernels/train_optimizations.nut`.

Then reconfigure **the same PGO build directory** with `SQGI_PGO_MODE=USE` and
rebuild `sqgi-bin`. Keep the source and compiler flags unchanged between generate
and use, apart from the profile mode. Using another directory can change GCC's
profile filenames. Check the build log for missing/mismatched profiles; the
measured build consumed 60 generated `.gcda` files with no such warnings.

Create a JSON list of configurations, with absolute binary paths:

```json
[
  {"name":"Release","binary":"/path/to/release/sqgi","jit":false},
  {"name":"Release+JIT","binary":"/path/to/release/sqgi","jit":true},
  {"name":"LTO","binary":"/path/to/lto/sqgi","jit":false},
  {"name":"LTO+JIT","binary":"/path/to/lto/sqgi","jit":true},
  {"name":"LTO+PGO","binary":"/path/to/pgo/sqgi","jit":false},
  {"name":"LTO+PGO+JIT","binary":"/path/to/pgo/sqgi","jit":true}
]
```

Run after all compilation and training have finished:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_builds.py configs.json \
  --output /tmp/kernel-build-comparison.json
```

The runner measures both the oscillator workflow and typed-controller workloads,
checks every result/state/checksum across configurations, and compares Node in
fresh processes per case. There are two trials in reversed configuration order,
with nine CPU-time samples per trial, a warm-up before measurement and JIT
threshold 1,000. Node uses ordinary scratch arrays for the oscillator and
Float64Array input/output for the controller. Profiles are trained partly on
these workloads, so PGO results should not be generalized to unrelated apps.

For an untimed check of what the JIT actually executes:

```sh
SQGI_JIT=1 SQGI_JIT_TRACE=stats /path/to/release/sqgi \
  demo/benchmarks/kernels/jit_call_probe.nut
```

Keep tracing off during benchmarks. `SQGI_JIT_TRACE=stats` adds instrumentation;
`SQGI_JIT_TRACE=1` additionally logs compilation and execution decisions.

## Measured results

Host: Intel i7-12700, CPU 0; GCC 13.3; LLVM 18; Node v18.19.1 /
V8 10.2.154.26-node.28. All times below are median nanoseconds per call over
18 samples. “Previous O2” is the existing RelWithDebInfo build with JIT compiled
out. The other builds are Release with JIT support compiled in; labels without
“+JIT” use `SQGI_JIT=0`. All compared outputs, object state and checksums match.

Whole oscillator simulation, including local object and scratch initialization:

| Build/runtime | 1 step | 16 steps | 256 steps | 4,096 steps |
| --- | ---: | ---: | ---: | ---: |
| Previous O2 | 34.9 | 74.8 | 776.8 | 12,026.6 |
| Release | 35.2 | 74.4 | 776.3 | 12,032.3 |
| Release+JIT | 33.8 | 73.7 | 775.5 | 12,023.1 |
| LTO | 45.0 | 78.3 | 780.5 | 12,027.2 |
| LTO+JIT | 42.8 | 77.6 | 779.5 | 12,028.7 |
| LTO+PGO | 28.2 | 71.7 | 773.6 | 12,022.0 |
| LTO+PGO+JIT | 27.3 | 70.9 | 773.7 | 12,022.0 |
| Node | 11.7 | 40.7 | 991.7 | 16,301.7 |

Typed controller calls (driver times are per call, not per element):

| Build/runtime | Driver/1 | Scalar method | Driver/16 | Driver/256 | Driver/4,096 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Previous O2 | 67.9 | 61.0 | 85.4 | 489.3 | 6,972.8 |
| Release | 63.8 | 61.5 | 82.3 | 487.6 | 6,967.2 |
| Release+JIT | 66.1 | 63.1 | 85.1 | 489.9 | 6,974.9 |
| LTO | 68.8 | 71.5 | 84.8 | 488.8 | 6,973.9 |
| LTO+JIT | 71.0 | 72.7 | 89.4 | 493.6 | 6,984.1 |
| LTO+PGO | 54.3 | 50.6 | 76.4 | 481.2 | 6,965.2 |
| LTO+PGO+JIT | 56.6 | 52.8 | 79.8 | 485.8 | 6,971.8 |
| Node | 1.7 | 5.3 | 26.9 | 1,727.2 | 17,593.2 |

PGO helped small-call costs; LTO alone regressed them in this run. The combined
LTO+PGO build reduced the scalar controller method from 61.5 ns (Release) to
50.6 ns with JIT off. Enabling JIT gave 52.8 ns. The single-step simulation
reached 27.3 ns with all options enabled, versus 35.2 ns in plain Release. The
4,096-step oscillator remained about 12.0 µs in every build, ahead of Node's
16.3 µs, because these flags do not change the generated LLVM kernel code.

These are measurements of this build/workload, not a promise that LTO or PGO
always helps. No default build options were changed.

### What the Squirrel JIT actually executed

Separate, untimed traces show some ancillary arithmetic loops compiled in the
benchmark scripts. The isolated `jit_call_probe.nut` is more conclusive for the
calling boundary: both named functions (`kernel_call_driver` and
`native_method_driver`) were rejected with `unsupported callee or receiver`.
The probe recorded zero native loop executions. The controller benchmark also
reported this rejection for its two calling closures. Thus `SQGI_JIT=1` does not
currently turn these kernel-call drivers into native loops; it leaves the
Squirrel-to-native dispatch boundary in place.

Eighteen selected tests passed in each of the three builds with JIT enabled:
the 11 kernel demos, three kernel integration/lifetime/local-storage suites,
and four bytecode-JIT correctness/performance-correctness tests. This was not a
claim that the entire experimental bytecode-JIT test suite passes.
