# Eliminating private object graphs

For the subsequent class/method, repeated-allocation, math and append extensions,
see [the Node parity report](llvm-node-parity.md). The scope and measurements
below describe the original graph pass.

The LLVM bytecode JIT now scalar-replaces bounded, private graphs of ordinary
Squirrel tables and arrays. Nested arrays, local aliases, reference-valued field
swaps and literal string fields can stay entirely in native values. No kernel
syntax or source annotation is required.

For example, this function can compile without allocating its table or arrays:

```squirrel
function swap_and_sum(n) {
    local state = { active = [1, 2], spare = [3, 4] };
    for (local i = 0; i < n; i++) {
        local previous = state.active;
        state.active = state.spare;
        state.spare = previous;
        state.active[i % 2] = state.active[i % 2] + i;
    }
    return state.active[0] + state.spare[1];
}
```

This directly addresses the unchanged `object_member_write_fallback` benchmark.
That name describes a mixed loop, not the cost of a single object assignment.
The loop swaps references, assigns strings, accesses arrays, calls `len()` and
performs integer arithmetic. Its objects never escape the function, so their
intermediate ownership operations can disappear altogether.

## Compiler and runtime contract

The new `SQJitLocalGraphPlan` runs after the established scalar/inlining and
simple private-aggregate plans. Unsupported opcodes and functions without
multiple allocations are rejected before allocating graph-analysis state.

1. Discover allocation sites and field layouts in the straight-line prefix.
   Identity belongs to a creation site, not a stack register; registers may be
   reused while building nested objects.
2. Compute a conservative fixed point over register and field provenance.
   Scalar values, individual literal strings, object identities and uninitialized
   values remain distinct. Joins retain every possible identity. Local aliases
   and reference swaps therefore preserve which fields belong to which object.
3. Validate every use. Encoded references and strings can flow through local
   moves and private fields, but cannot escape through returns, identity tests,
   arithmetic, external writes or arbitrary calls.
4. Replace objects with scalar field slots and internal identity selections.
   LLVM promotes the slots and optimizes the loop. Successful execution requires
   no allocation, hashing or reference-count updates for the eliminated graph.

Missing fields and invalid indices produce a native guard failure. No rewritten
heap mutation has been published, so replaying the original bytecode preserves
its errors and effects. The original function remains the fallback implementation.
Arguments retain the existing scalar type guards and floating-environment guards.

Literal-string and array lengths are supported for adjacent `PREPCALLK`/`CALL`
pairs. Native entry checks the actual default-length bindings. Replacing the
string delegate's method causes fallback, including any replacement callback's
effects. Array length follows the VM's existing special shortcut, which bypasses
replacement of the array delegate's `len` entry.

The VM temporary's ownership is guarded separately. String method preparation,
member reads and original comparison-branches can overwrite it; the array-length
shortcut alone does not. Guard failures leave it untouched. Successful code only
commits an allowed drop when an instruction that touches it has actually run.
An observable final release remains in the interpreter.

## Bounds and exclusions

- Up to eight arrays/tables, eight cells per object, and 32 literal strings.
- Allocation and shape construction occur before control flow; no branch can
  recreate an object or repeat its initializers.
- At most 128 scalar slots and 1,024 lowered scalar instructions. The ordinary
  small-leaf instruction limit remains 64; the whole-function scalar limit grew
  from 512 to accommodate the expanded graph selections.
- No class construction, callbacks, captures, external object arguments, object
  returns, identity observations, weak-reference creation or structural mutation.
- Mixed array/string receivers at one length-preparation site conservatively
  fall back because their VM-temporary effects differ.

This does not replace shared-object storage or eliminate ownership checks for
escaping objects. Those continue through the interpreter or the
[boxed native loop path](llvm-boxed-loops.md). Near-Node performance on a private
graph is not a claim of parity for arbitrary dynamic classes or shared objects.

## Validation

`test/cpp/test_sqjit_llvm.cpp` exercises both interpreter and native execution,
asserting native-success counters for supported graphs. Coverage includes:

