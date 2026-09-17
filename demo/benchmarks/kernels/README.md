# Kernel benchmarks

This suite loads the actual [demo kernels](../../kernels/README.md). It covers
geometry, sum/dot/prefix reductions, particles, grayscale thresholding, matrix
multiplication, rectangle queries, histograms, heat diffusion and A*.
No additional benchmark library or Python package is required.

## Run

From the repository root, using an existing kernel-enabled build:

```sh
cmake --build build-kernels --target sqgi_kernel_benchmark_suite -j
./build-kernels/sqgi_kernel_benchmark_suite --root . > /tmp/kernels.json
./build-kernels/sqgi demo/benchmarks/kernels/suite.nut
```

The optional C++ target is excluded from the default build. For a short run that
validates results and the JSON schema:

```sh
python3 demo/benchmarks/kernels/run.py build-kernels/sqgi_kernel_benchmark_suite --quick
```

Build a second tree with `-DSQGI_KERNEL_BACKEND=NATIVE` to compare backends:

```sh
python3 demo/benchmarks/kernels/run.py \
  build-kernels/sqgi_kernel_benchmark_suite \
  build-native/sqgi_kernel_benchmark_suite \
  --sqgi build-kernels/sqgi --output /tmp/kernel-comparison.json
```

On Windows these executables have `.exe` suffixes. `run.py` uses subprocess
argument lists and works from PowerShell; it does not need MSYS2. Use Release
builds for timing. Sanitizer and Debug runs are useful for correctness only.

## What is measured

`suite.cpp` emits JSON for 85 cases (25 with `--quick`): empty, single-element,
small, near-capacity and full batches, plus predictable and mixed branches.
A* uses open, maze, unreachable, same-endpoint and seeded random maps. All inputs
are deterministic (seed 42). Every case checks the complete output, unused
buffer tails and guard cells against an independently written C++ model before
timing. `run.py` also checks that backend result checksums agree.

- `module_compile_ms`: one compilation per source file, excluding file reading.
  Includes parsing, optimization and executable generation. Repeated values for
  sum/dot/prefix refer to the **same** reductions module; do not add them up.
  These are single observations, not compilation medians or separate processes.
- `kernel_ns`: median warm native entry time per whole batch, including call
  setup, status checking and the kernel's bounds/requirement/fuel checks.
- `cpp_ns`: median of the matching C++ algorithm. The baseline uses the shared
  test model, including its string-based workload dispatch. It is a useful
  reference, not a hand-tuned lower bound; dispatch can dominate tiny batches.
- `cpp_over_kernel`: C++ time divided by kernel time; above 1 means the kernel
  took less time. Min/max sample times and repetitions are also recorded.

Seven samples alternate which implementation runs first. A pilot calibrates
repetitions to roughly 5 ms for the slower implementation (cap 100,000 calls).
Use `--samples N --target-ms N` on the binary to change this. Each sample copies
its starting fixture **outside** the timed region. Particle state evolves during
repetitions identically on both paths. Each call consumes an observable output;
full-buffer hashing happens outside timing. Compilation, allocation, input
conversion and Squirrel wrappers are excluded from this C++ measurement.

On GCC/Clang the benchmark target uses `-O3 -ffp-contract=off`, plus `-march=native`
when not cross-compiling. Floating reductions retain source order. The C++ model
has no kernel fuel/bounds machinery. `run.py` records platform, binary paths and
available CMake configuration. Run on a quiet machine, pin to a CPU if desired,
and inspect variation; there are no CI performance thresholds.

`suite.nut` compares warm calls from Squirrel with Squirrel sum, histogram and
**the same linear-scan A*** algorithm. It reuses arrays, checks results, alternates
sample order and reports five-sample medians using `clock()` CPU time. Compilation
and input/output conversion are separate fields. Scalar sum already crosses the
boundary as its return value; its copy-out field is only a trivial assignment.
The script benchmark should be run with the general Squirrel JIT disabled for an
interpreted baseline. It does not time a complete application or claim to cover
every workload's host overhead.

