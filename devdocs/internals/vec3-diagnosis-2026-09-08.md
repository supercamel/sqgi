# Vec3 execution diagnosis — September 8, 2026

This is the historical baseline. The subsequent
[object inlining implementation](vec3-implementation-2026-09-08.md) makes the
original array-backed Vec3 kernel native and eliminates its temporary objects.
The baseline executable was preserved at
`/tmp/sqgi-vec3-implementation-20260908/baseline-sqgi`; the `symbols/sqgi` path
below now contains the candidate build.

The original Vec3 kernel gets essentially no benefit from the current x64 JIT:
**2,798.58 ns/iteration interpreted versus 2,780.15 ns with JIT enabled**.
Its loop, constructors and arithmetic methods execute in the interpreter.
The JIT handles only the two small array accessors. This leaves a large amount
of bytecode dispatch, boxed-value handling, member lookup and call machinery
around a small numerical calculation.

The investigation also found and fixed a native branch-parameter initialization
bug. The timing results below include that correction; wrong-result timings
were discarded. The correction does not make the original Vec3 loop native.

## Controlled variants

All variants preserve the numerical operation order, int64/double behavior and
checksums. Same machine as the cross-runtime comparison: i7-12700, Linux x86-64,
CPU 0. Release `-O3 -DNDEBUG -g`, PGO/LTO disabled. Five fresh-process rounds,
rotating variant/JIT order, 80,000 iterations per call, five full warmups,
threshold 1. Timings exclude startup and compilation. Instrumentation is off.
All 70 measured checksums agree; each process also checks a known 120-iteration
reference. Medians are shown; the raw samples include occasional outliers, so
small differences between object variants should not be overinterpreted.

| Representation | Interpreter ns/iteration | JIT ns/iteration | Original JIT / variant JIT |
| --- | ---: | ---: | ---: |
| Array-backed Vec3, overloaded operators (original) | 2798.58 | 2780.15 | 1.00× |
| Same objects/allocations, explicit arithmetic methods | 2785.55 | 2829.18 | 0.98× |
| x/y/z fields, overloaded operators | 2211.61 | 2299.58 | 1.21× |
| x/y/z fields, explicit arithmetic methods | 2098.50 | 2218.03 | 1.25× |
| Reused array-backed objects, mutating methods | 1716.16 | 1746.78 | 1.59× |
| Reused arrays, arithmetic written in the loop | 483.38 | 83.05 | 33.48× |
| Scalar locals, arithmetic written in the loop | 283.99 | 38.75 | 71.75× |

Replacing overloaded operators with ordinary methods does not deliver a
material win here. Removing per-iteration object construction helps, but the
reused-object version still spends most of its time outside the JIT. Flattening
the operations removes method/lookup work and lets the existing JIT compile
the numerical loop. Its speedup over its own interpreter becomes 5.82× with
arrays and 7.33× with scalars.

These are diagnostic source transformations, not automatic optimizations now
applied to arbitrary Vec3 code. They change identity, aliasing and allocation
behavior that this closed benchmark cannot observe. A compiler must prove
those changes safe, including on fallback paths. The 33×/72× ratios therefore
show opportunity for this kernel, not a promised general JIT speedup or a new
like-for-like result against Node/GJS/Python.

## Hardware profile and allocation counts

`perf record` sampled the original variant with JIT enabled, using user-space
cycles at 997 Hz and DWARF stacks. One warmup and one measured call each used
2,000,000 iterations. There were **11,307 samples and zero lost samples**.

The largest **self** cycle shares were:

| Location | Sampled cycles |
| --- | ---: |
| `SQVM::Execute` | 47.54% |
| `SQVM::Get` + `SQTable::Get` | 13.57% |
| `StartCall` + `EnterFrame` + `LeaveFrame` + `Return` | 8.43% |
| libc `malloc` + `cfree` + `_int_free` | 6.63% |
| Outlined `SQObjectPtr` assignment functions | 4.23% |

These rows exclude their callees and do not overlap. `Execute` itself includes
inlined operations; it is not all instruction-fetch overhead. Source attribution
places about 20.9% of cycles in `sqobject.h`, which contains value copies, type
handling, reference increments/decrements and release checks. That source view
overlaps the function view above. It cannot be treated as a separate 20.9% cost
or as an exact measurement of reference counting alone.

A separate glibc allocation-counting preload measured differences between
1,000, 2,000 and 4,000 iterations, holding startup and reference checks constant.
Both differences agree exactly:

- Original Vec3 and the explicit-method equivalent: **30 mallocs, 30 frees and
  2,240 requested bytes per iteration**. The source creates ten Vec3 instances,
  each with an SQArray and a separate element buffer. At 80,000 iterations that
  is 2.4 million allocation calls and 179.2 MB of cumulative requested storage,
  not resident memory usage.
- The field-backed JIT variant makes 11 allocation/free calls per iteration:
  ten instances plus the native setter's transaction log. It still interprets
  its allocating arithmetic methods.
- Reused objects, reused arrays and scalars add **zero allocation/free calls
  per loop iteration**. Setup still allocates outside the loop.

Reference counting and lifetime handling contribute, but removing allocation
alone leaves the reused-object kernel at roughly 1.75 microseconds. The evidence
supports reducing VM/object work together through native lowering and inlining.

## Why the object program misses the JIT

A separate observer enabled JIT route counters and invoked each kernel for
1,000 iterations. These diagnostic runs were excluded from timing.

- The original loop and whole function fail compilation. There are zero
  successful native loop executions.
