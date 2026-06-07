# Squirrel Bytecode JIT Design

This document sketches an optional JIT compiler for the vendored Squirrel VM in
`Squirrel3/squirrel`. The goal is to speed up hot Squirrel bytecode while keeping
the interpreter as the source of truth for semantics, error handling, debugging,
and unsupported bytecode paths.

For the current AArch64 cleanup checklist, benchmark gates, and pruning rules,
see `docs/internals/jit-maintainability-todo.md`.

## Goals

- Improve tight-loop Squirrel execution speed for arithmetic, locals, arrays,
  and table access.
- Keep the existing interpreter fully functional and always available as a
  fallback.
- Make the JIT optional at build time and runtime.
- Preserve current C API behavior, bytecode format, GC behavior, refcounting,
  debug hooks, exceptions, generators, and native/GI calls.
- Support Linux and Windows from the design stage, even if the first backend is
  Linux/x86-64 only.

## Non-Goals

- Replacing the bytecode interpreter.
- Requiring LLVM or another large compiler stack for ordinary builds.
- JIT-compiling native closures, GI calls, or C/C++/Vala extension code.
- JIT-compiling every opcode in the first implementation.
- Ahead-of-time native compilation of `.cnut` files.

## Current VM Shape

Important existing structures:

- `SQInstruction` in `Squirrel3/squirrel/sqopcodes.h` is a compact bytecode
  instruction: one opcode byte, two one-byte operands, one signed 32-bit operand,
  and one more one-byte operand.
- `SQFunctionProto` in `Squirrel3/squirrel/sqfuncproto.h` owns bytecode,
  literals, nested protos, outer-value descriptors, line info, and stack size.
- `SQClosure` points at an `SQFunctionProto` plus bound outers/root/env.
- `SQVM::Execute()` in `Squirrel3/squirrel/sqvm.cpp` is the bytecode dispatch
  loop.
- `SQVM::StartCall()` sets up `CallInfo`, stack base, top, literals, and IP.
- Most slow/dynamic semantics already live behind helper methods:
  `Get`, `Set`, `NewSlot`, `ARITH_OP`, `CMP_OP`, `CallNative`, `StringCat`,
  `FOREACH_OP`, `Return`, `Raise_Error`, and friends.

The JIT should initially call these helpers for dynamic behavior rather than
reimplementing the object model.

## High-Level Architecture

Add a small optional JIT subsystem under `Squirrel3/squirrel/jit/`:

```text
Squirrel3/squirrel/jit/
  sqjit.h              public/internal JIT declarations
  sqjit.cpp            manager, policy, hotness counters
  sqjit_backend.h      backend interface
  sqjit_backend_aarch64.cpp
                        AArch64 backend root and include-fragment owner
  sqjit_backend_aarch64_private.h
                        private backend constants and small state structs
  sqjit_backend_aarch64_*.inc
                        AArch64 helper, whole-proto, and loop compiler fragments
  sqjit_backend_aarch64_emit.*
                        AArch64 instruction encoder helpers
```

Build controls:

```text
SQ_ENABLE_JIT=ON/OFF          CMake option, default OFF
SQGI_JIT=0/1                  runtime env toggle
SQGI_JIT_THRESHOLD=N          hot-call threshold
SQGI_JIT_TRACE=0/1            logging for compile/fallback decisions
SQGI_JIT_TRACE=stats          aggregate counters and rejection summary at exit
```

When JIT is disabled, the build should compile no executable-code allocator and
all behavior should match today.

## Compilation Unit

Compile one `SQFunctionProto` at a time.

Add optional JIT metadata to `SQFunctionProto` behind `#ifdef SQ_ENABLE_JIT`:

```cpp
struct SQJitProto {
    SQJitCode *entry;
    SQInteger hot_count;
    SQInteger fail_count;
    SQInteger version;
    SQJitEligibility eligibility;
};

SQJitProto *_jit;
```

The compiled code is invalidated when the proto is released. Because bytecode is
immutable after `SQFunctionProto::Create()`, there is no normal bytecode
patching invalidation problem.

## Execution Entry

`SQVM::Execute()` remains the canonical entry. At `ET_CALL`, after `StartCall()`
has installed `ci`, check whether the current closure's proto has compiled code:

