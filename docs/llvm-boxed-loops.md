# LLVM loops with shared objects

The newer [private object graph pass](llvm-local-graphs.md) now eliminates the
allocations and reference transfers in `object_member_write_fallback` entirely.
The boxed path documented here remains necessary for shared and escaping objects;
its benchmark results below are historical measurements before graph elimination.

The LLVM bytecode backend can now enter eligible loops that read and write
existing table slots, instance fields, and array elements, including reference
values. Unlike private-table scalar replacement, these objects can be shared
with callers: native writes update the real objects immediately.

The primary workload is the unchanged `object_member_write_fallback` benchmark,
which swaps array references in table fields, changes a string field, and updates
array elements. Tests also exercise the same operations on class instances.

## Execution and ownership

Compilation happens at the loop header. The interpreter handles allocation and
setup; LLVM handles the eligible loop using canonical VM stack slots. Integer
arithmetic, field-cache hits, array bounds checks, and common reference transfers
are emitted directly into LLVM IR. Cold lookups and uncommon operations call
bounded helpers derived from the existing precise-exit backend's contracts.

Each activation has fresh borrowed field-location caches. Hits validate receiver
type and identity and key type and identity, then read the current slot value.
The accepted instructions cannot allocate new Squirrel objects, resize containers,
or invoke user callbacks. Thus a cached slot cannot move and a freed receiver's
address cannot be reused during the activation. A side exit discards these caches.

Reference copies retain the incoming value before dropping the displaced owner.
Only a proven non-final drop without ancestor journal pins uses direct reference
count updates. Other drops consult `CanReleaseInContext` before creating any
temporary pin. Observable final destruction or weak-reference death causes a
side exit so the interpreter performs that instruction at its normal point.
GET preserves the VM temporary-swap semantics, rather than releasing the old
destination immediately. Assignment-expression results retain the combined-drop
checks in the helper path.

Guard failure returns the exact failing instruction. Earlier writes remain
committed and are never replayed. The loop runtime now handles this side-exit
status and suppresses immediate reentry at a failing header, ensuring progress.
Completed loops resume at their ordinary exit instruction. Invalid continuations
raise a VM error; they cannot trigger replay of committed writes. Already rejected
headers are checked before entering the loop dispatcher, avoiding repeated work
in unsupported loops.

## Supported scope and limits

- Existing table slots, instance fields, and array elements; reference-valued
  assignments, weak-value reads, scalar operations, and ordinary branches.
- Default array/string length preparation and default length calls. Replacement
  methods and unsupported receivers resume in the interpreter.
- Up to 257 instructions per compiled region, subject to bytecode validation.
- No constructors, structural mutations, arbitrary calls, or method inlining
  inside the compiled region. Metamethods and delegation execute after a side exit.
- Integer arithmetic is directly lowered. Unsupported arithmetic types resume
  at the original instruction, preserving prior writes.

Whole-function canonical-frame entries are also implemented for short reference
methods, but remain behind the existing `SQGI_JIT_PRECISE_EXITS=1` experiment.
Initial short-method measurements regressed the mixed-object workload, so they
are not enabled by default. Loop entries are enabled with the LLVM bytecode JIT.
Frameless calls cannot invoke a canonical-frame entry.
Returns that could move observable receiver destruction ahead of frame cleanup
also resume in the interpreter.

This does not change the general table/instance layout or introduce dependencies.
Validation and measurements here use Linux x86-64 and LLVM 18.

## Correctness coverage

Twelve selected tests passed in the normal build and twelve under ASan/UBSan.
The expanded LLVM tests compare JIT-disabled and JIT-enabled behavior and assert
native loop execution for shared tables, instances, changing receivers, and
reference swaps. They cover zero-trip loops, partial writes before bounds and
division failures, noninteger header fallback, live weak values, release-hook
ordering, ancestor journal pins, metamethod fallback, and replaced length methods.
The optional frame path additionally tests returning the replaced reference.
An injected invalid native continuation verifies that committed effects are
preserved and the VM raises an error instead of replaying the loop.

## Reproduce

Preserve a baseline binary before rebuilding, then run:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/current/sqgi --sqgi-baseline /path/to/before/sqgi \
  --node /path/to/node26 --suite kernels --runs 5 --iterations 80000 \
  --warmups 5 --jit 1 --cpu 0 --output /tmp/boxed-comparison.json