## Example observations

A local Linux x86_64 RelWithDebInfo run with LLVM 18 (un-pinned, seven samples)
gave these warm C++ entry medians, in microseconds per batch:

| Workload | NATIVE emitter | LLVM | C++ model in LLVM build |
| --- | ---: | ---: | ---: |
| Sum, 1,024 doubles | 2.83 | 0.42 | 0.43 |
| Matrix, 16×16 | 16.06 | 2.23 | 1.43 |
| A*, open 16×16 grid | 173.90 | 21.49 | 19.94 |
| A*, two-wall maze | 138.10 | 16.76 | 16.32 |
| A*, unreachable | 87.84 | 10.79 | 9.86 |

The accompanying script run measured roughly 76–82× faster A* calls than
interpreted Squirrel, but copying its grid in and path out cost approximately
15 µs each. LLVM compilation of the A* module cost about 33 ms in that run.
These numbers illustrate the tradeoff: load once, reuse buffers, and amortize
compilation and conversion. They are not guaranteed speedups. JSON results are
written outside the repository so machine-specific timings do not become tests.

The older `test/kernel/benchmark.cpp` and `.nut` remain small affine-transform
microbenchmarks. This directory is the broader workload suite.

## Node.js A* comparison

```sh
python3 demo/benchmarks/kernels/run.py \
  build-kernels/sqgi_kernel_benchmark_suite --node --sqgi build-kernels/sqgi \
  --output /tmp/kernel-node.json
# Or run either Node representation directly:
node demo/benchmarks/kernels/node_astar.js int32
node demo/benchmarks/kernels/node_astar.js float64
```

`--node` optionally takes a Node executable path. The comparison uses the same
linear open-set scan, neighbour order, tie breaking, state initialization and
path reconstruction. Each representation runs in a separate process, warms each
map for at least 100 ms, then measures nine samples with `hrtime.bigint()`.
Buffers are reused. BFS checks shortest paths; the Python runner compares the
entire grid/state/path checksum with the C++ suite's kernel output.

`Float64Array` matches the kernel's eight-byte cell layout. `Int32Array` uses
half the storage and is a useful JavaScript baseline for these small integer
values. Neither reproduces general i64 semantics, fuel accounting or explicit
kernel requirement checks; this comparison is for valid inputs to this A*.

A run pinned to CPU 0 with the locally installed **Node v18.19.1**, V8
10.2.154.26-node.28, measured these medians (µs per search):

| Map | LLVM native entry | LLVM called from Squirrel | Node Int32Array | Node Float64Array |
| --- | ---: | ---: | ---: | ---: |
| Open | 21.45 | 23.00 | 36.19 | 51.69 |
| Two-wall maze | 16.83 | 18.25 | 31.11 | 42.60 |
| Unreachable | 10.70 | 11.38 | 18.15 | 26.10 |

Here LLVM is about 1.7–1.9× faster than the smaller Node representation at native
entry, or 1.6–1.7× through Squirrel. Both exclude compilation/JIT warm-up and
input/output conversion. Copying all buffers each call can erase that advantage.
Node versions and V8 optimization decisions matter; these measurements describe
the installed version, not all Node releases or JavaScript algorithms.

## Other workloads versus Node.js

The same `--node` command now also runs `node_workloads.js`. With `--sqgi`, it
adds `boundary.nut` to measure calls from Squirrel on those same fixtures. JSON
results have `node_workloads`, `node_integer_workloads` and `boundary_workloads`
sections. The native suite's `--fixtures` mode supplies inputs, expected outputs
and expected state after 100 calls; both scripts verify every payload cell
before timing. The Node suite covers 80 non-A* cases, with another 45 cases using
32-bit integer buffers. `--quick` selects fewer sizes and branch patterns.