1. If JIT disabled, continue interpreter.
2. If debug hook is active, continue interpreter.
3. If the function has unsupported features, continue interpreter.
4. If hotness threshold is not reached, increment hot count and continue
   interpreter.
5. If threshold is reached, compile the proto.
6. If compile succeeds, call compiled entry.
7. If compiled entry exits normally, return through the same path as
   `_OP_RETURN`.
8. If compiled entry bails out, resume the interpreter at the indicated bytecode
   IP.

Compiled entry signature:

```cpp
enum SQJitExitKind {
    SQ_JIT_EXIT_RETURN,
    SQ_JIT_EXIT_BAILOUT,
    SQ_JIT_EXIT_THROW,
    SQ_JIT_EXIT_SUSPEND
};

struct SQJitExit {
    SQJitExitKind kind;
    SQInstruction *resume_ip;
    SQObjectPtr value;
};

typedef SQJitExit (*SQJitEntry)(SQVM *v);
```

The first version can simplify this further: compiled code returns `false` for
fallback and `true` for completed return, with details stored in `SQVM`.

## Baseline JIT Strategy

The first JIT should be a baseline compiler, not an optimizing compiler. It
emits native code that operates on the existing Squirrel VM stack and uses
helper calls for complex semantics.

Principles:

- Treat `_stack._vals` as the canonical register file.
- Keep `SQObjectPtr` lifetimes correct by using existing assignment paths or
  tiny helper stubs.
- Compile basic blocks and use native branches for `_OP_JMP`, `_OP_JZ`,
  `_OP_AND`, `_OP_OR`, and common loop backedges.
- For unsupported opcodes, emit a bailout to the interpreter at that IP.
- For errors, helper functions raise VM errors and return a failure flag; JIT
  exits with `SQ_JIT_EXIT_THROW`.
- Preserve `ci->_ip` before calls that may throw or invoke Squirrel/native code.

This gives speedups by removing switch dispatch, operand decoding, and some
repeated stackbase calculations while leaving semantics in existing VM helpers.

## MVP Opcode Set

The first useful subset should target `demo/benchmarks/sqgi_bench.nut`:

Always safe/straightforward:

- `_OP_LOAD`
- `_OP_LOADINT`
- `_OP_LOADFLOAT`
- `_OP_DLOAD`
- `_OP_MOVE`
- `_OP_DMOVE`
- `_OP_LOADNULLS`
- `_OP_LOADBOOL`
- `_OP_LOADROOT`
- `_OP_JMP`
- `_OP_JZ`
- `_OP_AND`
- `_OP_OR`
- `_OP_RETURN`

Useful with helper calls:

- `_OP_ADD`
- `_OP_SUB`
- `_OP_MUL`
- `_OP_DIV`
- `_OP_MOD`
- `_OP_CMP`
- `_OP_JCMP`
- `_OP_EQ`
- `_OP_NE`
- `_OP_GET`
- `_OP_GETK`
- `_OP_SET`
- `_OP_CALL`

Useful specialized paths:

- `_OP_INCL` integer fast path with fallback to `ARITH_OP`.
- `_OP_PINCL` integer fast path with fallback.
- `_OP_APPENDARRAY` direct `SQArray::Append`.

Bail out initially:

- `_OP_YIELD`
- `_OP_RESUME`
- `_OP_PUSHTRAP`
- `_OP_POPTRAP`
- `_OP_THROW`
- `_OP_FOREACH`
- `_OP_POSTFOREACH`
- `_OP_CLOSURE`
- `_OP_TAILCALL`
- class-heavy paths through `_OP_NEWOBJ`/`CLASS_OP`
- opcodes that interact with outers until closure/outer lifetime handling is
  explicitly tested

## Type Specialization

After the baseline compiler is correct, add guarded specialization:

- Integer arithmetic for `_OP_ADD`, `_OP_SUB`, `_OP_MUL`, `_OP_MOD`.
- Float arithmetic when both operands are floats.
- Integer local increment for `_OP_INCL` and `_OP_PINCL`.
- Array integer index get/set.
- Table get/set inline cache for string literal keys.

Each specialization must guard object type and bail out to a generic helper or
the interpreter on mismatch.

Example guard:

```text
if STK(arg2)._type != OT_INTEGER || STK(arg1)._type != OT_INTEGER:
    goto generic_arith_helper
TARGET = STK(arg2).nInteger + STK(arg1).nInteger
```

Do not skip refcounting when assigning a refcounted object to a stack slot. It
is only safe to write raw scalar fields directly when the old destination value
is known to be scalar/null or when using the normal assignment helper.

## Calls

For `_OP_CALL`, first version should:

- Flush `ci->_ip` to the bytecode IP after the call instruction.
- Call existing `StartCall()` for Squirrel closures.
- Call existing `CallNative()` for native closures.
- Bail out after setting up a Squirrel call, letting the interpreter continue in
  the new frame.

This keeps nested calls correct without compiling multiple frames at once.

Later versions can directly enter compiled callees when:

- callee is an `OT_CLOSURE`,
- callee proto has compiled code,
- no debug hook/traps/generator edge cases apply.

## Exceptions, Traps, and Debug Hooks

Initial JIT eligibility should reject functions containing:

- `_OP_PUSHTRAP`
- `_OP_POPTRAP`
- `_OP_THROW`
- generator/yield/resume opcodes

When `_debughook` is active, skip JIT entirely. This preserves line hooks,
debugger behavior, and stack inspection without making every compiled block a
debug safepoint.

Later, line events can be supported by splitting blocks at `_OP_LINE` and
calling `CallDebugHook()`, but this should not be part of MVP.

## GC and Refcounting

Squirrel uses refcounting plus optional GC chain marking. The JIT must preserve
these rules:

- Assigning `SQObjectPtr` must addref new refcounted values and release old
  refcounted values.
- Raw writes are only safe for scalar/null destinations or freshly initialized
  slots.
- Helper stubs should be preferred for object assignment:

```cpp
void sqjit_assign(SQObjectPtr *dst, const SQObjectPtr *src);
void sqjit_assign_raw_obj(SQObjectPtr *dst, const SQObject *src);
void sqjit_set_integer(SQObjectPtr *dst, SQInteger value);
void sqjit_set_bool(SQObjectPtr *dst, SQBool value);
void sqjit_null(SQObjectPtr *dst);
```

Compiled code must not keep raw `SQObjectPtr *` across calls that may grow the
VM stack or call stack. If a helper can grow `_stack`, reload `_stack._vals`,
`_stackbase`, and `ci` after the helper returns.

## Code Cache and Memory

Use one process-local `SQJitContext` per `SQSharedState`:

- owns executable memory pages,
- owns compiled proto records,
- provides logging/statistics,
- releases code when the shared state closes.

Executable memory policy:

- Allocate RW pages for code generation.
- Flip to RX before execution.
- Never keep pages RWX.
- On Windows use `VirtualAlloc`/`VirtualProtect`.
- On POSIX use `mmap`/`mprotect`.

Compiled code lifetime should be tied to `SQFunctionProto::Release()`. The first
implementation can leak code until VM shutdown to simplify correctness, then add
per-proto reclamation once stable.

## Backend Choice

Use a small backend abstraction. Practical path:

1. Start with an interpreter-adjacent "compiled block" prototype that lowers
   bytecode to C++ helper calls through hand-written x86-64 emission.
2. Keep the backend isolated so AsmJit, DynASM, MIR, or platform-specific
   emitters can be swapped in.
3. Prefer AsmJit if we accept a third-party dependency because it supports
   x86/x64 on Linux and Windows and keeps the implementation readable.

Do not introduce LLVM for the first JIT. It is too heavy for SQGI's lightweight
runtime story.

## Eligibility Analysis

Before compiling a proto:

1. Build basic block boundaries:
   - function entry,
   - branch targets,
   - instruction after conditional/unconditional branches,
   - return sites.
2. Scan opcodes for unsupported features.
3. Record max stack slot touched.
4. Mark blocks that need `ci->_ip` safepoints before helper calls.
5. Decide whether the proto is:
   - `NeverJit`: unsupported semantic feature,
   - `BaselineOnly`: generic helper-heavy code,
   - `Specializable`: good type-specialization candidate.

## Bailout Design

A bailout must restore enough state for `SQVM::Execute()` to continue:

- `ci->_ip` points to the bytecode instruction that should run next.
- `_top` and `_stackbase` are valid.
- stack slots contain valid `SQObjectPtr`s.
- `temp_reg` is valid or null.
- any helper-raised error remains in `_lasterror`.

