# Runtime-compiled kernels for SQGI

Status: proposed design and implementation plan, 2026-09-16. A smaller
[tested prototype](kernels/README.md) now exists; this document remains the
target design, not a description of its complete API. Syntax, API names and initial
resource limits below are proposed defaults. The original backend preference was
no additional dependencies. Following explicit authorization and a measured
roughly 32x improvement on the prototype batch benchmark, LLVM 18 is now the
implemented default; the minimal native backend remains an explicit option.
See the prototype documentation for current build requirements and validation.

## 1. Decision and scope

Add a small, statically typed, C-like computational language, compiled to native
CPU code at runtime. Ordinary Squirrel handles application state, UI and I/O;
kernels operate on scalar values, plain structs and fixed-size arrays.

The kernel compiler is independent of the speculative Squirrel bytecode JIT.
It does not consume Squirrel bytecode, specialize on observed object types,
deoptimize into Squirrel, or replay a partially executed function. Unsupported
programs fail compilation. Invalid arguments fail before execution.

Initial supported hosts: Linux x86_64 and native Windows x64, without an MSYS2
shell. Linux AArch64 is a subsequent release gate. CPU only; GPU compilation,
automatic parallel execution and arbitrary foreign calls are outside version 1.

The target is useful throughput over batches, not making every tiny arithmetic
expression worth a native call. No speedup is assumed until end-to-end measured.

## 2. What application code looks like

Kernel source lives in a separate `.sqk` file. This keeps the Squirrel grammar
unchanged and makes diagnostics, editor support and standalone checking simpler.

```c
// kernels/geometry.sqk
const u32 CAPACITY = 1024;

struct Vec3 {
    f32 x;
    f32 y;
    f32 z;
};

f32 length_squared(Vec3 p) {
    return p.x * p.x + p.y * p.y + p.z * p.z;
}

export void transform(
    in Vec3 input[CAPACITY],
    inout Vec3 output[CAPACITY],
    u32 count,
    f32 scale,
    Vec3 offset
) {
    require(count <= CAPACITY);
    for (u32 i = 0; i < count; i += 1) {
        Vec3 p = input[i];
        output[i] = Vec3 {
            .x = p.x * scale + offset.x,
            .y = p.y * scale + offset.y,
            .z = p.z * scale + offset.z
        };
    }
}

export f32 sum_lengths(in Vec3 input[CAPACITY], u32 count) {
    require(count <= CAPACITY);
    f32 result = 0.0;
    for (u32 i = 0; i < count; i += 1) {
        result += length_squared(input[i]);
    }
    return result;
}
```

Proposed Squirrel usage:

```squirrel
local geometry = sqgi.kernel.load("kernels/geometry.sqk");
local input = geometry.array("Vec3", 1024);
local output = geometry.array("Vec3", 1024);
local offset = geometry.value("Vec3", { x = 1.0, y = 0.0, z = 0.0 });

input.set(0, { x = 2.0, y = 3.0, z = 4.0 });
geometry.transform(input, output, 1, 2.0, offset);
local result = output.get(0); // Explicit copy into a Squirrel value.
```

`load` validates and compiles all exports before returning. Subsequent calls use
resolved entry points. This moves compilation out of the first interactive
operation if the application loads kernels during startup. The initial API has
one optimization policy; no warmup thresholds or user-visible compiler flags.

The table used to construct `offset` is copied once into a typed host value.
Kernel execution never sees a Squirrel table. `set/get` are conveniences; real
batch pipelines should retain typed storage and use explicit bulk transfers.

## 3. Language contract

### Types

| Type | Meaning |
| --- | --- |
| `bool` | Boolean; no implicit integer conversion |
| `i8/i16/i32/i64` | Signed, two's-complement integers |
| `u8/u16/u32/u64` | Unsigned integers |
| `f32/f64` | Binary floating-point values |
| `void` | Function with no result |
| Named `struct` | Plain value with named, typed fields |
| `T[N]` | Contiguous fixed-size array; N is a positive compile-time integer |

Everything has a static type. Local declarations spell the type; no `var`,
dynamic value, nullable reference, pointer type or implicit C integer promotion.
Numeric literals receive an expected type from context, otherwise integer
literals default to `i32` and floating literals to `f64`. Out-of-range literals
are errors. Mixed typed operands require explicit conversion. Conditions are
Boolean expressions, not numeric truthiness.