Both runtimes reset buffers outside each sample and use the same repetition
count, so in-place particles follow the same trajectory. Node warms each case
for at least 100 ms and collects nine samples. Squirrel collects seven CPU-time
samples after correctness calls. Its measurement includes the script loop,
closure call, kernel argument validation and native execution, but excludes
buffer conversion and compilation. Node uses wall time; all loops are CPU-bound.

The default Node representation uses `Float64Array`. A separate process tries
`Int32Array` for image, histogram and routing integer buffers (routing boxes
remain doubles). These active integer values fit both representations exactly;
this does not implement general checked i64 arithmetic. Inactive integer output
sentinels are compared after conversion to the selected JavaScript storage.

Before the call-marshalling optimization below, a CPU-0-pinned run with Node
v18.19.1 gave the following full-batch medians. The
Node column uses the faster measured representation where both were tested.
All times are **microseconds per batch**, with buffers already populated:

| Workload | LLVM via Squirrel | Node | Node time / kernel time |
| --- | ---: | ---: | ---: |
| Transform 256 vertices | 0.326 | 0.523 | 1.61× |
| Sum 1,024 doubles | 0.540 | 0.448 | 0.83× |
| Dot product, 1,024 pairs | 0.597 | 0.554 | 0.93× |
| Prefix sum, 1,024 doubles | 0.591 | 0.555 | 0.94× |
| Step 128 particles | 0.281 | 0.319 | 1.14× |
| Threshold 1,024 intensities | 0.919 | 1.636 | 1.78× |
| Multiply 16×16 matrices | 2.358 | 3.938 | 1.67× |
| Query 256 obstacle boxes | 0.397 | 0.526 | 1.33× |
| Histogram 1,024 samples | 0.518 | 0.667 | 1.29× |
| Diffuse a 32×32 grid | 0.747 | 2.184 | 2.92× |

The native kernel body alone was faster than Node on all these full-batch cases,
but the host boundary erased that lead for reductions. One-element calls were
roughly 10–25× faster in Node than through the Squirrel/kernel boundary. Batch
work and keep buffers resident; a tiny kernel per element is a poor fit. These
results are workload- and version-specific, and simple reference algorithms
are not substitutes for optimized matrix/image libraries.


## Call-marshalling optimization

The host adapter now uses bounded stack arrays for arguments and alias checks,
resolves record schemas at module creation, and reads each scalar's tagged
value once. Successful marshalling allocates no heap storage. All module/type,
extent, alias, budget and error checks remain active.

Using the same exported fixtures and repetition counts, pinned to CPU 0,
seven-sample medians before/after this change were:

| Squirrel-to-kernel workload | Before | After | Speedup |
| --- | ---: | ---: | ---: |
| Transform one vertex | 189 ns | 103 ns | 1.83× |
| Sum one value | 114 ns | 73 ns | 1.56× |
| Threshold one intensity | 178 ns | 92 ns | 1.93× |
| Transform 256 vertices | 308 ns | 219 ns | 1.41× |
| Sum 1,024 doubles | 530 ns | 493 ns | 1.08× |
| Dot product, 1,024 pairs | 574 ns | 507 ns | 1.13× |
| Query 256 obstacle boxes | 387 ns | 295 ns | 1.31× |
| Histogram 1,024 samples | 491 ns | 424 ns | 1.16× |

Small-call latency dropped about 36–48% across the ten mixed-pattern workloads.
Relative to the preceding Node measurements, full transforms are now about
2.4× faster and histograms about 1.6× faster. Dot/prefix calls narrowly lead Node;
sum remains about 10% slower. Single-element calls still favour Node despite the
improvement. The compiled kernel bodies did not change; substantial workloads
spend proportionally less time in marshalling and benefit less.

Regression coverage includes 32 scalar arguments, 32 buffer arguments, aliases
in both writable/read-only orders, wrong final argument types, excess argument
counts, schema identity and GC lifetime. All 14 kernel CTests pass on LLVM,
NATIVE and LLVM with ASan/UBSan; the native Windows tests and demos pass under
Wine. Hardware profiling was unavailable under the host's perf permissions;
these are wall-workload/CPU-time observations, not sampled profile attribution.


