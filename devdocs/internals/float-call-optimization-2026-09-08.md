# Floating-call optimization — 2026-09-08

The unchanged float-call kernel improves from **6.964 to 1.581 ns/iteration** in ordinary Release (4.40×), and **6.884 to 1.566 ns** with fresh PGO/LTO (4.40×).

A separate five-runtime comparison measures **SQGI PGO 1.537 ns, Node 1.572 ns and GJS 1.570 ns**. Treat this as parity for this kernel. The seven independent floating workloads improve 1.2–4.8× but remain behind Node.

## What the profile showed

The leaf call was already inlined. Its hot path spent its time in generated code, copying values through XMM0, spilling dead argument/result temporaries and writing/reloading the accumulator each iteration. Refcounting and VM call dispatch were not the hot-loop cost.

The emitted hot loop drops from **52 to 32 instructions** and from **seven floating frame accesses to zero**. The accumulator stays in XMM2 and the multiply/add operate directly on it. Integer modulo, integer temporary moves and reloading the floating constant still remain. The exit path writes the result to memory.

Three perf-stat repetitions execute 100 million iterations with one same-sized warmup, pinned to CPU 0. Counts include startup and warmup; checksums agree.

| Counter per process | Before PGO | After PGO | Reduction |
| --- | ---: | ---: | ---: |
| CPU cycles | 6,256,913,445.00 | 1,423,928,032.00 | 77.2% |
| Retired instructions | 10,234,636,677.00 | 6,234,831,313.00 | 39.1% |
| Task clock (ms) | 1,375.49 | 311.74 | 77.3% |

## Implementation and invariants

- `sqjit_backend_x64_emit` tracks multiple logical names for one physical floating value. Copies can become metadata updates. Overwriting one name detaches it; every still-live alias preserves its original bits.
- Existing bytecode liveness removes dead whole-function names and private inlined-call/conversion temporaries. Native loop regions keep their conservative VM-local exit writeback contract.
- Inlined floating arithmetic can overwrite its left register only if liveness and the alias set prove that all old names are dead or replaced. Subtraction, division and NaN operand order are preserved. No reassociation, FMA or precision reduction is introduced.
- `sqjit_backend_x64_float_loops` owns a bounded convention for up to four live floating locals at eligible loop headers. It validates loop control flow, emits parallel copies on backedges and spills on the exit edge. Shared sources and register cycles are handled explicitly with XMM0 scratch.
- Side entries, side exits, terminal instructions in the body and unsupported backedges reject the loop convention. Internal branches keep the ordinary memory convention. Eligible inner loops can still benefit when an outer loop is rejected.
- Header operand materialization can introduce extra cached values: the conditional emitter preserves the complete hot-edge state, while the exit stub reconciles it to memory. Helpers and guard failures retain their existing flush/replay contract.
- Register alias lists exist only while compiling. XMM2–5 remain volatile cache registers under both supported x64 ABIs; XMM0/1 remain scratch. AArch64 emission and the int64/double ABI are unchanged.

## Independent floating workloads

Five rotating rounds, 200,000 iterations, five warmups, fresh process per runtime. Every result matches an interpreter reference and the Node port exactly. These workloads were written after the implementation and excluded from PGO training. All figures are ns/iteration.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| filter | 10.46 → 2.20 | 10.46 → 2.19 | 4.78× | 1.57 |
| channels_4 | 36.96 → 9.22 | 36.98 → 9.22 | 4.01× | 2.02 |
| pressure_8 | 77.17 → 27.31 | 75.80 → 27.04 | 2.80× | 3.44 |
| integration | 16.07 → 9.15 | 16.05 → 9.05 | 1.77× | 3.67 |
| retained_input | 20.72 → 8.27 | 20.74 → 8.28 | 2.50× | 1.68 |
| branching | 7.93 → 4.58 | 7.84 → 4.58 | 1.71× | 1.56 |
| helper_control | 10.04 → 8.38 | 10.09 → 8.23 | 1.23× | 1.57 |

Four/eight channels exercise register pressure; integration and retained-input cases keep values live across calls; branching forces control-flow reconciliation; the helper control crosses the math ABI. These demonstrate broader effects than the original two-argument affine recurrence. The fixed four-register cache and memory joins still cost substantially more than Node on complex cases.

## Whole SQGI regression comparison

Five rotating rounds compare preserved before binaries with the final builds on the original 15 kernels plus four execution kernels. 80,000 iterations per sample, matching checksums, same compiler flags. All figures are ns/iteration.

