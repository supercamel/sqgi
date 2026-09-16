# Typed kernel prototype

This is an experimental runtime compiler for a small C-like language,
independent of the Squirrel bytecode JIT. Source is parsed and type-checked,
then compiled into native code. The reference evaluator is linked only into tests.

The default backend now uses **LLVM 18 ORC/LLJIT with O3 optimization**. It promotes
locals into registers and optimizes/vectorizes loops where the existing checks
and strict arithmetic semantics allow it. Compilation runs inside the application;
there is no compiler subprocess, generated C++ or interpreter fallback.

The original dependency-free x64 emitter remains available explicitly as
`SQGI_KERNEL_BACKEND=NATIVE`. It is a smaller, slower alternative and a useful
comparison backend. Kernel support itself remains opt-in. The LLVM backend has
been validated on Linux x86_64; Windows x64 tests under Wine cover the NATIVE
backend, not LLVM. Native Windows/MSVC acceptance remains outstanding.

## Build and run

Install LLVM 18 development headers and its matching shared library (on Ubuntu
24.04, the `llvm-18-dev` package), then from the repository root:

```sh
cmake -S . -B build-kernels -G Ninja \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSQGI_ENABLE_KERNELS=ON -DSQGI_KERNEL_BACKEND=LLVM -DSQ_ENABLE_JIT=OFF
cmake --build build-kernels --target sqgi sqgi-bin sqgi_test_kernel_native -j4
ctest --test-dir build-kernels -L kernel --output-on-failure
LD_LIBRARY_PATH="$PWD/build-kernels${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
  ./build-kernels/sqgi test/test_kernel.nut
```

For an SDK outside the normal paths, set `LLVM_ROOT`, or set
`SQGI_LLVM_INCLUDE_DIR` (containing both `llvm-c/` and `llvm/`) and
`SQGI_LLVM_LIBRARY` explicitly. Headers and runtime must both be LLVM 18. No
LLVM dependencies are searched for when kernel support is disabled.

To build the minimal backend without LLVM, use `-DSQGI_KERNEL_BACKEND=NATIVE`.
The tested Windows cross-build uses this setting; its executable runs directly
without an MSYS2 shell. LLVM on Windows additionally needs a compatible LLVM 18
C API library and has not been validated here.

The explicit Linux library path prevents an installed `libsqgi` from overriding
this build. CTest sets the matching library path automatically. Unsupported hosts
expose `sqgi.kernel.available == false` and reject compilation. With the CMake
option off, the `sqgi.kernel` table is absent. `sqgi.kernel.backend` reports
`"llvm"` or `"native"`.

Packaged LLVM-enabled applications must include a compatible LLVM runtime library
and its dependencies; end users do not need development headers or compiler tools.
The development host's shared LLVM library occupies about 118 MiB uncompressed.
A measured LLVM benchmark process peaked at about 60 MiB resident memory; these
costs are additional reasons to retain the smaller backend.

## Example

```c
// transform.sqk
struct Point { f64 x; f64 y; };

export void transform(in Point input[8], inout Point output[8],
                      i64 count, f64 scale) {
    require(count >= 0 && count <= 8);
    for (i64 i = 0; i < count; i += 1) {
        output[i].x = input[i].x * scale;
        output[i].y = input[i].y * scale;
    }
}
```

```squirrel
local m = sqgi.kernel.load("transform.sqk");
local input = m.array("Point", 8);
local output = m.array("Point", 8);
input.set(0, { x = 3.0, y = 4.0 });
m.transform(input, output, 1, 2.0);
print(output.get(0).x + "\n"); // 6
```

For in-memory source, use `sqgi.kernel.compile(source, optional_filename)`.
`load(path)` currently resolves paths against the process working directory,
not against the importing script. Only `export` functions become module methods.
Helper functions must be defined before callers and are compiled by bounded
inlining. Closures and typed buffers retain the compiled module independently of
the module table's lifetime.

The tested example [geometry.sqk](../../test/kernel/geometry.sqk) also demonstrates
helper functions and reduction over struct fields.

## Implemented language

- Scalars: `i64`, `f64`, `bool`; functions may return a scalar or `void`.
- Struct declarations with `i64`/`f64` fields, stored in fixed arrays. Fields
  occupy eight-byte cells in declaration order; struct stride is their total
  size. No aggregate values or whole-struct assignment yet.
