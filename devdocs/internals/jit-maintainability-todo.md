# JIT Maintainability TODO

This is the working checklist for keeping the SQGI/Squirrel JIT useful without
letting it become a hard-to-prune second VM. The interpreter remains the source
of truth. Native paths must be benchmark-owned, tested, conservative, and easy
to delete when they stop paying rent.

Status keys:

- `[x]` completed in the current maintainability pass.
- `[ ]` backlog item.
- `[gate]` rule that every future JIT change must satisfy.

## September 8 execution improvements

The [dynamic-member pass](dynamic-member-optimization-2026-09-08.md) adds:

- [x] Reuse the bounded field plan for groups of member reads and writes in
  eligible mutating functions, retaining fresh addresses and existing guards.
- [x] Accept guarded borrowed array/string parameters in native field stores.
- [x] Place x64 undo logs in the native frame and construct only used entries;
  larger logs retain the checked heap growth and rollback path.
- [x] Test poisoned/reused log storage, growth, aliased receivers, changed
  layouts/types and failures after multiple owning writes.
- [x] Six independent mutating-call workloads with Node ports, excluded from
  PGO training. The report includes gains and the Release class-update regression.
- [ ] Compile loops across general mutating calls and changing object locals.
  This needs an explicit ownership/effect contract; the dynamic-member outer
  loop still executes in the interpreter.

The [floating-call pass](float-call-optimization-2026-09-08.md) adds:

- [x] Shared floating-copy names with liveness-based removal of dead native
  temporaries; live caller values remain independent across inlined calls.
- [x] Destructive scalar arithmetic only when all names of its input are dead
  or overwritten, retaining double precision and operand order.
- [x] A separate x64 loop register convention with parallel backedge copies,
  ordinary memory exits, and conservative rejection of side entries/exits.
- [x] Executable register permutation tests and interpreter comparisons for
  register pressure, helpers, branches, guards and exceptional floating values.
- [x] Seven independent floating workloads with Node ports, excluded from PGO
  training. The report records remaining gaps as well as improvements.
- [ ] General floating register allocation across arbitrary control flow,
  invariant constant residency and integer temporary coalescing remain separate
  work. AArch64 retains its existing lowering.

The [object-store pass](object-store-optimization-2026-09-08.md) adds:

- [x] A separate bounded field/key plan shared by whole-function and loop x64
  lowering, with fresh field addresses on each native invocation.
- [x] Immediate heap stores with a small borrowed cache of owners already
  retained by rollback; cache misses retain the complete write-log behavior.
- [x] Literal-key flow through branches and backedges for guard placement.
- [x] Tests for alias visibility, type changes, float/integer register reuse,
  allocation failure, release hooks, rehashing and cache capacity overflow.
- [x] Independent owner populations beyond the cache size, with interpreter
  and Node checksums, excluded from PGO training.
- [ ] Broader ownership/deoptimization work and large displaced-owner log
  indexing remain separate optimizations. The new native stores target x64;
  AArch64 retains its existing lowering.

The [member-access pass](member-optimization-2026-09-08.md) follows up with:

- [x] Shared borrowed slot lookup for existing table/instance fields, avoiding
  duplicate native-store lookups while retaining displaced owners for rollback.
- [x] Table cache invalidation based on layout changes; cached reads still
  fetch the current value and validate callable identity.
- [x] Built-in guard placement based on possible writes to the guarded key;
  unknown keys, structural writes and callback-capable operations stay conservative.
- [x] Interpreter fast paths for indexed arrays, existing fields and integer
  remainder, with error propagation and dynamic-divisor JIT regressions tested.
- [x] Independent record/layout/buffer-size workloads excluded from PGO training.

The subsequent [Vec3 implementation](vec3-implementation-2026-09-08.md) adds:

- [x] Shared x64 numeric array stores and whole-function borrowed array-member reads.
- [x] Native implicit-null returns for x64 mutating methods.
- [x] A separate, bounded object inlining pass that emits ordinary scalar
  bytecode for the existing x64 and AArch64 backends.
- [x] Scalar replacement of closed numeric object graphs, with method/class/root
  guards, stable loop aliases, parallel backedge copies and replay-safe failure.
