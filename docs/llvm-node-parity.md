# Ordinary Squirrel: remaining Node parity targets

The subsequent [RouteTastic application tests](realworld-routetastic-benchmarks.md)
show that these microbenchmark wins do not establish general application parity:
ordinary JIT coverage remains limited, while typed kernels provide large gains
on the geometry-heavy board workflow.
The [runtime follow-up](routetastic-runtime-improvements.md) removes the import
regression and improves searches while retaining that coverage limitation.

The six remaining runtime-suite holdouts now meet the target of no more than
2× Node.js 26.9.0's warmed time per iteration. All six are faster in this run.
These are unchanged ordinary Squirrel programs, automatically compiled from
bytecode through LLVM; they have not been rewritten as typed kernels.

## Results

Five process rounds, five warmups, 80,000 requested iterations, CPU 0 on an
Intel Core i7-12700. SQGI uses LLVM 18, int64/double, threaded dispatch and a
RelWithDebInfo build with LTO and PGO disabled. Startup and compilation are
excluded. Runtime order rotates; the runner checks every result against an
interpreter reference and the saved SQGI baseline, Node, GJS and Python.

The baseline is the build immediately before these improvements, including the
previous private object-write optimization. Medians below are **nanoseconds per
iteration**; a row measures its complete workload, not a single field access.

| Workload | SQGI before | SQGI now | Node 26 | GJS | Python |
|---|---:|---:|---:|---:|---:|
| direct_call | 3.141 | 3.136 | 3.873 | 3.700 | 86.789 |
| branch_call | 3.220 | 3.215 | 2.984 | 2.793 | 64.380 |
| float_call | 1.474 | 1.473 | 1.469 | 1.468 | 39.388 |
| numeric_loop | 5.447 | 5.447 | 5.486 | 5.332 | 58.587 |
| vector | 2768.575 | 8.388 | 111.542 | 143.850 | 1812.405 |
| dynamic_member | 211.550 | 6.025 | 27.550 | 21.375 | 259.280 |
| dynamic_key_get_set | 4.375 | 4.412 | 17.970 | 11.163 | 104.747 |
| object_member_write_fallback | 3.175 | 3.175 | 4.390 | 6.700 | 185.922 |
| array_append | 38.637 | 3.350 | 9.607 | 5.837 | 60.919 |
| array_write | 0.888 | 0.888 | 1.699 | 1.788 | 46.975 |
| array_read | 0.216 | 0.216 | 0.839 | 0.845 | 21.158 |
| array_float | 0.421 | 0.421 | 0.474 | 0.736 | 19.848 |
| math_intrinsic | 219.037 | 8.225 | 9.005 | 3.025 | 170.471 |
| math_variable | 193.963 | 25.487 | 27.969 | 30.900 | 155.017 |
| matrix | 402.537 | 4.888 | 7.034 | 14.050 | 338.827 |

The six targets improve by approximately 330× (vectors), 35× (mixed objects),
12× (append), 27× (mixed math), 7.6× (variable math) and 82× (matrix) over the
saved SQGI build. Other rows remain within about 1% of that baseline; there is
no material suite regression in these samples. Branch calls still take about
8% longer than Node. This is parity on this benchmark suite, not a claim about
all dynamic programs or cold-start performance.

[Raw measurements](benchmark-results/llvm-holdouts-2026-09-17.json) contain all
samples, commands, checksums, executable identities, source hashes, runtime
versions and build metadata. JSON times are microseconds, unlike this table.

Reproduce with:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/current/sqgi --sqgi-baseline /path/to/before/sqgi \
  --node /path/to/node26 --suite kernels --runs 5 --iterations 80000 \
  --warmups 5 --jit 1 --cpu 0 --output /tmp/holdouts.json
