# Member-access and matrix optimization — September 8, 2026

Profiling the next weak kernels led to shared runtime changes: fewer member
lookups and temporary reference-count operations, useful field-location caches
across value updates, cheaper interpreter indexing/remainder, and more precise
built-in guard placement. The original benchmark formulas are unchanged.

With fresh PGO/LTO, object-member writes improve **1.57×**, matrix **1.24×**,
and dynamic-member work **1.09×**. The broader dynamic-key kernel improves
**1.17×**. These improvements reduce the gap to Node; they do not close it.

## Before and after

Five rounds rotate the preserved before/after Release and PGO/LTO binaries.
Each invocation uses a fresh process, five warmups, CPU 0 affinity and JIT
threshold 1. Both suites run at 80,000 base iterations; the existing scalar
kernel multiplier remains 20×. All 19 checksums match. Times are ns/iteration.

| Kernel | Release before | Release after | PGO before | PGO after | PGO speedup |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.863 | 3.769 | 3.876 | 3.780 | 1.03× |
| branch_call | 3.075 | 3.039 | 3.026 | 3.084 | 0.98× |
| float_call | 6.746 | 6.802 | 6.919 | 6.846 | 1.01× |
| numeric_loop | 5.802 | 6.046 | 6.056 | 5.965 | 1.02× |
| vector | 59.463 | 62.050 | 60.775 | 62.100 | 0.98× |
| dynamic_member | 274.462 | 226.362 | 248.000 | 227.587 | 1.09× |
| dynamic_key_get_set | 25.700 | 19.813 | 16.213 | 13.888 | 1.17× |
| object_member_write_fallback | 106.438 | 70.100 | 81.863 | 52.237 | 1.57× |
| array_append | 37.637 | 35.075 | 30.988 | 28.700 | 1.08× |
| array_write | 5.938 | 6.613 | 4.450 | 4.450 | 1.00× |
| array_read | 1.191 | 1.186 | 1.191 | 1.187 | 1.00× |
| array_float | 1.711 | 1.750 | 1.754 | 1.716 | 1.02× |
| math_intrinsic | 26.125 | 25.562 | 26.062 | 26.062 | 1.00× |
| math_variable | 47.100 | 46.062 | 46.025 | 46.113 | 1.00× |
| matrix | 75.900 | 58.787 | 56.825 | 45.762 | 1.24× |
| temporary_arrays | 7.125 | 7.175 | 7.075 | 7.287 | 0.97× |
| gi_scalar | 482.625 | 492.275 | 474.513 | 487.387 | 0.97× |
| gi_clock | 251.475 | 246.762 | 221.025 | 223.775 | 0.99× |
| array_guards | 1.087 | 1.075 | 1.075 | 1.100 | 0.98× |

An apparent Release array-write regression in the short runs had a wide sample
spread. Five further rounds at **5,000,000 iterations** measured 6.135 → 6.030 ns in Release and 4.670 → 4.498 ns with PGO.
That did not reproduce the regression. Small differences around a few percent
are not treated as reliable gains: unchanged scalar/Vec3 controls also vary.
Earlier exploratory runs overlapped other user CPU workloads; the final timed
runs had no concurrent builds or tests from this task. Affinity does not reserve
a physical core or prevent other host activity.

## Fresh comparison with Node

A separate five-round run rotates SQGI Release, SQGI PGO/LTO, Node 18.19.1,
GJS 1.80.2 and CPython 3.12.2. All equivalent checksums match. Selected results:

| Kernel | SQGI Release ns | SQGI PGO ns | Node ns | PGO/Node time |
| --- | ---: | ---: | ---: | ---: |
| vector | 60.687 | 60.950 | 185.169 | 0.33× |
| dynamic_member | 218.488 | 229.325 | 32.837 | 6.98× |
| dynamic_key_get_set | 18.975 | 13.938 | 21.328 | 0.65× |
| object_member_write_fallback | 71.063 | 51.925 | 3.923 | 13.24× |
| array_append | 33.962 | 29.263 | 12.770 | 2.29× |
| matrix | 58.675 | 47.813 | 7.351 | 6.50× |

Lower time ratios are better. Object-member writes remain about **13×** slower
and matrix about **6.5×** slower than Node. Vec3 retains its roughly **3×**
advantage over Node; dynamic-key updates also remain faster. PGO is not uniformly
better than ordinary Release, particularly for the interpreted dynamic-member
case. The evidence includes every Node/GJS/Python row.

## Independent workloads and generality

The new [member workloads](../../test/bench_member_workloads.nut) and
[JavaScript port](../../demo/benchmarks/node_member_workloads.js) were written
after the runtime changes and **excluded from PGO training**. They use 97 table
or class records, changing table insertion orders and unrelated fields, dynamic
event keys, 13-element sample histories, 7/31-element rotating buffers and
17/67-element numeric arrays. Their names and dimensions are not referenced
by the optimizer. All six match an interpreter reference and Node exactly.

Five rounds, 200,000 iterations and five warmups:

| Workload | Release before → after ns | PGO before → after ns | PGO speedup | Node ns |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 192.56 → 170.94 | 161.81 → 151.77 | 1.07× | 24.99 |
| class_events_97 | 161.45 → 137.65 | 139.78 → 117.94 | 1.19× | 23.70 |
| buffers_7 | 101.92 → 68.84 | 77.66 → 50.37 | 1.54× | 4.90 |
| buffers_31 | 103.36 → 67.40 | 76.13 → 50.52 | 1.51× | 4.82 |
| calibrate_17 | 17.56 → 15.28 | 15.41 → 15.90 | 0.97× | 3.15 |
| calibrate_67 | 17.88 → 15.27 | 15.44 → 15.73 | 0.98× | 3.08 |

