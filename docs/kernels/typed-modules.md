# Typed modules

The kernel compiler supports persistent typed classes, runtime-sized borrowed
arrays, call-local objects and scratch arrays, and helper/method calls that stay
in native code. This is an incremental
extension of `sqgi.kernel`, using the same LLVM compiler and retaining the NATIVE
backend. Existing `.sqk` programs and APIs continue to work.

```c
class Counter {
    i64 value;
    void add(i64 amount) { this.value += amount; }
    i64 consume(in i64 values[]) {
        for (i64 i = 0; i < values.len(); i += 1) {
            this.add(values[i]);
        }
        return this.value;
    }
};
export i64 consume(inout Counter counter, in i64 values[]) {
    return counter.consume(values);
}
```

```squirrel
local m = sqgi.kernel.compile(source);
local counter = m.Counter(); // zero-initialized fields
counter.value = 10;
counter.add(2);
local values = m.array("i64", 3);
values.set(0, 4);
values.set(1, 5);
values.set(2, 6);
print(m.consume(counter, values) + "\n"); // 27
local same = counter; // reference identity, not a field copy
same.add(1);
assert(counter.value == 28);
```

The complete [controller demo](../../demo/kernels/typed_objects.nut) includes
floating-point and boolean state, an independent result check and several array
lengths. Run it from the repository root. The
[controller benchmark](../../demo/benchmarks/kernels/typed_objects.nut) compares a
compiled driver, calls from a Squirrel loop into scalar methods, and a Squirrel
class implementing the same calculation. It reports per-driver-call times;
compilation, allocation, input conversion and output validation are outside timing.

## Semantics and ownership

- A class has a fixed schema of scalar `i64`, `f64` and `bool` fields. Fields must
  precede methods; member names beginning with `_`, `this` and `constructor` are
  reserved. Methods have explicit scalar/void return types and use `this.field`.
- `module.ClassName()` creates a zero-initialized instance in Squirrel-owned
  userdata. Assignment of its handle shares the instance. These are typed objects,
  not ordinary extensible Squirrel class instances: `typeof` reports `userdata`,
  and Squirrel inheritance and native `bindenv(instance)` do not apply. Use
  `object.method(...)`, `method.call(object, ...)`, or a capturing closure.
- Host field writes enforce exact types before mutation; unknown fields cannot
  be added. Class constructors currently take no arguments. Set initial fields
  explicitly or call a typed initialization method.
- Class references in compiled functions require `in` or `inout`. All methods
  currently borrow their receiver mutably, including methods that only read.
  Readonly functions can read fields through `in ClassName` parameters.
- `in T values[]` and `inout T values[]` accept runtime lengths, including zero.
  `values.len()` is an i64 value; indexing checks the actual length. This is
  runtime-sized storage, not a resizable list. Allocation remains in Squirrel.
  Struct arrays also support runtime lengths; class-reference arrays do not yet.
- Helpers accept borrowed arrays and instances. Fixed arrays can be passed to
  runtime-sized helper parameters. A runtime-sized parameter cannot be passed
  to a fixed-extent helper, even if a runtime check established the length.
- Calls cannot strengthen a readonly borrow to a writable borrow. Repeated
  mutable arguments are rejected at compile time inside a module and at the host
  boundary before execution. Readonly arguments may alias.
- Methods and helpers must be defined before their callers. Calls are expanded
  into typed IR and then optimized by LLVM, including inside loops. They do not
  call back into Squirrel. There is no recursion, virtual dispatch or separate
  native call stack yet; the existing expansion/frame limits still apply.
- Host objects, buffers and method closures retain their module/code/schema. Arguments
  stay rooted throughout execution. Native code borrows their storage and
  cannot allocate managed objects, resize host storage, trigger GC or retain
  references after returning. Call-local storage uses the native frame.
  No new collector is introduced: instance fields cannot hold managed references
  in this slice, so there are no new internal reference cycles to trace.
- Scalar method calls use the existing checked leaf adapter; debug hooks use the
  regular native adapter. The same bounds, strict arithmetic, error propagation
  and shared per-call loop budget apply to compiled method chains. Writes before
  an error remain visible and execution is never retried.

## Keeping a whole single-object workflow compiled

Compiled code can now declare zero-initialized, call-local typed storage:

```c
Counter counter;        // Fields start at 0 / 0.0 / false.
i64 scratch[16];         // Fixed-size native scratch array.
f64 samples[8];
Point points[4];         // Array of an earlier-declared struct.
```

