# Kernel compiler architecture proposal

Status: core architecture implemented. See [implementation and validation](compiler-architecture-results.md).
This document preserves the original design rationale; the results document
records implementation choices, measured performance and platform limitations.

The objective is to let ordinary-sized typed programs compile without an
arbitrary temporary-slot ceiling, retain fast small calls, and bound real
resource consumption. Keep the existing kernel language and Squirrel API.
This is not a proposal to add another type system to ordinary Squirrel.

## Current constraints

`src/kernel/kernel.cpp` parses directly into mutable slot-based instructions.
Every helper/method call copies the callee's instructions and slots into the
caller. Slots are never recycled. The 384-slot check combines parameters,
temporaries, and addressable local storage before LLVM optimization.

`src/kernel/llvm.cpp` lowers each function independently, creating an LLJIT
instance per function. It already separates addressable storage from scalar
allocas and runs the O3 pipeline, but LLVM never sees original helper calls.

The x64 emitter consumes the same flattened representation. The reference
interpreter and explicit boxed-Squirrel compiler also consume kernel IR.
Changes must account for these consumers, not only the LLVM backend.

## 1. Preserve function boundaries in a typed module IR

Introduce stable function, value, local-storage, and source-location IDs.
Represent a call with a callee ID, ordered argument list, and optional result.
Represent addressable arrays/instances separately from scalar temporaries;
an array of N cells is one storage descriptor, not N temporary IDs.

Record scalar and pointer types explicitly. Preserve the existing eight-byte
external storage layout and arithmetic semantics; changing bool/record layouts
is separate work. Initially retain mutable scalar locals and lower them to
separate entry-block allocas for LLVM promotion. A bespoke SSA builder is not
required to remove mandatory inlining.

Use a declaration/signature pass followed by body lowering. Keep current name
resolution behavior initially, including helper-versus-math-name precedence.
Forward references can be enabled separately with explicit shadowing rules.
Reject recursive call-graph components, including method cycles, with a call
chain diagnostic. Recursion is not needed for this migration.

Add an IR verifier for types, call signatures, control flow, initialized values,
storage references, and borrow permissions. Preserve argument evaluation order,
local initialization on each execution of a declaration, and existing alias
rejections. Do not infer LLVM noalias merely from source-level `inout`.

## 2. Compile one kernel module together

Change lowering from `lower(Function)` to a module compilation interface.
Declare all internal LLVM functions first, then emit their bodies and public
entry wrappers into one LLVM module. Optimize that module together.

Use one LLJIT owner per compiled source module initially. That is a bounded
lifecycle change, without introducing a process-wide cache or shared compiler
service. Retain the current restricted runtime-symbol resolution policy.

Keep `int entry(Call*)` as the public prepared-call ABI. Wrappers unpack and
validate the already marshalled arguments as appropriate, call the internal
typed function, and publish its status/result. Internal helpers pass scalars
directly and borrowed arrays as pointer/length arguments; they never re-enter
Squirrel or rebuild boxed argument lists.

Module ownership retains all helper code until its last kernel/prepared-call
owner is released. Preserve the current requirement that borrowers of prepared
entry pointers retain the module. Compilation must publish entries atomically:
failure must leave no partially usable module or dangling entry address.

## 3. Define errors and effects before optimizing calls

All potentially failing internal functions receive a hidden execution-context
pointer and return a status plus a typed result where applicable. A concrete
initial LLVM representation is an aggregate `{i32 status, T value}` (just status
for void); benchmark aggregate returns against an output-pointer form on each
supported target before freezing the private ABI. This ABI is internal only.

The context carries shared fuel and the first error location. Failure propagates
immediately: callers cannot continue stores or expose an uninitialized result.
Do not replay a failed kernel in an interpreter, because preceding writes may
already have occurred. Add a function ID to private diagnostics so errors in
non-inlined helpers identify the actual helper and line.

Compute transitive effects over the acyclic call graph: may fail, consumes fuel,
uses floating-point operations, reads/writes borrowed memory. Start conservatively.
An integer-only wrapper that calls a floating-point helper still needs the FP
environment policy. Normalize and restore FP state once at the outer kernel
boundary, including error exits, retaining existing x64/ARM64 behavior.

Preserve existing Tick placement and fuel accounting exactly. Helper entry does
not gain a new fuel charge; nested loops share one remaining budget. Preserve
integer wrapping, checked division/remainder, NaN comparisons, short-circuiting,
and strict floating-point behavior. No fast-math or signed-overflow assumptions.

After the checked ABI is correct, functions proven unable to fail or consume
fuel can use direct typed returns and omit unneeded context arguments. Keep
effect inference and any resulting call specialization mechanically verifiable.

