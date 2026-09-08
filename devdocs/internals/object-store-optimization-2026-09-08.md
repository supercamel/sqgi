# Object-member store optimization — September 8, 2026

This pass profiles and optimizes the remaining object-member write cost after
the [previous member-access pass](member-optimization-2026-09-08.md). It adds
invocation-local field locations, inline logged stores, and literal-key analysis
across control-flow joins. The original benchmark algorithms are unchanged.

Object-member writes improve **3.95× in Release**
and **3.19× with fresh PGO/LTO**.
The fresh Node comparison is **15.93 ns for SQGI PGO versus
4.07 ns for Node**: the gap is now 3.92×.
The preceding comparison was roughly 13×. These are warmed microbenchmarks,
not end-to-end application measurements.

## What the profile showed

Before this pass, about 22% of sampled cycles were in the array-member getter,
15% in pointer-member assignment, 13% in member write-log lookup, and 7% in
the string-length identity guard. The same receiver and literal fields were
resolved repeatedly even though the native loop could not change their layout.

The new profile removes member getter/setter and length-guard helpers from
the steady hot path. Most samples are in generated native code; the logged
array-element setter accounts for about 17% and is a remaining shared cost.

Three perf-stat repetitions use the preserved before/after PGO executables,
30 million iterations, one warmup and CPU 0. Counters include warmup and
measured execution, plus a small correctness/setup phase:

| Counter | Before | After | Reduction |
| --- | ---: | ---: | ---: |
| Retired instructions | 85,576,589,371 | 18,501,303,239 | 78.4% |
| Cycles | 14,576,130,559 | 4,297,201,408 | 70.5% |

## Implementation and ownership contract

The new [member plan](../../Squirrel3/squirrel/jit/sqjit_member_plan.h) is
separate from machine-code emission. Both x64 function and loop lowering
consume it through the shared memory lowerer.

1. Resolve existing table/instance fields once on each native entry. A base
   must stay in an unchanged VM-stack slot for the region. Structural writes,
   allocation/append operations and outer effects disable this plan. Accepted
   native calls are audited intrinsics or scalar leaf bodies without callbacks.
   Every entry resolves current storage again, including after receiver changes,
   table rehashing or deletion/reinsertion between calls.
2. Read each field from the actual heap and check its current tag. Stores
   update that heap slot immediately, preserving visibility through aliases.
   They do not buffer external fields or assume disjoint receivers.
3. The first store uses the existing bounded undo log. Each field cell has
   two borrowed entries identifying displaced array/string owners already
   held strongly by that same invocation’s log. A hit performs the normal
   reference increment, payload write and decrement inline. The displaced
   owner cannot be destroyed because the log still owns it. Numeric writes
   of the same tag bypass the helper after the original field is logged.
4. Cache misses, type changes and larger owner populations use the full
   checked log and ordinary object assignment. A failed record publishes
   neither the store nor a newly eligible cache entry. The cache owns nothing
   independently and resets with every invocation. Sixteen field cells bound
   frame use; additional fields retain existing lowering.
5. Literal-key dataflow follows moves, branches and backedges. A constant key
   survives a conditional value expression, allowing safe field reuse and
   conversion/length guard hoisting. Unknown or disagreeing keys stay unknown.
   Arithmetic facts apply only to accepted native numeric operations; an
   overloaded or string operation cannot execute under that assumption.
6. Math identity checks avoid replacing old cache owners while field addresses
   are live: releasing an old class could otherwise run a hook and rehash a
   table. The regression suite injects exactly such a stale cache owner.

The new mixed integer/double regression caught and fixed a bug in the first
implementation: loading raw double bits through an integer-register accessor
could use a stale pinned value when bytecode reused the slot. Floating stores
now read the flushed floating frame location on both fast and slow paths.

No opcode, benchmark field name, receiver class name, array dimension or
relaxed numeric semantics were added. Native store emission targets x86-64;
AArch64 retains its existing lowering. The shared plan/helpers build and
their contracts pass on AArch64 under QEMU.

## Full before/after comparison

Five rounds rotate four preserved binaries, with fresh processes, CPU 0
affinity, five warmups and JIT threshold 1. Base iterations are 80,000;
the original scalar-kernel 20× multiplier is preserved. All 19 checksums
match. Times below are ns per iteration.