- [x] Native-route assertions for the original Vec3 source and regressions for
  mutation, GC, ownership, bounds, escapes, defaults and changing aliases.
- [x] AArch64 root-identity guards and retained embedded weak references for
  both whole functions and loops; conservative instance root fallback.
- [ ] General object calls, escaping-object materialization and branched method
  inlining remain separate work. The field-backed Vec3 variants still fall back.
- [ ] Investigate the measured small regressions in matrix, array append and
  object member writes before claiming an improvement across all workloads.

See [implementation, measurements and limits](execution-improvements-2026-09-08.md).

- [x] Lower positive constant signed division/remainder on x64; keep compact
  division in write-heavy loops where the longer sequence regresses timings.
- [x] Cache floating intermediates across eligible scalar operations; spill at
  helpers/control-flow joins and test raw double bits and ABI boundaries.
- [x] Support mixed int64/double arithmetic without changing source slot tags.
- [x] Hoist bounded homogeneous-array guards in regions without heap effects.
- [x] Scalar-replace small nonescaping numeric arrays within one block.
- [x] Support guarded array/string member transfers and numeric instance fields.
- [x] Retain distinct displaced owners once per member/epoch, and accelerate
  repeated scalar-array logging with exact identity/index membership.
- [x] Propagate compatible bytecode constants across forward joins and prevent
  whole-function JIT loop headers from reloading modified parameters.
- [x] Cache immutable GI call plans with independent invocation buffers.
- [x] Add opt-in PGO/LTO configuration, training instructions and build comparison tooling.
- [ ] Precise guard resumption with materialization maps and packed numeric
  array storage remain separate architecture projects; their prerequisites and
  measurement gates are recorded in the report.

The x64 object-transfer path supersedes the historical object-write fallback
entry below. AArch64 retains its existing lowering, with shared value/logging
and optimizer changes checked under emulation.

## Current Pass

- [x] Name AArch64 backend limits instead of scattering literal `512`, `513`,
  guard-relocation, exit-relocation, and no-result-slot values through the
  compiler.
- [x] Centralize whole-prototype prepared-call state reset in
  `SQJitA64ProtoPreparedCallState`.
- [x] Centralize loop-region prepared-call state reset in
  `SQJitA64CommonPreparedCallState`, without reintroducing loop append state.
- [x] Centralize whole-prototype slot observation invalidation behind one local
  helper.
- [x] Centralize loop-region slot observation invalidation behind one local
  helper while preserving existing `dirty_slot` and `entry_loaded` behavior.
- [x] Add reusable median benchmark tooling:
  `tools/run_jit_median_benchmarks.py`.
- [x] Add reusable demo benchmark median tooling:
  `tools/run_sqgi_demo_median_benchmarks.py`.
- [x] Add reusable rejection-summary tooling:
  `tools/run_jit_reject_summary.py`.
- [x] Expand `test_sqjit_aarch64_emit.cpp` coverage for memory, ALU, float,
  comparison, branch rejection, and helper-call branch emission.
- [x] Add focused benchmark kernels for dynamic-key get/set, object-valued
  member-write fallback, array append, array write, and math intrinsics to
  `test/test_jit_perf_correctness.nut`.
- [x] Record the current local AArch64 median benchmark baseline below.
- [x] Keep the recent AArch64 pruning rule explicit: loop-region
  `array.push/append` falls back unless a benchmark later proves a safe win.
- [x] Split the AArch64 backend into a small root translation unit, a private
  backend header, and helper/whole-proto/loop compiler implementation
  fragments.
- [x] Update the design doc to describe the current AArch64 layout and
  `SQGI_JIT_TRACE=stats` workflow.
- [x] Replace parallel AArch64 slot-tracking arrays with
  `SQJitA64SlotState`, including named transition methods for slot kind,
  pointer freshness, and constant values, with dirty and entry-loaded flags kept
  in the state object.
- [x] Add debug-only consistency checks for slot-kind transitions and auxiliary
  observation fields.
- [x] Promote rejection diagnostics into stable runtime categories via
  `SQJitRejectCategory` and teach `tools/run_jit_reject_summary.py` to consume
  those category rows.
