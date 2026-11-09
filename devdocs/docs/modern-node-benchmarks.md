# Modern Node.js comparison

Tested Node 26.9.0 Current and Node 24.21.0 LTS, downloaded from the official
[Node distribution index](https://nodejs.org/dist/index.json) and checked against
each release's published SHA-256 sums. System Node 18 was not replaced.

Five rounds per release, 80,000 requested iterations, five warmups, CPU 0 on
an i7-12700. SQGI uses the LLVM bytecode JIT, threaded dispatch, int64/double,
RelWithDebInfo, and no LTO/PGO. Runtimes run sequentially in rotating order;
compilation is excluded. All 15 workload checksums matched every round.

Times below are ns/iteration. SQGI is from the Node 26 comparison; the Node 24
column is from its separate five-round comparison.

| Workload | SQGI | Node 24.21.0 | Node 26.9.0 |
|---|---:|---:|---:|
| direct_call | 3.138 | 3.876 | 3.871 |
| branch_call | 3.198 | 2.996 | 2.989 |
| float_call | 1.476 | 1.473 | 1.469 |
| numeric_loop | 5.444 | 5.473 | 5.481 |
| vector | 2605.338 | 133.671 | 114.760 |
| dynamic_member | 219.800 | 27.879 | 27.840 |
| dynamic_key_get_set | 4.375 | 18.216 | 17.771 |
| object_member_write_fallback | 138.288 | 4.738 | 4.299 |
| array_append | 42.037 | 14.820 | 9.477 |
| array_write | 0.888 | 1.697 | 1.701 |
| array_read | 0.217 | 0.844 | 0.839 |
| array_float | 0.419 | 0.630 | 0.474 |
| math_intrinsic | 227.362 | 9.155 | 9.003 |
| math_variable | 200.137 | 27.769 | 28.029 |
| matrix | 398.863 | 7.139 | 11.041 |

The private-table workload remains about four times faster than modern Node.
Shared objects and reference-valued writes remain substantially slower. Node 26
improves vector operations and variable-input math relative to our older Node 18
results; the earlier kernel speedup ratios must not be applied to modern Node.

## Reproduce

```sh
python3 tools/run_runtime_benchmarks.py --sqgi /path/to/sqgi \
  --node /path/to/node --suite kernels --runs 5 --iterations 80000 \
  --warmups 5 --jit 1 --cpu 0 --output /tmp/modern-node-runtime.json
```

## Typed kernels

Fresh separate five-round comparisons with the same settings. Each kernel
executes a complete loop per host call; compilation is excluded. SQGI values
below come from the Node 26 comparisons. All checksums matched.

| Workload | SQGI kernel | Node 24.21.0 | Node 26.9.0 |
|---|---:|---:|---:|
| vector | 8.400 | 135.246 | 110.450 |
| matrix | 6.913 | 7.205 | 6.978 |
| math_intrinsic | 8.162 | 9.155 | 9.033 |
| math_variable | 25.325 | 27.842 | 27.952 |

The vector kernel remains 13.1× faster than Node 26 and 16.1× faster than
Node 24 on the existing object-based vector algorithm. The kernel uses fixed
storage; this is not a comparison against an allocation-free JavaScript rewrite.
Both math kernels have about a 10% lead over modern Node. Matrices are effectively
tied near 7 ns/iteration. Node 26 matrix samples in the full runtime suite ranged
from 6.98 to 28.82 ns; the dedicated comparison was steadier (6.95–7.16 ns).
Do not interpret the full-suite matrix median as a reliable Node 26 regression.

Each kernel runner now accepts `--node /path/to/node`, for example:

```sh
python3 demo/benchmarks/kernels/compare_math_recurrence.py \
  --sqgi /path/to/sqgi --node /path/to/node --runs 5 --iterations 80000 \
  --warmups 5 --cpu 0 --output /tmp/modern-node-math.json
```