## Restricted native leaf calls

Kernel exports now automatically use a restricted native callback that borrows
arguments from the caller's rooted stack and returns a scalar directly. This
avoids a general-purpose native VM frame and copying captured values onto it.
Debugged and environment-bound calls retain the regular path. Both adapters
share the same argument checks and execution routine; failed execution is never
replayed. This requires the updated bundled Squirrel runtime, with the callback
contract documented by `SQLEAFFUNCTION` in `Squirrel3/include/squirrel.h`.

A fresh CPU-0-pinned run using the same single-element cases measured another
20–30% reduction after the earlier marshalling optimization. These timings include
the Squirrel benchmark's loop and forwarding closure, in nanoseconds per call:

| Single-element workload | Before leaf dispatch | Leaf dispatch | Node |
| --- | ---: | ---: | ---: |
| Transform | 101 | 75 | 9 |
| Sum | 73 | 54 | 11 |
| Dot | 86 | 61 | 11 |
| Prefix | 80 | 61 | 10 |
| Particle step | 73 | 56 | 10 |
| Threshold | 90 | 70 | 5 |
| Matrix | 98 | 74 | 12 |
| Obstacle query | 106 | 75 | 7 |
| Histogram | 83 | 66 | 12 |
| Stencil | 87 | 68 | 10 |

Node v18.19.1 still wins these tiny cases by roughly 5–15×. This optimization
reduces the fixed cost; it does not make an interpreted Squirrel call loop as
cheap as a V8-optimized one. The full benchmark runner validates all 80 generic
boundary cases after this change. Thirty targeted kernel/runtime tests pass in
release and ASan/UBSan builds; the NATIVE backend passes all 15 kernel CTests,
and native Windows dispatch/integration tests and demos pass under Wine.

### Typed object call chains

```sh
taskset -c 0 ./build-kernels/sqgi demo/benchmarks/kernels/typed_objects.nut
```

This separate controller benchmark compares a compiled method chain over
runtime-sized arrays, scalar typed-method calls from a Squirrel loop, and an
ordinary Squirrel class. It checks persistent state and every output cell,
rotates execution order, and reports median CPU time over seven samples at
1/16/256/4096 elements. Storage is reused; compilation and conversion are not
included. The scalar-method loop returns only the last output, so its number
measures boundary cost and is not an identical output-storage workload.

Compare the typed controller with Node.js:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_typed_objects.py \
  ./build-kernels/sqgi --node node --output /tmp/typed-objects-node.json
