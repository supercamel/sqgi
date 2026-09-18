# RouteTastic and application-component performance — 2026-09-18

The [runtime follow-up](routetastic-runtime-improvements.md) fixes the import
regression and speeds up search. The tables below are the preserved **before-fix**
investigation; use the follow-up for current RouteTastic results.

The ordinary-Squirrel microbenchmark parity result does **not** generalize to
these application workloads. The typed kernels deliver substantial real gains
on a geometry-heavy PCB analysis; the automatic bytecode JIT generally gives
little benefit and sometimes makes the application slower. No compiler/runtime
optimizations were changed during these measurements.

## Application and methodology

The drivers import the existing local RouteTastic modules without rewriting them.
The RP2040 input has 275 pads, 585 track segments, 85 vias and four layers. Every
configuration produces zero remaining connections and the same two DRC findings.
The full two-net routing pipeline produces the same two generated segments,
connects both nets and reports no failed routes in every configuration.

Measurements use the same LLVM 18 SQGI build as the prior parity report,
RelWithDebInfo, int64/double, threaded dispatch, no LTO/PGO, pinned to CPU 0 on an
i7-12700. Source/input/native-library hashes are recorded. RouteTastic's checkout
already contained local changes; the hash checks verify it stayed unchanged during
measurement. No application source, original board or project file was modified.

The primary application comparison below uses the **normal JIT threshold of
1,000 calls**, three fresh process rounds and two workflow passes per process.
The first pass is recorded separately; the second uses fresh board/search state
in the same VM. Runtime order rotates. Native GI with the interpreter was measured
in a separate three-round follow-up and its outputs compared against the same
reference. Reports retain individual timing samples and complete reference outputs.

The geometry backend is explicitly selected. Kernel/native configurations also
permit the application's existing spatial kernels; pure Squirrel configurations
disable them. Thus these are complete application configurations, not isolated
comparisons of one math operation. All native-GI results include GI adapter costs.

## Warm application results

**Milliseconds per complete workflow**, lower is better. Search means four
multilayer maze searches using the production `RouteSearch.Engine`; full autoroute
means `route_all` on the supplied two-net board followed by connectivity validation.

| Configuration | Small-board analysis | RP2040 analysis | Four searches | Full two-net autoroute |
|---|---:|---:|---:|---:|
| Squirrel interpreter | 1.171 | 10034.160 | 662.779 | 7.245 |
| Ordinary JIT | 5.183 | 10286.550 | 701.411 | 11.688 |
| Kernels + interpreter | 1.155 | 440.842 | 644.485 | 7.148 |
| Kernels + JIT | 5.124 | 932.443 | 683.855 | 11.598 |
| Native GI + interpreter | 1.185 | 519.925 | 736.043 | 7.164 |
| Native GI + JIT | 5.153 | 1004.514 | 768.180 | 11.836 |

On the RP2040 analysis, kernels with the interpreter are **22.8× faster** than
pure Squirrel and about **1.18× faster** than native GI geometry with the interpreter.
Ordinary JIT is approximately **2.5% slower** than the interpreter overall; enabling
it alongside kernels roughly doubles the elapsed time. Small-board workloads do
not amortize kernel compilation and receive little benefit from kernel geometry.

The search fixtures are application-component tests with synthetic obstacles,
not four full-board autoroutes. The two-net end-to-end route is real application
code but a small/easy board; it must not be extrapolated to difficult PCB routing.
The RP2040 board is already connected, so its workflow measures import,
connectivity and DRC, not routing new copper.

### Where the RP2040 time goes

**Milliseconds**, medians of individual phases (their sum need not equal the
median of total time).

| Configuration | Import + rules | Connectivity | DRC |
|---|---:|---:|---:|
| Squirrel interpreter | 217.115 | 2516.431 | 7300.614 |
| Ordinary JIT | 700.460 | 2457.078 | 7125.792 |
| Kernels + interpreter | 217.819 | 62.995 | 160.030 |
| Kernels + JIT | 706.880 | 63.005 | 162.671 |
| Native GI + interpreter | 218.798 | 83.682 | 218.412 |
| Native GI + JIT | 700.126 | 83.419 | 220.676 |