- The unchanged benchmark, including zero trips and its known checksum.
- Reference swaps, retained aliases after field replacement, nested tables with
  different field orders, cycles, floating fields and dynamic string keys.
- Array/string lengths, changed delegate bindings and the array shortcut.
- Missing keys, negative/out-of-range/Boolean/fractional indices and replay.
- Escapes, identity tests, symbolic-string arithmetic, callbacks and external
  writes, all rejected by this pass.
- A sole-owner release hook in the VM temporary: preserved by direct array
  length, and guarded before a member-reading graph can execute.
- Malformed literal indices and branch targets, plus a method key containing
  embedded NUL bytes that must not be mistaken for `len`.

The selected JIT/interpreter suite passes 31 tests in the normal LLVM build and
31 under ASan/UBSan. These include the existing shared-object, weak-reference,
ancestor-journal, release-order, exact-side-exit and invalid-continuation tests.

## Measurements

Comparisons use an i7-12700 pinned to CPU 0, five process rounds, five warmups,
80,000 requested iterations, LLVM 18, threaded interpreter dispatch, int64/double,
RelWithDebInfo, and no LTO/PGO. Node is 26.9.0. Compilation/startup is excluded;
the checksum runner rotates runtime order and checks all 15 workloads against
the saved SQGI build, Node, GJS and Python.

Reproduce with:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/current/sqgi --sqgi-baseline /path/to/before/sqgi \
  --node /path/to/node26 --suite kernels --runs 5 --iterations 80000 \
  --warmups 5 --jit 1 --cpu 0 --output /tmp/local-graph-comparison.json
```

Final five-round medians, ns per iteration (lower is better):

| Workload | SQGI before | SQGI after | Node 26 |
|---|---:|---:|---:|
| direct_call | 3.156 | 3.128 | 3.880 |
| branch_call | 3.217 | 3.211 | 2.990 |
| float_call | 1.475 | 1.473 | 1.472 |
| numeric_loop | 5.472 | 5.441 | 5.486 |
| vector | 2763.237 | 2793.500 | 111.655 |
| dynamic_member | 218.888 | 217.150 | 27.943 |
| dynamic_key_get_set | 4.387 | 4.425 | 18.043 |
| object_member_write_fallback | 59.013 | 3.288 | 4.302 |
| array_append | 39.075 | 39.100 | 9.997 |
| array_write | 0.888 | 0.888 | 1.700 |
| array_read | 0.215 | 0.218 | 0.839 |
| array_float | 0.418 | 0.421 | 0.474 |
| math_intrinsic | 224.725 | 218.238 | 9.014 |
| math_variable | 200.162 | 194.250 | 28.009 |
| matrix | 400.662 | 403.487 | 8.567 |

The private object-write workload improves **17.95×**, from 59.013 ns to
3.288 ns. Node measures 4.302 ns: SQGI is approximately **1.31× faster** on this
workload. An independent 40-million-iteration check produced the same checksum
and about 3.3 ns per iteration. These results meet the goal of being within 2×
Node on this workload, without altering the benchmark source.

The first full comparison showed a 5.6% regression for mixed dynamic objects.
A five-round isolated comparison at three million iterations did not reproduce
it: 211.666 ns before versus 211.799 ns after with the JIT, and 214.324 ns versus
213.991 ns without it. After adding cheap early rejection for unrelated functions,
the final full comparison above also shows no mixed-object regression. Do not
infer a speedup for that workload from the small final difference. Most other
rows remain close; shared dynamic objects still trail Node substantially.

Session artifacts:

- `/tmp/sqgi-local-graph-final.json`: all samples, checksums and runtime metadata.
- `/tmp/sqgi-local-graph-final.txt`: complete five-runtime median table.
- `/tmp/sqgi-dynamic-isolated.txt`: isolated mixed-object regression investigation.
- `/tmp/sqgi-graph-tests.txt` and `/tmp/sqgi-graph-asan-tests.txt`: test results.
- `/tmp/sqgi-before-local-graph`: preserved pre-change executable.