```

The comparison uses `typed_objects_node.nut` and `node_typed_objects.js`, with
identical inputs, iteration counts, persistent state and output storage. Both
use process CPU time, excluding compilation, allocation, reset and validation.
Each case runs nine measured batches in each of two trials, reversing runtime
launch order. Node warms for at least 100 ms and runs each case in a separate
process to isolate V8 optimization feedback. The runner verifies every final
output and state field exactly across runtimes, in addition to each runtime's
independent closed-form checks. Node uses Float64Array buffers and a Number
sample counter; all tested counts fit exactly, so this does not compare full
i64 overflow semantics. Kernel times include the Squirrel-to-native call boundary;
Node can inline its JavaScript call chain into the benchmark loop.

Measured on an i7-12700, pinned to CPU 0, LLVM 18 RelWithDebInfo,
Squirrel bytecode JIT disabled, Node v18.19.1 / V8 10.2.154.26-node.28:

| Controller workload | Typed module | Node | Faster |
| --- | ---: | ---: | --- |
| Scalar `advance()` call | 58.1 ns | 5.27 ns | Node 11.0× |
| Driver, 1 sample | 63.0 ns | 1.68 ns | Node 37.5× |
| Driver, 16 samples | 80.8 ns | 26.9 ns | Node 3.0× |
| Driver, 256 samples | 485 ns | 1,723 ns | Typed module 3.6× |
| Driver, 4,096 samples | 6.97 µs | 27.08 µs | Typed module 3.9× |

Times are median per call over 18 samples, not per element. The single-sample
driver is a separate V8 optimization case from the scalar method; its lower
time should not be treated as a general JavaScript method-call cost. These
results describe this controller workload, not all typed classes or Node versions.

### Whole single-object workflow

```sh
taskset -c 0 ./build-kernels/sqgi demo/benchmarks/kernels/compiled_workflow.nut
```

This compares a whole compiled oscillator simulation (including its local typed
object and four-element scratch history) with the same state updates driven by
a Squirrel loop calling the typed `advance()` method. Each simulation starts at
the same state, and both paths compute and verify the final four-sample mean.
The compiled path initializes its frame-local storage inside the timed call;
the host path resets reusable host storage inside its timed call. Compilation
and validation are untimed. Nine CPU-time samples alternate execution order.
This is one object's sequential evolution, not an array of independent objects.

On the same pinned i7-12700 / LLVM 18 configuration:

| Steps per simulation | Entirely compiled | Squirrel driver + typed methods | Speedup |
| --- | ---: | ---: | ---: |
| 1 | 59 ns | 338 ns | 5.7× |
| 16 | 153 ns | 1,257 ns | 8.2× |
| 256 | 1,672 ns | 14,365 ns | 8.6× |
| 4,096 | 25.8 µs | 220.5 µs | 8.5× |

The gain comes from moving initialization, control flow and method calls behind
one VM/native boundary. It is not a reduction in the cost of each isolated
Squirrel-to-native method call; the existing scalar controller benchmark still
measures approximately 58 ns per call after this language change.

Compare that complete workflow directly with Node:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_typed_objects.py \
  ./build-kernels/sqgi --workload workflow --node-storage array \
  --output /tmp/compiled-workflow-node.json
```

Use `--node-storage float64` to test Float64Array scratch storage instead.
The Node version has the same class, methods, integration formula, step limit,
timestep check and four-element history. Each timed invocation initializes a new
object and scratch storage in both runtimes (native frame storage for kernels;
JavaScript allocations, subject to V8 optimization, for Node). Two timesteps
alternate between measured samples. Every invocation contributes to an observed
checksum. Each runtime checks results and checksums against an independent
calculation, and the runner compares them exactly across runtimes. Each case has
18 process-CPU-time samples, with warmed, separately launched Node processes and
alternating runtime launch order. Compilation and verification are untimed.

Initial results before separating LLVM storage regions, on the same i7-12700
pinned to CPU 0, LLVM 18 RelWithDebInfo and Node v18.19.1, using ordinary
JavaScript arrays for Node's local scratch:

| Steps | Kernel | Node | Faster |
| --- | ---: | ---: | --- |
| 1 | 40.1 ns | 11.8 ns | Node 3.4× |
| 16 | 141 ns | 40.7 ns | Node 3.5× |
| 256 | 1.77 µs | 0.991 µs | Node 1.8× |
| 4,096 | 27.9 µs | 16.3 µs | Node 1.7× |

Node also won with Float64Array scratch storage; ordinary arrays were faster for
the small cases. Unlike the earlier controller workload, this sequential
oscillator still favors Node at every tested size. These times use a different
harness from the Squirrel-driver comparison above: direct calls plus a checksum,
instead of calls through a Squirrel closure. Compare runtimes within each table.


#### LLVM local-storage optimization

Inspection of optimized IR showed that taking the address of a local object
kept the entire 95-cell simulation frame in memory, including arithmetic
temporaries. Giving each object/array its own allocation, separate from scalar
temporaries, allows LLVM to promote object fields and loop state into registers.
Only the four-cell indexed history remains on the stack in optimized IR.

Re-running the same Node comparison after this compiler change:

| Steps | Kernel before | Kernel after | Node in new run | Result |
| --- | ---: | ---: | ---: | --- |
| 1 | 40.1 ns | 34.8 ns | 12.3 ns | Node 2.8× faster |
| 16 | 141 ns | 74.3 ns | 40.7 ns | Node 1.8× faster |
| 256 | 1.77 µs | 0.777 µs | 0.992 µs | Kernel 1.28× faster |
| 4,096 | 27.9 µs | 12.0 µs | 16.3 µs | Kernel 1.36× faster |

This is a general storage-lowering change, not a special case for the oscillator.
The source workload, strict floating-point semantics, bounds checks and loop
budget are unchanged. Both runtime results and checksums still match exactly.
The before timings are the earlier run above; compare the after and Node columns
for the matched new run. Tiny calls remain dominated by boundary overhead.


### Release, bytecode JIT, LTO and PGO

The [build optimization comparison](build-optimizations.md) documents the full
seven-configuration matrix, training procedure, correctness checks and measured
results for both workloads. It also includes an isolated diagnostic showing
that native kernel calls are currently rejected by the Squirrel bytecode JIT.

### Direct engine call versus the Squirrel boundary

Build and run the direct-call probe with the bytecode JIT disabled:

```sh
cmake -S . -B build-kernels -DSQ_ENABLE_JIT=OFF
cmake --build build-kernels --target sqgi-bin sqgi_kernel_call_boundary -j4
taskset -c 0 ./build-kernels/sqgi_kernel_call_boundary "$PWD"
SQGI_JIT=0 taskset -c 0 ./build-kernels/sqgi \
  demo/benchmarks/kernels/compiled_workflow_node.nut
```

The C++ probe compiles the same `.sqk` source and calls the normal `execute()`
API, retaining MXCSR handling, per-call fuel, status checks and result conversion.
Both harnesses use identical step counts, two timesteps, repeat counts, checksum
order and CPU-time clocks. Setup/compilation is untimed. A matched run on CPU 0
used two trials in reverse order and verified outputs/checksums across runtimes:

| Steps | Direct C++ driver | Squirrel driver | Difference |
| --- | ---: | ---: | ---: |
| 1 | 4.62 ns | 34.82 ns | 30.20 ns |
| 16 | 22.26 ns | 74.36 ns | 52.10 ns |
| 256 | 691.87 ns | 776.80 ns | 84.93 ns |
| 4,096 | 11.942 µs | 12.027 µs | 0.086 µs |

This measures the entire driver/boundary difference, not individual marshalling
costs, and the difference is not constant. It includes interpreted versus native
loop/checksum execution, dispatch, validation, object conversion and code-layout
effects. It is evidence for compiling larger caller regions, not proof that all
of the difference can be removed with one ABI change. The direct probe is not a
new unchecked execution API; it uses the existing checked engine entry.