Structs may contain scalars, other structs and fixed arrays. Recursive layouts,
unions, inheritance, methods, constructors, destructors and operator overloading
are excluded. Struct identity is nominal within its module. Assignment and
by-value arguments copy the value, with optimization allowed to remove copies.
Copying a struct has no user-observable destruction or identity.

Arrays retain their extent in the type and never decay to pointers. Multidimensional
arrays are nested fixed arrays in row-major order. Local array assignment copies
the entire value; no array return values in v1. Struct returns are supported,
with a result buffer at the external boundary.

### Declarations, control flow and calls

Support `const`, block scope, `if/else`, `for`, `while`, `break`, `continue`,
`return`, arithmetic, comparisons, bit operations and short-circuit `&&/||`.
Expressions and function arguments evaluate left to right. Assignment, compound
assignment and increment are statements, not expressions. This avoids ambiguous
side effects such as `a[i++] = i` while retaining familiar loop syntax.

All local declarations require initialization. Scalars/structs use expressions;
`T values[N] = {};` recursively zero-initializes an array. Named struct literals
must provide every field, except `{}` which means recursive zero initialization.
No uninitialized bytes may become observable through the host API. Whole-array
zeroing can be eliminated only when the compiler proves it unnecessary.

Functions have explicit parameter and return types. Module-local calls are
direct and statically resolved. Forward function references are allowed, but
the call graph must be acyclic: no direct or mutual recursion. No closures,
function pointers, variadic functions or overloading. Functions and structs are
the only executable/data abstractions. Global declarations are immutable
compile-time constants; no module initialization code or mutable global state.

One source file forms one module initially. Cross-file kernel imports, generic
functions and compile-time metaprogramming are deferred. A checker reports
these as unsupported features, not obscure parse failures.

### Arithmetic semantics

- Integer addition, subtraction, multiplication and negation wrap modulo the
  width for both signed and unsigned types. The language does not inherit C's
  signed-overflow undefined behaviour. Provide explicit checked arithmetic
  intrinsics for applications that need overflow errors.
- Integer division truncates toward zero; remainder follows the dividend's
  sign. Division by zero and signed minimum divided by minus one are errors.
  The same exceptional pair is checked for remainder, avoiding target traps.
- Shift counts must be in `[0, bit_width)`, otherwise error. Signed right shift
  is arithmetic; left shift shifts bits with width truncation.
- `cast<T>(x)` performs a checked numeric conversion. Float-to-integer truncates
  toward zero then checks range, rejecting NaN/infinity. Integer-to-float and
  `f64`-to-`f32` round to nearest, ties to even; finite floating narrowing that
  overflows is an error. Integer-to-integer checks representability. A separate
  integer `wrap_cast<T>` explicitly keeps the low bits.
- Default floating arithmetic preserves expression order, signed zero, NaN and
  infinity behaviour; no reassociation, implicit fused multiply-add or fast-math
  assumptions. Division by floating zero follows floating-point semantics.
  Enter with round-to-nearest and gradual underflow; save and restore the host
  FP control state where needed. Do not promise identical NaN payloads across
  architectures.
- Initial intrinsics: `min`, `max`, `abs`, `sqrt`, `isnan`, `isfinite`, checked
  integer arithmetic and explicit `fma`. Specify NaN and signed-zero behaviour
  for min/max before implementation; proposed rule: propagate NaN, choose -0
  for min and +0 for max. Signed integer abs(minimum) is an error. Floating
  sqrt(negative) produces NaN. Transcendentals and relaxed math are later work.

These rules belong in the language specification and reference evaluator,
not in backend-specific conventions. Optimization must preserve them.

## 4. Fixed arrays, ownership and variable workloads

Array parameters require a mode: `in` for a read-only borrow and `inout` for an
exclusive mutable borrow. Scalars are passed by value. Structs may be passed by
value or explicitly borrowed with these modes. V1 does not add `out`: proving
complete initialization across branches would complicate both language and API.

Within a call, mutable borrowed memory must not overlap any other borrowed
parameter. Multiple read-only borrows may overlap. Wrappers validate byte ranges
before entry; internal calls obey the same rule, proven statically or checked
before the callee executes. References cannot be stored, returned, retained or
converted to integers. Passing one `inout` parameter supports in-place work;
passing the same allocation as both input and output is an argument error.

Host arrays own aligned, fixed-length typed storage and cannot resize. Views
retain their allocation owner. The wrapper validates exact element type and
shape, alignment, byte capacity and all offset/size calculations, then pins the
owners and module for the whole call. No Squirrel code runs until the call ends.
There are no ownership decrements inside a kernel. Cleanup happens through one
wrapper exit path, for success and failure alike.