## 4. Make inlining an optimization

Emit ordinary internal calls and let the existing LLVM optimization pipeline
decide which to inline. Do not mark every helper alwaysinline. Keep larger or
multiply used helpers callable to avoid duplicating their bodies everywhere.

Retain a compiler-internal forced-no-inline testing mode so correctness cannot
depend on LLVM erasing a call. Collect function counts, before/after IR size,
compile duration, and emitted code size. Add inline-decision reporting where
practical, without adding user-facing tuning knobs initially.

Do not claim that module compilation alone enables inlining into separately
compiled ordinary Squirrel JIT code. Preserve prepared-call entry points first.
Audit `src/sqgi_llvm.cpp` and all automatic-JIT/native-leaf consumers; an
unsupported new IR shape must decline direct inlining and use the existing
prepared entry safely. Cross-module IR importing is a later, measured project.

## 5. Budget resources separately

Replace 384 with distinct policies for frontend size, addressable local bytes,
call depth, compiler growth, and generated code size. Retain existing source,
token, parameter, and instruction guards until replacements are tested.

Virtual temporary count is a compiler-memory budget, not a stack-size estimate.
Addressable storage has an explicit byte/alignment budget. The acyclic call graph
permits conservative maximum call-depth and simultaneously active source-local
storage estimates. Inlining can change storage lifetimes, so check the chosen
lowering too. LLVM spills, saved registers, ABI overhead, and stack probes mean
these estimates are not a hard bound on final machine-stack consumption.

Choose default byte/count limits using measured corpus sizes and adversarial
tests; do not replace one unexplained number with another. Report the exhausted
resource, requested amount, allowed amount, and relevant function/call chain.
Distinguish enforced preflight limits from observed post-codegen measurements.
Hard compilation deadlines require an interruptible/isolated compiler design;
an elapsed-time check after optimization is only telemetry, not enforcement.

## 6. Keep the dependency-free native backend working

Use an adapter from module IR to the existing flattened native IR first. Move
mandatory expansion into that adapter with checked instruction/storage growth.
Keep its existing tested frame limit initially and report backend-specific
capacity errors explicitly. LLVM gets larger-program support first; native
backend feature parity is not implied during this transition.

Later add native internal calls with correct platform calling conventions and
frame layout if demand warrants it. Do not delay the LLVM architecture change
for a second optimizing backend. The reference interpreter instead gains real
call frames and separate local storage, and remains a test oracle only.

## Delivery sequence and acceptance gates

1. **Capture behavior and baselines.** Add helper-heavy fixtures, errors after
   partial writes, aliasing, local reinitialization, nested-loop fuel, FP state,
   and module lifetime cases. Record tiny-call, method, array, math, A*, and
   RouteTastic baselines, including cold compilation and code size.
2. **Introduce module calls and verification.** Parser emits calls and separate
   storage; the reference interpreter executes them. A checked flattening
   adapter keeps existing backends and consumers operational. Existing public
   APIs and tests retain behavior; diagnose recursive graphs deterministically.
3. **Add module-wide LLVM lowering.** Shared code ownership, public wrappers,
   typed internal checked calls, transitive effects. Test with helper inlining
   disabled as well as normal optimization. Adapter remains for native x64.
4. **Remove LLVM's inherited slot cap.** Introduce measured resource policies;
   compile fixtures with more than 384 cumulative temporaries and legitimate
   larger local storage. Test limit boundaries and adversarial call graphs.
5. **Tune small calls.** Add proven non-failing direct-return paths if benchmarks
   justify them. Verify prepared calls and ordinary-JIT integration retain their
   fast paths. Investigate repeatable regressions rather than promising every
   workload will improve from a change primarily aimed at scalability.

Run existing kernel and LLVM-JIT correctness suites plus targeted ASan/UBSan.
Compare LLVM execution with the reference interpreter and independent expected
results; compare native x64 where within its supported resource envelope.
Use randomized well-typed programs with deterministic seeds and strict fuel
bounds. Compare statuses, error locations, remaining fuel, mutated buffers,
and scalar results, respecting documented floating-point comparison rules.

Validate x86-64 Linux, ARM64 Linux, and supported Windows configurations on real
target runners. Include destruction/recompilation, repeated module names,
multiple exports sharing helpers, and cleanup after compilation failure.

Report warm throughput separately from compilation/first-call time and memory.
Performance acceptance is no repeatable regression beyond measured noise in
existing tiny-call paths, successful compilation of previously oversized helper
programs, and evidence that repeated helper sites no longer force frontend IR
duplication. Expected compile-time/code-size improvements remain hypotheses
until measured; module-wide optimization itself can add cost.