For helper failures, compiled code should return `SQ_JIT_EXIT_THROW`, and
`Execute()` should use the same exception handling path as `SQ_THROW()`.

## Instrumentation

Add counters:

- proto hot count,
- compile attempts,
- compile successes,
- compile failures by reason,
- JIT entries,
- JIT returns,
- bailouts by opcode,
- helper throws.

Expose optionally through:

```text
SQGI_JIT_TRACE=1
SQGI_JIT_TRACE=stats
tools/run_jit_reject_summary.py script.nut
```

Stats output includes stable reject-category rows from `SQJitRejectCategory`.
Detailed rejection strings remain useful for humans, but tests and tools should
prefer the category rows.

## Benchmark Plan

Use `demo/benchmarks/run.sh` as the first smoke benchmark.

Add a JIT comparison mode:

```sh
SQGI_BIN=build/sqgi SQGI_JIT=0 demo/benchmarks/run.sh --scale=5
SQGI_BIN=build/sqgi SQGI_JIT=1 demo/benchmarks/run.sh --scale=5
```

Expected MVP wins:

- `empty-loop`: dispatch removal.
- `numeric`: dispatch plus integer fast paths.
- `function-call`: only after direct compiled-to-compiled calls.
- `array`: append/index operations.
- `table`: only after inline caches.
- `string`: unlikely to improve without a separate string-builder strategy.
- `glib-clock`: mostly native/GI boundary, not core bytecode.

## Implementation Milestones

### Milestone 0: Skeleton

- Add `SQ_ENABLE_JIT` CMake option.
- Add no-op `SQJitContext`.
- Add `SQFunctionProto` JIT metadata behind `#ifdef SQ_ENABLE_JIT`.
- Add hotness counters and environment toggles.
- Prove no behavior change when JIT disabled.

### Milestone 1: Baseline Native Blocks

- Compile straight-line blocks for:
  `_OP_LOAD`, `_OP_LOADINT`, `_OP_MOVE`, `_OP_DMOVE`, `_OP_JMP`, `_OP_JZ`,
  `_OP_RETURN`.
- Bail out on everything else.
- Add tests that force JIT on tiny functions and compare interpreter results.

### Milestone 2: Helper-Backed Semantics

- Add helper-call lowering for arithmetic, compare, get/set, and calls.
- Preserve `ci->_ip` around helpers.
- Add exception and error propagation tests.

### Milestone 3: Integer Fast Paths

- Add guarded integer arithmetic and local increment.
- Add bailout counters.
- Benchmark `empty-loop`, `numeric`, and `function-call`.

### Milestone 4: Containers

- Add direct array append/index fast paths.
- Add table string-key inline cache with guard on table identity/shape.
- Benchmark `array` and `table`.

### Milestone 5: Windows and Packaging

- Add Windows executable memory backend.
- Ensure `sqgipkg` can package JIT-enabled builds.
- Add runtime fallback when executable memory is unavailable.

## Test Plan

Correctness tests:

- Run the existing `ctest` suite with `SQGI_JIT=0`.
- Run it again with `SQGI_JIT=1 SQGI_JIT_THRESHOLD=0`.
- Add focused Squirrel tests for arithmetic, loops, arrays, tables, closures,
  recursion, native calls, errors, and import-loaded `.cnut` files.
- Add C tests for bailout state and refcount stability.

Stress tests:

- Run JSON/marshal fuzz tests with JIT forced on.
- Run sanitizer builds with JIT disabled and with JIT helper paths enabled.
  Native executable memory may need sanitizer-specific handling.

Performance tests:

- Track median of at least five runs for `demo/benchmarks/run.sh --scale=3`.
- Report per-benchmark before/after medians, not single-run results.

## Main Risks

- Refcount mistakes from raw stack writes.
- Incorrect resume state after bailout.
- Helper calls growing the stack and invalidating cached pointers.
- Debug hooks and exception traps observing wrong IP/line information.
- Platform executable-memory policy differences.
- Maintenance cost if the backend is too clever too early.

The design intentionally starts with a conservative baseline JIT so failures
fall back to the interpreter and optimization can be added only where benchmarks
prove it worthwhile.