- Parameters: scalars by value; fixed arrays declared `in T a[N]` or
  `inout T a[N]`. Array extents are positive integer literals.
- Initialized scalar locals, nested lexical blocks, assignment and `+=/-=/*=`.
- `+`, `-`, `*`, `/`, unary minus, comparisons, `!`, and short-circuit `&&/||`.
- Braced `if/else`, `for`, `while`, `require`, and `return`.
- Direct scalar helper calls, including early returns and control flow inside
  helpers. Helpers are declared before use; recursion is rejected.
- Line comments, block comments, decimal integer/float literals and exponents.

All types are explicit and operands must match. Unlike the full proposed
language, this prototype does not contextually type literals: `1` is `i64` and
`1.0` is `f64`. Use `i += 1`; increment operators are not implemented. For-loop
steps must be straight-line assignments. Locals require initialization and
non-void functions must return on every path recognized by the checker.

Integer add/subtract/multiply/negation wrap in 64 bits. Integer division truncates
toward zero and rejects division by zero and `INT64_MIN / -1`. Floating code uses
scalar binary64 operations without reassociation or contraction. Entry establishes
nearest-even rounding, gradual underflow and masked hardware floating exceptions;
exit restores the caller's MXCSR. NaNs, infinities and signed zero are supported.
Full-width signed values can enter through arguments; the minimum i64 decimal
literal is not yet supported because unary minus follows positive-literal range
checking.

Not implemented: other numeric widths, casts, remainder/bitwise operators,
constants, nested structs, struct values, local/multidimensional arrays, `break`,
`continue`, forward calls, array arguments to helpers, intrinsics, pointers,
allocation inside kernels, callbacks, foreign calls, threads or GPU execution.
These produce compilation errors rather than interpreter fallback.

## Host buffers and errors

`module.array("i64"|"f64"|struct_name, count)` creates fixed-size, zero-initialized
storage. `get(index)` returns a scalar or copied field table; `set(index, value)`
validates types and all struct fields before writing. Integer and floating host
values are distinct: pass `2.0` to an f64 parameter. Buffers must originate from
the same compiled module and match the exact declared type and extent.

No implicit copies occur on a kernel call. Per-element `set/get` conversion is
explicit and can be expensive: retain typed arrays between calls. There are no
views, bulk transfers or foreign-buffer adapters yet.

Multiple read-only arguments may share a buffer. Any overlap involving `inout`
is rejected before execution. There are no views in the prototype, so buffer
identity proves overlap. Owners remain rooted for the whole synchronous call,
and generated code cannot reenter the VM, resize or release their storage.

Native indexing checks reject negative or excessive indices before address
calculation. Requirements, integer division and loop budgets also return errors
through the call boundary, including the source filename/line. Writes preceding
an execution error remain visible. There is no rollback or interpreter replay.
A failed boundary validation performs no kernel writes.

Limits: 1 MiB source; 65,536 tokens; nesting depth 64; 64 functions; 32 parameters;
64 fields per struct; 384 native temporary slots per function after inlining;
8,192 IR instructions per function; 1 MiB emitted code per function. Host arrays
contain at most 1,048,576 elements and 8,388,608 eight-byte cells (64 MiB).

Each Squirrel call has a fixed budget of 1,000,000 loop-condition evaluations;
loop headers decrement it, including the final false condition. There is no
wall-clock deadline or asynchronous cancellation API yet. Calls are synchronous
and may block the UI. These checks do not make generated code a security sandbox.

## Tests and validation

`kernel` CTest label includes two test programs:

- Native/reference tests: expected values, deterministic randomized inputs,
  NaN comparisons, integer boundaries, short circuiting, helper returns, loop
  carry, struct strides, bounds errors, partial writes, budget exhaustion, FP
  state restoration, malformed-source rejection, source truncation/mutation,
  and repeated executable allocation/unmapping.
- Squirrel integration: source loading, typed values, native calls, scalar and
  struct arrays, alias and shape validation, exact numeric host types, setter
  atomicity, error propagation, execution budgets, independent schema identity,
  and retained function/module/buffer lifetime through garbage collection.