```

## What changed

**Numeric calls.** Audited native math bindings and numeric `tofloat()` calls
lower to internal typed operations. Entry guards check the actual functions,
their environments and delegate bindings. LLVM receives math intrinsics where
available and direct audited libm calls otherwise. The ORC symbol table exposes
only the supported math entries. Floating-environment guards remain in place;
these changes do not enable fast-math. The supported functions are `sqrt`, `sin`,
`cos`, `asin`, `acos`, `log`, `log10`, `tan`, `atan`, `floor`, `ceil`, `exp`, `fabs`,
`atan2` and `pow`.

**Matrix indexing.** Constant indices loaded into registers are recovered within
basic blocks, including moves and sequential `DMOVE`. This avoids expanding a
fixed row access into selections over every possible row. Numeric conversion
lowering then lets the unchanged matrix loop compile completely.

**Append.** A private, nonescaping integer array can use an entry-owned native
buffer with checked growth, indexed reads and length. Successful and failed
native exits release the buffer. Escaping arrays, aliases and observable append
results fall back. Shared boxed loops also support the VM's builtin append/push
shortcut, retaining object identities and guarding observable releases.

**Classes and arithmetic methods.** Constructors, methods and supported arithmetic
metamethods can be inlined into a private graph. Callee frames reuse only caller
registers proven dead at the call, protecting all input and result operands.
The class must already be locked by a real construction; otherwise compilation
is deferred until a later call. Class identity, defaults, constructor, methods
and metamethods are checked at native entry. Captured class and method identities
use weak references.

An implicit constructor lookup inside a method also guards the method's root,
the absence of a class member or `_get` interception, and the instance default
delegate. A delegate member can shadow a root binding; overlooking that lookup
order would incorrectly suppress user behavior. Mutation causes fallback to the
original bytecode, including exceptions and callbacks.

**Repeated allocations.** Each private allocation has a distinct abstract
identity and scalar field storage. An allocation site can reuse that storage
on another loop iteration only when a reachability proof shows that no live
register, including references through other private objects, can still reach
its previous instance. A live old alias therefore rejects this optimization.
The analysis distinguishes an allocation that has not occurred on a path from
an allocated but uninitialized field. Conditional storage gets a compatible
scalar initializer; it remains inaccessible before the real construction.

The graph pass supports up to 64 local objects, eight cells per object and 32
literal strings, within 240 scalar slots and 8,192 lowered instructions. Shapes
must be built within a basic block. Class bodies are bounded, unbound closures;
inheritance, native instance payloads, captures, arbitrary callbacks, object
returns and observable identity operations are outside this pass. Unsupported
programs retain interpreter or existing native-tier behavior. No public
bytecode format or Squirrel syntax changes were introduced.

## Validation

The selected JIT/interpreter suite passes **31/31 tests** in both the normal LLVM
build and the ASan/UBSan build. New cases in `test/cpp/test_sqjit_llvm.cpp` cover:

- All 15 math operations against interpreter results, conversions, NaN, replaced
  root functions/delegates, exception propagation and nested matrix indexing.
- Private buffer growth, negative and out-of-range indices, fractional-index
  fallback, zero trips, escapes, aliases, append results and shared object identity.
- Class field swaps, changed methods/defaults/classes, changed method roots,
  changed arithmetic metamethods, repeated allocations and a live previous alias.
- Collection of classes with native artifacts still alive, after clearing the
  interpreter's independent class-layout caches and conservatively marked scratch.

Existing tests cover default-delegate shadowing, root lookup changes, weak
references, release hooks, journal ancestors, committed writes and exact exits.
Every one of the 15 benchmark checksums matched across all five rounds and all
five compared runtimes. The target is satisfied for these measured workloads;
compilation latency and broader application performance were not measured here.

## Typed-kernel follow-up

Fresh five-round comparisons on the same build, with the same warmups, iteration
count and CPU affinity. Times are ns/iteration; compilation is excluded. Each
kernel executes the complete loop in one host call. All checksums matched.

| Workload | Typed kernel | Node 26.9 | GJS | Python |
|---|---:|---:|---:|---:|
| vector | 8.425 | 112.542 | 143.512 | 1760.875 |
| matrix | 7.025 | 8.615 | 14.050 | 338.200 |
| math_intrinsic | 8.175 | 9.024 | 3.013 | 168.728 |
| math_variable | 25.325 | 27.949 | 30.863 | 154.742 |

The dedicated vector and matrix runners measured ordinary-Squirrel JIT times of
8.350 and 4.900 ns respectively. The math runner's ordinary-Squirrel references
measured 311.200 and 265.500 ns, unlike the optimized full-suite math rows above;
that harness/context discrepancy remains to be investigated. Do not substitute
those reference rows for the earlier full-suite results. The typed-kernel figures
above are directly measured and checksum-validated.

Raw runs: [vectors](benchmark-results/llvm-kernel-vector-2026-09-18.json),
[matrices](benchmark-results/llvm-kernel-matrix-2026-09-18.json),
[math](benchmark-results/llvm-kernel-math-2026-09-18.json).