Local objects have the same typed fields and method syntax as host-created
objects. Local arrays support indexing, `.len()`, and borrowing into helpers.
For example, a compiled function can create one object and keep its entire
stateful time loop native:

```c
export f64 simulate(i64 steps, f64 dt) {
    Oscillator body;
    body.position = 1.0;
    return body.run(steps, dt);
}
```

The [complete example](../../demo/kernels/compiled_workflow.sqk) implements
`run()` with a four-element scratch history and calls `this.advance(dt)` for
each step. Squirrel invokes `module.simulate(4096, 0.125)` once. A persistent
host-created oscillator can also invoke the same compiled `run()` method.

Local storage has lexical visibility and cannot escape: reference returns,
reference assignment and managed-reference fields are unsupported. It lives in
the current native call frame, including when helpers are inlined, and requires
no managed allocation or GC. Initialization occurs each time execution reaches
the declaration, so declarations inside loops reset every iteration. Distinct
local declarations and separate helper invocations get independent storage.

Local array lengths must be positive literals. Runtime-sized local arrays,
arrays of classes, bool arrays and scalar struct locals are not supported yet.
The existing 384-cell native frame limit counts local storage, parameters and
compiler temporaries together; it is not a 384-element array allowance. Oversized
frames are rejected at compile time. Bounds, borrowing and execution-budget
checks also apply to local storage. Errors discard the call-local frame while
preserving any writes already made to borrowed host objects or buffers.

This reduces how often a workflow crosses the VM boundary. It does not remove
the fixed cost of an isolated method call from Squirrel. The
[workflow benchmark](../../demo/benchmarks/kernels/compiled_workflow.nut) compares
the complete compiled simulation with the same calculation driven by a Squirrel
loop calling a typed method. Allocation/initialization of local working state is
included; input conversion and compilation are outside the timed region.

## Implementation and validation

Dynamic array lengths occupy hidden ABI argument slots after public parameters.
Bounds instructions accept either an immediate fixed extent or a runtime length
slot. Both emitters and the independent test interpreter implement this form.
Class methods lower to functions with an implicit borrowed receiver, and field
accesses become checked-schema, constant-offset native loads/stores.

`test/kernel/test_typed.cpp` compares native execution with the interpreter and
an independent prefix-state model across lengths, budgets and failure paths. It
also exercises 32 public array arguments plus 32 hidden lengths.
`test/test_typed_modules.nut` covers field enforcement, identity, wrong-module
handles, alias rejection, helper typing, early returns, zero-length arrays,
partial writes, debug hooks, coroutines and lifetime after module collection.
`test/test_kernel_locals.nut` additionally checks zero initialization, nested
helper storage relocation, loop-local reset, lexical scopes, invalid extents,
local bounds failures and external writes before failure. The native differential
test adds 80 local-state/array cases with varied budgets and indices. Both demos
and all these tests run under CTest's `kernel` label.

The internal `LocalAddress` operation takes the address of consecutive frame
cells; it is not a source-language pointer operation. Each local object/array
has a separately tracked storage region, relocated when a helper is inlined.
LLVM allocates these regions separately from scalar temporaries, allowing its
optimizer to replace local object fields and ordinary temporaries with register
values. Combining them in one addressable allocation prevents that optimization.
The NATIVE emitter and test interpreter retain the same logical cell layout.

Set `SQGI_KERNEL_DUMP_IR=1` to print each function's optimized LLVM IR to stderr
at compilation time. This diagnostic is off by default and applies only to the
LLVM backend. For the oscillator simulation, optimized output retains only its
four-cell indexed history on the stack; position and velocity become SSA loop
values. Bounds, fuel and strict arithmetic checks remain enabled.

## Next stages

This is not yet a fully compiled Squirrel dialect. Typed tables, strings, nested
managed fields, heap allocation inside compiled functions, reference
returns, closures, inheritance, forward/recursive calls and arbitrary Squirrel
library calls remain unimplemented. Those require a managed execution ABI with
explicit rooting, cleanup and error propagation. They must not be added to the
leaf callback, whose contract forbids VM reentry and managed return values.

A sensible next stage is typed native-to-native function calls (to remove the
inlining size ceiling), followed by a managed ABI for strings, typed maps and
allocation. Keep numerical storage unboxed while adding those facilities.
