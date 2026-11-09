# Typed modules

The kernel compiler supports persistent typed classes, runtime-sized borrowed
arrays, call-local objects and scratch arrays, and helper/method calls that stay
in native code. Use these features through the [typed kernel API](README.md).

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
- Methods and helpers must be defined before their callers. Calls stay in native
  code, share the execution budget and propagate errors immediately. Recursion
  and virtual dispatch are unsupported.
- Host objects, buffers and method closures retain their module/code/schema. Arguments
  stay rooted throughout execution. Native code borrows their storage and
  cannot allocate managed objects, resize host storage, trigger GC or retain
  references after returning. Call-local storage uses the native frame.
  Instance fields cannot hold managed references.
- The same bounds, strict arithmetic, error propagation and shared per-call loop
  budget apply to compiled method chains. Writes before
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

The [complete example](https://github.com/supercamel/sqgi/blob/master/demo/kernels/compiled_workflow.sqk) implements
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
LLVM permits up to 64 KiB of addressable local storage per function, separate
from scalar temporaries, and 256 KiB along a call chain. NATIVE retains the
384-cell expanded-frame limit, including storage and temporaries. These limits
are enforced at compile time; they do not measure final optimized machine stack
usage. Bounds, borrowing and execution-budget
checks also apply to local storage. Errors discard the call-local frame while
preserving any writes already made to borrowed host objects or buffers.

Batching the simulation in one compiled function reduces per-call overhead.
The [controller demo](https://github.com/supercamel/sqgi/blob/master/demo/kernels/typed_objects.nut) shows persistent
objects, and the [compiled workflow demo](https://github.com/supercamel/sqgi/blob/master/demo/kernels/compiled_workflow.nut)
shows call-local state.

## Unsupported features

Typed classes cannot contain strings, tables or other managed fields. Reference
returns, closures, inheritance, forward or recursive calls, managed allocation
and arbitrary Squirrel library calls are unsupported. Use ordinary Squirrel to
manage those parts of your application and pass numerical data to the module.
