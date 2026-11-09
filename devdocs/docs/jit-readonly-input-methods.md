# LLVM compilation of read-only input methods — 2026-11-02

This extends the [SQTheia assessment](../../docs/sqtheia-jit-assessment.md) from accessor
specializations to compiling calculations on existing objects. SQTheia is a
benchmark and correctness client; the compiler has no aircraft, vector,
quaternion, application field names, or numerical formulas built into it.
No SQTheia files were changed.

The new [input plan](../../Squirrel3/squirrel/jit/sqjit_input_plan.cpp) follows
ordinary bytecode, inlines supported read-only method and indexing calls,
and lowers the resulting arithmetic into the existing LLVM scalar pipeline.
It accepts persistent instance inputs, nested field/table/array reads,
numeric arguments, small array `foreach` loops, and audited math builtins.
It can compile the unchanged `Vector.dot`, `squared_norm`, vector magnitude,
and quaternion magnitude methods.

## Representation and guards

The compiler records a dependency graph rooted in the original arguments
and closure. At execution, a bounded C++ helper checks that graph and reads
current numeric values into a native buffer. LLVM executes the calculation
over those values. It does not copy Squirrel objects or retain the objects
used during compilation. Artifact dependencies use weak references for
classes and call targets, and strong references only for non-GC strings.

Runtime checks cover input types, instance class identity, live field reads,
array lengths and element types, method/metamethod identity, closure
environments, builtin length/math identity, and root fallback lookup rules.
Changing a field's numeric value is supported without recompilation. A
different shape, callable, or type can fall back to the original bytecode.
Nested table fields are looked up afresh, so rehashing does not invalidate
a cached address.

Only branches proved from literals, guarded types, or guarded lengths are
folded. Numeric field contents are never treated as constants. Small array
iterations are unrolled from their guarded length. Limits of 16 elements,
128 input nodes, 8 call levels, 4,096 analysis visits, 2,048 emitted
instructions, and the existing scalar register budget bound compilation
cost. They apply to every workload, and unsupported shapes keep their
interpreter behavior.

An index getter that declines a string name with `throw null` may allow
normal root lookup to continue. The compiler proves that outcome without
emitting arithmetic or effects, then guards the getter and lookup
dependencies. This is needed for ordinary methods that have `_get` and
call a global math function. Changing `_get`, the instance default delegate,
the method's root, or a member that shadows the global causes fallback.

Successful paths have no object writes, allocations, or arbitrary native
callbacks. Failed guards can replay the original method from its beginning.
The VM scratch owner is checked before snapshots and cleared only after
successful execution. Scalar argument reads and output publication retain
the existing native calling contract, including aliased argument/result
slots and caller-owned stack cells. Floating arithmetic uses the existing
floating-environment guard and LLVM arithmetic semantics.

This is a general but deliberately bounded compiler extension. It does not
yet support captured module values, default parameters, data-dependent
branches, object construction/escaping results, or writes in these methods.
It does not implement general object mutation or deoptimization inside a
partially completed method. Those remain separate compiler milestones.

## Generality and correctness checks

[The regression test](../../test/cpp/test_sqjit_input_plan.cpp) verifies actual
LLVM compilation and successful native execution, not merely agreement
through interpreter fallback. Alongside vector-style reductions, it tests
Horner polynomial evaluation and pricing calculations with a nested
configuration table and an inlined caller. Fresh VMs exercise lengths
0, 1, 4, 8, and 16 natively, and length 17 through fallback. All samples
match the interpreter exactly, including after coefficient/field changes
and table rehashing.

Other cases cover numeric argument changes, full-width integers, NaNs,
integer division failure, empty/mismatched arrays, arbitrary callback
fallback, method and root mutations, default-delegate shadowing, inherited
classes, managed scratch releases, output/input aliasing, uninitialized
bytecode locals, and garbage collection while an artifact remains alive.
The tests explicitly clear interpreter caches when isolating artifact
ownership.

