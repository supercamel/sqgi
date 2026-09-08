# SQGI versus GJS, Node and Python — September 8, 2026

The latest SQGI JIT is close to Node/GJS on integer loops and scalar integer
calls. Object-heavy vectors and matrix calculations still trail both JavaScript
runtimes substantially. Pure Python also beats SQGI on the vector-object kernel;
SQGI wins the matrix kernel and most scalar/array workloads against Python.

## Environment and method

- Intel Core i7-12700, Linux x86-64, each benchmark process pinned to CPU 0.
- Node **18.19.1**, GJS **1.80.2** in **ES module mode**, CPython **3.12.2**
  from the existing Miniconda installation.
- Latest SQGI Release/JIT builds from the execution-improvement pass, int64 and
  double, shown with PGO/LTO off and on. `SQGI_JIT=1`, threshold 1.
- Five rounds, rotating all five runtime/build entries through each execution
  position. Every entry uses a fresh process, five full warmup calls per kernel,
  then one timed call. Medians are reported below.
- 80,000 base iterations; direct/branch/float-call, integer-loop, and integer/
  float-array-read kernels use 1,600,000 iterations.
- All 15 checksums match across every runtime/build in all five rounds.
  Integer results compare exactly; doubles use 1e-10 relative/absolute tolerance.
  Timing excludes process startup, script loading and the warmup calls; automatic
  collection/allocation occurring during the timed call is included.

## Results

**Nanoseconds per iteration; lower is faster.** An iteration means one pass
through the named kernel, so compare across runtimes within each row.

| Kernel | SQGI Release | SQGI PGO/LTO | Node | GJS module | CPython |
| --- | ---: | ---: | ---: | ---: | ---: |
| `direct_call` | 3.89 | 3.73 | 4.05 | 3.80 | 88.46 |
| `branch_call` | 3.13 | 3.14 | 2.84 | 2.81 | 65.63 |
| `float_call` | 6.68 | 6.69 | 1.51 | 1.50 | 40.03 |
| `numeric_loop` | 5.83 | 5.82 | 5.41 | 5.44 | 59.90 |
| `vector` | 2754.69 | 2099.65 | 180.35 | 150.06 | 1790.87 |
| `dynamic_member` | 268.12 | 225.04 | 32.10 | 21.44 | 268.89 |
| `dynamic_key_get_set` | 22.77 | 14.86 | 20.48 | 11.41 | 105.98 |
| `object_member_write_fallback` | 96.21 | 64.11 | 3.82 | 6.80 | 192.16 |
| `array_append` | 36.79 | 28.76 | 12.09 | 5.84 | 62.82 |
| `array_write` | 5.66 | 4.38 | 1.51 | 1.82 | 48.02 |
| `array_read` | 1.28 | 1.29 | 0.63 | 0.86 | 21.72 |
| `array_float` | 1.72 | 1.72 | 0.54 | 0.75 | 20.16 |
| `math_intrinsic` | 25.36 | 25.35 | 13.84 | 3.09 | 172.47 |
| `math_variable` | 45.23 | 45.09 | 54.15 | 31.51 | 158.72 |
| `matrix` | 69.79 | 53.80 | 7.08 | 14.38 | 347.69 |

## What the results mean

- **Vector objects:** ordinary SQGI takes 15.3× Node's time and 18.4× GJS's
  time. PGO/LTO reduces those ratios to 11.6× and 14.0×. Even the PGO/LTO build
  takes about 17% longer than the pure-Python version.
- **3×3 matrix/vector loop:** ordinary SQGI takes 9.9× Node's time and 4.9×
  GJS's; PGO/LTO reduces that to 7.6× and 3.7×. SQGI is 5.0× faster than Python
  in ordinary Release and 6.5× faster with PGO/LTO.
- **Integer work:** scalar calls are approximately tied with the JavaScript
  runtimes. The integer loop takes about 7–8% longer than Node/GJS, and is about
  10× faster than Python. Small differences require cautious interpretation.
- **Dynamic keys:** PGO/LTO SQGI takes about 27% less time than Node, but 30%
  more than GJS. Broader dynamic member access still trails both JS runtimes.
- **Object swaps:** previous SQGI optimizations helped, but PGO/LTO still takes
  16.8× Node's time and 9.4× GJS's on this kernel.
- **Variable math:** SQGI takes about 16% less time than Node, but about 44%
  more than GJS. Constant-heavy math favors GJS much more strongly.

This identifies object construction, overloaded vector operations and member
handling as useful areas for further profiling. These measurements do not
separate reference counting, allocation, dispatch, guard checks or interpreter
fallback, so they do not establish reference counting as the cause.

## Comparison boundaries

The vector kernel constructs array/list-backed `Vec3` objects, invokes add/sub/
multiply/dot/cross operations, and performs dynamic component updates. SQGI and
Python use operator overloads; JavaScript expresses the same operations through
explicit methods. Python classes use `__slots__` for their fixed fields.
The matrix kernel iterates a 3×3 matrix–vector calculation and mutates scalar
entries; it is **not** dense matrix multiplication or a NumPy/BLAS comparison.
Python uses normal loops, lists, objects and `math`, without a numeric extension.

JS uses Number and SQGI uses int64/double; integer intermediates in these
workloads fit JS's exact integer range. Python's signed-remainder handling is
explicitly matched to SQGI/JS in the direct-call kernel: negative accumulators
occur in the long run, and using Python's `%` unmodified would change the work.

Node and GJS run the identical JavaScript kernel file. An initial classic-script
GJS experiment produced about 90 ns scalar calls and 359 ns constant-heavy math.
Switching the same file to `gjs -m` reduced those to approximately 3.8 ns and
3.1 ns. The table therefore uses the module-mode rerun throughout; classic-script
results are not presented as a general GJS limitation.

The SQGI PGO build trained on smaller versions of these kernel shapes plus its
correctness suite, so it is a favorable workload-specific configuration. Ordinary
Release is shown separately. No runtime-specific flags were used to tune Node,
GJS or CPython. Timings describe these local warmed workloads, not startup,
GI crossings, GUI responsiveness or an overall language ranking.

## Reproduction and evidence

```sh
python3 tools/run_runtime_benchmarks.py \
  --sqgi /tmp/sqgi-execution-20260908.s0zUxK/release/sqgi \
  --sqgi-pgo /tmp/sqgi-execution-20260908.s0zUxK/pgo/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 --gjs-mode module \
  --output comparison.json
```

[Full JSON evidence](runtime-comparison-2026-09-08.json) includes every sample,
checksum, command, version, build setting and SQGI executable hash. Initial
script-mode measurements remain in `/tmp/sqgi-runtime-comparison-20260908/`.
The runtime source and install-ready builds were not changed for this comparison;
changes are limited to benchmark ports, the reusable runner and this report.
