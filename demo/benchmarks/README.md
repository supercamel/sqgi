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
For changes shared with the interpreter, add `--jit 0` to
`run_execution_benchmarks.py` to compare both builds with native execution
disabled. The default remains `--jit 1`; the saved result records this setting.
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

The independent application-component suite adds eight workloads:

```sh
python3 tools/run_runtime_benchmarks.py --suite applications \
  --sqgi /path/to/candidate/sqgi --sqgi-baseline /path/to/baseline/sqgi \
  --runs 5 --iterations 200000 --warmups 5 --seed 17 --cpu 4 \
  --output applications-seed17.json
```

It covers routing with balanced and skewed branches, pricing with early returns
and retained arguments, a streaming filter, record updates over 64 and 4096
objects with two insertion orders, string-key word counting, and dependent
graph-array reads. Node and GJS share one JavaScript source; Python uses normal
lists and dictionaries. Checksums are first checked against SQGI with JIT off,
then compared across every timed runtime. `--sqgi-baseline` also works with the
original kernel suite. Match baseline and candidate build options when measuring
compiler improvements.

Keep `test/bench_application_workloads.nut` and its ports out of PGO training.
Repeat with a different `--seed` and iteration count (for example seed 83 and
400003 iterations) to change input values and loop boundaries. Input arrays are
constructed before timing; record construction and per-run word-count tables
are included in their workload's timing. State is reset on every invocation.
Results exclude process startup and report microseconds per processed event,
record, word, or graph hop. The JSON preserves raw samples, source hashes,
build settings and timing spread. These are representative components, not
measurements of complete applications or end-to-end latency.

For a quicker SQGI-only paired confirmation, use
`run_execution_benchmarks.py --suite applications --seed 17` with the same
`--baseline`, `--candidate`, `--iterations`, `--runs`, `--cpu` and `--output`
options shown above. This alternates the two builds and preserves checksums,
raw timings, and executable/source hashes. The full cross-runtime runner's
JIT-off reference remains the independent correctness check.

The [AArch64 scalar-call report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/aarch64-leaf-control-flow-2026-09-09.md)
records the initial results, sanitizer-discovered ownership fix, final PGO/LTO
comparison, independent seeds and timing variability.

The [checked table slots and direct math report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/guarded-slots-direct-math-2026-09-09.md)
records the subsequent runtime/AArch64 iteration, final cross-runtime results,
independent member/method holdouts, and the rejected cache-only experiment.
It preserves regressions, confirmation runs, counter evidence and remaining gaps.

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

The [Vec3 object inlining report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/vec3-implementation-2026-09-08.md)
records the next implementation step: the unchanged array-backed vector kernel
now becomes native scalar code. It includes fresh SQGI/Node/GJS/Python results,
allocation measurements, native-route tests, and the remaining optimization limits.

The [fresh PGO/LTO comparison](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/pgo-lto-after-vec3-2026-09-08.md)
compares the same implementation with ordinary Release, LTO-only and trained
PGO/LTO builds across 19 kernels, then repeats the JavaScript/Python comparison.

The [member-access optimization report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/member-optimization-2026-09-08.md)
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
of PGO training too. The [object-store optimization report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/object-store-optimization-2026-09-08.md)
includes the original kernels, both independent suites, and the remaining
large-owner-set costs.

Add `--suite methods` for six mutating-call workloads covering table, class and
mixed-layout receivers, payload exchange and state publication. Keep
`test/bench_member_methods.nut` out of PGO training. The
[dynamic-member report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/dynamic-member-optimization-2026-09-08.md)
records native method execution, frame-local undo storage, before/after
measurements and the remaining interpreter overhead.

Add `--suite floats` for seven independent floating workloads, including
filtering, multiple channels, integration, retained arguments, branched calls
and a math-helper control. Keep `test/bench_float_workloads.nut` out of PGO
training. Its Node port preserves arithmetic order and the runner requires
exact final checksums against the interpreter. The
[floating-call report](https://github.com/supercamel/sqgi/blob/7de5513c2feb807d4587fcece54ba8f88477fe28/devdocs/internals/float-call-optimization-2026-09-08.md)
includes the original float-call kernel, these independent workloads, hardware
counters and the remaining Node performance gaps.
