# SQTheia simulator JIT assessment — 2026-11-02

This records the initial assessment and accessor improvement. The subsequent
[read-only input-method compiler work](jit-readonly-input-methods.md) adds
LLVM compilation of existing object methods and tests unrelated workloads.

SQGI's ordinary JIT misses most of SQTheia's dynamics because the hot code
combines persistent objects, overloaded vector arithmetic, captured module
tables, method calls, validation branches, and temporary allocations. The
typed kernel works around those boundaries by expressing numerical blocks
over typed buffers. Improving floating-point instruction selection alone
will not close this gap.

This investigation made no changes to SQTheia. The first SQGI improvement
accelerates ordinary checked array getters and constant-index getters. It
reduces the measured scalar dynamics time by **10.0%**, and time on the
existing kernel path by **5.4%**. The kernel path remains substantially faster;
this change does not make it redundant.

The implementation and measurements are based on SQGI commit `a8a77cd` plus
the accessor changes on `work/sqtheia-jit`. SQTheia's checkout has no Git
metadata, so the measurements record hashes of its dynamics inputs. A
separate before/after check covers 621 `.nut`, `.sqk`, and `.json` files in
its `src`, `resources`, and `tests` directories.

## Workload and results

The harness imports SQTheia's production `flight_dynamics.nut` unchanged.
Each pass constructs trainer, optera, cotesia, and sc1 with fixed initial
conditions and runs 1,000 steps of 0.001 seconds per aircraft. Each process
runs three passes; the first warms compilation and caches. Three fresh
processes per mode, with rotating mode order, supply six warm samples per
mode. Statistics collection is disabled during timing.

These are medians for **4,000 aggregate dynamics steps**, measured on an
Intel Core i7-12700, Linux x86_64, pinned to logical CPU 0. Both runtimes use
Release `-O3`, LLVM 18, and no LTO or PGO. The JIT threshold is 1,000 and
`SQGI_JIT_PRECISE_EXITS=0`.

| Execution mode | Before | After | Reduction in elapsed time |
| --- | ---: | ---: | ---: |
| Ordinary JIT, scalar dynamics | 1.387760 s | 1.248447 s | 10.04% |
| Ordinary JIT plus typed kernels | 0.802483 s | 0.758828 s | 5.44% |
| Interpreter, scalar dynamics | — | 1.399133 s | — |
| Interpreter plus typed kernels | — | 0.805662 s | — |

The original ordinary JIT barely changes scalar runtime relative to the
interpreter. After the change, kernels plus JIT still run about **1.65 times
as fast** as scalar dynamics plus JIT. All recorded final positions,
velocities, angular rates, quaternions, angles of attack/sideslip, and motor
states match exactly across modes, processes, and passes: maximum absolute
difference **0**.

Timing includes dynamics dispatch and kernel buffer packing/unpacking.
It excludes model construction, module initialization, and cold kernel
compilation. Compilation time is retained separately in the raw results.
This is a dynamics benchmark, not a measurement of the full simulator,
autopilot, sensor processing, telemetry, rendering, or worker scheduling.
It covers fixed scenarios rather than a complete flight envelope, and the
sample count is too small for broad claims about other hosts.

Reproduce with [the runner](../tools/run_sqtheia_benchmarks.py) and
[the harness](../tools/bench_sqtheia_dynamics.nut):

```sh
python3 tools/run_sqtheia_benchmarks.py \
  --repo "$HOME/Programming/sqtheia" --sqgi build/sqgi \
  --baseline /path/to/a8a77cd/sqgi --runs 3 --steps 1000 \
  --threshold 1000 --cpu 0 --output /tmp/sqtheia-jit.json
```

Omit `--baseline` for the four current-runtime modes. Select an available
logical CPU on other hosts. The runner verifies state agreement and input
hashes. [Raw timings and states](benchmark-results/sqtheia-jit-2026-11-02.json)
include binary and harness hashes.

## Where the ordinary JIT stops

SQTheia's `src/physics.nut` performs ten 1 ms dynamics steps per 10 ms
autopilot interval, with sensor work around those steps. Its worker tracks
scheduling debt. The benchmark isolates those dynamics steps; meeting the
worker's deadline also depends on the surrounding work.