| Kernel | Release before | Release after | PGO before | PGO after | PGO speedup |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.846 | 3.789 | 3.841 | 3.838 | 1.00× |
| branch_call | 3.099 | 3.070 | 3.051 | 3.108 | 0.98× |
| float_call | 6.964 | 1.581 | 6.884 | 1.566 | 4.40× |
| numeric_loop | 5.964 | 5.987 | 6.054 | 6.046 | 1.00× |
| vector | 61.187 | 61.988 | 62.100 | 61.538 | 1.01× |
| dynamic_member | 230.325 | 231.462 | 204.888 | 212.025 | 0.97× |
| dynamic_key_get_set | 21.313 | 18.412 | 13.713 | 13.875 | 0.99× |
| object_member_write_fallback | 17.263 | 17.600 | 16.000 | 15.813 | 1.01× |
| array_append | 35.200 | 33.775 | 28.887 | 28.825 | 1.00× |
| array_write | 6.050 | 6.050 | 4.500 | 4.588 | 0.98× |
| array_read | 1.223 | 1.218 | 1.201 | 1.197 | 1.00× |
| array_float | 1.788 | 1.790 | 1.785 | 1.762 | 1.01× |
| math_intrinsic | 26.625 | 26.650 | 26.600 | 26.087 | 1.02× |
| math_variable | 47.100 | 46.875 | 46.262 | 46.088 | 1.00× |
| matrix | 61.538 | 58.675 | 47.288 | 46.913 | 1.01× |
| temporary_arrays | 7.325 | 5.675 | 7.300 | 5.675 | 1.29× |
| gi_scalar | 500.375 | 502.138 | 475.750 | 478.625 | 0.99× |
| gi_clock | 259.400 | 251.287 | 226.612 | 227.488 | 1.00× |
| array_guards | 1.125 | 1.050 | 1.112 | 1.125 | 0.99× |

The PGO dynamic-member result was 3.5% slower in the short suite. A five-round follow-up at two million iterations and one warmup measured **199.977 → 204.167 ns (2.1% slower)**. Release was 222.099 → 223.952 ns. This remains a measured tradeoff; its cause has not been established.

## SQGI versus Node, GJS and Python

Five rotating rounds, 80,000 iterations, five warmups, CPU 0. Node 18.19.1, GJS 1.80.2 in module mode, CPython 3.12.2. Pure Python loops/objects; no NumPy. Node/GJS share the same JavaScript source. All figures are ns/iteration.

| Kernel | SQGI Release | SQGI PGO | Node | GJS | Python |
| --- | ---: | ---: | ---: | ---: | ---: |
| direct_call | 3.838 | 3.854 | 4.127 | 3.908 | 92.486 |
| branch_call | 3.115 | 3.077 | 2.929 | 2.969 | 68.431 |
| float_call | 1.571 | 1.537 | 1.572 | 1.570 | 42.108 |
| numeric_loop | 5.950 | 5.939 | 5.519 | 5.593 | 61.670 |
| vector | 61.988 | 61.163 | 188.875 | 150.388 | 1834.286 |
| dynamic_member | 215.950 | 206.563 | 34.190 | 22.700 | 272.637 |
| dynamic_key_get_set | 18.300 | 13.688 | 22.187 | 12.050 | 105.701 |
| object_member_write_fallback | 17.225 | 15.588 | 4.068 | 7.112 | 197.682 |
| array_append | 33.263 | 28.587 | 12.712 | 6.150 | 64.170 |
| array_write | 5.938 | 4.437 | 1.741 | 1.912 | 50.084 |
| array_read | 1.196 | 1.217 | 0.680 | 0.897 | 22.223 |
| array_float | 1.749 | 1.756 | 0.565 | 0.776 | 20.449 |
| math_intrinsic | 26.087 | 26.038 | 14.489 | 3.225 | 178.623 |
| math_variable | 47.150 | 46.088 | 56.564 | 32.550 | 162.497 |
| matrix | 58.763 | 46.250 | 7.454 | 15.012 | 354.133 |

## Member and ownership regression workloads

These two suites also remain excluded from PGO training. Five rotating rounds, 200,000 iterations, five warmups, exact interpreter and Node checksum checks. The complete samples are in the JSON. A few PGO cases are 3–4% slower, including class events and five-owner cases; this pass does not claim an improvement across every workload.

