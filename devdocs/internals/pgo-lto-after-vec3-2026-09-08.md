# PGO/LTO after Vec3 inlining — September 8, 2026

Fresh PGO training plus LTO improves the current SQGI runtime's memory/helper
paths substantially: **1.62× for dynamic-key reads/writes, 1.36× for matrix,
1.31× for object member writes, and 1.30× for array writes**. Vec3 and the
other predominantly emitted-code kernels remain effectively unchanged.

These builds contain the completed [Vec3 object inlining
implementation](vec3-implementation-2026-09-08.md). The source and ordinary
Release executable match that report's hashes. No compiler/runtime source or
benchmark formulas were changed for this experiment.

## Build comparison

Five rounds rotate ordinary Release, LTO-only and trained PGO/LTO, with fresh
processes, five full warmups, CPU 0 affinity, JIT threshold 1 and 80,000 base
iterations. Simple scalar kernels use the suite's existing 20× iteration
multiplier. Kernel/execution suite order also alternates. All 19 checksums
match across all builds and rounds. Times below are **ns per iteration**.

| Kernel | Release | LTO only | PGO + LTO | Combined speedup |
| --- | ---: | ---: | ---: | ---: |
| Direct calls | 3.839 | 3.811 | 3.859 | 0.99× |
| Branching calls | 3.093 | 3.196 | 3.098 | 1.00× |
| Floating-point calls | 6.864 | 6.958 | 6.956 | 0.99× |
| Numeric loop | 6.025 | 6.049 | 6.010 | 1.00× |
| **Vec3** | **61.900** | **62.175** | **62.087** | **1.00×** |
| Dynamic members | 276.100 | 312.688 | 251.925 | 1.10× |
| Dynamic-key reads/writes | 25.562 | 24.512 | 15.738 | 1.62× |
| Object member writes | 106.700 | 97.775 | 81.687 | 1.31× |
| Array append | 39.050 | 39.113 | 30.600 | 1.28× |
| Array writes | 6.038 | 5.425 | 4.662 | 1.30× |
| Integer array reads | 1.233 | 1.224 | 1.234 | 1.00× |
| Float array reads | 1.789 | 1.791 | 1.791 | 1.00× |
| Math intrinsics | 26.638 | 26.713 | 26.650 | 1.00× |
| Variable-argument math | 47.063 | 47.188 | 47.100 | 1.00× |
| **Matrix** | **76.387** | **68.500** | **56.275** | **1.36×** |
| Temporary arrays | 7.325 | 7.325 | 7.300 | 1.00× |
| GI scalar call | 498.750 | 507.025 | 482.812 | 1.03× |
| GI clock call | 261.338 | 258.362 | 224.450 | 1.16× |
| Array guards | 1.125 | 1.100 | 1.125 | 1.00× |

LTO alone improves matrix by about 1.12×, array writes by 1.11× and object
member writes by 1.09×, but dynamic-member access becomes 13% slower. Fresh
training provides most of the dynamic-key improvement and makes the combined
build preferable for this workload mix.

PGO optimizes the compiled C/C++ runtime, helper functions and compiler. It
does not optimize the machine code emitted by the JIT. The flat Vec3 and
scalar-loop results are consistent with their work already running in native
code generated at runtime. Small differences around 1–3% are not treated as
reliable wins or regressions.

## Updated JavaScript/Python comparison

A separate five-round run rotates Release, PGO/LTO, Node 18.19.1, GJS 1.80.2
in ES module mode, and CPython 3.12.2. All 15 equivalent kernel checksums match.
Selected medians are shown here; the evidence contains every row.

| Kernel | SQGI Release ns | SQGI PGO/LTO ns | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: |
| Vec3 | 62.025 | 61.012 | 183.562 | 150.975 | 1842.122 |
| Dynamic members | 267.363 | 253.512 | 32.467 | 23.288 | 267.990 |
| Dynamic-key reads/writes | 25.625 | 15.500 | 21.816 | 11.975 | 111.614 |
| Object member writes | 106.500 | 80.950 | 3.977 | 7.775 | 195.911 |
| Array append | 38.363 | 30.250 | 12.469 | 6.138 | 64.540 |
| Array writes | 6.038 | 4.562 | 1.565 | 1.950 | 49.200 |
| Matrix | 74.688 | 56.350 | 7.230 | 14.988 | 354.085 |

Vec3 remains about **3.0× faster than Node and 2.5× faster than GJS**. Dynamic-
key reads/writes now beat Node by **1.41×**, although GJS remains faster.
Matrix is still **7.8× slower than Node and 3.8× slower than GJS**. Object
member writes remain about **20× slower than Node**. PGO reduces these gaps;
further JIT/runtime changes are still needed to close them.

Use the contemporaneous Release column when assessing the improvement. The
absolute times differ slightly from the earlier report even for the unchanged
Release executable. These are warmed microbenchmarks, not application or
startup measurements.

## Training and validation

All builds use GCC 13.3.0 on the i7-12700, Release `-O3 -DNDEBUG -g`, JIT
enabled, int64/double, and install prefix `/usr`. Fast-math remains disabled.
CMake's Release IPO emits `-flto=auto -fno-fat-lto-objects`.

PGO used a new build/profile directory. Training ran the 94-test correctness
suite, followed by:

- `test_jit_perf_correctness.nut`: all 15 kernels, 20,000 base iterations,
  two warmups, JIT threshold 1.
- `bench_execution.nut`: four kernels, 20,000 iterations, five warmups.
- `bench_vec3.nut`: all seven variants, 20,000 iterations, two warmups.

The same directory was then reconfigured from `GENERATE` to `USE`. There are
89 profile files, including all 54 SQGI core translation units and the CLI.
GCC reported no coverage mismatch or missing profile for the core/CLI. Its
22 missing-profile warnings are confined to unused standalone bundled
`squirrel`/`sqstdlib` targets, which receive ordinary compiler optimization.
Training data targets these benchmark shapes, so this result should not be
generalized to an arbitrary application workload without measuring it.

Validation: **94/94 tests passed in each of LTO-only, PGO generation, and
trained PGO/LTO builds**. This includes native execution, object-plan guards,
GC, rollback, numeric-width and ABI-emitter checks. The existing
`sqgi_test_sqgipkg` external-download test was excluded. No sanitizer or ARM
performance result is inferred from these x86-64 Release builds.

## Using and reproducing this build

The tested combined executable is:

```text
/tmp/sqgi-pgo-vec3-20260908.SJ3iqV/pgo/sqgi
```

Run it with JIT enabled:

```sh
SQGI_JIT=1 /tmp/sqgi-pgo-vec3-20260908.SJ3iqV/pgo/sqgi your-script.nut
```

Reproduce training with the [compiler optimization build
instructions](../../tools/README.md#compiler-optimization-builds), adding the
Vec3 training command above and retaining the same build directory between
`GENERATE` and `USE`. Profiles must be refreshed when source/compiler changes.
The exact benchmark runner is saved inside the evidence and at
`/tmp/sqgi-pgo-vec3-20260908.SJ3iqV/compare_builds.py`.

The installed runtime, normal `build/` directory and default build options
remain unchanged. This experiment supports a trained PGO/LTO release build,
with workload-specific training kept separate from ordinary development builds.

[Saved evidence](pgo-lto-after-vec3-2026-09-08.json) contains source/binary
hashes, build settings, profile inventory, training/test logs and all timing
samples. Raw builds and profiles remain in
`/tmp/sqgi-pgo-vec3-20260908.SJ3iqV/`.