The scalar path still exists and is selected with
`SQTHEIA_DYNAMICS_KERNELS=0`. The 486-line
`resources/kernels/flight-dynamics.sqk` contains multiple numerical blocks.
`src/dynamics_kernels.nut` loads them once and adapts the object model to
typed buffers for aero, forces, motion, rotation, atmosphere, motor, tilt,
contact, and drag calculations. Its benefit comes from combining arithmetic
and avoiding repeated object dispatch within those blocks.

A separate diagnostic run over three passes reports these baseline counts:

| Event or function | Baseline observation |
| --- | --- |
| Prototype compilation | 9 successes, 114 failures in 123 attempts |
| Loop discovery | 174 attempts, no loops compiled |
| Vector `_get` | 12,349,671 interpreted entries |
| Vector `_set` | 5,211,432 interpreted entries |
| Vector `copy` | 1,848,435 interpreted entries |
| Vector `_add` | 992,958 interpreted entries |
| Vector `_mul` | 627,186 interpreted entries |
| Vector `cross` | 500,958 interpreted entries |
| Quaternion `rotate_vector` | 218,988 interpreted entries |

These are **call counts, not CPU-time percentages**. Compilation counts
include retries. [Full diagnostic output](benchmark-results/sqtheia-jit-coverage-2026-11-02.json)
records both runtimes. Native `n()` calls already work, so a blanket claim
that object access has no acceleration would be incorrect.

The concrete compiler barriers are:

1. [Scalar eligibility](../Squirrel3/squirrel/jit/sqjit_leaf.cpp) rejects
   captured outer values, default parameters, ordinary receiver accesses,
   and unlowered calls. The final
   [LLVM lowering path](../Squirrel3/squirrel/jit/sqjit_backend_llvm.cpp)
   requires scalar arguments. Velocity integration receives vector objects,
   while the vector/quaternion constructors and helpers commonly capture `M`.
   The baseline records 89 scalar-function rejections, 24 scalar-argument
   rejections, and one scalar type-flow rejection.
2. [Object inlining](../Squirrel3/squirrel/jit/sqjit_object_plan.cpp) can
   eliminate suitable private local object graphs. Its entry contract
   requires a root-table receiver, numeric arguments, no outer captures,
   and a scalar result. Existing aircraft/vector inputs and returned vector
   instances fall outside that contract. Increasing its size limits does
   not supply the missing object representation.
3. [Scalar helper inlining](../Squirrel3/squirrel/jit/sqjit_scalar_inline.cpp)
   covers a narrow root-table helper shape. Vector operations invoke methods,
   constructors, and metamethods, often through captured module tables.
   `rotate_vector` creates vectors, calls `cross`, and chains overloaded
   multiplication/addition; native arithmetic is only a small part of the
   required operation.
4. `foreach`, `typeof`, error paths, numeric conversion, and dynamic calls
   obstruct compiling larger regions. The optional
   [boxed LLVM path](../Squirrel3/squirrel/jit/sqjit_llvm_objects.cpp) has
   limited opcode and call coverage. One exploratory baseline run with
   precise exits enabled did not improve warmed timing; that flag is not
   an established remedy for this workload.
5. There are smaller scalar gaps too: the leaf type flow currently limits
   negation to integers and equality/inequality to matching integer or bool
   types. Float validation and quaternion arithmetic need broader handling
   with correct NaN and signed-zero semantics.

## First implemented improvement

The old accessor recognizer missed both the compiler's
`GETK; LOADINT; GET; RETURN` sequence for `return data[0]` and the bounds
checks in SQTheia's vector getter:

```squirrel
function _get(i) {
    if (typeof i != "integer") throw null;
    if (i < 0 || i >= data.len()) throw "Vector index";
    return data[i];
}
```