Record and buffer workloads improve with both build configurations. Numeric
calibration improves in ordinary Release but is roughly flat/slightly slower
with PGO. This is evidence for reuse across these workload variations, not
a claim about every application. Startup, GUI/GI dispatch, large object graphs
and end-to-end application performance are not measured here.

## Changes and safety boundaries

1. **Borrow an existing field once.** `SQTable::GetRawSlot` and the shared
   `sq_member_raw_slot` return existing table/instance storage without boxing a
   copied value. Native stores retain the old value in the undo log, then assign
   through that same slot. No raw address survives a structural mutation or
   callback. Weakref tags remain raw for guards/rollback. Missing fields still
   take the interpreter’s delegation/metamethod path.
2. **Invalidate field locations on layout changes.** Replacing an existing
   value with `Set` or `NewSlot` leaves the cached location valid. Insertion,
   deletion, rehash via those operations and clear invalidate it. Every cache
   hit reads the current value; callable identity is still checked.
3. **Use built-in write effects.** The x64 call lowerer can hoist numeric
   conversion/string-length identity checks when all stores provably use other
   keys. It follows definitions within a basic block and retains site checks
   for unknown keys or joins. Structural operations, outer effects and possible
   callbacks stay conservative. Checks still run on each native entry, and
   aliased writes to the actual default delegates force the correct fallback.
   Native math lookup avoids replacing cache owners when a hoisted delegate
   guard depends on the absence of release-hook callbacks.
4. **Inline ordinary interpreter operations.** Integer-index array reads and
   existing array/table/instance writes avoid general VM lookup dispatch.
   Integer remainder avoids the generic arithmetic helper, checks zero and
   handles `INT64_MIN % -1` safely. Other operand types use the normal path.
5. **Repair remainder correctness.** The regression tests exposed an ignored
   interpreter arithmetic-error result and an x64 variable-divisor bug:
   materializing the divisor could overwrite the dividend register. Errors now
   reach `catch`, and both function/loop lowerers reload the dividend afterwards.
   Signed, full-width, mixed-float, compound and overloaded cases are covered.

The shared interpreter/cache changes apply to both architectures. Guard placement
and native helper changes in this pass target x86-64. ARM checks establish
correctness under emulation, not ARM performance. No benchmark-specific opcode,
class-name recognition, field layout, array dimension or arithmetic relaxation
was introduced.

## Profiles and remaining costs

Before optimization, object-write time was concentrated in table lookup, member
getter/setter helpers and write-log membership. Matrix spent about 22% of sampled
cycles checking numeric conversion identity. Dynamic-member execution spent most
of its time in the interpreter, with general arithmetic/get/set routines visible.

Fresh `perf stat` measurements use the same before/after PGO executables, 6 million
dynamic-member iterations or 15 million object/matrix iterations, and one warmup.
The counters cover both warmup and measured execution, plus small setup overhead:

| Workload | Retired-instruction reduction | Cycle reduction in this sample |
| --- | ---: | ---: |
| dynamic_member | 20.2% | 13.5% |
| object_member_write_fallback | 27.7% | 34.0% |
| matrix | 17.5% | 14.4% |

The repeated number-conversion guard disappears from the matrix hot profile.
Member-read helpers and write-log bookkeeping remain prominent for object writes;
string-length guards remain at sites when the key proof crosses a branch.
Dynamic members still execute mostly interpreted bytecode: after inlining the
common operations, about 90% of sampled cycles are attributed to `SQVM::Execute`.
Inlining moves attribution, so the instruction/cycle counters are more useful
proof of reduced work than symbol percentages alone.

Further work should focus on guarded field-location reuse in native code,
broader method-call/type feedback, and reducing rollback bookkeeping with a
general ownership/deoptimization design. These are larger architectural changes;
adding closed shapes for these particular kernels would not address them.

## Validation and reproduction

- **95/95** tests in Release, ASan/UBSan with leak checking, and final PGO/LTO.
- **81/81** tests with JIT disabled.
- **14/14** AArch64 core tests under QEMU, plus the final expanded guard test.
- Regression coverage includes cache mutation/rehash/deletion, live/dead weakrefs,
  table/class receivers, bounds, aliases, delegation/metamethods, native-route
  assertions, delegate replacement and undo-log replay after late failure.
- The existing external-download packaging test is excluded.

Builds use GCC 13.3.0, Release `-O3 -DNDEBUG -g`, int64/double, JIT enabled and
prefix `/usr`. LTO/PGO remain opt-in and fast-math is disabled. PGO training used
a fresh directory: the 95-test suite, the original 15 kernels at 20,000 iterations
and two warmups, four execution kernels at 20,000 iterations, and the seven Vec3
variants at 20,000 iterations and two warmups. All 54 core translation units and
CLI have valid profiles, with no coverage mismatch. Unused bundled targets have
no profiles. A final expanded unit test was rebuilt without its obsolete test
profile; the production executable hashes and measured binaries are unchanged.

Tested binaries:

```text
/tmp/sqgi-member-optim-20260908.y27AYv/release/sqgi
/tmp/sqgi-member-optim-20260908.y27AYv/pgo/sqgi
```

Reproduce the build using the [PGO instructions](../../tools/README.md#compiler-optimization-builds).
The [member benchmark runner](../../tools/run_member_benchmarks.py) accepts any
number of `--sqgi NAME=PATH` arguments and checks Node/interpreter results.
The four-build runner, complete perf commands, source/binary hashes, profile
inventory, training/test logs and all timing samples are preserved in the
[evidence JSON](member-optimization-2026-09-08.json). Raw profiles and build
directories remain under the temporary work directory above.