| Workload | Release before → after | PGO before → after | PGO speedup | Node |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 175.56 → 170.39 | 153.91 → 152.86 | 1.01× | 24.86 |
| class_events_97 | 141.28 → 135.31 | 116.64 → 121.23 | 0.96× | 22.26 |
| buffers_7 | 15.32 → 15.29 | 12.68 → 12.81 | 0.99× | 4.70 |
| buffers_31 | 15.66 → 16.09 | 12.79 → 12.89 | 0.99× | 4.92 |
| calibrate_17 | 15.41 → 15.52 | 15.30 → 15.45 | 0.99× | 3.08 |
| calibrate_67 | 15.57 → 15.44 | 15.39 → 15.53 | 0.99× | 3.05 |
| table_owners_1 | 11.01 → 10.98 | 10.05 → 10.12 | 0.99× | 4.35 |
| table_owners_2 | 12.09 → 12.12 | 10.25 → 10.35 | 0.99× | 4.37 |
| table_owners_5 | 20.26 → 19.90 | 16.07 → 16.55 | 0.97× | 4.25 |
| table_owners_19 | 29.09 → 29.32 | 25.57 → 24.86 | 1.03× | 4.25 |
| table_owners_257 | 187.32 → 182.82 | 160.94 → 159.19 | 1.01× | 4.40 |
| class_owners_1 | 10.87 → 10.97 | 9.77 → 9.72 | 1.01× | 4.30 |
| class_owners_2 | 11.93 → 12.13 | 10.23 → 10.16 | 1.01× | 4.28 |
| class_owners_5 | 20.12 → 19.90 | 15.89 → 16.46 | 0.97× | 4.38 |
| class_owners_19 | 30.20 → 29.82 | 25.07 → 25.66 | 0.98× | 4.30 |
| class_owners_257 | 186.74 → 186.25 | 162.84 → 166.95 | 0.98× | 4.44 |

## Correctness and build validation

- 97/97 tests passed with Release JIT, Debug ASan/UBSan with leak detection, PGO training and final PGO/LTO.
- 81/81 tests passed with Debug JIT disabled.
- 16/16 static AArch64 core tests passed under QEMU, including the shared floating differential suite. This is compatibility evidence, not a native ARM performance result.
- New `test_sqjit_float_cache.cpp`: 288 executable register-copy probes cover every four-register permutation, cycles, shared sources, integer overwrite and mixed memory/register sources. Raw signed-zero, infinity and NaN payload bits are checked.
- 672 interpreter/JIT comparisons cover 14 workloads, six iteration counts and eight double inputs, including subnormal, huge, infinite and NaN values. Native-route assertions cover whole functions and OSR loop regions. Tests also cover closure rebinding and a late guard failure.
- All configured tests except the network-downloading `sqgi_test_sqgipkg` ran. Existing Windows x64 ABI emitter tests passed on the host; Windows runtime execution was not tested.
- GCC 13.3, Release `-O3 -DNDEBUG -g`, prefix `/usr`, JIT enabled, 8-byte integers/floats. No fast-math. The PGO build uses LTO and a fresh profile directory.
- Training used the 97-test suite, the original 15 kernels at 20,000 iterations/two warmups, four execution kernels at 20,000 iterations, and seven Vec3 variants at 20,000 iterations/two warmups. All 56 linked core profiles were present. No core/CLI missing-profile or profile-mismatch warnings; 22 unused bundled-library profile warnings and three pre-existing `offsetof` warnings remain.

## Reproduction and evidence

Build Release with JIT enabled. For PGO/LTO use a fresh directory, train in `GENERATE` mode, then rebuild in the same directory with `SQGI_PGO_MODE=USE`; see [tools instructions](../../tools/README.md). Keep the independent suites out of training.

```sh
python3 tools/run_member_benchmarks.py --suite floats \
  --sqgi before=/path/to/before/sqgi --sqgi after=/path/to/after/sqgi \
  --runs 5 --iterations 200000 --cpu 0 --output floats.json
python3 tools/run_runtime_benchmarks.py \
  --sqgi /path/to/release/sqgi --sqgi-pgo /path/to/pgo/sqgi \
  --runs 5 --iterations 80000 --warmups 5 --cpu 0 --output runtimes.json
```

[The accompanying JSON](float-call-optimization-2026-09-08.json) preserves binary/source hashes, raw benchmark samples, exact commands, hardware-counter output, generated assembly, comparison scripts and final test/training logs. Temporary binaries and perf.data live in `/tmp/sqgi-float-optim-20260908.q35vg_b0`.

Measurements use an i7-12700 P-core with affinity, without exclusive CPU reservation. The large float improvements have independent-workload and hardware-counter support; small unrelated shifts should not be treated as universal gains. These are warm microbenchmarks, not startup or complete application results.