Import grows from about **217 ms to 700 ms** with the bytecode JIT enabled. This
persists at the normal threshold and is not just first-call compilation cost.
Kernels cut connectivity from roughly **2.5 s to 63 ms**, and DRC from **7.3 s to
160 ms**. The next runtime investigation should target the import slowdown and
object/callback-heavy execution, rather than claiming broad parity from private
numeric loops.

## First-pass costs

**Milliseconds including module imports and the first workflow pass**. This
includes kernel compilation performed by module loading and JIT compilation
triggered by execution. It excludes process startup before the driver begins;
full process wall times, including startup, both passes, output and teardown,
are separately retained in the reports.

| Configuration | Small-board analysis | RP2040 analysis | Four searches | Full two-net autoroute |
|---|---:|---:|---:|---:|
| Squirrel interpreter | 140.879 | 10180.524 | 672.221 | 268.041 |
| Ordinary JIT | 144.486 | 10472.451 | 711.348 | 273.012 |
| Kernels + interpreter | 322.757 | 771.717 | 845.193 | 460.068 |
| Kernels + JIT | 326.922 | 1303.175 | 884.042 | 464.658 |
| Native GI + interpreter | 141.257 | 668.356 | 744.246 | 269.218 |
| Native GI + JIT | 145.047 | 1197.849 | 783.495 | 275.601 |

Geometry-kernel module imports add about **183 ms** here. For the large board,
the savings outweigh that cost even on the first pass. For the small example,
first-pass analysis rises from about 141 ms to 323 ms with kernels/interpreter.

## Identical-tree comparison with Node, GJS and Python

The fixture exports RouteTastic's actual constructed object tree. Every runtime
traverses the same tree and the same 4,096 bounding-box queries, allocates result
arrays, and checks the same ordered checksum: **593450353**, with **690 matches**.
The ports implement the application's traversal algorithm using each language's
objects and functions; they do not reproduce every Squirrel module-lookup cost.
Tree construction, fixture parsing and compilation are outside query timings.
Five process rounds, with internal warmups excluded.

| Runtime/path | Milliseconds per 4,096 queries |
|---|---:|
| SQGI interpreter, object tree | 21.212 |
| SQGI JIT, object tree | 21.476 |
| SQGI kernel + interpreter host | 3.624 |
| SQGI kernel + JIT host | 3.567 |
| Node 26.9.0, object tree | 2.323 |
| GJS 1.80.2, object tree | 2.212 |
| Python 3.12.2, object tree | 13.355 |

The application kernel is about **6× faster** than ordinary SQGI traversal,
but Node is about **1.54× faster** than the kernel path including Squirrel result
materialization. Ordinary SQGI traversal is about **9.25× slower** than Node here.
This is one ported application component, not Node running the entire PCB tool.

## Public geometry adapters

The application's existing geometry benchmark includes argument conversion and
GI/kernel call overhead. Three process rounds; first internal samples discarded;
JIT threshold 1. **Microseconds per operation**, 8,192 operations per pass:

| Operation | Native GI | Typed-kernel adapter | Native/kernel time |
|---|---:|---:|---:|
| point_segment | 2.033 | 0.320 | 6.36× |
| segment_segment | 2.997 | 0.436 | 6.87× |
| rotated_point | 2.361 | 0.365 | 6.46× |
| rotated_segment | 3.450 | 2.651 | 1.30× |
| prepared_polygon | 1.977 | 0.782 | 2.53× |

These compare the application's public adapters, not bare C against bare LLVM
instruction throughput. All operation checksums matched.

## Other application-style workloads

The existing independent application-component suite was run with a different
input seed (431), 200,000 iterations, five warmups and five process rounds. These
are synthetic component workloads, separate from the actual RouteTastic modules.
This suite uses the earlier aggressive JIT threshold of 1. **ns/iteration**:

