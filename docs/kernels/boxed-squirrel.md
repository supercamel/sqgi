# Explicit LLVM compilation of Squirrel functions

An experimental `sqgi.llvm` API is available when SQGI is built with LLVM typed
kernels enabled and the ordinary bytecode JIT disabled (`SQ_ENABLE_JIT=OFF`).
It is separate from the automatic JIT used by default SQGI builds.

## Compile a function

```squirrel
local sum = function(n) {
    local total = 0;
    for (local i = 0; i < n; i++) total += i;
    return total;
};
sqgi.llvm.compile(sum);
print(sum(100) + "\n");
local stats = sqgi.llvm.info(sum);
```

Compilation is synchronous and idempotent. A compilation failure throws an
exception before changing the function. The closure retains its identity and
captured environment. Other closures sharing the same function prototype use
the compiled code with their own captured values.

## Execution behavior

Eligible numerical operations and loops run as native code. Unsupported
operations continue through the interpreter, preserving ordinary Squirrel
behavior for tables, classes, strings, GI calls, exceptions and coroutine
suspension. Debug hooks use the interpreter path.

Typed kernel exports and methods can be called from these functions. Their
argument checks, error behavior and execution budgets still apply. Compilation
does not make all operations or library calls native, and small functions may
cost more to compile than they save in execution time.

## Inspect execution

`sqgi.llvm.info(closure)` returns cumulative counters:

| Field | Meaning |
| --- | --- |
| `entries` | Entries into compiled code |
| `operations` | Successful direct and helper operations |
| `direct_operations` | Operations executed directly by compiled code |
| `leaf_calls` | Attempted direct native leaf calls |
| `lowered`, `instructions`, `direct` | Static instruction counts |

Static counts do not predict how often execution falls back to the interpreter.
Use measurements from your application's workload when deciding whether to use
this API. `SQGI_SQUIRREL_DUMP_IR=1` prints optimized LLVM IR for inspection.

See the [boxed Squirrel demo](https://github.com/supercamel/sqgi/blob/master/demo/kernels/boxed_squirrel.nut) for an
example that calls a typed kernel.