| Kernel | Release before | Release after | PGO before | PGO after | PGO speedup |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.883 | 3.879 | 3.861 | 3.861 | 1.00× |
| branch_call | 3.109 | 3.158 | 3.113 | 3.144 | 0.99× |
| float_call | 6.954 | 6.959 | 6.964 | 6.902 | 1.01× |
| numeric_loop | 6.069 | 6.050 | 6.054 | 6.050 | 1.00× |
| vector | 62.637 | 62.187 | 62.150 | 62.025 | 1.00× |
| dynamic_member | 230.137 | 227.038 | 233.800 | 218.500 | 1.07× |
| dynamic_key_get_set | 20.088 | 21.462 | 14.200 | 13.862 | 1.02× |
| object_member_write_fallback | 72.462 | 18.350 | 52.450 | 16.438 | 3.19× |
| array_append | 35.425 | 36.300 | 29.312 | 28.800 | 1.02× |
| array_write | 6.225 | 6.125 | 4.562 | 4.525 | 1.01× |
| array_read | 1.232 | 1.228 | 1.219 | 1.208 | 1.01× |
| array_float | 1.789 | 1.793 | 1.776 | 1.789 | 0.99× |
| math_intrinsic | 26.650 | 26.687 | 26.600 | 26.787 | 0.99× |
| math_variable | 47.100 | 47.225 | 47.225 | 47.587 | 0.99× |
| matrix | 61.200 | 61.363 | 48.025 | 47.938 | 1.00× |
| temporary_arrays | 7.313 | 7.325 | 7.313 | 7.300 | 1.00× |
| gi_scalar | 499.787 | 500.387 | 525.162 | 477.662 | 1.10× |
| gi_clock | 254.350 | 255.487 | 226.112 | 225.213 | 1.00× |
| array_guards | 1.125 | 1.112 | 1.050 | 1.100 | 0.95× |

Most unrelated controls are close to unchanged. The dynamic-key Release
regression persisted in five longer runs at five million iterations and
three warmups: **20.019 → 20.885 ns
(4.3% slower)**. PGO was effectively flat at
13.871 → 13.778 ns. This is a retained tradeoff. The dynamic-key loop
uses unknown keys and does not gain cached fields; the
cause of its small Release slowdown has not been isolated.
Other small shifts, including unrelated GI/array controls, should not be
attributed to the new field stores without further evidence.

## Fresh runtime comparison

Five rounds rotate SQGI Release, SQGI PGO/LTO, Node 18.19.1, GJS 1.80.2 and
CPython 3.12.2. All equivalent checksums match. Times are ns per iteration.

| Kernel | SQGI Release | SQGI PGO | Node | GJS | Python | PGO/Node time |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.861 | 3.846 | 4.109 | 3.925 | 92.181 | 0.94× |
| branch_call | 3.167 | 3.091 | 2.909 | 2.972 | 67.852 | 1.06× |
| float_call | 6.889 | 6.846 | 1.552 | 1.563 | 41.919 | 4.41× |
| numeric_loop | 6.029 | 5.933 | 5.516 | 5.554 | 61.384 | 1.08× |
| vector | 62.137 | 62.262 | 188.680 | 151.738 | 2015.098 | 0.33× |
| dynamic_member | 224.238 | 207.950 | 33.050 | 22.200 | 304.094 | 6.29× |
| dynamic_key_get_set | 20.887 | 13.825 | 21.769 | 11.925 | 125.137 | 0.64× |
| object_member_write_fallback | 17.137 | 15.925 | 4.067 | 7.138 | 218.411 | 3.92× |
| array_append | 34.737 | 28.237 | 12.623 | 6.112 | 73.520 | 2.24× |
| array_write | 6.012 | 4.525 | 1.602 | 1.912 | 50.101 | 2.82× |
| array_read | 1.216 | 1.191 | 0.672 | 0.897 | 22.534 | 1.77× |
| array_float | 1.750 | 1.749 | 0.562 | 0.789 | 20.779 | 3.11× |
| math_intrinsic | 26.075 | 26.212 | 14.464 | 3.075 | 176.382 | 1.81× |
| math_variable | 46.450 | 46.150 | 55.618 | 33.125 | 165.216 | 0.83× |
| matrix | 61.863 | 46.812 | 7.311 | 14.950 | 362.622 | 6.40× |

Lower time ratios are better. SQGI still trails Node on this object-write
kernel. Vec3 retains its roughly 3× advantage; dynamic methods and matrix
remain substantially behind Node.

## Independent workloads and limits

Both suites below were excluded from PGO training. Every workload matches
an interpreter reference and Node exactly. Five rounds rotate all four
SQGI builds plus Node, using 200,000 iterations, five warmups and CPU 0.
All times are ns per iteration.