| Workload | SQGI before changes | SQGI now | Node 26.9 | GJS | Python |
|---|---:|---:|---:|---:|---:|
| route_balanced | 44.375 | 44.850 | 2.759 | 2.650 | 71.703 |
| route_skewed | 44.195 | 45.170 | 2.849 | 2.680 | 69.816 |
| pricing_events | 63.435 | 63.250 | 3.755 | 3.585 | 114.874 |
| filter_stream | 52.265 | 52.630 | 1.809 | 3.075 | 76.619 |
| records_64 | 80.045 | 80.385 | 7.410 | 12.975 | 149.275 |
| records_4096 | 91.570 | 92.600 | 6.106 | 14.380 | 167.058 |
| word_count | 63.380 | 63.830 | 20.982 | 41.105 | 98.173 |
| graph_walk | 15.485 | 5.555 | 2.726 | 3.930 | 42.602 |

Graph traversal improves **2.8×** over the saved SQGI build: this is evidence
that some improvements transfer beyond the original suite. It remains about
2× slower than Node. Most other workloads change little, and Node is roughly
3–29× faster across these rows. Shared input arrays/records, changing table
entries and ordinary helper calls do not receive the same whole-function
optimization as the earlier private-object benchmarks.

## Diagnostics and validation

Separate diagnostic runs use threshold 1 so every encountered function is
considered. They are excluded from timing medians; statistics collection itself
was expensive. On the two-pass RP2040 run, **5 of 650 considered functions**
compiled, with 645 rejected, mostly because LLVM required a scalar function.
Those few functions still accounted for **44.6 million successful direct native
calls**; compiled-function counts must not be mistaken for CPU-time coverage.
Three loop regions compiled, with 14,886 successful loop entries.

The four-search fixture compiled **1 of 29 considered functions**, made 107,333
successful direct native calls, and compiled no loop regions. This demonstrates
partial native execution, not broad compilation of the object-heavy search.
Neither entry counts nor number of compiled functions measures native CPU time.

All measured modes matched full board findings/connectivity, generated route
geometry, and search paths/costs/metrics. Native-GI/interpreter outputs were also
checked against the primary interpreter reference. All spatial ordered checksums
and application-component checksums matched. The existing independent Dijkstra
oracle suite passed **6/6 tests** with the interpreter, ordinary JIT and kernel
configuration, for **18 passing tests** in total ([test output](benchmark-results/routetastic-oracle-tests.json)).

The threshold-1 baseline comparison found no meaningful transfer of the recent
microbenchmark gains to RouteTastic: RP2040 analysis was 10.129 s before versus
10.259 s now, and search was 705.694 ms before versus 705.049 ms now. These small
differences should not be advertised as improvements; the much larger JIT-on/off
import regression exists in both builds.

## Reproduction and artifacts

See [driver instructions](../demo/benchmarks/routetastic/README.md). The drivers
and ports live in `demo/benchmarks/routetastic`; the reusable runners are
`tools/run_routetastic_benchmarks.py` and `tools/run_routetastic_spatial_ports.py`.

- [Normal-threshold application measurements](benchmark-results/routetastic-default-threshold.json).
- [Native-GI/interpreter follow-up](benchmark-results/routetastic-native-interpreter.json).
- [Aggressive-threshold baseline comparison and diagnostics](benchmark-results/routetastic-routetastic-final.json).
- [Spatial runtime comparison](benchmark-results/routetastic-spatial-ports.json).
- [Application-component comparison](benchmark-results/routetastic-application-components.json).

Application artifacts compact duplicated stdout/reference outputs while retaining
all timing samples, commands, hashes, diagnostics, one full reference output per
task, and per-result digests. Full session outputs are in `/tmp/sqgi-realworld`.
No conclusions about whole-application Node parity or UI responsiveness follow
from these measurements.