```

Compilation is excluded from these warmed timings. The harness rotates runtime
order and checks all 15 workloads against the baseline, Node, GJS, and Python.

## Measured results

Five-round medians, i7-12700 CPU 0, 80,000 requested iterations and five warmups.
LLVM bytecode JIT and threaded dispatch enabled, RelWithDebInfo without LTO/PGO.
Node 26.9.0. All 15 workloads matched checksums across all five runtimes in every round.

| Workload | Before (ns/iteration) | After | Node 26 |
|---|---:|---:|---:|
| direct_call | 3.131 | 3.137 | 3.866 |
| branch_call | 3.205 | 3.196 | 2.982 |
| float_call | 1.470 | 1.472 | 1.470 |
| numeric_loop | 5.448 | 5.456 | 5.484 |
| vector | 2613.962 | 2778.775 | 111.907 |
| dynamic_member | 217.275 | 212.262 | 27.936 |
| dynamic_key_get_set | 4.375 | 4.375 | 17.954 |
| object_member_write_fallback | 136.162 | 76.912 | 4.296 |
| array_append | 42.175 | 38.975 | 9.345 |
| array_write | 0.888 | 0.888 | 1.702 |
| array_read | 0.216 | 0.216 | 0.839 |
| array_float | 0.419 | 0.425 | 0.473 |
| math_intrinsic | 227.238 | 219.762 | 9.110 |
| math_variable | 200.112 | 195.075 | 27.957 |
| matrix | 398.425 | 401.712 | 6.980 |

Object-valued writes improve 1.77× (43.5% less time); array append also improves
after removing repeated dispatch into rejected loop probes. Mixed dynamic objects
change only slightly. Ordinary object-based vectors regress about 6.3%, so this
change is not a universal interpreter speedup. The earlier typed-vector kernel
was not rerun here. Object-valued writes still trail Node by about 18×.

The enabled improvement is native loop execution over shared objects. Short
class-method inlining and further reduction of ownership/bookkeeping costs remain
future work; the experimental frame tier is not enabled merely to inflate coverage.

## Follow-up: exposing common operations to LLVM

A profile of 40 million iterations of `object_member_write_fallback` found
roughly 40% of sampled core cycles in named C++ helpers and bookkeeping.
Literal loads alone accounted for 11.6%, length preparation 5.6%, and the
shared release predicate 4.7%. These are samples of the complete mixed loop,
not timings of individual object writes; generated code contains additional
ownership work.

The next lowering step emits literal loads, reference moves, integer equality
and inequality, truth tests, and integer post-increments directly in LLVM IR.
This removes opaque helper boundaries and exposes memory effects to LLVM.
Reference transfers continue to use the existing ownership checks; they are
not converted into unowned pointers. Floating and mixed numeric equality retain
the existing numeric helper inside the native loop. Truth tests cover all VM
value types, including negative floating zero. Post-increment checks the result's
old owner before either write; its incremented operand is already an integer,
so publishing the second write cannot introduce a new failing release.

Additional tests compare interpreter and native execution for literal/reference
transfers, equality and inequality, integer/float comparisons, scalar and object
conditions, negative zero, and nonnumeric equality side exits after committed
writes. Native-success counters verify that mixed numeric comparisons still
finish compiled loops. Existing release-hook, weak-reference, ancestor-journal,
metamethod, and invalid-continuation tests remain enabled. Twelve selected tests
pass in each of the normal and ASan/UBSan builds.

This is a first step toward better value lowering. Canonical VM slots still
own their references, field accesses still validate their caches, and length
preparation still uses a helper. Register-resident values with reconstructed
exit frames and proven borrowed lifetimes remain future work.

Five-round medians for the final build, with the same CPU, options and harness
as above. All 15 checksums match in all rounds across SQGI, the saved pre-change
binary, Node 26.9.0, GJS and Python. Units are ns per complete loop iteration.

| Workload | Before | After | Node 26 |
|---|---:|---:|---:|
| direct_call | 3.142 | 3.142 | 3.855 |
| branch_call | 3.201 | 3.199 | 2.977 |
| float_call | 1.478 | 1.471 | 1.470 |
| numeric_loop | 5.459 | 5.458 | 5.508 |
| vector | 2765.850 | 2759.962 | 110.943 |
| dynamic_member | 211.212 | 221.062 | 27.483 |
| dynamic_key_get_set | 4.400 | 4.412 | 17.873 |
| object_member_write_fallback | 76.662 | 61.588 | 4.393 |
| array_append | 38.275 | 38.925 | 9.979 |
| array_write | 0.888 | 0.888 | 1.701 |
| array_read | 0.216 | 0.216 | 0.839 |
| array_float | 0.419 | 0.420 | 0.474 |
| math_intrinsic | 221.312 | 223.513 | 9.008 |
| math_variable | 195.463 | 199.437 | 27.923 |
| matrix | 404.037 | 400.525 | 7.020 |

The object-write workload improves 1.24× (19.7% less elapsed time); Node remains
about 14× faster. Mixed dynamic objects measure 4.7% slower in this comparison,
so this does not establish a general dynamic-object speedup. Earlier intermediate
57–58 ns measurements preceded the final changes preserving native numeric and
branch coverage; the final comparable median is 61.588 ns.

Raw results for this session: `/tmp/sqgi-boxed-inline-checked.json`. The saved
baseline is `/tmp/sqgi-before-boxed-inline`; both were measured with the same
five-round command above. Changes are intentionally confined to the boxed
lowering; this is not a claim that ownership promotion or exit-frame
reconstruction has been implemented.
