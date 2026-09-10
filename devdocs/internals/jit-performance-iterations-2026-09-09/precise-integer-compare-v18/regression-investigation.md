# Investigation of V18 call and float regressions

The original full56 score retains all five >5% audit regressions: direct_call,
float_call, channels_4, pressure_8 and retained_input. Nothing below replaces a
sample, changes a workload or changes its aggregation weight.

Forty timed SQGI processes execute the unchanged full 15-kernel script, using
five rotating audit/V17/V18/identical-V18 rounds in each of two warmup histories.
Per-case counts and integer/float checksums match independent interpreter
references. The full seven-case float script uses the same four SQGI labels plus
Node, with five rotating rounds in each history (50 timed processes). Benchmark
processes are pinned to CPU4; no build, debugger or profiler overlaps them.

| Case | Warmups | Audit ns | V17 ns | V18 ns | Identical V18 ns | V18 / V17 |
|---|---:|---:|---:|---:|---:|---:|
| direct_call | 4 | 34.107 | 34.004 | 35.846 | 35.827 | 1.054170x |
| direct_call | 5 | 34.057 | 33.901 | 35.790 | 35.882 | 1.055721x |
| branch_call | 4 | 31.900 | 31.535 | 33.319 | 33.304 | 1.056572x |
| branch_call | 5 | 31.895 | 31.454 | 33.331 | 33.332 | 1.059674x |
| float_call | 4 | 21.187 | 20.907 | 22.384 | 22.385 | 1.070646x |
| float_call | 5 | 21.491 | 20.841 | 22.366 | 22.381 | 1.073173x |
| filter | 4 | 23.545 | 23.475 | 24.815 | 24.735 | 1.057082x |
| filter | 5 | 23.300 | 23.355 | 24.940 | 24.780 | 1.067866x |
| channels_4 | 4 | 77.870 | 77.980 | 83.905 | 83.750 | 1.075981x |
| channels_4 | 5 | 78.460 | 77.395 | 84.430 | 84.425 | 1.090897x |
| pressure_8 | 4 | 153.445 | 151.465 | 163.100 | 162.680 | 1.076816x |
| pressure_8 | 5 | 152.365 | 151.770 | 162.575 | 164.225 | 1.071193x |
| retained_input | 4 | 44.160 | 44.540 | 47.015 | 47.135 | 1.055568x |
| retained_input | 5 | 44.210 | 44.395 | 47.470 | 46.985 | 1.069265x |

Direct calls are 5.4–5.6% slower than V17 and float calls 7.1–7.3% slower. Channels,
pressure and retained input also repeat the regression. The complete controls
expose branch_call (5.7–6.0%) and filter (5.7–6.8%) costs that did not exceed 5%
against audit in the original fixed-mix batch. These are retained and investigated,
not discarded for falling outside the initial list. Raw data includes every
other control case as well.

## Generated-code attribution

Both frozen binaries execute the unchanged kernel and float scripts in separate
debugger runs after timing. Captures cover the five initially flagged functions,
then branch_call, filter and the noisy array_append control. Each compiled
artifact's weak-reference metadata is saved alongside its bytes and disassembly.

| Native artifact | Added weak guard sites | Added instructions | Added code bytes |
|---|---:|---:|---:|
| direct_call_kernel-loop | 1 | 8 | 32 |
| float_call_kernel-loop | 1 | 8 | 32 |
| channels-loop | 4 | 32 | 128 |
| pressure-loop | 8 | 64 | 256 |
| retained-loop | 2 | 16 | 64 |
| branch_call_kernel-loop | 1 | 8 | 32 |
| array_append_kernel-entry | 0 | 0 | 0 |
| filter-loop | 1 | 8 | 32 |

Each new guard loads the retained weak witness, loads and compares its type, and
branches to the existing failure path. It costs eight instructions per guarded
call. The decoder identifies the actual retained weak address and type before
removing that exact sequence. The remaining instruction streams match after
masking wide immediate values and branch displacements. This is structural
comparison, not a claim that arbitrary immediates are interchangeable. The
changed source, weak metadata, captures and repeated timings support attributing
these call costs to the necessary lifetime guard rather than the precise JCMP
optimization. Native mappings remain 4 KiB for these eight captured artifacts.

## Array-append variance remains open

| Warmups | Audit ns | V17 ns | V18 ns | Identical V18 ns |
|---|---:|---:|---:|---:|
| 4 | 113.950 | 138.838 | 136.619 | 128.731 |
| 5 | 133.137 | 112.219 | 127.031 | 137.362 |

The identical V18 labels differ by -5.77% and +8.13%, while the V18/V17 direction
changes between histories. Its captured entry adds no weak guard and has the
same normalized instruction stream and code size. Thus the call-guard finding
does not explain this older unstable case. Its cause remains unresolved; no
original full-mix sample is replaced. The first extra-capture postprocessor
incorrectly expected a new guard in every function and rejected this unchanged
entry. It was corrected to require zero added guards only for array_append; no
new timing or debugger capture was needed for that correction.

## Decision

Retain the closure-lifetime fix: the activated allocator-reuse contract exposed
incorrect execution without it. Preserve the comparison gain and the compact
large-function coverage repair, while recording the call regressions as real
costs to address next. The full aggregate is still only 1.610484881x audit speed.

First investigate folding the weak witness check into the already-required
closure guard helper, or a cheaper type-bit encoding at the same guard point.
Both must reject a dead witness before using the expected closure and must not
pin that closure. Do not hoist or remove the guard without its separate lifetime
and mutation proof. Keep the activated reuse/release/allocation/rollback tests.
Then pursue the broader native loop/call and guarded builtin coverage required
by the unchanged full56 goal; more owner-only gains cannot complete it.
