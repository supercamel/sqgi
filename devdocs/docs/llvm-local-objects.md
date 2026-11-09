# Compiling private dynamic tables

For the newer pass supporting nested objects, aliases, reference swaps and
literal-string fields, see [private object graphs](llvm-local-graphs.md).
The scope and measurements below describe the original simple-aggregate pass.

The LLVM bytecode backend can now eliminate small private tables as well as
arrays. This optimizes ordinary Squirrel source; no typed-kernel rewrite or
language annotation is needed. For example:

```squirrel
function accumulate(n) {
    local keys = ["a", "b", "c"];
    local state = { a = 1, b = 2, c = 3 };
    for (local i = 0; i < n; i++) {
        local key = keys[i % 3];
        state[key] = state[key] + i;
    }
    return state.a + state.b + state.c;
}
```

The compiler proves that the objects cannot escape, replaces their fields with
scalar locals, and represents the private string keys as internal identifiers.
LLVM then optimizes the whole loop. Successful native execution performs no
table allocation, string hashing, or boxed field assignment for these objects.

This addresses a compilation gap: previously, these functions were rejected by
the LLVM backend and ran in the interpreter. Changing the runtime hash-table
layout alone would leave that interpreter dispatch cost in place. Instances
already have indexed field storage; this change does not alter their layout or
the general table ABI.

For shared tables and reference-valued fields, a separate
[canonical-slot loop path](llvm-boxed-loops.md) now compiles eligible loops while
preserving actual heap updates. The restrictions below describe private-object
elimination, not the entire LLVM backend.

## Scope

The existing bounded local-array pass now also accepts string-key tables:

- At most four aggregates with at most eight cells each, within the existing
  scalar-slot and instruction budgets.
- Allocation and initialization occur once, before control flow. Table keys
  are unique literal strings and cannot be added or deleted afterward.
- Values are supported scalar values. Dynamic keys can come from an immutable
  local array containing only string literals, or from proven string-key locals.
- Tables may have different field orders and sets. Each access selects from the
  particular table's own fields.
- The object cannot be aliased, returned, captured, passed to a call, stored in
  another object, or inspected for identity.

Unsupported cases retain interpreter behavior. In particular this does not yet
compile the mixed `PayloadBox` benchmark, object-valued field swaps, shared
tables, class construction, table growth, or arbitrary runtime string keys.
The optimization belongs to the LLVM bytecode backend and does not require
threaded interpreter dispatch.

## Correctness

A forward dataflow analysis tracks string-key provenance separately from scalar
values. Joins preserve both possibilities; a key that might instead be a number
is rejected. Internal identifiers cannot be returned, compared with ordinary
numbers, used in arithmetic, or stored as field values. Double moves are modeled
sequentially, including overlapping source/destination registers.

Missing keys and invalid array indices trigger the existing native guard failure
and replay the original bytecode. Until successful return, all rewritten object
writes are private scalar state and nothing has been published to the VM heap.
The existing temporary-owner guard preserves observable release timing. This
keeps errors and fallback behavior consistent with the interpreter.

Tests in `test/cpp/test_sqjit_llvm.cpp` run with JIT disabled and enabled. They
assert native execution for supported table loops and interpreter fallback for
escaping objects, aliases, shared writes, strings used as values, mixed keys,
and structural mutations. Additional coverage includes floating fields, zero-trip
loops, different field orders, missing-key and arithmetic guard replay, malformed
literal operands, and overlapping double moves. Eleven selected tests passed
in both normal and ASan/UBSan builds.

## Reproduction

Save the baseline executable before rebuilding the LLVM bytecode-JIT build, then:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/current/sqgi --sqgi-baseline /path/to/before/sqgi \
  --suite kernels --runs 5 --iterations 80000 --warmups 5 --jit 1 --cpu 0 \
  --output /tmp/local-objects.json
```

The unchanged `dynamic_key_get_set` workload exercises this optimization.
The runner validates all 15 workloads against Node, GJS and Python, rotates
runtime order, and reports warmed iteration times with compilation excluded.

September 17 local results: i7-12700 CPU 0, five rounds, 80,000 iterations,
five warmups, LLVM bytecode JIT and threaded dispatch enabled, RelWithDebInfo,
no LTO/PGO. Node 18.19.1, GJS 1.80.2, Python 3.12.2:

| Dynamic-key get/set | ns/iteration |
|---|---:|
| SQGI before | 51.338 |
| SQGI with private-table compilation | 4.375 |
| Node | 21.100 |
| GJS | 11.225 |
| Python | 105.076 |

This is 11.7× faster than the saved SQGI baseline, 4.8× faster than Node, and
2.6× faster than GJS on this specific workload. Every checksum matched across
all 15 workloads in every round. The mixed class/object workload remained around
218 ns and object-valued writes around 136 ns: those functions still fall back.
Other rows varied by a few percent; this is not a general speedup of shared or
escaping dynamic objects.