Fixed size refers to the compiled array extent. A `Vec3[1024]` kernel receives
a full 1024-element allocation even when `count` is 17; unused elements remain
unchanged unless the source writes them. A shorter allocation is rejected.
Arbitrary-size workloads use repeated fixed-capacity batches and a final partial
batch. Cross-batch state such as an accumulator is passed explicitly.

This is a real limitation for global graph algorithms or meshes requiring
arbitrary random access. Do not quietly introduce dynamic slices. Measure whether
batching is useful first; named compile-time size parameters can be added later
with explicit specialization and cache limits. Choosing an enormous array type
for every workload is not an acceptable general solution.

Host `.get()` returns a copy, not a reference into movable Squirrel storage.
Host array-to-array copies require identical types. Bulk conversions from normal
Squirrel arrays are explicit, validate every element and report the copy cost.
Do not automatically convert tables/arrays on every kernel call.

Initially accept only kernel-owned storage. Borrowing GI buffers, blobs or
foreign memory needs a separate audited lifetime/alignment adapter. Existing
Squirrel blobs expose resizable byte storage and are not by themselves a typed
ownership contract. No arbitrary address constructor is exposed to scripts.

## 5. Bounds, errors and termination

Every array access is checked unless range analysis proves it in bounds.
Negative signed indices are errors. Address calculations use checked wide
arithmetic; wrapping source integers must not make pointer arithmetic unsafe.
`require(condition)` is a runtime precondition/error operation with a source
location, not an optimizer assumption until it has actually been checked.

Compile errors include file, span, function, expected/actual types and a concrete
correction where possible. Runtime errors include bounds, arithmetic, failed
requirement, resource exhaustion and cancellation, with the kernel function and
source location. Stable machine-readable error codes accompany messages.

Errors return a status through the native calling convention; they never throw
C++ exceptions or longjmp through generated frames. Internal callers propagate
failure and the Squirrel wrapper converts it into a normal script error.

**Writes before an execution error remain visible.** Argument-validation errors
occur before writes; an error inside a kernel is not a transaction. Never replay
the operation in an interpreter after such an error. Callers requiring atomic
updates use a separate output buffer and commit only after success.

Start with synchronous execution on the calling thread. Kernels cannot yield,
perform I/O or call Squirrel/GI. Long runs therefore block the calling UI thread;
applications should use bounded batches. Include inexpensive cancellation/budget
polls on loop backedges, with an amortized counter and a documented maximum
poll interval. Polls do not invoke callbacks. Native call context supports a
host deadline/cancellation flag, polled using a monotonic clock at that interval.
Compilation has separate source, nesting, IR-size and work limits. This is
cooperative interruption, not a real-time deadline guarantee or hostile-code
security sandbox. Worker-thread scheduling is a separate later feature.

Proposed initial compiler limits: 1 MiB source, 64 KiB maximum local storage
per function and 256 KiB conservative cumulative local storage along any call
path. Account for backend spills/frame size and Windows stack probing too;
reject code exceeding the native-frame budget. Large arrays belong in caller
storage. Tune published limits from prototype measurements, not silently.

## 6. Data layout and native entry ABI

Define a kernel layout independent of the C++ struct ABI: scalar alignment equals
its byte width up to 8, bool occupies one byte, fields are naturally aligned in
declaration order, and struct size rounds up to its maximum field alignment.
Array stride is the element size including tail padding. Padding is initialized
and hidden from language-level operations. No packing directives in v1.

Use native-endian storage; it is not a portable file format. Expose field offsets,
size, alignment and a nominal schema identity through read-only host metadata.
That identity includes the module revision so stale views cannot silently bind
to a changed struct. Reusing persistent data after reload requires an explicit
validated conversion.

All exported kernels use one private, versioned native ABI conceptually like:

```c
KernelStatus entry(KernelCallContext *ctx,
                   const KernelArgument *args,
                   KernelResult *result);
```

Generated wrappers unpack typed arguments into efficient internal calls. No
libffi dispatch or Squirrel value inspection in inner loops. The ABI uses fixed
layouts and ordinary host calling conventions; internal functions use whatever
calling convention the backend chooses. Native pointers do not cross into the
script API. Bounds/alias validation happens once at entry where possible, while
data-dependent bounds checks remain in generated code.

