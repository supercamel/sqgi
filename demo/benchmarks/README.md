# SQGI benchmark demos

Small cross-runtime benchmarks for SQGI, Python, Node.js, and GJS.

Run from the repository root:

```sh
demo/benchmarks/run.sh
```

The runner prints tab-separated rows:

```text
runtime  benchmark  iterations  ms  checksum
```

## Workloads

- `numeric`: integer arithmetic in a tight loop.
- `numeric-kernel`: the same arithmetic isolated in a warmed leaf function, so
  runtimes with hot-function compilation can optimize the body without timing
  benchmark formatting.
- `empty-loop`: loop dispatch with a tiny side effect.
- `function-call`: tiny function call overhead.
- `array`: append values, then read them back in reverse.
- `table`: repeated string-key table/object/dict updates.
- `string`: build a larger string from repeated chunks.
- `glib-clock`: repeated `GLib.get_monotonic_time()` calls through GI. This
  runs for SQGI and GJS, and for Python only when PyGObject is installed. Node.js
  is skipped because it has no built-in GObject Introspection bridge.

These are not scientific language shootouts. They are smoke-sized benchmarks
that make SQGI overhead visible across core interpreter work and GI boundary
crossings. Use `--scale=N` to multiply the default iteration counts:

```sh
demo/benchmarks/run.sh --scale=3
```

For a warmed SQGI JIT versus Node.js comparison using the JIT regression kernels:

```sh
python3 tools/run_sqgi_node_benchmarks.py --sqgi build-jit-release/sqgi --runs 5 --cpu 0
```

This runs 15 matching algorithms, gives each kernel five full warmups per process,
alternates runtime order, and checks integer results exactly and double results
within a tight tolerance. It requires SQGI's int64/double configuration. Omit
`--cpu` when Linux `taskset` is unavailable. `--output results.json` saves metadata,
raw output and samples. Startup and GI boundary costs are outside this comparison.

Compare two SQGI builds after changing the interpreter, GI bridge or JIT:

```sh
python3 tools/run_execution_benchmarks.py --baseline /path/to/old/sqgi \
  --candidate /path/to/new/sqgi --suite kernels --runs 5 --cpu 0 \
  --output kernels.json
python3 tools/run_execution_benchmarks.py --baseline /path/to/old/sqgi \
  --candidate /path/to/new/sqgi --suite execution --runs 5 --cpu 0 \
  --iterations 150000 --output execution.json
```

The `execution` suite adds GI scalar calls, GI clock calls, parameter-array
reads and nonescaping temporary numeric arrays. Both suites use five warmups,
alternate process order, compare checksums, and save all samples and output.
Results are microseconds per iteration, excluding startup and compilation.
Run on an otherwise idle machine. The historical
`object_member_write_fallback` kernel name is retained for comparison; eligible
array/string member transfers now use native loop code on x64.

For the same 15 kernels across SQGI, Node, GJS and pure Python:

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/release/sqgi --sqgi-pgo /path/to/pgo/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 \
  --output runtime-comparison.json
```

`--sqgi-pgo` is optional. Each round rotates runtime order and launches a fresh
process. Results use medians, exact integer checksums and tight double-result
checks. The JSON contains executable identities, versions, build settings,
commands, samples and raw output. The runner requires all requested runtimes.

Node and GJS execute the **same** `node_jit_kernels.js` file. GJS uses ES module
mode (`gjs -m`) by default: classic script bindings can materially change JIT
optimization of calls and math. `--gjs-mode script` measures that mode explicitly.
Python uses ordinary CPython objects, loops, lists and `math`, with fixed-field
classes (`__slots__`), not NumPy/BLAS. Its direct-call kernel explicitly preserves
SQGI/JavaScript's signed-remainder behavior for negative accumulators.

`vector` constructs and combines `Vec3` objects with list/array-backed elements;
SQGI/Python use overloaded operators and JavaScript uses explicit methods.
`matrix` is an iterative 3×3 matrix–vector calculation with scalar element
updates. These tests do not measure vectorized library kernels, startup, GI
crossings or complete application performance. The PGO build has trained on
these kernel shapes; ordinary Release is shown separately.

To isolate Vec3 allocation, storage and dispatch costs within SQGI:

```sh
python3 tools/run_vec3_benchmarks.py --sqgi /path/to/release/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 --output vec3.json
SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 /path/to/release/sqgi \
  test/bench_vec3.nut --only=arrays_operators --iterations=1000000 --warmups=1
```

The seven variants preserve numerical operation order and check both a known
reference result and agreement across variants/JIT modes. They range from the
original array-backed objects and overloaded operators to reused objects,
reused arrays and scalar locals. The runner reports nanoseconds per iteration
and saves every sample and checksum. These source rewrites measure where
execution time goes; their speedups are not compiler improvements to the
original object program. The runner requires Linux `taskset`.

The [Vec3 object inlining report](../../devdocs/internals/vec3-implementation-2026-09-08.md)
records the next implementation step: the unchanged array-backed vector kernel
now becomes native scalar code. It includes fresh SQGI/Node/GJS/Python results,
allocation measurements, native-route tests, and the remaining optimization limits.

The [fresh PGO/LTO comparison](../../devdocs/internals/pgo-lto-after-vec3-2026-09-08.md)
compares the same implementation with ordinary Release, LTO-only and trained
PGO/LTO builds across 19 kernels, then repeats the JavaScript/Python comparison.

The [member-access optimization report](../../devdocs/internals/member-optimization-2026-09-08.md)
profiles the remaining object/dynamic-member and matrix costs. Its independent
workloads vary table layouts, receiver kinds and array sizes:

```sh
python3 tools/run_member_benchmarks.py \
  --sqgi before=/path/to/before/sqgi --sqgi after=/path/to/after/sqgi \
  --node /usr/bin/node --runs 5 --iterations 200000 --cpu 0 \
  --output member-workloads.json
```

The runner checks all six workloads against the interpreter and Node, rotates
runtime order, and saves hashes and raw samples. Keep these workloads out of
PGO training when using them to check whether an optimization generalises.

Add `--suite owners` to run ten table/class workloads with varying numbers of
displaced array owners and mixed integer/double field writes. Keep these out
of PGO training too. The [object-store optimization report](../../devdocs/internals/object-store-optimization-2026-09-08.md)
includes the original kernels, both independent suites, and the remaining
large-owner-set costs.

Add `--suite methods` for six mutating-call workloads covering table, class and
mixed-layout receivers, payload exchange and state publication. Keep
`test/bench_member_methods.nut` out of PGO training. The
[dynamic-member report](../../devdocs/internals/dynamic-member-optimization-2026-09-08.md)
records native method execution, frame-local undo storage, before/after
measurements and the remaining interpreter overhead.

Add `--suite floats` for seven independent floating workloads, including
filtering, multiple channels, integration, retained arguments, branched calls
and a math-helper control. Keep `test/bench_float_workloads.nut` out of PGO
training. Its Node port preserves arithmetic order and the runner requires
exact final checksums against the interpreter. The
[floating-call report](../../devdocs/internals/float-call-optimization-2026-09-08.md)
includes the original float-call kernel, these independent workloads, hardware
counters and the remaining Node performance gaps.
