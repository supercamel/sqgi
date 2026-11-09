# LLVM backend for the existing bytecode JIT

Status, 2026-09-17: opt-in backend with scalar helper inlining and bounded local
array scalar replacement.
Milestones 1 and 2 of the [backend review](llvm-jit-backend-review.md) now have
working implementations and comparative measurements. Caller loops and their
eligible integer/float helpers are compiled as one region. Small nonescaping
arrays can also become private scalar storage across loops. Shared typed-kernel IR
and committed exits remain future work; the handwritten backend remains the
default when enabling the old JIT.

## Build

```sh
cmake -S . -B build-bytecode-llvm -G Ninja \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSQ_ENABLE_JIT=ON -DSQGI_BYTECODE_JIT_BACKEND=LLVM \
  -DSQGI_ENABLE_KERNELS=ON -DSQGI_KERNEL_BACKEND=LLVM
cmake --build build-bytecode-llvm --target sqgi-bin sqgi_test_cpp_sqjit_llvm -j4
ctest --test-dir build-bytecode-llvm -R '^sqgi_test_cpp_sqjit_llvm$' --output-on-failure
SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 ./build-bytecode-llvm/sqgi test/test_integer_edges.nut
```

LLVM 18 headers/library are required; the existing `LLVM_ROOT`,
`SQGI_LLVM_INCLUDE_DIR` and `SQGI_LLVM_LIBRARY` overrides work for both backends.
The bytecode backend also builds with `SQGI_ENABLE_KERNELS=OFF`. Its default
selector, `SQGI_BYTECODE_JIT_BACKEND=AUTO`, retains the handwritten backend.
Validation so far is Linux x86-64 only; other 64-bit hosts need validation.

## Implemented

- Existing hotness, observation, guard backoff, frame/direct-call entry and debug
  hook policy; LLVM consumes Squirrel bytecode, with no generated source files.
- Shared `SQJitLeafPlan` typing, with an explicit opt-in fixed point for loops.
  Existing handwritten leaf callers retain forward-only eligibility. Limits:
  128 scalar slots, 8 parameters, 512 lowered bytecode instructions, 16,384
  analysis visits. Inlined helpers retain the leaf limits: 32 slots, 64 instructions,
  no loops or nested calls within the helper itself.
- Integer, boolean and double inputs/results; integer and mixed floating-point
  arithmetic, signed division/remainder, moves, integer/boolean comparisons,
  branches, early returns and increment/decrement. LLVM optimizes private scalar
  locals with its O2 pipeline, without fast-math flags.
- A separate scalar inlining pass expands direct table-bound helper calls before
  type analysis. It supports ordinary calls, tail calls, nested argument calls and
  early-returning helpers, with private argument registers. Each callee identity
  is checked at entry; there are no helper dispatches inside the compiled loop.
  Only direct slots on the actual receiver table qualify; delegate/metamethod
  lookups, bound callees, default arguments, captured variables and effects reject.
- Bounded local-array scalar replacement: up to four arrays of eight elements,
  initialized once in the straight-line prefix before control flow. Integer and
  floating reads, scalar writes, dynamic indices, assignment results and multiple
  loops lower to scalar cells and control flow; LLVM can fold or vectorize them.
  Aliases, escapes, nested arrays, later appends, loop allocations and incompatible
  live element types reject. Bounds failures return to the interpreter before any
  effects are published, preserving the original error.
- Eliminated reads/prepared calls track whether the VM temporary would have been
  overwritten. Entry guards use the existing reference/pin census to reject an
  observable final drop. A proven-safe drop is committed only on successful paths
  that actually touched the temporary. Zero-trip paths and guard failures retain
  it. This also fixes an ownership hole in the previous helper-inlining slice.
- Callees are held through weak references. Changed/collected callees, different
  receiver bindings and bound caller environments guard out before execution. The entry
  check is sufficient because the compiled region cannot mutate the binding or
  reenter the VM.
- Floating code checks the host environment in an opaque C++ wrapper before
  calling the optimized body. This prevents LLVM speculation moving arithmetic
  ahead of the check. Non-default rounding, FTZ/DAZ or unmasked exceptions fall
  back without changing the host's control bits.
- Entry type checks; integer zero/overflow guards before LLVM division/remainder;
  safe managed-result assignment, including aliasing caller slots. No VM state or heap
  effects are published before return, so guard failure can replay safely.
- `SQJitCode` owns external executable resources through a disposer. LLVM ORC
  artifacts are released on replacement/destruction rather than treated as borrowed
  stubs or directly unmapped executable pages.
- Interpreter fallback fixes found by the new tests: signed division overflow
  raises an error instead of trapping; add/subtract/multiply/negate/increment use
  unsigned arithmetic to implement integer wrapping without signed-overflow UB.

This is not the separate explicit `sqgi.llvm.compile` experiment. The new backend
uses the old JIT's automatic entry paths. Unsupported functions stay interpreted
(or use an existing C++ specialization). Floating comparisons/negation,
object/member operations, arbitrary heap arrays, recursive helper inlining, OSR
loop entries and
precise side exits are not implemented here. Typed kernels keep their existing
compiler and call boundary.

## Tests

- LLVM build: 9/9 selected tests passed: integer edges with JIT disabled/enabled,
  contracts, side-exit contracts, values, dedicated LLVM coverage, shared leaf
  semantics, write log, and release order.
- The 10 existing `sqgi_test_jit_*` script tests also pass, including their
  numeric-loop native execution trace assertions.
- ASan+UBSan, kernels disabled: 4/4 passed with `UBSAN_OPTIONS=halt_on_error=1`:
  integer edges disabled/enabled, contracts and dedicated LLVM coverage.