- `cross` enters the interpreter 2,000 times, `_add` 3,000, `_mul` 3,000 and
  `_sub` 1,000. Every arithmetic prototype is rejected at its class-call
  preparation with `unsupported callee or receiver`.
- `dot` enters 1,001 times and also fails compilation. The x64 whole-function
  field-load lowering handles scalar members; it cannot carry `this.values`
  as an array through the following indexed loads. The loop memory lowerer
  already has related support, making shared lowering a useful next step.
- `get` and `set` successfully use native accessor stubs, totaling 2,000 and
  1,000 calls. This explains why enabling JIT barely changes total time.
- The class-call branch in `SQVM::Execute` starts constructor frames without
  the normal JIT entry hook. These constructors also have default parameters,
  which whole-function compilation currently rejects. Their absence from the
  JIT counters is not evidence that their 10,000-plus calls disappeared.
- `SQJitX64Calls::Prepare` supports selected numeric operations and eligible
  table-resolved scalar leaf functions. It does not provide general instance
  method or class-call lowering. `SQJitLeafPlan::Eligible` also excludes reads
  of `this`, member accesses, allocations and nested calls.
- Reused-object arithmetic still fails the array-field load path. The flattened
  array version successfully runs as a native loop; the scalar version runs
  as a native whole function.

Source locations: [VM class calls](../../Squirrel3/squirrel/sqvm.cpp),
[x64 call lowering](../../Squirrel3/squirrel/jit/sqjit_backend_x64_calls.cpp),
[leaf eligibility](../../Squirrel3/squirrel/jit/sqjit_leaf.cpp),
[whole-function lowering](../../Squirrel3/squirrel/jit/sqjit_backend_x64.cpp),
[loop member/array lowering](../../Squirrel3/squirrel/jit/sqjit_backend_x64_memory.cpp).

## Correctness fix discovered during the investigation

The field-backed setter had this shape:

```squirrel
function set(i, value) {
    if (i == 0) this.x = value
    else if (i == 1) this.y = value
    else this.z = value
    return value
}
```

Linear lowering first loaded `value` inside the `i == 0` arm, then marked its
native slot materialized for all later code. Taking another arm skipped that
load and read uninitialized native storage. The 120-iteration checksum was
`0.008499258350671878` instead of `0.021712587807413163` in the initial run;
the erroneous value depends on native stack contents.

x64 and AArch64 whole-function lowering now initialize live numeric parameters
before branch labels, so their loads dominate every arm. Loop-modified
parameters retain their existing initialization outside backedges. Straight-line
functions keep lazy loading. This is a targeted repair; a future shared IR should
track representation and initialization through control flow explicitly.

The regression test failed before the fix and passes afterward. It checks
branching stores and arithmetic, first calls taking a non-first arm, repeated
calls with changed values, int64/double tags, table/class receivers and native
frame/direct execution. Validation: **93 Release tests, 93 ASan/UBSan tests
with leak detection, and 12 AArch64 core tests under QEMU passed**. The packaging
test requiring the previously failing external download was excluded from both
93-test suites. All seven benchmark variants now match with JIT on and off.

## Priorities supported by this evidence

1. Share array-valued member and indexed-load lowering between whole functions
   and loops, then compile methods such as `dot` and reused-object arithmetic.
   Add route assertions for these realistic object kernels so successful
   checksums alone cannot hide permanent interpreter execution.
2. Add guarded instance-method and constructor calls. Handle normalized/default
   arguments and constructor entry correctly, preserving class/method changes,
   hooks, errors and coroutine semantics. Support calls without turning a
   single unsupported operation into loss of the entire hot region.
3. Build bounded method/constructor inlining on shared control-flow and effect
   analysis. Cover the object arithmetic/metamethod chain, carrying scalar
   values through calls and eliminating repeated member lookup and boxing.
4. Use escape analysis and scalar replacement to remove temporary Vec3
   instances and backing arrays. Materialize values if identity becomes
   observable or execution must resume in the interpreter. Precise fallback
   state and ownership rules are prerequisites.
5. Profile again, then reduce remaining ownership operations or allocation cost
   where they remain measurable. The current evidence favors the preceding
   object/JIT work over adding arithmetic opcodes.

## Reproduction and evidence

```sh
python3 tools/run_vec3_benchmarks.py \
  --sqgi /tmp/sqgi-vec3-audit-20260908/symbols/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 --output vec3.json

taskset -c 0 perf record -e cycles:u -F 997 --call-graph dwarf,8192 \
  -o /tmp/vec3.data -- env SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 SQGI_JIT_TRACE=0 \
  /tmp/sqgi-vec3-audit-20260908/symbols/sqgi test/bench_vec3.nut \
  --only=arrays_operators --iterations=2000000 --warmups=1
perf report --stdio --no-children --call-graph none --sort dso,symbol -i /tmp/vec3.data

SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 SQGI_JIT_TRACE=1 \
  /tmp/sqgi-vec3-audit-20260908/symbols/sqgi test/bench_vec3.nut \
  --only=arrays_operators --iterations=120 --warmups=0
```

[Saved evidence](vec3-diagnosis-2026-09-08.json) includes all timing samples,
commands/checksums, executable/source hashes, allocation counts and probe source,
route observations, both profile views and test logs. Large raw perf recordings
remain in `/tmp/sqgi-vec3-audit-20260908/`. Temporary probes linking `libsqgi` must
set `LD_LIBRARY_PATH` to the matching build; an existing system library otherwise
takes precedence in this environment. The installed runtime and main `build/`
directory were not rebuilt or installed by this investigation.