`boxed_squirrel.nut` compares identical ordinary Squirrel loops interpreted and
explicitly LLVM-compiled, including direct typed-kernel calls. Requires the LLVM
backend with the handwritten JIT off. It validates results, reports compilation
cost separately, and includes execution counters. See
[the baseline's limitations and measurements](../../../docs/kernels/boxed-squirrel.md).

## Node, GJS and Python comparison

Run all 85 native fixtures, Squirrel call boundaries, five ordinary scalar loops,
nine typed-class/workflow cases, and 50 alternative Int32Array cases sequentially:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_runtimes.py \
  /tmp/sqgi-kernel-llvm --output /tmp/sqgi-runtime-comparison
```

Requires `node`, `gjs`, Python 3, and the LLVM build's `sqgi` and
`sqgi_kernel_benchmark_suite` executables. Omit `taskset` where unavailable.
`report.md` contains every row; `results.json` and per-runtime JSON files retain
samples and validation outputs. Node/GJS share numeric source and Float64Array
fixtures. Python uses plain lists and explicit loops, with no NumPy or external
JIT. All runtimes verify complete native-fixture outputs before timing.

The report separates direct native entry from the Squirrel boundary. Numeric
managed-language runners use monotonic wall time, whereas existing Squirrel
scripts use CPU time; class Node scripts also use CPU time. Run on an idle CPU.
Samples are calibrated independently per runtime, and stateful particle timing
can span different repetition counts. Tiny function-call comparisons explicitly
label the difference between a native kernel boundary and an inlinable JS call.

`tiny_calls.nut` compares equivalent interpreter and LLVM whole-caller loops for
integer exports and scalar controller methods. `node_tiny_calls.js` supplies the
matching Node cases (`integer_export` and `scalar_method`, one per process).
See [tiny-call changes and measurements](../../../docs/kernels/tiny-calls.md).

`compare_inline_calls.py` runs `inline_calls.nut` against `node_inline_calls.js`
in fresh processes and reversed order. It checks complete checksums for three
pure integer kernels whose calls can be inlined into the ordinary Squirrel loop.
See [supported regions, guards and results](../../../docs/kernels/inlined-calls.md).

`compare_hot_loops.py` reruns the five ordinary loops against Node/GJS/Python and
both tiny-call loops against Node in fresh processes with reversed launch order.
It validates matching results and requires the promoted paths to execute.
`boxed_squirrel.nut --json` retains raw samples, warmup/initial compilation times
and promotion counters. See [ordinary regions and prepared stateful
methods](../../../docs/kernels/prepared-methods.md) for results and constraints.

## Evolving 3x3 matrix recurrence

This is the `matrix` row from the ordinary-Squirrel runtime benchmarks, distinct
from the existing 16x16 matrix multiplication workload. The `recurrence` export in
`demo/kernels/matrix.sqk` keeps the matrix, vector and entire time loop native.
Each call resets its scratch state. Integer `%` computes the rotating indices;
a small f64 lookup table represents the exact small integer values because the
prototype does not yet provide numeric casts. Arithmetic/update order is preserved.

```sh
./build-kernels/sqgi demo/benchmarks/kernels/matrix_recurrence.nut
python3 demo/benchmarks/kernels/compare_matrix_recurrence.py \
  --sqgi build-kernels/sqgi --runs 5 --iterations 80000 --warmups 5 --cpu 0 \
  --output /tmp/matrix-recurrence.json
```

The first command checks zero/short/long runs, every prefix through 127 iterations,
the established 200-step checksum, negative input rejection, and scratch reset.
The comparison rotates runtime order, alternates the two SQGI paths, and checks
all results against ordinary Squirrel. Node/GJS/Python use their existing matrix
implementations from the full 15-case suite. Timings are nanoseconds per matrix
iteration, including one Squirrel-to-kernel call per complete loop; runtime
compilation is excluded. `--jit 0` disables the ordinary bytecode JIT while leaving
the explicitly compiled typed kernel enabled. Default is `--jit 1`.

Measured on the local i7-12700, CPU 0, LLVM kernel backend, bytecode JIT enabled,
threaded interpreter dispatch enabled, RelWithDebInfo without LTO/PGO. Median of
five rounds with 80,000 steps and five warmups per case:

| Implementation | ns per step |
|---|---:|
| Ordinary Squirrel | 397.150 |
| LLVM typed kernel | 6.913 |
| Node.js | 7.071 |
| GJS | 14.037 |
| Python | 339.579 |

The typed kernel takes about 57× less time than ordinary Squirrel here and is
approximately on par with Node; the small Node/kernel difference is not a
reliable lead. All timed checksums matched. This is the complete native loop,
not one host-to-kernel call per individual matrix step.

## Vec3 recurrence

The [vector kernel](../../kernels/vector.sqk) ports the `vector` row of the
ordinary-Squirrel runtime suite. Cross products, scalar multiplication, vector
addition/subtraction, rotating component updates, and dot products stay inside
one compiled loop. Fixed local arrays replace transient Vec3 objects. Position
updates happen before the velocity cross product, and the component adjustment
happens afterward, exactly as in the original. Floating arithmetic retains its
original grouping without fast-math or FMA contraction.

```sh
./build-kernels/sqgi demo/benchmarks/kernels/vector_recurrence.nut
python3 demo/benchmarks/kernels/compare_vector_recurrence.py \
  --sqgi build-kernels/sqgi --runs 5 --iterations 80000 --warmups 5 --cpu 0 \
  --output /tmp/vector-recurrence.json
```

The correctness script compares against the original Squirrel Vec3 implementation:
zero iterations, every prefix through 127, longer runs through 4096, the known
120-step checksum, negative-input rejection, and fresh state after a failed call.
It runs under LLVM, NATIVE, and the LLVM sanitizer build. The runner shares the
matrix comparison machinery and uses the existing Node/GJS/Python vector ports.
Timings include a single Squirrel-to-kernel call for the complete loop; module
compilation is excluded. This is a typed rewrite of the numerical workload,
not a change to the speed of ordinary dynamic Vec3 objects.

Local i7-12700 results, CPU 0, LLVM kernels, bytecode JIT and threaded interpreter
dispatch enabled, RelWithDebInfo without LTO/PGO. Medians of five rounds,
80,000 iterations and five warmups:

| Implementation | ns per vector iteration |
|---|---:|
| Ordinary Squirrel | 2682.225 |
| LLVM typed kernel | 8.688 |
| Node.js | 180.252 |
| GJS | 151.850 |
| Python | 1811.898 |

All checksums matched in every round. The typed kernel is approximately 309×
faster than ordinary Squirrel and 20.7× faster than this Node Vec3 implementation.
This measures the existing allocation-heavy object algorithms in the comparison
runtimes against the fixed-storage kernel; it is not a comparison against a
separately scalarized or allocation-free JavaScript rewrite.

## Standard math workloads

The matrix, vector, and math comparison runners accept `--node /path/to/node`
to select a particular Node.js release without changing the system installation.
The selected version is recorded in each JSON report.

`demo/kernels/math.sqk` ports both math rows from the existing runtime comparison.
`constant_workload` includes invariant calls and lets LLVM fold them;
`variable_workload` changes every argument to measure actual transcendental work.
The formulas and summation order match ordinary Squirrel. Small lookup arrays
represent exact integer-to-double values because casts are not yet implemented.

```sh
./build-kernels/sqgi demo/kernels/math.nut
./build-kernels/sqgi demo/benchmarks/kernels/math_recurrence.nut
python3 demo/benchmarks/kernels/compare_math_recurrence.py \
  --sqgi build-kernels/sqgi --runs 5 --iterations 80000 --warmups 5 --cpu 0 \
  --output /tmp/math-recurrence.json
```

The runner compares both typed kernels with ordinary Squirrel and the unchanged
Node/GJS/Python implementations. It validates checksums every round, rotates
runtime order, and reports warmed ns/iteration, excluding module compilation.
Each typed-kernel call executes the complete loop, including scratch initialization.
Short and empty loops, remainder wrap points, invalid counts, and repeat-call
state reset are checked before timing. Language-level tests additionally exercise
all 43 math functions across signed zero, finite values, subnormals, infinities,
NaNs, domain errors, invalid signatures, nested calls, predicates, and partial
writes before a requirement failure.

Local i7-12700 results, pinned to CPU 0, LLVM kernels with bytecode JIT and
threaded dispatch enabled, RelWithDebInfo without LTO/PGO. Medians of five
rounds, 80,000 iterations and five warmups; all checksums matched:

| Implementation | Mixed constant/variable math (ns/iteration) | Variable-input math (ns/iteration) |
|---|---:|---:|
| Ordinary Squirrel | 318.750 | 281.263 |
| LLVM typed kernel | 8.337 | 25.438 |
| Node.js | 13.565 | 53.245 |
| GJS | 3.075 | 31.000 |
| Python | 170.555 | 155.072 |

The typed kernels are approximately 38.2× and 11.1× faster than ordinary
Squirrel, and 1.63× and 2.09× faster than Node on these workloads. GJS wins
the first case; the kernel wins the variable-input case. These are complete-loop
measurements, not timings of individual calls from Squirrel into a kernel.
