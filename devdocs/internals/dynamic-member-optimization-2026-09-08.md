# Dynamic-member optimization — 2026-09-08

The unchanged dynamic-member kernel improves from **219.814 to 208.046 ns/iteration** in Release (1.06×), and **204.235 to 165.526 ns** with fresh PGO/LTO (1.23×; 19.0% less time). These are five rotating rounds at two million iterations with one same-sized warmup.

The separate five-runtime comparison measures **SQGI PGO 163.438 ns versus Node 33.229 ns**, leaving a **4.92× gap**. Six independent mutating-call workloads improve 1.12–1.59× with PGO; one is 5.4% slower in ordinary Release.

## Profile and implementation

The baseline profile attributed about 89% of sampled cycles to `SQVM::Execute`. Both the dynamic-member outer loop and `PayloadBox.swap_with` were interpreted. The loop mixes changing object references, dynamic keys, writes and a mutating method call. Scalar leaf inlining cannot admit that call.

This pass reuses the bounded field plan for eligible functions containing groups of member reads and writes. Field addresses are resolved afresh on each invocation through the existing raw-slot helper. The plan still requires unchanged VM-stack owners, literal string keys, bounded field counts and compatible effects. Straight-line admission requires a write and at least three GETK/SET operations; it does not inspect names, constants or benchmark identities. Pure getters keep their existing path.

Array/string parameters can now supply borrowed values to native member stores, with a type guard before use. Owners remain on the unchanged VM stack, and displaced values remain retained in the write log. Existing checks and exclusions prevent unsupported allocation, callbacks or owner replacement while field addresses and borrowed pointers are live.

Compiling the method alone was insufficient: initialization, allocation and destruction of its undo log consumed the gain. x64 native functions and loop regions now reserve aligned log storage in their own stack frames. The inline entries are constructed on demand, so a short method does not initialize/destroy all eight entries or allocate/free the log object. Logs exceeding inline capacity retain the existing checked heap growth, index, limit and failure behavior. Other callers, including AArch64, retain lazy heap allocation for the log object.

Commit destroys the used entries; guard failure first rolls writes back, then destroys them. The slot is cleared before destruction, and frame storage is never freed. Inline reverse destruction order is preserved; growth copies all entries before releasing the old owners. Alias visibility and raw weak-reference rollback semantics remain unchanged.

The final trace confirms native execution of `swap_with`, `transfer` and `publish`. The outer dynamic-member loop remains interpreted. Final samples attribute about 72% of cycles to `SQVM::Execute`; write logging, member initialization and native-call boundaries still cost time.

Three perf-stat repetitions each execute ten million iterations plus one same-sized warmup, pinned to CPU 0. Counts include startup and warmup; all checksums agree.

| Counter per process | Before PGO | After PGO | Reduction |
| --- | ---: | ---: | ---: |
| CPU cycles | 19,514,585,452.00 | 15,209,063,706.00 | 22.1% |
| Retired instructions | 88,374,850,766.00 | 79,814,816,595.00 | 9.7% |
| Task clock (ms) | 4,237.33 | 3,295.71 | 22.2% |

## Independent mutating-call workloads

Five rotating rounds, 200,000 iterations, five warmups and fresh processes. All six cases match the interpreter and Node exactly. Written after the implementation and excluded from PGO training, they use tables, classes and mixed layouts, 17 receivers for transfer, 97 for publication, 13 array payloads, 11 elements and five captions. Transfer also exercises aliased receivers. All numbers are ns/iteration.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 159.32 → 122.77 | 146.28 → 92.21 | 1.59× | 6.10 |
| transfer_class | 133.92 → 121.36 | 116.33 → 91.89 | 1.27× | 6.46 |
| transfer_mixed | 175.05 → 128.23 | 150.03 → 95.20 | 1.58× | 8.71 |
| publish_table | 127.67 → 117.70 | 114.54 → 85.18 | 1.34× | 5.21 |
| publish_class | 109.67 → 115.62 | 95.56 → 85.26 | 1.12× | 5.22 |
| publish_mixed | 132.76 → 122.01 | 113.30 → 90.86 | 1.25× | 7.32 |

PGO gains are broader than the original receiver pair, but Node remains substantially faster on these calls. The Release class-publication regression is retained as a measured tradeoff; the same case improves with PGO. This pass does not claim universal gains.

## Whole SQGI regression comparison

Five rotating rounds, 80,000 iterations, five warmups for the original kernel suite, matching checksums and preserved baseline binaries. Includes four additional execution kernels. All numbers are ns/iteration.