- [x] Add an AArch64 backend regression test for invalid stack-slot operands
  reaching the backend and falling back safely.
- [x] Add helper-backed object lifetime/refcount stress coverage.
- [x] Complete the prepared-state, observed-shape, duplicated-emitter, and
  x64/AArch64 pruning-boundary reviews below.

## September 2026 architecture refactor

Steps 1–2 of the [architecture review](jit-architecture-review-2026-09-07.md)
are implemented. See the [first-stage report](jit-refactor-stage1-2026-09-07.md)
for the module map, tests and measurements.

The [follow-up bytecode/JIT exploration](bytecode-jit-exploration-2026-09-07.md)
records a reproduced x86 boolean-tag bug, native-coverage gaps, write-log scaling
experiments, and an implementation sequence for the next stages. The
[implementation report](bytecode-jit-implementation-2026-09-07.md) records the
completed optimization pass, native coverage, tests and performance tradeoffs.

- [x] Return typed compilation results, including backend, rejection category,
  instruction position and retryability; remove global transient-failure state.
- [x] Assert native frame/direct/loop execution, guard fallback, rollback,
  debugger behavior and backoff through internal route snapshots.
- [x] Extract x86 encoding/ABI, runtime helpers, policy, diagnostics and C++ stubs.
- [x] Give each shared state its own context and each prototype typed artifact owners.
- [x] Run x86, Win64 ABI and AArch64 encoder tests on the development host.
- [ ] Run the new runtime contracts natively on AArch64 and Windows.
- [x] Share opcode operands, effects, CFG liveness and loop-written facts.
- [x] Share bounded rollback logging, preserving old values, weak references and structural boundaries.
- [x] Add conservative bytecode folding, branch pruning and dead scalar temporary removal.
- [x] Share scalar state and reject incompatible live type joins; preserve boolean tags and branch constants.
- [x] Share guarded math identities/evaluators and add x86 conversion/math lowering.
- [x] Emit x86 scalar conversions and direct audited math calls; hoist invariant checks in pure regions. See the [follow-up measurements](jit-math-optimization-2026-09-07.md).
- [x] Check numeric delegate identity on AArch64 and reject bound conversion receivers.
- [x] Share x86 checked array loads, including dynamic floats and nested arrays; compile temporary string-key table loops. See the [memory optimization report](jit-memory-optimization-2026-09-07.md).
- [x] Deduplicate scalar member undo records and preserve raw weakrefs in table/instance rollback.
- [x] Analyze bounded scalar leaf callees with bytecode data flow and inline them in x86 callers/loops, with weak prototype guards and private locals. See the [leaf-call report](jit-leaf-call-optimization-2026-09-07.md).
- [x] Standardize int64/double across runtime and public SDK, update AArch64 floating lowering, and measure equivalent warmed Node.js 18 kernels. See the [numeric64 and Node comparison](numeric64-and-node-comparison-2026-09-07.md).
- [x] Size x86 frames from actual slots and assign its three value registers by weighted use.
- [x] Allocate existing member caches sparsely when smaller and reuse them for intrinsic guards.
- [x] Execute ten focused AArch64 core tests under QEMU; real-hardware validation remains open above.
- [ ] Continue reducing duplicated lowering and add precise guard-site/compile-cost telemetry.
- [ ] Revisit dynamic object specialization and full register allocation only with measured evidence.

## Required Gates

- [gate] Every native fast path must have a named benchmark, or it should be
  deleted, rejected earlier, or marked as speculative with a removal date.
- [gate] Every mutating native path must document whether it needs write-log
  rollback, and tests must cover guard failure after the mutation is prepared.
- [gate] Every helper-call path must preserve a valid resume IP and stack state
  before code that can fail, allocate, throw, or call back into Squirrel.
- [gate] Every object-valued stack write must use normal `SQObjectPtr`
  assignment semantics or prove the destination is fresh/scalar.
- [gate] Every benchmark report must use medians from at least five runs unless
  it is explicitly labeled as a smoke run.
- [gate] If a path is removed for weak performance, its fallback behavior must
  have a correctness test name that says it is expected to fall back.

## Capability Ownership Matrix

