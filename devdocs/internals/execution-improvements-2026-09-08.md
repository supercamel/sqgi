# Execution improvements — September 8, 2026

Implemented the bounded execution improvements from the performance review.
The existing install-ready `build/` and earlier source changes are preserved.
New builds and raw measurements are under `/tmp/sqgi-execution-20260908.s0zUxK`,
also recorded in `/tmp/sqgi-execution-latest`. The baseline binary was copied
from `build/` before these changes; both versions use int64 and double.

## Implementation and contracts

1. **Constant integer division and remainder.** x64 whole-function, loop and
   inlined-leaf lowering use signed bias/shift for powers of two and reciprocal
   multiplication for other positive constants. Quotients truncate toward zero;
   remainders retain the numerator's sign. The emitter handles the full signed
   64-bit numerator range. Other divisor cases retain existing guards and fallback where unsupported.
   Whole-function/loop literal loading still limits which large constants reach
   native lowering; unsupported literals remain correct through the interpreter.
   Mutation loops retain compact IDIV for remainder: the longer reciprocal
   sequence regressed these helper-heavy workloads. The generator follows the
   signed division algorithm described in Hacker's Delight, chapter 10; its
   unsigned recurrence avoids host overflow and host-specific 128-bit arithmetic.
2. **Floating register retention and mixed arithmetic.** XMM2–5 retain doubles
   within eligible inlined-scalar and virtual-array blocks. Helpers, branches,
   labels and exposed local addresses reconcile memory. XMM0/1 remain scratch;
   Win64's nonvolatile floating registers are untouched. Broad caching regressed
   variable math, so its activation is deliberately narrow. Mixed int64/double
   arithmetic converts into dedicated scratch slots, preserving the integer
   source's value/tag; integer/integer division remains truncating.
3. **GI call preparation.** Each function closure lazily owns an immutable
   argument/signature plan. Cached metadata includes visible input mappings,
   hidden length/callback arguments, output visibility and return ownership.
   Invocations keep independent mutable storage, with inline buffers for up to
   eight arguments and lazy callback bookkeeping. Larger calls use heap buffers.
   Cleanup owns the plan for exactly the closure lifetime; partial failures and
   recursive callbacks retain independent invocation state. GI still performs
   its normal `g_function_info_invoke`; libffi invocation data is not cached.
4. **Native object operations.** x64 loops admit guarded array/string transfers
   between existing table or instance fields, copies of those borrowed values,
   and identity-guarded default string `len`. Numeric instance fields share the
   scalar member path. Raw member reads avoid delegate/metamethod lookup and reject missing fields
   or weakref representations requiring interpreter behavior. Borrowed live-outs,
   escaping objects and arbitrary methods retain fallback.
5. **Undo-log work reduction.** A member log retains each distinct displaced
   owner once per field/structural epoch, preserving raw weakref identity and
   reverse rollback. Repeated swaps stay bounded. Scalar-only lookups avoid
   owning-value comparisons. A 64-bit membership mask caches recorded indices
   for one retained array, avoiding repeated searches for small numeric arrays.
   Owning array values still receive lifetime-preserving records. Resize resets
   the mask and epoch; array identity, bounds and allocation failures are checked.
6. **Array guards.** For unchanged entry arrays of 1–16 homogeneous numeric
   elements, a pure native loop checks receiver, length and all element tags
   once. Constant in-range accesses can omit bounds checks; other accesses still
   check signed/unsigned bounds. Real calls, allocation and heap mutations
   disqualify the region. The eligibility check explicitly models admitted
   native scalar instructions: interpreter bytecode facts correctly retain
   their broader metamethod effects. Shape/type changes bail out and replay.
7. **Temporary numeric arrays.** Bounded escape analysis scalar-replaces up to
   four arrays of at most eight elements each, over at most 64 instructions per
   array within one basic block. Elements are copied when appended, so later
   source writes cannot change captured values. Uses must be constant-index
   reads; aliases, escaping returns, mutation, callbacks and control-flow
   boundaries reject the candidate. Native guards preserve numeric tags.
   Ordinary execution, debugging and fallback retain the original bytecode and
   allocation behavior. This introduces no opcode or public numeric ABI change.
