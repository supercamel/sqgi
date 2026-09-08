# 64-bit numbers and the Node.js comparison

SQGI now uses signed 64-bit integers and binary64 (`double`) floating-point
values by default. With that configuration, the warmed kernels measured here
are generally slower than the installed Node.js 18.19.1, with one math-kernel
exception. This is a workload comparison, not an application-wide speed ratio.

## Numeric configuration

`Squirrel3/include/sqconfig.h` defines the numeric ABI for the runtime, bundled
Squirrel libraries, checker and external C/C++ consumers. Integers were already
64-bit on the development host; floats have changed from single to double
precision. The public script type name remains `float`, with `_intsize_ == 8`
and `_floatsize_ == 8`.

The x86 emitter already selected its floating instructions by `SQFloat` width.
The AArch64 emitter needed double loads/stores, integer conversions, arithmetic,
negation and comparisons. Its constant loaders now preserve all 64 bits, and
single-precision restrictions on normal value storage have been removed.
Legacy immediate float bytecodes still reject where their 32-bit encoding
cannot represent the new value width; the compiler uses literal loads instead.
Raw object initialization also clears unused pointer bytes when pointers are
narrower than the fixed 64-bit value storage.

The install now includes the bundled Squirrel public headers, so an embedder
using `sqgi.pc` receives the matching numeric types without extra definitions.
The shared library moves to ABI version 1 (`libsqgi.so.1`, file version `1.0.0`),
separate from the application release version. Packaging uses the new SONAME.
Native embedders/extensions must rebuild against these headers. Previously
serialized float32 bytecode must be recompiled: its recorded float width is
checked and rejected by the loader. Source scripts need no type-name changes,
but floating results can change because intermediate rounding is more precise.

## Measurement method

Intel Core i7-12700, Linux x86_64, GCC 13.3 Release SQGI with JIT enabled and
threshold 1. Node is the existing `/usr/bin/node`, v18.19.1, V8
`10.2.154.26-node.28`, using default engine flags.

The Node port performs the same 15 algorithms as
`test/test_jit_perf_correctness.nut`, with ordinary arrays, objects and Numbers.
All integer intermediates in these workloads fit JavaScript's exact integer
range; this does not compare SQGI int64 with JavaScript BigInt. Both now use
double precision for floating arithmetic. Vec3 operator overloads become
explicit JavaScript methods performing the same component operations.

Five fresh process pairs alternate runtime order, pinned to CPU 0, with five
full untimed invocations of each kernel before its timed invocation. Each pair
checks all integer results exactly and all floating results with relative and
absolute tolerance `1e-10`, using 17-digit SQGI checksum output. All checks pass.
Base iterations are 80,000; scalar call, numeric-loop and array-read kernels run
1,600,000 iterations. No builds or tests run concurrently with timing.

Times below are median **nanoseconds per kernel loop iteration**. Allocation
inside a kernel is included. Parsing, startup, warmup, formatting and GI boundary
costs are outside the timed intervals. A loop iteration can contain several
operations; these are not isolated instruction or call latencies.

| Kernel | SQGI | Node 18 | SQGI/Node time |
| --- | ---: | ---: | ---: |
| direct_call | 6.602 | 4.080 | 1.618x |
| branch_call | 6.604 | 2.888 | 2.287x |
| float_call | 11.157 | 1.536 | 7.266x |
| numeric_loop | 10.072 | 5.502 | 1.830x |
| vector | 2787.437 | 184.949 | 15.071x |
| dynamic_member | 258.950 | 33.700 | 7.684x |
| dynamic_key_get_set | 25.900 | 21.797 | 1.188x |
| object_member_write_fallback | 192.250 | 3.964 | 48.500x |
| array_append | 36.062 | 12.592 | 2.864x |
| array_write | 8.975 | 1.537 | 5.840x |
| array_read | 2.291 | 0.658 | 3.481x |
| array_float | 2.191 | 0.549 | 3.993x |
| math_intrinsic | 25.950 | 14.162 | 1.832x |
| math_variable | 45.637 | 55.658 | 0.820x |
| matrix | 73.000 | 7.327 | 9.964x |

A ratio above 1 means Node is faster. SQGI is 1.22x faster on `math_variable`,
which varies all transcendental arguments. It does not establish a general
math-library advantage. Dynamic-key table updates and integer leaf calls are
relatively close; object-valued writes, general object operations and vector
methods expose the largest remaining gaps. Existing native coverage restrictions
leave the object-write/vector workloads on interpreter paths. The causes of the
remaining native-kernel gaps require profiling; these timings alone do not
separate register traffic, remainder lowering, guards or engine specialization.

Do not compare this table directly with earlier float32 optimization reports:
numeric precision and warmup methodology have changed. No newer Node version,
startup, memory-usage or real GUI application comparison is claimed.

## Validation and reproduction

- 89/89 Release and 89/89 ASAN/UBSAN tests pass, excluding the known external
  packaging download failure. All 79 tests in the JIT-disabled build also pass
  with that exclusion.
- Ten focused AArch64 core executables pass under QEMU, including bitwise
  interpreter/native comparisons of double arithmetic and constants. Host tests
  cover AArch64 encodings and the x86/Win64 calling convention. Native Windows
  and AArch64 hardware validation remains open.
- New C tests check public widths, values above the float32 and JavaScript
  integer precision boundaries, decimal literals, double range, JSON, GValue,
  GI calls, bytecode round trips and rejection of old float32 streams.
- Precision-sensitive math fixtures use independently calculated binary64
  references with tighter tolerances. Native conversion tests include the
  `2^53` boundary, and native arithmetic checks constants differing beyond
  single precision plus values outside single-precision range.
- A separately compiled embedder uses only installed headers/pkg-config flags
  and passes numeric contracts with JIT off/on. A packaging smoke test copies
  ABI-1 artifacts and runs the numeric embedder against the copied library.
- The final benchmark harness also passes its small smoke run and the existing
  benchmark correctness tests.

```sh
python3 tools/run_sqgi_node_benchmarks.py \
  --sqgi /tmp/sqgi-jit-review-20260907/release/sqgi \
  --node /usr/bin/node --runs 5 --warmups 5 --iterations 80000 --cpu 0 \
  --output comparison.json
```

The JavaScript counterpart is `demo/benchmarks/node_jit_kernels.js`. The runner
validates the numeric widths and saves metadata, raw output and individual
samples. Results are in `/tmp/sqgi-vs-node-20260907/comparison.json` and
`comparison.log`; numeric migration build/test/SDK evidence and the pre-change
float32 binary are in `/tmp/sqgi-numeric64-20260907/`.