Fill this matrix before adding more optimizations. A row without a benchmark or
test is a deletion candidate.

| Area | Whole proto | Loop region | Benchmark owner | Correctness owner | Notes |
| --- | --- | --- | --- | --- | --- |
| Integer arithmetic | supported | supported | `numeric_loop`, `numeric` | `test_jit_fastpath.nut` | Keep direct emitters small. |
| Float arithmetic | supported | supported | `matrix`, `vector` | `test_jit_math.nut` | Preserve conversion guards. |
| Direct closure calls | supported for selected leaf shapes | supported for selected leaf shapes | `direct_call`, `branch_call`, `float_call`, `function-call` | `test_sqjit_leaf.cpp`, `test_jit_fastpath.nut` | x86 uses bounded scalar analysis, weak prototype guards and private locals; general calls fall back. |
| Array reads | supported | supported | `vector`, `array` | `test_jit_fastpath.nut` | Shape guards must stay simple. |
| Array writes | supported | supported | `array`, focused write kernels | `test_jit_fastpath.nut` | Requires write-log rollback. |
| Array append/push | supported for selected whole-proto/fresh-array shapes | fallback | `array`, `array_push_sum` | `test_jit_correctness.nut` | Do not restore loop append without benchmark proof. |
| Table/member reads | supported for observed shapes | supported for observed shapes | `dynamic_member`, `table` | `test_jit_fastpath.nut` | Dynamic-key helpers are parity-sensitive. |
| Table/member writes | integer/float/bool only | integer/float/bool only | focused write kernels | `test_jit_correctness.nut` | Object-valued writes currently fall back. |
| Math intrinsics | supported | supported | math benchmark cases | `test_jit_math.nut` | Keep native-closure guards explicit. |
| Constructors/classes | selected shapes | fallback/limited | focused constructor benchmarks | `test_jit_correctness.nut` | Treat as high risk. |
| Closed numeric object kernels | bounded inlining and scalar replacement | one counted loop inside a whole function | `vector`, `bench_vec3.nut` | `test_sqjit_object_plan.cpp` | Shared scalar bytecode; no escaping objects or unanalyzed effects. |
| GI/native calls | mostly fallback | mostly fallback | `glib-clock` | existing GI tests | Do not optimize unless boundary cost moves. |

## Code Organization TODO

- [x] Split `sqjit_backend_aarch64.cpp` after the behavior settles into a
  root owner plus included implementation fragments:
  `sqjit_backend_aarch64_helpers.inc`,
  `sqjit_backend_aarch64_compile_proto.inc`, and
  `sqjit_backend_aarch64_compile_loop.inc`. This keeps static helper linkage
  local while making the backend reviewable in separate files.
- [x] Move common AArch64 constants and small state structs into
  `sqjit_backend_aarch64_private.h`.
- [x] Keep `sqjit_backend_aarch64_emit.cpp` boring and heavily tested. The
  emitter should know encodings, not Squirrel semantics.
- [x] Avoid a generic IR until the current backend has a smaller, cleaner
  surface. Premature IR would hide complexity rather than remove it.

## Slot-State TODO

- [x] Introduce shared prepared-call state reset helpers.
- [x] Introduce local slot-observation invalidation helpers in both AArch64
  compilers.
- [x] Replace the parallel slot arrays with an explicit slot-state object:
  kind, stack object register, observed array pointer, observed object pointer,
  const-known flag, dirty flag, and entry-loaded flag.
- [x] Make all slot-kind transitions go through methods such as
  `MarkInt`, `MarkFloat`, `MarkStackObject`, `MarkArrayPtr`, `Copy`, and
  `MarkUnknown`.
- [x] Add debug-only assertions that a slot's kind and auxiliary observation
  fields agree after every transition.
- [x] Remove local ad hoc slot-transition checks once slot-state methods carry
  the bounds and no-result-slot rules. Opcode operand validation stays local at
  decode/emit sites because those checks reject malformed bytecode before the
  slot object should be touched.

## Fallback and Diagnostics TODO

- [x] Promote fallback reasons into a stable enum or table so runtime tests can
  assert them without string matching. The VM still records detailed human
  strings, but `SQJitRejectCategory` is the stable runtime contract exposed in
  `SQGI_JIT_TRACE=stats`.