Both pass with LLVM on Linux in RelWithDebInfo and Debug with ASan/UBSan.
The same semantic suite passes with NATIVE. Windows x64 native/reference and
Squirrel integration tests pass under Wine using NATIVE; LLVM on Windows is
unverified. Existing import, JSON and language regression checks are also run
with the Squirrel JIT disabled.

Additional optimizer regressions compare every output cell, remaining execution
budget and failure location for large map/fill/copy loops, vector tails, negative
counts, bounds failures and requirements that fail after a write. A separate
floating-point case rejects unintended multiply/add contraction.
ASan/UBSan instruments the compiler and host runtime, not emitted machine code;
explicit checked indexing and differential native tests are still necessary.

To repeat sanitizer validation, configure another build with
`-DSQGI_ENABLE_ASAN=ON -DCMAKE_BUILD_TYPE=Debug` and the same kernel/JIT options.

## Performance and tradeoffs

Reproduce the informational benchmarks, which are not CTest speed gates:

```sh
cmake --build build-kernels --target sqgi_kernel_benchmark
./build-kernels/sqgi_kernel_benchmark
LD_LIBRARY_PATH="$PWD/build-kernels" ./build-kernels/sqgi test/kernel/benchmark.nut
```

On GCC/Clang native builds, the comparison C++ loop uses `-O3 -march=native
-ffp-contract=off`, matching LLVM's optimization level, host CPU features and
separate multiply/add semantics. This corrects the original prototype comparison,
which used a less aggressively optimized C++ baseline. The compiled kernel and
C++ loop compute the same outputs, but only the kernel includes the language's
error/budget machinery. The C++ benchmark includes kernel entry overhead but
excludes Squirrel wrappers; the script benchmark includes wrappers and excludes
output conversion.

Seven-run medians on Linux x86_64, Intel i7-12700, GCC 13.3.0, LLVM 18.1.3,
RelWithDebInfo, pinned to CPU 0, with the Squirrel JIT disabled:

| Metric: 1,024-element affine transform | NATIVE | LLVM |
| --- | ---: | ---: |
| Cold compile of the small kernel | 0.035 ms | 7.59 ms |
| Warm batch through C++ entry | 2,400 ns | 75 ns |
| Kernel / optimized C++ time, median paired ratio | 35.94x | 1.01x |
| 3,000 batches through Squirrel | 8.48 ms | 0.629 ms |
| Interpreted Squirrel / kernel, median paired ratio | 6.31x | 85.24x |

On this benchmark LLVM is about 32x faster than the original native emitter at
its native entry, about 13.5x faster through the script boundary, and comparable
to optimized C++. Individual native timings varied with host load/frequency;
these numbers are not a general application speedup claim. Explicit conversion
of 1,024 input elements through `set()` cost roughly 0.06 ms separately.

Cold compilation is substantially more expensive. For 3,000 batches, the LLVM
script benchmark's roughly 7.7 ms compile plus 0.63 ms execution is approximately
break-even with NATIVE's warm execution alone. Compared with interpreted
Squirrel's roughly 53.5 ms, that workload still benefits after compilation.
Load kernels once, keep the returned module/functions and reuse typed buffers.
There is no process-wide or persistent compiled-code cache yet; repeated `load`
recompiles. Each compiled function currently owns its own LLJIT instance.

The LLVM adapter uses the C API, preserving the repository's C++11 build. It
verifies IR before and after optimization, checks integer division before
emitting potentially trapping operations, and makes no unchecked `noalias`,
no-overflow or fast-math promises. Fuel is a local value written back at all exits,
allowing optimization without changing partial-error/budget semantics. Compiler
runtime memory helpers may resolve from the host; arbitrary foreign calls remain
unavailable to kernel source. See [LLVM ORC](https://llvm.org/docs/ORCv2.html) and
[LLVM's pass manager](https://llvm.org/docs/NewPassManager.html) for the backend
interfaces used here.

Next work: a profiled application pilot, broader throughput/latency benchmarks,
shared module-level compilation/cache management, and native Windows LLVM
acceptance. The [full design](../kernel-design-2026-09-16.md) remains the longer-term
proposal; this prototype implements a smaller language subset.