| Kernel | Release before | Release after | PGO before | PGO after | PGO speedup |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.729 | 3.791 | 3.816 | 3.774 | 1.01× |
| branch_call | 3.024 | 3.244 | 3.086 | 3.031 | 1.02× |
| float_call | 1.568 | 1.530 | 1.534 | 1.533 | 1.00× |
| numeric_loop | 5.953 | 5.879 | 5.848 | 5.901 | 0.99× |
| vector | 60.625 | 60.375 | 61.262 | 59.975 | 1.02× |
| dynamic_member | 225.238 | 212.275 | 206.350 | 161.800 | 1.28× |
| dynamic_key_get_set | 19.037 | 18.062 | 13.550 | 13.638 | 0.99× |
| object_member_write_fallback | 17.487 | 17.212 | 15.813 | 15.612 | 1.01× |
| array_append | 32.813 | 34.313 | 27.662 | 27.975 | 0.99× |
| array_write | 5.987 | 6.000 | 4.338 | 4.375 | 0.99× |
| array_read | 1.223 | 1.172 | 1.196 | 1.181 | 1.01× |
| array_float | 1.794 | 1.711 | 1.749 | 1.749 | 1.00× |
| math_intrinsic | 26.662 | 25.737 | 25.800 | 25.975 | 0.99× |
| math_variable | 47.175 | 45.112 | 45.413 | 46.075 | 0.99× |
| matrix | 58.625 | 56.638 | 45.950 | 46.137 | 1.00× |
| temporary_arrays | 5.587 | 5.587 | 5.600 | 5.575 | 1.00× |
| gi_scalar | 485.088 | 492.875 | 467.700 | 474.475 | 0.99× |
| gi_clock | 248.988 | 249.450 | 223.900 | 222.188 | 1.01× |
| array_guards | 1.087 | 1.075 | 1.112 | 1.087 | 1.02× |

## SQGI versus Node, GJS and Python

Five rotating rounds, 80,000 iterations, five warmups, CPU 0. Node 18.19.1, GJS 1.80.2 in module mode, CPython 3.12.2. Node/GJS share the same JavaScript source; Python uses ordinary loops and objects without NumPy. All numbers are ns/iteration.

| Kernel | SQGI Release | SQGI PGO | Node | GJS | Python |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.751 | 3.777 | 4.050 | 3.839 | 91.233 |
| branch_call | 3.084 | 3.089 | 2.877 | 2.926 | 67.157 |
| float_call | 1.540 | 1.503 | 1.536 | 1.531 | 40.377 |
| numeric_loop | 5.929 | 5.888 | 5.448 | 5.429 | 60.326 |
| vector | 60.225 | 60.675 | 179.619 | 146.500 | 1818.680 |
| dynamic_member | 212.838 | 163.438 | 33.229 | 22.100 | 273.788 |
| dynamic_key_get_set | 18.562 | 13.525 | 22.124 | 11.625 | 109.259 |
| object_member_write_fallback | 17.313 | 15.312 | 4.135 | 7.088 | 195.907 |
| array_append | 34.700 | 27.938 | 12.783 | 5.862 | 62.832 |
| array_write | 5.925 | 4.375 | 1.598 | 1.863 | 48.546 |
| array_read | 1.209 | 1.192 | 0.658 | 0.883 | 22.026 |
| array_float | 1.751 | 1.737 | 0.561 | 0.772 | 20.638 |
| math_intrinsic | 26.062 | 25.550 | 14.463 | 3.138 | 175.539 |
| math_variable | 46.038 | 45.213 | 55.353 | 32.488 | 159.946 |
| matrix | 57.112 | 46.938 | 7.249 | 14.650 | 351.179 |

## Existing independent regression suites