- [x] Add a `--jit-stats` equivalent diagnostic output with compile attempts,
  compile successes, rejection reasons, native entries, native returns, and
  bailouts. Current interface: `SQGI_JIT_TRACE=stats`.
- [x] Add a small tool that runs a script with `SQGI_JIT_TRACE=stats` and
  reports the top rejection reasons:
  `tools/run_jit_reject_summary.py`.
- [x] Track fast-path value in benchmark output with off/on medians and
  speedups so pruning decisions are visible.

## Benchmark TODO

- [x] Add repeat/median benchmark wrapper for `test_jit_perf_correctness.nut`.
- [x] Add a median wrapper for `demo/benchmarks/sqgi_bench.nut`.
- [x] Add focused benchmark modes for individual contentious paths:
  dynamic-key get/set, object-member write fallback, array append, array write,
  direct call, and math intrinsics.
- [x] Store the current baseline table in docs after this pruning pass with
  date, machine, build flags, runs, and medians.
- [gate] Treat paths below roughly 1.05x median speedup as suspect unless they
  are required to unlock a larger benchmark win.

## Latest Local Baseline

Collected on 2026-06-07 on the local AArch64 Linux development machine at base
commit `d8f39df` plus the current dirty-tree JIT cleanup, multi-file split,
slot-state migration, and pruning review, using `build-jit-release` with JIT
enabled in the build and `SQGI_JIT_THRESHOLD=1`.

`tools/run_jit_median_benchmarks.py --runs 9 8000`:

| Benchmark | Off | On | Speedup |
| --- | ---: | ---: | ---: |
| `array_append` | 0.210500 us | 0.068125 us | 3.090x |
| `array_write` | 0.099875 us | 0.050500 us | 1.978x |
| `direct_call` | 0.237137 us | 0.056194 us | 4.220x |
| `dynamic_key_get_set` | 0.204000 us | 0.200250 us | 1.019x |
| `dynamic_member` | 0.815625 us | 0.817875 us | 0.997x |
| `math_intrinsic` | 0.943875 us | 0.216750 us | 4.355x |
| `matrix` | 1.392000 us | 0.280500 us | 4.963x |
| `numeric_loop` | 0.104687 us | 0.029169 us | 3.589x |
| `object_member_write_fallback` | 0.640125 us | 0.637125 us | 1.005x |
| `vector` | 7.990500 us | 4.845625 us | 1.649x |

Focused `array_write` is back above water after deduplicating AArch64 array
write-log entries by target/index. `dynamic_member` and
`object_member_write_fallback` are still effectively parity. Keep member/table
paths frozen/suspect and do not add more complexity without proving a larger
benchmark win.

`tools/run_sqgi_demo_median_benchmarks.py --runs 9 --scale 3`:

| Benchmark | Off | On | Speedup |
| --- | ---: | ---: | ---: |
| `array` | 150.888 ms | 107.198 ms | 1.408x |
| `empty-loop` | 198.050 ms | 18.527 ms | 10.690x |
| `function-call` | 186.984 ms | 33.864 ms | 5.522x |
| `glib-clock` | 874.572 ms | 879.410 ms | 0.994x |
| `numeric` | 234.622 ms | 36.124 ms | 6.495x |
| `numeric-kernel` | 234.260 ms | 37.406 ms | 6.263x |
| `string` | 20.925 ms | 20.554 ms | 1.018x |
| `table` | 108.050 ms | 104.418 ms | 1.035x |

## Test TODO

- [x] Add regression tests for invalid stack-slot operands reaching the AArch64
  backend and falling back safely.
- [x] Add write-log rollback tests where a guard fails after a logged mutation.
- [x] Add object lifetime/refcount stress tests for helper-backed paths.
- [x] Add tests that force fallback for intentionally unsupported paths:
  object-valued member writes, dynamic stack-object member writes, and
  loop-region append/push.
- [x] Expand `test_sqjit_aarch64_emit.cpp` with every encoding helper used by
  the backend, especially branches, load/store forms, and float operations.

## Pruning TODO

- [x] Review every helper with `_logged` in the name. Keep only helpers with a
  current native caller and a benchmark/test owner.