[The new recognizer](../Squirrel3/squirrel/jit/sqjit_specialize.cpp) proves
a bounded, read-only successful path under a live array/type/index/bounds
guard. It follows equivalent conditional forms, including `and`/`or`,
without depending on application names or error strings. It rejects
additional work, unknown predicates, writes, and arbitrary calls. Failed
guards execute the original bytecode, preserving validation and callbacks.
The builtin length closure is checked, and observable releases of the VM
scratch value cause fallback before any state change.

This uses a **C++ native specialization selected by the JIT**, extending
the existing accessor mechanism. It does not generate general LLVM code
for object methods. The constant-index sequence now uses the existing
constant accessor specialization with the same scratch-release protection.

The diagnostic run now has 13 successful compilations. Vector `_get`
records 12,213,387 successful native entries, and `get_x/y/z` use native
direct calls after warmup. `_set`, `copy`, vector arithmetic, and quaternion
rotation remain interpreted. The kernel path benefits because it still
performs Squirrel object access outside its numerical blocks.

## Next compiler work

The next milestone should compile unchanged `Vector.dot` and
`Quaternion.magnitude` as object methods. They give useful, bounded tests
of native object inputs, scalar arithmetic, method/metamethod calls, and
array iteration before tackling allocation-heavy expressions.

1. Add mixed boxed-object/scalar values to native regions, guarded instance
   field access, float negation/comparison, and array `foreach`. Keep cold
   validation paths as precise exits with the correct bytecode position and
   live values. Preserve mutable fields and array lengths rather than
   assuming vector shape from application class names.
2. Compile and inline observed method/metamethod targets with guards on
   receiver layout and callable identity. Support captured module bindings
   and default arguments without freezing mutable tables. This should let
   `dot`, `squared_norm`, and `magnitude` stay native across their calls.
3. Handle checked numeric stores and conversions with correct write and
   release ordering. Vector `_set` is the largest remaining counted call
   site, but a getter proof cannot safely be reused for writes. Error and
   callback paths must execute exactly once, with no replay after mutation.
4. Extend escape analysis across those calls, then scalar-replace temporary
   vectors/quaternions in `cross`, overloaded arithmetic, and
   `rotate_vector`. Materialize objects when they escape or a side exit
   needs them. This is the route toward the kernel's advantage across a
   complete calculation; individual accessor stubs have a much lower ceiling.
5. Carry the resulting regions into integration and aero methods, remeasure
   all four aircraft, and then measure worker deadlines with autopilot and
   sensor work included. Keep the kernel as a performance and correctness
   comparator until ordinary JIT coverage and end-to-end timing justify
   removing it.

Each milestone needs assertions that its intended methods actually execute
natively, mutation/error/deoptimization tests, and the same differential
workload. Sampling CPU and allocation profiles should guide the larger
changes; the current call counters do not quantify allocation cost or
predict the speedup from eliminating it.

## Validation and limits

The selected release checks pass **16/16**, covering the new accessor test,
JIT contracts, side exits, values, memory, LLVM, objects, leaf/object plans,
and script-level correctness/math/loop/integer tests. A fresh ASan+UBSan
Debug build passes both the accessor and contract tests. The
[validation record](benchmark-results/sqtheia-jit-validation-2026-11-02.json)
retains the test names, differential output, and source-verification result.

[Accessor regression coverage](../test/cpp/test_sqjit_checked_accessors.cpp)
checks native execution, equivalent guard forms, live field/element
replacement, invalid and extreme indices, managed result identity, custom
callbacks, extra predicates, side effects, builtin length replacement, and
observable scratch releases. Both interpreted and JIT modes are exercised.

SQTheia's unchanged `tests/dynamics_kernels.nut` passes **13,237 checks**
with maximum scalar/kernel difference **0**. All recorded benchmark states
also agree exactly.

The separate existing reference suite is not green: `tests/dynamics.py`
rejects the current SC1 model hash. Running `tests/dynamics.nut` directly
reaches a mismatch at check 1719, `sc1.1.aeroMoment.1`:
`-1.9798606890727` versus expected `-1.9749556784346`. The identical failure
reproduces with the saved baseline runtime and JIT disabled. This is a
pre-existing reference/model discrepancy, not evidence of a regression
from this patch; the model and fixtures were left unchanged.