The current Squirrel configuration uses 64-bit integers and double floats.
Host conversion must nevertheless check the actual build configuration. Full
`u64` values cannot all fit a signed Squirrel integer: represent out-of-range
values with a typed scalar wrapper, and never silently round through a float.
Small integers become checked Squirrel integers; f32 becomes an exactly
representable Squirrel double on the current configuration. Struct results become
typed host values, with an explicit operation to copy to a table.

## 7. Compiler architecture and backend

```text
.sqk source
    -> lexer / parser, with source spans
    -> name resolution / type checking / layout / call-graph validation
    -> typed control-flow IR with explicit memory effects and error edges
    -> backend lowering / optimization / machine-code generation
    -> executable module + validated Squirrel wrappers
```

Keep a small backend-neutral typed IR and verifier. It records widths, array
extents, parameter modes, struct offsets, checks, calls and source locations.
Use basic blocks, SSA scalar values and explicit loads/stores for aggregates.
Lower phi nodes to edge copies before register allocation; handle copy cycles
using a temporary. Memory effects and possible errors constrain reordering.
A simple bounded IR evaluator is a development/testing oracle, not an automatic
production fallback or a public alternative execution mode.

**Original backend plan (superseded by the measured LLVM implementation):**
Start with x86_64, covering System V and Windows x64 calling conventions. Reuse
audited instruction encoding and executable-memory techniques from the existing
JIT, not its bytecode analysis, object guards, write log or local-slot model.
The current x64 buffer has an 8192-byte limit, three pinned integer slots and
four float-cache slots; it is not a general typed register allocator. The new
backend needs width-aware instructions, a bounded growable code buffer, label
fixups and a frame layout independent of `MAX_FUNC_STACKSIZE`.

Implement the small amount of optimization we can justify with measurements:

1. Constant folding using the exact language arithmetic, copy propagation,
   unreachable-block and dead-value elimination.
2. Scalar replacement of small structs, constant field/stride addressing and
   conservative direct-call inlining with code-size limits.
3. Liveness analysis and linear-scan register allocation with separate integer
   and floating register classes, spills, fixed-register constraints, ABI
   clobbers and correct edge copies. Keep loop-carried values in registers.
4. Canonical induction-variable recognition, redundant-check elimination and
   invariant movement only when safe. A validated `count <= CAPACITY` and a
   canonical increasing loop should remove repeated bounds checks.
5. Profile-guided priorities for additional instructions/peepholes. First use
   scalar integer and scalar SSE2 floating instructions on x64; this does not
   promise packed SIMD. Add narrowly supported vectorized map loops only when
   their measured benefit justifies the legality analysis and extra encodings.

Do not build a broad optimizer or vectorizer merely to imitate an established
compiler. Scalar native code without VM dispatch may already meet the product
goal; memory traffic, spills and call costs must still be measured.