- [x] Review every `prepared_*` array. If a prepared state is only used to reject
  later, reject at the preparation opcode and delete the state.
- [x] Review every observed-shape fast path. If the guard is complex and the
  benchmark is near parity, delete the native path and document the fallback.
- [x] Review duplicated whole-proto and loop-region emitters. Merge only after
  slot-state methods are explicit enough to avoid accidental behavior changes.
- [x] Keep x64-disabled code out of AArch64 pruning decisions unless the build
  actually compiles it on the target platform.

## Final Pruning Review

The current pass found no additional AArch64 native fast path that could be
deleted without either losing a benchmark-owned win, removing correctness-owned
rollback/refcount coverage, or deleting code shared with larger winning kernels.
The previous loop-region `array.push/append` pruning remains the active removal:
loop append falls back until a benchmark proves that reintroducing it is worth
the complexity.

Prepared-call state review:

| State | Producer | Consumer | Decision |
| --- | --- | --- | --- |
| `array_len_base` | `PREPCALL/PREPCALLK` on `len` | `CALL` emits array length | Keep; owned by `array`, `table`, and len-hoist behavior. |
| `array_append_base` | whole-proto `PREPCALL/PREPCALLK` on append/push | whole-proto `CALL` emits selected fresh-array append | Keep only in whole-proto; loop append state remains deleted/fallback. |
| `direct_closure` | observed closure member/slot | `CALL` emits direct leaf call | Keep; owned by `direct_call` and `function-call`. |
| `klass` | observed constructor receiver | whole-proto `CALL` emits selected constructor fast paths | Keep; correctness-owned by constructor and return-shape tests. |
| `math_intrinsic`/`math_nargs` | observed math native closure | `CALL` emits intrinsic | Keep; owned by `math_intrinsic`. |
| `number_conversion`/`number_conversion_base` | numeric receiver member lookup | `CALL` emits `tofloat`/`tointeger` conversion | Keep; small state, direct consumer, correctness-owned by math/conversion tests. |

Observed-shape review:

| Path | Current value | Decision |
| --- | --- | --- |
| Array reads and writes | Focused `array_write`, `matrix`, `vector`, and demo `array` stay clear wins. | Keep; write-log dedupe owns repeated scalar writes. |
| Whole-proto fresh-array append | Focused `array_append` is a strong win. | Keep; loop-region append remains fallback. |
| Direct closure calls | Strong focused/demo wins. | Keep. |
| Math intrinsics | Strong focused win. | Keep. |
| Table/member reads and dynamic-key helpers | Near parity in focused/demo table cases, but shared with observed-shape correctness and direct-call preparation. | Keep frozen as suspect; no new expansion without >1.05x median proof. |
| Member/table writes | Scalar writes are guarded by write-log rollback tests; object-valued writes fall back. | Keep scalar paths; keep object-valued fallback. |
| Constructor/class fast paths | High-risk but correctness-owned and not used in loop-region expansion. | Keep selected whole-proto shapes only. |

Whole-proto and loop-region emitter duplication review:

- The two compiler fragments still duplicate some emitter names, but their
  state contracts differ enough that a merge would be riskier than useful in
  this pass.
- Loop-region emitters own dirty-slot writeback, `entry_loaded`, body-entered
  tracking, loop guard relocation, len-hoist state, and sampled member shapes.
- Whole-proto emitters own constructor specialization, fresh array/table
  tracking, return-shape recording, and complete function epilogues.
- The maintainability win completed here is shared slot/prepared state and file
  layout, not a forced generic emitter abstraction.

Platform pruning boundary:

- This pass only changes AArch64 code and shared diagnostics/tests needed to
  exercise it.
- The disabled x64 backend code in `sqjit.cpp` was not used as a pruning target
  because it is not compiled on the current AArch64 JIT platform.

## Done Criteria

A maintainability pass is done only when:

- the code compiles in `build-jit-release`;
- `ctest --test-dir build-jit-release -L jit --output-on-failure` passes;
- any touched performance-sensitive path has at least one median benchmark run;
- `git diff --check` is clean;
- this TODO file is updated with what moved from backlog to completed.