- Existing `test/test_kernel.nut` passed with this bytecode backend enabled.
- Dedicated coverage asserts LLVM backend identity and successful native entries
  for arithmetic, branches, loops and inlined callers. It tests type changes, zero
  divisors, overflow, booleans, isolated arguments, callee replacement/collection,
  bound receivers, discarded-call errors, malformed branch/literal operands,
  NaN/infinity/signed-zero behavior, mixed conversion, hostile FP environments,
  debug hooks and repeated VM teardown. Local-array coverage checks 100 trip
  counts, reads/writes, bounds and type changes, zero/negative trips, escapes,
  alias/nested-array fallback, composition with helper inlining, and observable
  temporary ownership on success, zero-trip and guard-failure paths. Shared tests alone
  do not establish LLVM coverage: architecture-specific groups may be skipped.
- The handwritten build's contracts and integer-edge regressions pass. Its
  previously recorded leaf test failure, `native loop contains leaf call`, remains;
  it is not a new LLVM result and has not been hidden or weakened.

## Initial performance experiment

The existing 15-case legacy suite was run against LLVM, the handwritten x64 JIT,
Node, GJS and Python, checking every checksum against the interpreter reference.
Five rotating runs, 80,000 requested iterations, five warmups, CPU 0,
RelWithDebInfo, no LTO/PGO. These are warm execution timings, excluding JIT compile cost.
Earlier scalar-call and float-call results were about 39 and 44 ns/iteration
before caller/helper inlining. Immediately before local-array scalar replacement,
array reads, float reads and writes took 17.50, 17.69 and 27.11 ns respectively.
The new measurements exercise compiled callers and private scalar array storage.

Nanoseconds per iteration, lower is better:

| Case | LLVM bytecode | Handwritten x64 | Node | GJS | Python |
|---|---:|---:|---:|---:|---:|
| direct_call | 3.147 | 3.699 | 3.953 | 3.784 | 88.185 |
| branch_call | 3.213 | 2.962 | 2.764 | 2.795 | 65.580 |
| float_call | 1.476 | 1.489 | 1.487 | 1.467 | 40.025 |
| numeric_loop | 5.506 | 5.753 | 5.312 | 5.364 | 59.618 |
| vector | 2759.937 | 59.788 | 173.192 | 144.800 | 1780.878 |
| dynamic_member | 269.763 | 250.138 | 31.847 | 21.275 | 264.156 |
| dynamic_key_get_set | 57.275 | 21.025 | 20.253 | 11.300 | 106.754 |
| object_member_write_fallback | 167.200 | 40.363 | 3.862 | 6.788 | 189.460 |
| array_append | 44.075 | 36.175 | 12.843 | 5.875 | 61.311 |
| array_write | 0.888 | 7.300 | 1.508 | 1.788 | 47.738 |
| array_read | 0.215 | 0.992 | 0.643 | 0.844 | 21.480 |
| array_float | 0.427 | 1.711 | 0.619 | 0.740 | 20.086 |
| math_intrinsic | 286.963 | 25.337 | 13.841 | 3.013 | 170.843 |
| math_variable | 264.200 | 45.000 | 53.065 | 31.137 | 156.834 |
| matrix | 369.650 | 59.463 | 7.018 | 14.062 | 338.876 |

Scalar calls and the three small local-array workloads beat Node in this run;
float calls are approximately level. These arrays have known sizes, local identity
and scalar contents; the results do not establish performance for arbitrary heap
arrays. Branch-heavy calls still lag Node. Object/vector, matrix, array append and
math workloads remain large coverage gaps. Continue the experiment, but do not replace the handwritten backend
as the default: broader coverage and shared kernel IR are still missing. All 15
checksums matched for every runtime in all five rounds.
Raw local results: `/tmp/sqgi-jit-llvm-arrays-runtime-comparison.json` and `.txt`.

Reproduce:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /tmp/sqgi-jit-llvm/sqgi \
  --sqgi-baseline /tmp/sqgi-legacy-jit-compare/sqgi \
  --suite kernels --runs 5 --iterations 80000 --warmups 5 --cpu 0 \
  --output /tmp/sqgi-jit-llvm-arrays-runtime-comparison.json
```

## Compilation cost

The standalone `sqgi_bench_bytecode_jit` target measures backend compilation,
first native execution, warmed execution and artifact disposal. It validates each
result against the interpreter. Parsing, hotness tracking and VM dispatch are
outside these measurements. Each case compiles nine independent artifacts; the
reported numbers are medians, so they do not represent process cold-start cost.
The small branch and array-write probes here differ from the 15-case suite above.

```sh
cmake --build build-bytecode-llvm --target sqgi_bench_bytecode_jit -j4
taskset -c 0 ./build-bytecode-llvm/sqgi_bench_bytecode_jit
```

| Probe | Compile (ms) | Dispose (µs) |
|---|---:|---:|
| numeric | 4.328 | 55.979 |
| calls | 3.892 | 50.960 |
| branches | 4.243 | 41.268 |
| floats | 3.857 | 42.533 |
| array_read | 3.234 | 38.978 |
| array_float | 3.917 | 39.389 |
| array_write | 4.384 | 40.406 |

LLVM still creates one ORC instance per artifact. Compilation costs milliseconds,
so warmed loop speed alone is insufficient to choose compilation thresholds;
short-lived functions may never repay compilation. Memory at scale and shared
ORC infrastructure remain unmeasured.

Next: lower pure typed-kernel IR into the caller module and profile the remaining
branch-call gap. Stateful kernels must wait for frame-based exact exits: their
completed writes cannot be rolled back by the old replay guard path.