**LLVM is now the implemented default after the prototype exposed a substantial
performance gap.** Its ORC/LLJIT infrastructure supplies runtime compilation and
linking; LLVM also has loop and SLP vectorizers. These could replace substantial
backend work, but our frontend, runtime contract and testing still remain.
See [LLVM ORC](https://llvm.org/docs/ORCv2.html) and
[LLVM vectorizers](https://llvm.org/docs/Vectorizers.html). Actual vectorization
still depends on legality and profitability.

The dependency decision needs a written comparison using the same kernel IR
and semantics: warm throughput, whole-operation speedup, compilation latency,
runtime memory, packaged size, Windows/Linux build effort and ongoing work
required for our backend. A suggested trigger to investigate LLVM is failure to
meet the application performance gate after the basic allocator and loop passes,
or a demonstrated need for broad SIMD optimization. Adoption requires a material
benefit on the real pilot, not just an attractive microbenchmark. If our backend
meets the gates, stop there. A developer-only comparison can be added without
shipping two backends or adding a production dependency.

AsmJit remains an option only if instruction encoding/register allocation is the
specific bottleneck in development: its Compiler interface supplies allocation
and calling-convention support, but it does not remove our higher-level optimizer
work. See [AsmJit's Compiler documentation](https://asmjit.com/doc/group__asmjit__compiler.html).
Do not add it by default either.

Preserve error ordering and
the visible prefix of writes on failure. Do not hoist a potentially failing
check ahead of prior writes unless equivalent; use guarded fast paths when
appropriate. Strict FP reductions cannot be freely reassociated.

If LLVM is evaluated, emit no `nsw`, `nuw`, `inbounds`, `noalias` or fast-math promises unless
their preconditions have been proved or enforced. Guard division, conversions
and shifts before emitting operations that could produce poison or target traps.
Writable parameter disjointness can justify useful alias information, but that
promise must also hold at every internal call.

## 8. Compilation lifecycle, code cache and diagnostics

Compile the module synchronously on `load`, resolve all exports, then publish an
immutable module handle. Keep mutable compiler state local to a compilation.
Failure publishes no callable exports. Calls hold a strong module
reference; unload waits for the final wrapper/call reference. Reload creates a
new module, leaving existing handles valid until released.

V1 uses an in-process cache only. Identity includes canonical source content,
language version, compiler/backend build identity, ABI/layout version, target
triple, CPU/OS-enabled features, optimization and arithmetic settings. Validate
source changes on explicit reload. Never key just by path or modification time.
Cache retention has a bounded memory budget; active code is not evicted.

Persistent object caching is a later milestone. Store relocatable objects, never
absolute executable pointers. Use atomic writes, per-user ownership, integrity
checks and complete compatibility keys. A hash detects accidental corruption;
it does not authenticate hostile cache entries. Source remains the authority,
and corrupt/incompatible cache entries are rebuilt. Packaged apps must work with
an unwritable or absent cache directory.

Normal API remains `load`, typed allocation and function calls. Developer tooling
can expose compile timings, cache hits, copies, code size, typed IR, backend IR,
assembly and missed-vectorization reasons through diagnostics. Do not put these
options into every manifest. Retain source maps for runtime error locations;
native debugger line stepping and profiler registration can follow the MVP.

## 9. Repository and packaging integration

Observed integration points in the current checkout:

- `src/sqgi_vm.c` registers SQGI helper APIs and owns VM teardown. Register
  `sqgi.kernel` here and integrate orderly wrapper/module cleanup.
- `src/sqgi_import.c` resolves Squirrel imports. Reuse/refactor its path resolution
  for kernel loads without changing what an ordinary `.nut` import means.
- `CMakeLists.txt` currently requests C++11 and makes `SQ_ENABLE_JIT` optional.
  Add an independent `SQGI_ENABLE_KERNELS` build option. Keep the initial backend
  in its own C++11 target with a narrow C-compatible adapter. If LLVM is later
  selected, isolate its required C++ standard and pinned version in that target.
- `Squirrel3/squirrel/jit/sqjit_code.cpp` already demonstrates writable-to-executable
  memory transitions on POSIX/Windows. Preserve that policy in the new backend,
  but do not couple kernel lifetimes to Squirrel weak-reference bookkeeping.
- Existing blob support is registered in the VM; implement a separate typed
  storage abstraction rather than treating blobs as automatically safe arrays.

Suggested new files/areas:

```text
src/kernel/          parser, types, layout, checked IR, compiler and runtime
src/kernel/x64/      instruction selection, register allocation, encoding, ABI
src/kernel/native/   code allocation, relocations, module lifetime
src/sqgi_kernel.*    Squirrel registration, arguments, typed host values
test/kernel/        language, semantic, ABI, integration and fuzz fixtures
tools/sqkernelcheck standalone checker using the same frontend
docs/kernels/       tutorial, language specification, host API, performance
```

The default backend adds no development or runtime library dependency. The end
user needs no compiler executable, development headers, shell or external compile
service. If LLVM later earns adoption, SQGI builders need its development
libraries and packaged applications must include its required runtime components;
measure and explicitly account for that distribution footprint.

Ship `.sqk` sources using sqgipkg's normal resource mechanism and the kernel-enabled
SQGI runtime. Do not require per-kernel build commands or
optimization settings. Check sources during package validation, but compile for
the actual CPU at application runtime. Preserve supported Linux distribution
baselines, including any compiler dependency if later adopted. Native Windows acceptance uses
PowerShell and an MSVC/clang-cl runtime build, not Wine alone.

An unsupported/disabled backend produces a clear capability error at load time.
There is no silent Squirrel fallback. Existing applications that never request
kernels continue to work with a kernel-disabled build. Existing JIT behaviour
and its tests remain independent; this proposal does not remove it.

## 10. Implementation sequence and acceptance gates

| Phase | Deliverable | Exit condition |
| --- | --- | --- |
| 0: semantics and native spike | Hand-built typed examples: scalar arithmetic, fixed-array transform, reduction and a bounds-error path; dependency-free x64 backend on Linux and Windows | Native execution, correct error return, measured code/compile/packaging costs and emitter gaps recorded |
| 1: frontend and oracle | Lexer/parser, types, structs, layout, fixed arrays, control flow, call graph, checker and bounded reference evaluator | Accepted/rejected source corpus; deterministic diagnostics; arithmetic and layout specification executable as tests |
| 2: native language subset | Lower verified IR, intrinsics, calls, checked indexing, error propagation and resource limits | Differential tests agree with reference evaluator on successful results, errors and partial writes |
| 3: Squirrel integration | Typed values/arrays, wrappers, pinning, modes/alias checks, source paths and module lifecycle | Scalar and struct/array examples callable from Squirrel, no hidden per-call copies, no lifetime failures on success/error/unload |
| 4: useful performance | Register allocation, range-check elimination, native internal calls, benchmarks and one application pilot; limited SIMD or LLVM comparison only if justified | Correctness retained and measured end-to-end benefit including conversion/compilation amortization; explicit dependency decision |
| 5: ship-ready runtime | sqgipkg resources/dependencies, docs, diagnostics, disabled-backend behaviour, native Windows CI | Packaged demo runs on clean supported Linux and Windows machines without compiler tools or MSYS2 |
| 6: subsequent work | Linux AArch64, persistent cache and bulk foreign-buffer adapters | Each feature independently passes platform, lifetime, cache or adapter tests |

Phases 0–3 form the functional prototype; 0–5 form the first releasable version.
Estimate calendar effort after phase 0 exposes backend/build costs and phase 1
fixes the language size. Do not label this a quick adaptation of the current JIT.

Choose one numerical application pilot after profiling. Candidate areas visible
in the example repositories include FoamCutter profile geometry and RouteTastic
geometry/obstacle processing. These are candidates, not confirmed bottlenecks;
RouteTastic already calls native helpers in some paths. Compare against those
existing implementations rather than claiming all current work is interpreted.

## 11. Testing and performance gates

Tests must cover behaviour, not just successful compilation:

- Type errors, duplicate names, forbidden recursion/layouts, out-of-range
  constants, malformed source and compile resource limits.
- Integer boundaries, wrapping, exceptional division, bad shift counts, NaNs,
  infinities, signed zero, conversions and host FP-state restoration.
- Array indices at both boundaries, multidimensional stride, padding, partial
  batches, nested structs and full-width u64 host transport.
- Exact/partial overlapping views, read-only aliases, internal-call aliases,
  incompatible schema identities, invalid capacities and size overflows.
- Errors after earlier writes, propagation through several native functions,
  cancellation, pin release and module teardown/reload during retained handles.
- Differential generated programs against the reference evaluator with bounded
  loops; exact integer comparisons and specified floating comparisons. Compare
  error locations and modified outputs, not just return values.
- ABI tests on native Linux and Windows: preserved registers, stack alignment,
  stack probes, FP state, result/status handling and repeated load/unload. Later
  run the same suite on AArch64. Host ASan/UBSan is useful but does not automatically
  instrument JIT machine code; add generated-code checks and guard-page tests.

Benchmark transforms, dot/reduction, small matrix operations, a branch-heavy
geometry predicate and the actual application pilot. Include tiny, full and
partial batches. Compare ordinary Squirrel, existing native helpers and equivalent
optimized C++ with matching arithmetic/alias rules and target features.

Report cold load/compile latency, warm invocation overhead, execution throughput,
bulk conversion time, total application operation time, peak memory and added
distribution size separately. Include compiler/backend versions and hardware.
Record whether SIMD is actually generated. Tiny kernels need not beat Squirrel
after boundary costs; report the batch-size break-even point.

Proposed targets, to ratify after the spike: within 2x comparable optimized C++
throughput on representative batch kernels, under 100 ms warm-process compilation
for a small module, and a demonstrable pilot speedup after amortization. These
are goals, not current measurements or universal guarantees. Cold compiler
initialization and total packaged footprint get explicit budgets from measured
prototype data before adopting the backend.

## 12. Decisions to retain and features to defer

Recommended v1 decisions: separate `.sqk` source; fixed extents; explicit types;
plain structs; direct functions; borrowed arrays; checked memory access; defined
integer wrapping; conservative FP; synchronous compile-at-load; no interpreter
replay; one backend; one default optimization policy.

Defer runtime-sized arrays, size generics, pointers, allocation inside kernels,
foreign calls, callbacks, closures, recursion, mutable globals, threads, atomics,
GPU targets, relaxed floating math and build-time native artifacts. Each would
expand the contract substantially. The backend spike may change the compiler
choice, but should not weaken this small language contract to fit an emitter.