All 23 existing member, owner and floating cases also remain excluded from PGO training. Five rounds, 200,000 iterations, five warmups; every checksum agrees with Node and the interpreter. Some member PGO cases are 2–3% slower, while the larger floating gains from the preceding pass are preserved. Small shifts should not be treated as universal improvements or attributed to a specific cause without further evidence.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 166.28 → 172.98 | 154.62 → 158.86 | 0.97× | 24.89 |
| class_events_97 | 136.78 → 139.49 | 120.41 → 123.15 | 0.98× | 21.46 |
| buffers_7 | 15.29 → 15.23 | 12.57 → 12.86 | 0.98× | 4.74 |
| buffers_31 | 15.97 → 15.93 | 12.72 → 13.15 | 0.97× | 4.72 |
| calibrate_17 | 15.66 → 15.28 | 15.52 → 15.54 | 1.00× | 3.08 |
| calibrate_67 | 15.51 → 15.29 | 15.49 → 15.29 | 1.01× | 3.06 |
| table_owners_1 | 11.16 → 11.11 | 10.01 → 9.96 | 1.01× | 4.26 |
| table_owners_2 | 12.15 → 12.02 | 10.35 → 10.19 | 1.01× | 4.24 |
| table_owners_5 | 19.60 → 19.65 | 16.35 → 16.32 | 1.00× | 4.16 |
| table_owners_19 | 28.58 → 29.93 | 25.12 → 24.19 | 1.04× | 4.17 |
| table_owners_257 | 185.41 → 184.86 | 162.19 → 163.01 | 1.00× | 4.27 |
| class_owners_1 | 10.84 → 10.97 | 9.79 → 9.85 | 0.99× | 4.18 |
| class_owners_2 | 11.72 → 11.75 | 10.14 → 10.10 | 1.00× | 4.19 |
| class_owners_5 | 19.14 → 19.98 | 16.22 → 15.89 | 1.02× | 4.19 |
| class_owners_19 | 28.08 → 28.92 | 24.93 → 24.70 | 1.01× | 4.22 |
| class_owners_257 | 182.21 → 181.40 | 157.72 → 160.54 | 0.98× | 4.39 |
| filter | 2.19 → 2.12 | 2.15 → 2.17 | 0.99× | 1.56 |
| channels_4 | 9.21 → 9.02 | 9.21 → 9.21 | 1.00× | 2.06 |
| pressure_8 | 27.31 → 27.06 | 26.97 → 26.75 | 1.01× | 3.38 |
| integration | 8.97 → 8.98 | 8.95 → 8.95 | 1.00× | 3.67 |
| retained_input | 8.15 → 8.27 | 8.16 → 8.05 | 1.01× | 1.69 |
| branching | 4.50 → 4.48 | 4.49 → 4.49 | 1.00× | 1.56 |
| helper_control | 8.21 → 8.23 | 8.38 → 8.04 | 1.04× | 1.54 |

## Correctness and build validation

- 97/97 tests passed in Release JIT, fresh PGO/LTO, and Debug ASan/UBSan with leak detection.
- 81/81 tests passed with JIT disabled; 16/16 static ARM core tests passed under QEMU. ARM runtime speed and Windows runtime execution were not measured.
- New frame-log tests poison/reuse aligned storage at 0, 1, 7, 8, 9 and 32 entries, checking commit, rollback, growth, contents and retained-owner counts. Existing allocation-failure, owner-lifetime, weakref and bounded-log tests also pass.
- New native-call tests cover tables/classes with different field layouts, aliased receivers, array/string parameters, changing parameter/element types, and a guard failure after three owning writes. Native execution and rollback routes are asserted. Existing 200 interpreter/JIT member-loop comparisons remain in place.
- The sanitizer/debug build caught an incorrect scalar-tag assertion in the new borrowed-parameter bookkeeping; it was corrected before final tests and measurement.
- All configured tests except the network-downloading `sqgi_test_sqgipkg` ran. The explicit initializer-list include required by the ARM compiler was followed by a targeted host rebuild/retest. Its test-only PGO profile was refreshed; measured CLI/library binaries were verified unchanged.
- GCC 13.3, Release `-O3 -DNDEBUG -g`, JIT enabled, prefix `/usr`, 8-byte integers and floats, no fast-math. PGO uses LTO and a fresh profile directory.
- PGO training used the 97-test suite, original kernels at 20,000 iterations/two warmups, four execution kernels at 20,000 iterations, and seven Vec3 variants at 20,000 iterations/two warmups. All 56 linked core profiles were present; no final core/CLI profile mismatch or missing-profile warnings. The 22 unused bundled-library missing-profile warnings and three existing offsetof warnings remain.

## Rejected experiments and remaining work

Experimental generic GET/modulo fast paths and threaded interpreter dispatch regressed and were removed. An inline class-field entry-lookup experiment also regressed and was removed. The interpreter and member-plan header are byte-for-byte unchanged from the start of this pass. The retained implementation uses the existing generic field-resolution helper and has no new opcodes, monomorphic class dependencies or benchmark-specific recognition.

The next larger step is admitting loops across mutating calls and changing object locals. That requires an explicit ownership/effect contract and rollback design; merely relaxing the current pure-call guards would be unsafe. Member initialization and log-recording overhead are smaller remaining costs.

## Reproduction and evidence

```sh
python3 tools/run_member_benchmarks.py --suite methods \
  --sqgi before=/path/to/before/sqgi --sqgi after=/path/to/after/sqgi \
  --runs 5 --iterations 200000 --cpu 0 --output methods.json
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/release/sqgi --sqgi-pgo /path/to/pgo/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 --output runtimes.json
```

[The accompanying JSON](dynamic-member-optimization-2026-09-08.json) contains raw samples, binary/source hashes, commands, profiles, counter output, the task diff, build/training scripts and validation logs. Temporary binaries and perf data are in `/tmp/sqgi-dynamic-optim-20260908.k57jzcei`. See [tools instructions](../../tools/README.md) for PGO/LTO builds.

Measurements use an i7-12700 P-core with affinity rather than exclusive CPU reservation. These are warm execution microbenchmarks; they exclude most startup and compilation and do not establish complete-application speed.
