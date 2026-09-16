# JIT member-plan failure investigation — 2026-09-15

The x64 `sqgi_test_cpp_sqjit_member_plan` failure contains two distinct issues:
27 incorrect release-order results and five missing native-execution assertions.
Both reproduce on an unchanged HEAD checkout, independently of sqgipkg and the
MinGW `_inline` field rename. The initial investigation below describes the
unfixed baseline; the subsequent correctness fixes and validation follow at
the end. Diagnostic instrumentation was confined to a temporary checkout.

## Reproduction

```sh
cmake -S . -B /tmp/sqgi-jit-review -G Ninja \
  -DCMAKE_BUILD_TYPE=Release -DSQ_ENABLE_JIT=ON
cmake --build /tmp/sqgi-jit-review \
  --target sqgi_test_cpp_sqjit_member_plan sqgi_test_cpp_sqjit_write_log -j4
ctest --test-dir /tmp/sqgi-jit-review \
  -R 'sqgi_test_cpp_sqjit_(member_plan|write_log)$' --output-on-failure
```

The member-plan test explicitly runs interpreter and JIT modes with a threshold
of one. CTest supplies the matching runtime library path; invoking the binary
without that environment can instead produce an unrelated symbol lookup error.
The write-log test passes; the member-plan test reports 32 failed assertions.

## Incorrect destruction timing on x64

`stack_release_order` in `test/cpp/test_sqjit_member_plan.cpp` warms native
functions with scalar arguments, then supplies an argument that owns userdata
with a release hook. It also covers ownership through arrays/tables and two
aliased argument slots. The release hook writes 99 to a root-table value.

For an assignment followed by a root read, the interpreter returns 100. Native
execution returns 1. The hook runs once, but only after the result was computed.
The test cleans the argument slots before checking the hook count; eventual
cleanup therefore passes while the return-value assertion exposes the bug.
Failures cover MOVE, GET, boxed GET, literal/arithmetic writes, branching and
aliased arguments. These are observable behaviour differences, not merely
missed optimization or an overly strict test expectation.

`compile_proto` in `sqjit_backend_x64.cpp` stores scalar assignments in its
native frame and changes `SQJitSlotState`, leaving the VM stack's reference
owners intact. Overwriting a parameter need not read its old value, so the
normal read-type guards do not protect against replacing the scalar warmup
argument with a last-owner reference. The subsequent native root read executes
before the old VM argument is released.

`SQJitWriteLog` already has `BeginStackWrite`, `FinishStackWrite` and
`PublishStackWrite`. The AArch64 backend uses them; x64 does not. Their getter
handling also models the interpreter's `temp_reg` swap, which matters for GET:
simply releasing every displaced value immediately would be incorrect too.

A correctness-first fix should bail out before an observable last-owner drop,
accounting for aliased slots, weak observers, nested ownership and journal pins.
The complete implementation should publish transactional stack writes at their
logical bytecode positions and preserve GET temporary semantics. Applying an
entry-type guard only to the scalar warmup types is insufficient for the full
ownership model. Keep the semantic assertions intact.

## Integer-only lowering of short reference assignments

`capture_ref`, `replace_ref`, `receiver_ref`, `nested_ref` and `capture_late`
produce correct values through interpreter fallback but never satisfy their
native-execution assertions. Trace output confirms successful compilation,
repeated guard failures and eventual 256-attempt backoff.

`SQJitMemberPlan::Build` declines caching for non-loop functions with fewer than
three member accesses. All five cases fall into that short-function category.
Without a cached member, x64's `_OP_SET` path selects its float or integer store
helper. An array argument reaches `ensure_int_slot`, which emits an integer
check against that argument's VM slot.

An instrumented temporary checkout confirmed integer guards generated for
observed `OT_ARRAY` arguments in all five functions. This is an input guard that
cannot pass for the observed workload, not a compiler rejection; consequently
the existing compilation diagnostic prints `ip=-1 reason=none`.

The fix should give uncached short member stores the same reference-value
handling as cached stores, including ownership of assignment-expression
results. Null member reads (`t.empty`), returning reference values, receiver
aliasing and late rollback also need coverage. Lowering the cache threshold
alone does not supply those capabilities and couples correctness to a
performance heuristic. Rejecting unsupported shapes explicitly would improve
diagnostics but would not satisfy the requested native capability.

## Scope and interim behaviour

Confirmed on Linux x86_64; this investigation does not establish ARM64 results.
The first issue is a correctness bug; the second is a native-coverage/lowering
gap whose tested values remain correct through fallback. JIT support compiled
with `SQ_ENABLE_JIT=ON` is still opt-in at runtime: `SQJitContext` reads
`SQGI_JIT`, which is disabled when unset or set to `0`. Leaving JIT disabled
avoids the demonstrated native release-order bug in the unfixed runtime.

## Correctness fixes and validation

Fetched all remotes before implementing the fixes. `master` and `origin/master`
both pointed to `51634e5`, with no commits ahead or behind.

The x64 backend now guards displaced entry owners before executing native
effects. Whole-function entry checks written parameters; loop entry checks
written VM slots. Regions containing GET also check the VM temporary. Values
whose delayed destruction could be observable force interpreter fallback.
The proof accepts primitives, unobserved strings/weak references, and bounded
arrays containing only scalars. It deliberately does not treat additional
strong references as proof: later alias or heap writes can remove those owners.
This is a conservative fallback fix; transactional publication of x64 stack
writes remains future optimization work.

A broader baseline run also exposed incorrect Boolean loop carry. The x64
backend now initializes loop-carried Boolean parameters before the backedge,
as it already did for integer and float parameters. An inlined leaf call can
then consume the updated Boolean rather than reload the initial VM argument.

Added a focused `sqgi_test_cpp_sqjit_release_order` CTest entry using the
member-plan executable's `--release-order-only` mode. It retains interpreter
and native comparisons and adds loop overwrites and direct native entry with
an observable VM temporary. These regressions fail against the unfixed runtime.

Validation with JIT enabled on Linux x86_64:

- All five focused tests pass: `jit_loop_regressions`, `jit_correctness`,
  `jit_correctness_runtime`, `cpp_sqjit_write_log`, and `cpp_sqjit_release_order`
  (each has the `sqgi_test_` prefix).
- The complete JIT label suite passes 23 of 28 test programs. Remaining
  failures are native-execution coverage assertions; their value checks pass.
  `cpp_sqjit_member_plan` retains the five pre-existing short reference-store
  coverage failures. Four additional programs (`cpp_sqjit_memory`,
  `cpp_sqjit_leaf`, `cpp_sqjit_objects`, and `cpp_sqjit_float_cache`) now encounter
  the conservative fallback. These are performance regressions introduced by
  the correctness guard, and their assertions remain enabled.
- The Windows x64 runtime cross-build succeeds and `test_jit_loop_regressions.nut`
  passes under Wine with JIT enabled and threshold one. Building the Windows
  C++ member-plan test is blocked by a duplicate `_Unwind_Resume` linker symbol;
  Windows release-order execution and actual Windows/ARM64 testing remain
  unverified.
