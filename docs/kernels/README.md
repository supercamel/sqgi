# Typed kernels

`sqgi.kernel` compiles a small, explicitly typed C-like language into native
code for numerical work. Use it for calculations that benefit from keeping data
in typed arrays and running a complete loop in one call from Squirrel.
Compilation runs inside the application and reports syntax or type errors before
the module can be used.

## Build and run

Typed kernels and the LLVM bytecode JIT are enabled in the default SQGI build.
Both require LLVM 18 development headers and a matching library when building
SQGI. On Ubuntu 24.04, install `llvm-18-dev` along with the normal
[build dependencies](../index.md#build-from-source-on-linux).

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j4
build/sqgi demo/kernels/geometry.nut
```

For LLVM outside the normal search paths, set `LLVM_ROOT`, or set
`SQGI_LLVM_INCLUDE_DIR` and `SQGI_LLVM_LIBRARY` explicitly.

To build without LLVM, select `-DSQGI_KERNEL_BACKEND=NATIVE` and
`-DSQGI_BYTECODE_JIT_BACKEND=AUTO`. The NATIVE kernel backend supports x86-64
and has smaller compilation limits. `sqgi.kernel.backend` reports `"llvm"` or
`"native"`; `sqgi.kernel.available` reports whether kernels can run on the host.
If SQGI was built with `SQGI_ENABLE_KERNELS=OFF`, the `sqgi.kernel` table is absent.
The packaged Android runtime has kernels disabled.

When distributing an LLVM-enabled application, include the LLVM runtime library
and its dependencies. End users do not need compiler tools or development headers.

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
`load(path)` resolves paths against the process working directory, then falls
back to `SQGI_APP_SHARE` for relative paths in packaged applications. Paths are
not relative to the importing script. `sqgipkg` automatically bundles literal
`sqgi.kernel.load("path.sqk")` references from staged scripts; computed paths
require an explicit `files` mapping. Only `export` functions become module functions; class names become constructors.
Helper functions must be defined before callers. Closures and typed buffers
retain the compiled module independently of the module table's lifetime.

The [geometry example](https://github.com/supercamel/sqgi/blob/master/demo/kernels/geometry.sqk) also demonstrates
helper functions and reduction over struct fields.

## Language

- Scalars: `i64`, `f64`, `bool`; functions may return a scalar or `void`.
- Struct declarations with `i64`/`f64` fields, stored in typed arrays.
  Aggregate values and whole-struct assignment are unsupported.
- Classes with fixed `i64`/`f64`/`bool` fields, persistent reference identity and
  typed methods. See [typed modules](typed-modules.md).
- Parameters: scalars by value; fixed arrays `in T a[N]` / `inout T a[N]`,
  runtime-sized arrays `in T a[]` / `inout T a[]`, and class references
  `in ClassName c` / `inout ClassName c`. Arrays expose `a.len()`.
- Initialized scalar locals; zero-initialized local classes and fixed-size
  scalar/struct arrays; nested lexical blocks, assignment and `+=/-=/*=`.
- `+`, `-`, `*`, `/`, integer `%` and `%=`, unary minus, comparisons, `!`, and short-circuit `&&/||`.
- Braced `if/else`, `for`, `while`, `require`, and `return`.
- Direct helper and method calls with scalars, arrays and class references,
  including void calls and early returns. Calls retain borrow checks;
  helpers/methods must be declared before use and recursion is rejected.
- Line comments, block comments, decimal integer/float literals and exponents.

All types are explicit and operands must match. Literals are not contextually typed: `1` is `i64` and
`1.0` is `f64`. Use `i += 1`; increment operators are not implemented. For-loop
steps must be straight-line assignments. Locals require initialization and
non-void functions must return on every path recognized by the checker.

Integer add/subtract/multiply/negation wrap in 64 bits. Integer division truncates
toward zero and rejects division by zero and `INT64_MIN / -1`. Integer remainder
`%` follows truncating division: a nonzero result has the dividend's sign
(`-7 % 3 == -1`, `7 % -3 == 1`). Zero divisors raise an arithmetic error;
`INT64_MIN % -1` is defined as zero. `%` has the same precedence as `*` and `/`,
and `%=` supports scalar, array-element and field assignments. Both require
i64 operands. Floating code uses
scalar binary64 operations without reassociation or contraction. Entry establishes
nearest-even rounding, gradual underflow and masked hardware floating exceptions;
exit restores the caller's floating-point settings. NaNs, infinities and signed zero are supported.
Full-width signed values can enter through arguments; the minimum i64 decimal
literal is not yet supported because unary minus follows positive-literal range
checking.

Not implemented: other numeric widths, casts, bitwise operators,
constants, nested structs, struct values, runtime-sized local/multidimensional
arrays, `break`,
`continue`, forward calls, tables, inheritance, strings, non-math intrinsics, pointers,
managed heap allocation inside kernels, callbacks, foreign calls, threads or GPU
execution.
These produce compilation errors rather than interpreter fallback.

## Host buffers and errors

`module.array("i64"|"f64"|struct_name, count)` creates fixed-size, zero-initialized
storage (count may be zero). `len()` returns its runtime length. `get(index)` returns a scalar or copied field table; `set(index, value)`
validates types and all struct fields before writing. Integer and floating host
values are distinct: pass `2.0` to an f64 parameter. Buffers must originate from
the same compiled module and match the declared type. Fixed array parameters
require an exact extent; runtime-sized parameters accept any allocated length.

No implicit copies occur on a kernel call. Per-element `set/get` conversion is
explicit and can be expensive: retain typed arrays between calls. There are no
views, bulk transfers or foreign-buffer adapters yet.

Multiple read-only arguments may share a buffer. Any overlap involving `inout`
is rejected before execution. There are no buffer views, so buffer
identity proves overlap. Owners remain rooted for the whole synchronous call,
and generated code cannot reenter the VM, resize or release their storage.

Native indexing checks reject negative or excessive indices before address
calculation. Requirements, integer division and loop budgets also return errors
through the call boundary, including the source filename/line. Writes preceding
an execution error remain visible. There is no rollback or interpreter replay.
A failed boundary validation performs no kernel writes.

Modules allow up to 1 MiB of source, 64 functions, 32 parameters per function,
64 fields per struct and nesting depth 64. With LLVM, call-local storage is
limited to 64 KiB per function and 256 KiB along a call chain, with call depth
at most 32. These are source-storage limits, not total machine-stack limits.
The NATIVE backend has smaller storage and code-size limits. Exceeding a
compiler limit raises a compilation error; there is no interpreter fallback.

Host arrays contain at most 1,048,576 elements and occupy at most 64 MiB.

Each Squirrel call has a fixed budget of 1,000,000 loop-condition evaluations,
including the final false condition. There is no
wall-clock deadline or asynchronous cancellation API yet. Calls are synchronous
and may block the UI. These checks do not make generated code a security sandbox.

## Using kernels efficiently

Load or compile a module once, retain its functions, and reuse its typed buffers.
Repeated `load` calls recompile the source. For small calculations, compilation
and per-element `set`/`get` conversion can cost more than execution saves.
Batch work inside a kernel instead of calling it once per element from Squirrel.

Kernel calls are synchronous. Keep interactive workloads bounded so a long
calculation does not block the application's main loop.

## Standard math functions

Math calls are built into kernel expressions: no import or Squirrel callback is
needed. All arguments must be `f64` (write `sqrt(4.0)`, not `sqrt(4)`). Predicates
return `bool`; other functions return `f64`. Helpers declared earlier in the
module can shadow these names. Recursive helper calls remain unsupported.

| Family | Functions |
|---|---|
| Roots and powers | `sqrt`, `cbrt`, `hypot`, `pow` |
| Trigonometry | `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2` |
| Hyperbolic | `sinh`, `cosh`, `tanh`, `asinh`, `acosh`, `atanh` |
| Exponential and logarithmic | `exp`, `exp2`, `expm1`, `log`, `log2`, `log10`, `log1p` |
| Magnitude and rounding | `fabs`, `abs` (f64 alias), `floor`, `ceil`, `trunc`, `round` |
| Floating remainder and selection | `fmod`, `remainder`, `fmin`, `fmax`, `copysign` |
| Error and gamma | `erf`, `erfc`, `tgamma`, `lgamma` |
| Classification (`bool` result) | `isnan`, `isinf`, `isfinite`, `signbit` |

`atan2(y,x)`, `pow(x,y)`, `hypot(x,y)`, `fmod(x,y)`, `remainder(x,y)`,
`fmin(x,y)`, `fmax(x,y)`, and `copysign(x,y)` take two arguments; the rest take one.
`round` rounds halfway cases away from zero. `fmod` uses a quotient truncated
toward zero; `remainder` uses the nearest integer quotient, ties to even. Integer
`%` remains a separate i64 operation. Results follow binary64/libm behavior:
domain errors and poles produce NaN/infinity rather than a kernel exception.
Use `require(isfinite(value))` when invalid/nonfinite results should stop work.
Math accuracy follows the platform library; bitwise portability across different
platforms is not promised. `errno` is not part of the kernel interface.

```c
export f64 wave(f64 phase, f64 amplitude) {
    require(isfinite(phase) && isfinite(amplitude));
    return sin(phase) * amplitude;
}
```

See [the math demo](https://github.com/supercamel/sqgi/blob/master/demo/kernels/math.nut) for a complete example.