The [existing member suite](../../test/bench_member_workloads.nut) retains
its original algorithms: 97 varied records, dynamic keys, rotating buffers
of different widths, and numeric calibration arrays.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 177.80 → 177.80 | 163.51 → 161.28 | 1.01× | 25.26 |
| class_events_97 | 143.25 → 144.93 | 127.82 → 122.13 | 1.05× | 22.08 |
| buffers_7 | 70.52 → 16.14 | 53.98 → 13.14 | 4.11× | 4.91 |
| buffers_31 | 71.17 → 16.46 | 52.96 → 13.43 | 3.94× | 4.90 |
| calibrate_17 | 15.93 → 15.91 | 15.89 → 15.90 | 1.00× | 3.20 |
| calibrate_67 | 15.93 → 15.92 | 15.91 → 15.93 | 1.00× | 3.15 |

The new [owner suite](../../test/bench_member_owners.nut) varies displaced
array-owner populations and mixes integer and double member stores. It
exercises single-owner self-assignment, a small reused set and populations
far beyond the borrowed cache’s capacity.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| table_owners_1 | 65.03 → 11.17 | 40.61 → 10.10 | 4.02× | 4.47 |
| table_owners_2 | 72.72 → 12.27 | 41.87 → 10.51 | 3.99× | 4.53 |
| table_owners_5 | 70.92 → 20.17 | 42.16 → 16.83 | 2.51× | 4.36 |
| table_owners_19 | 74.44 → 29.74 | 49.79 → 26.37 | 1.89× | 4.98 |
| table_owners_257 | 239.45 → 194.09 | 203.80 → 174.39 | 1.17× | 4.50 |
| class_owners_1 | 60.08 → 11.27 | 46.00 → 10.32 | 4.46× | 4.76 |
| class_owners_2 | 64.71 → 12.27 | 48.05 → 10.58 | 4.54× | 4.37 |
| class_owners_5 | 61.19 → 20.58 | 48.73 → 16.90 | 2.88× | 4.39 |
| class_owners_19 | 67.26 → 30.58 | 57.20 → 26.00 | 2.20× | 4.42 |
| class_owners_257 | 232.80 → 191.80 | 194.56 → 192.77 | 1.01× | 4.98 |

The benefit extends beyond the original benchmark and beyond two owners,
but is not uniform. At 257 owners the complete rollback log dominates:
Release improves modestly, the PGO table case improves modestly, and the
PGO class case is effectively flat. Record workloads with changing receivers
and dynamic keys do not receive the stable-field optimization. Large-owner
log indexing and logged array-element stores remain general next targets.

## Validation and reproduction

- 96/96 tests pass in Release, ASan/UBSan with leak checking, instrumented
  PGO training and the final PGO/LTO build.
- 81/81 pass with JIT disabled; 15/15 AArch64 core executables pass under QEMU.
- New tests cover 200 interpreter/native workload configurations, native
  success and late-failure routes, aliases, owner populations 1–257, mixed
  numeric assignment values, stale class release hooks, table rehash/delete,
  zero-trip missing fields, 24-field overflow, raw weakrefs and failed log
  allocation. Existing delegate, guard, ownership and rollback suites pass.
- The external-download packaging test is excluded.

Builds use GCC 13.3.0, Release -O3 -DNDEBUG -g, int64/double, JIT enabled and
prefix /usr. Fast-math is disabled. Both PGO baselines use LTO. The new PGO
directory was trained after implementation and tests were final: the complete
96-test suite, original 15 kernels at 20,000 iterations/two warmups, four
execution kernels at 20,000 iterations, and seven Vec3 variants at 20,000
iterations/two warmups. All 55 core translation units and CLI have profiles;
there are no core/CLI missing profiles or coverage mismatches. Unused bundled
Squirrel targets have the expected missing-profile warnings.

The final timed runs had no concurrent builds/tests from this task. CPU
affinity does not reserve the physical core or exclude other host activity.
Sample variance and raw data are retained.

Run the independent suites with the checked runner:

    python3 tools/run_member_benchmarks.py --sqgi before=/path/to/before/sqgi --sqgi after=/path/to/after/sqgi --runs 5 --iterations 200000 --cpu 0 --output members.json
    python3 tools/run_member_benchmarks.py --suite owners --sqgi before=/path/to/before/sqgi --sqgi after=/path/to/after/sqgi --runs 5 --iterations 200000 --cpu 0 --output owners.json

The [evidence JSON](object-store-optimization-2026-09-08.json) contains all
samples, checksums, binary/source hashes, build settings, profile reports,
hardware counters, exact profiling/comparison scripts and test/training logs.
Builds and raw perf data are in /tmp/sqgi-object-stores-20260908.ftC3jD.

Source changes are in the workspace. No installation, commit or push was
performed in this pass.