The release validation covers 17 selected JIT tests. ASan+UBSan covers the
input plan, accessor, contract, and LLVM suites; the expanded generality
cases also pass under sanitizers. The unchanged SQTheia kernel differential
suite passes 13,237 checks with maximum difference zero.
The [validation record](benchmark-results/sqtheia-input-methods-validation-2026-11-02.json)
includes the test names, source verification, and the pre-existing SC1
reference/model discrepancy described in the initial assessment.

## Measurements

The comparison baseline is the accessor-only runtime from the preceding
assessment, not the older `a8a77cd` runtime. Timing and compilation coverage
are collected separately. Runs use LLVM 18, Release `-O3`, CPU 0 on the
same i7-12700 host, a threshold of 1,000, and precise exits disabled.
Each mode has three fresh processes and three passes per process; the first
pass is excluded from warm medians.

The [method harness](../../tools/bench_sqtheia_methods.nut) imports SQTheia's
actual methods and performs 200,000 calls per method per pass. Its times
include the Squirrel caller's loop overhead. The dynamics harness uses the
same four-aircraft workload as the preceding assessment. Neither harness
changes SQTheia or measures the full autopilot/UI worker.

| Method, 200,000 calls | Accessor-only JIT | Input-method JIT | Throughput ratio |
| --- | ---: | ---: | ---: |
| Vector `dot` | 72.620 ms | 16.173 ms | 4.49× |
| Vector `squared_norm` | 76.957 ms | 12.905 ms | 5.96× |
| Vector `magnitude` | 107.943 ms | 18.146 ms | 5.95× |
| Quaternion `magnitude` | 24.602 ms | 16.786 ms | 1.47× |

| Full dynamics, 4,000 aggregate steps | Accessor-only JIT | Input-method JIT |
| --- | ---: | ---: |
| Scalar dynamics | 1.251859 s | 1.225294 s |
| Existing typed kernels | 0.766491 s | 0.761287 s |

The scalar dynamics reduction is **2.12%**, incremental to the accessor
improvement. The kernel-path difference is only 0.68%; given the spread of
these samples, treat that path as broadly unchanged. The large improvements
in these small methods translate to a modest overall gain because writes,
copying, construction, and overloaded arithmetic remain interpreted.
These measurements do not quantify the CPU-time share of each of those
operations; sampling profiles should guide the next larger change.

All recorded method checksums and dynamics states match exactly across
modes and processes. Raw [method results](benchmark-results/sqtheia-input-methods-micro-2026-11-02.json)
and [dynamics results](benchmark-results/sqtheia-input-methods-dynamics-2026-11-02.json)
retain every sample, input hash, and binary hash.

The separate [coverage run](benchmark-results/sqtheia-input-methods-coverage-2026-11-02.json)
confirms native execution of all four original methods. In the complete
dynamics workload, vector magnitude records 134,303 successful direct
native calls, including the inlined squared-norm/dot calculation. Its
callees can consequently stop reaching their own compilation thresholds;
individual prototype counts are not a measure of total useful coverage.
The workload has 17 successful compilations in 121 attempts. Most of the
remaining vector operations still fail eligibility.

```sh
python3 tools/run_sqtheia_method_benchmarks.py \
  --repo "$HOME/Programming/sqtheia" --sqgi build/sqgi \
  --baseline /path/to/accessor-only/sqgi --runs 3 --cpu 0 \
  --output /tmp/sqtheia-methods.json

python3 tools/run_sqtheia_benchmarks.py \
  --repo "$HOME/Programming/sqtheia" --sqgi build/sqgi \
  --baseline /path/to/accessor-only/sqgi --runs 3 --cpu 0 \
  --output /tmp/sqtheia-dynamics.json
```

The remaining major gaps are checked writes, captured helpers, and
allocation elimination across vector/quaternion operations. Improvements
to isolated read-only methods do not establish that the typed kernel can
be removed. Full dynamics timing and later worker-deadline measurements
remain the deciding evidence.