8. **Bytecode control flow.** Forward joins preserve only identical scalar
   constants from all predecessors; float identity uses bits, including signed
   zero and NaN payloads. Loop-written locals and exceptional edges invalidate
   assumptions. Analysis has explicit memory/function-size limits. A related
   pre-existing JIT correctness bug is fixed: a loop-modified parameter is loaded
   before the native loop, rather than reloaded from its original VM value at
   each header. That bug could make a decrementing loop run forever; both x64
   and AArch64 now preload loop-written scalar parameters.
9. **Compiler optimization builds.** Opt-in `SQGI_ENABLE_LTO` and
   `SQGI_PGO_MODE=OFF|GENERATE|USE` support checked Release IPO and GCC training.
   Empty-profile USE and sanitizer/PGO combinations fail configuration. Defaults
   remain unchanged; no fast-math flags are added. See the reproducible workflow
   in [tools/README.md](../../tools/README.md#compiler-optimization-builds).

Ownership and escape decisions live in the existing memory/call modules,
`SQJitWriteLog`, and the bounded `SQJitVirtualArrayPlan`; no second bytecode
interpreter or speculative general-purpose IR was added.

## Measurements

Five alternating process pairs, CPU 0, five warmups per kernel, threshold 1,
Release builds and checksum comparison. The final main-kernel comparison uses
240,000 base iterations (scalar/read kernels multiply that by 20). The focused
execution suite uses 150,000 iterations. These are warmed local microbenchmarks;
startup, compilation, UI work and real application distributions are not measured.
A ratio above 1 means the candidate is faster.

| Kernel | Baseline µs/iteration | New Release µs/iteration | Speedup |
| --- | ---: | ---: | ---: |
| `direct_call` | 0.006509 | 0.003800 | 1.71× |
| `branch_call` | 0.006508 | 0.003154 | 2.06× |
| `float_call` | 0.011168 | 0.006701 | 1.67× |
| `numeric_loop` | 0.010137 | 0.005906 | 1.72× |
| `vector` | 2.815829 | 2.863962 | 0.98× |
| `dynamic_member` | 0.256758 | 0.268633 | 0.96× |
| `dynamic_key_get_set` | 0.024538 | 0.023104 | 1.06× |
| `object_member_write_fallback` | 0.189408 | 0.096971 | 1.95× |
| `array_append` | 0.035800 | 0.035667 | 1.00× |
| `array_write` | 0.009483 | 0.005954 | 1.59× |
| `array_read` | 0.002259 | 0.001308 | 1.73× |
| `array_float` | 0.002154 | 0.001721 | 1.25× |
| `math_intrinsic` | 0.025521 | 0.025383 | 1.01× |
| `math_variable` | 0.046117 | 0.045988 | 1.00× |
| `matrix` | 0.074313 | 0.070317 | 1.06× |

Raw evidence: `bitmap-kernels.json`, including every sample and checksum.

The focused execution suite measured temporary arrays at **7.36×**, GI scalar
calls at **2.12×**, GI clock calls at **1.70×**, and parameter-array reads at
**2.05×**. Raw evidence: `execution.json` and `execution-*-*.txt`.

Broad float caching was pruned after a variable-math regression. Constant
remainder lowering was narrowed after write-loop regressions. The first owning
member-log prototype grew quadratically on swaps; retaining distinct owners
fixed that before acceptance. A later array-write regression was resolved with
the exact membership mask. The remaining dynamic-member kernel is about 4%
slower in the final ordinary Release comparison; vector is within 2%, and the
other main kernels are at parity or faster. There is no uniform application
speedup claim.

The historical `object_member_write_fallback` name is retained so older samples
remain comparable; eligible transfers now execute native x64 loops.

### Additional benefit of trained PGO + LTO

| Kernel | New Release µs/iteration | New PGO/LTO µs/iteration | Additional speedup |
| --- | ---: | ---: | ---: |
| `direct_call` | 0.003949 | 0.003847 | 1.03× |
| `branch_call` | 0.003179 | 0.003164 | 1.00× |
| `float_call` | 0.006886 | 0.006821 | 1.01× |
| `numeric_loop` | 0.005958 | 0.006068 | 0.98× |
| `vector` | 2.829025 | 2.266975 | 1.25× |
| `dynamic_member` | 0.266437 | 0.235887 | 1.13× |
| `dynamic_key_get_set` | 0.023275 | 0.015762 | 1.48× |
| `object_member_write_fallback` | 0.100025 | 0.066175 | 1.51× |
| `array_append` | 0.037437 | 0.029087 | 1.29× |
| `array_write` | 0.006112 | 0.004450 | 1.37× |
| `array_read` | 0.001316 | 0.001323 | 0.99× |
| `array_float` | 0.001755 | 0.001754 | 1.00× |
| `math_intrinsic` | 0.026050 | 0.025900 | 1.01× |
| `math_variable` | 0.046300 | 0.046100 | 1.00× |
| `matrix` | 0.072262 | 0.054900 | 1.32× |
| `temporary_arrays` | 0.007300 | 0.007307 | 1.00× |
| `gi_scalar` | 0.491507 | 0.473827 | 1.04× |
| `gi_clock` | 0.251967 | 0.220653 | 1.14× |
| `array_guards` | 0.001073 | 0.001093 | 0.98× |

Raw evidence: `final-pgo-kernels.json` and `final-pgo-execution.json`.

PGO/LTO results compare the new ordinary Release build with the trained new
build, rather than with the old baseline. Training used the correctness suite
and smaller versions of these benchmarks, so the results favor that workload
mix. Pure emitted-code kernels should gain little; compiled VM/helper paths can
benefit. Unused standalone bundled-library targets emit missing-profile warnings
and use normal compiler optimization; the SQGI core/CLI had training data.

Reproduce comparisons with `tools/run_execution_benchmarks.py`; commands and
output meanings are in [demo/benchmarks/README.md](../../demo/benchmarks/README.md).

## Validation

- Release with JIT: **93/93 passed** (`final-release-tests.log`).
- Debug with JIT, ASan/UBSan and leak detection: **93/93 passed**
  (`final-asan-tests.log`).
- Debug with JIT compiled out: **80/80 passed** (`off-tests.log`).
- Trained Release PGO + LTO: **93/93 passed** (`final-pgo-use-tests.log`).
- AArch64 static core under QEMU: **12/12 passed** (`final-a64-tests.log`),
  including the loop-parameter regression. No native ARM performance claim.
- SysV and Win64 x64 emitter/ABI tests passed; native Windows execution was
  not available in this Linux environment.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The new installable Release/JIT builds use prefix `/usr`, in the evidence
root's `release/` and `pgo/` directories. The repository's existing `build/`
continues to contain the previous install-ready build.

Focused tests execute emitted division code over boundary values, adjacent
multiples and randomized signed inputs; check floating-cache eviction, branch
joins, NaN payloads, signed zero and SysV/Win64 encoding; verify optimized and
unoptimized bytecode with JIT on/off and serialization; and exercise GI hidden
arguments, >8-argument calls, callback recursion, invalid-then-valid calls and VM
teardown. Object/array tests cover aliases, weak ownership, late errors, rollback,
shape/type changes, empty loops and delegate rebinding. Direct native artifact
execution verifies virtual arrays return correct values without writing real
array objects into the VM's allocation destinations.

The network-dependent `sqgi_test_sqgipkg` was also attempted and failed when an
external download returned HTTP 404. It is excluded from the reported green
suite counts. No installation, commit or push was performed in this pass.

## Larger architecture work assessed

**Precise native resumption** remains a separate change. The current contract
returns success or rolls back heap writes and replays from the region entry.
Resuming at a guard needs a per-guard bytecode PC, live-slot locations and tags,
trap/call state, and materialization descriptions for virtual aggregates. A guard
inside construction must reconstruct the partially built array, not just the
final fields. Completed writes would be committed before resuming instead of
rolled back. Both backends and VM entry/exit paths need the same contract, with
fault-injected guard tests proving that effects run exactly once. First measure
replay distance and guard-failure frequency in real applications; the bounded
log and native coverage changes already remove several costly fallback cases.

**Packed numeric array storage** also remains separate. `SQArray`, native raw
loads, C API access, iteration, serialization, weakref handling and GC currently
share `SQObjectPtr` element storage. A packed representation needs guarded
transitions to generic storage, precise element semantics, and invalidation of
native assumptions on writes/resizes. Start with a private storage abstraction
and a numeric-array benchmark/GC/serialization suite, then evaluate bandwidth
and memory benefits against conversion costs. Neither this representation nor
general object scalar replacement was silently introduced in this pass.
