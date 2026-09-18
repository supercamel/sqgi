# RouteTastic runtime improvements — 2026-09-18

The follow-up goal was to bring warmed RP2040 import within 10% of the
interpreter, eliminate the ordinary-JIT regressions on board analysis and four
maze searches, and improve real application execution over the saved pre-goal
binary. The measured targets are met. This does not establish Node parity on
arbitrary dynamic programs.

## Changes and evidence

1. **Remember rejected bytecode locations permanently.** The old eight-entry
   rejection cache thrashed on branch-heavy parsing code. A CPU profile of ten
   RP2040 imports attributed 41.33% of samples to bytecode analysis, 11.65% to
   instruction facts and 8.92% to analysis-vector initialization. Replacing the
   cache with a lazy bitmap (one bit per instruction location) prevents repeated
   discovery/analysis of already rejected regions. This is generic runtime
   bookkeeping, with no application-specific checks or new native coverage.
2. **Format decimal integers directly.** The remaining search profile showed
   time in printf formatting while the application builds coordinate keys.
   `tostring`, concatenation and in-place string append now use a small decimal
   formatter, with unsigned magnitude arithmetic for the minimum signed value.
   Floating formatting and dynamic conversion callbacks retain their behavior.
   This benefits both the interpreter and JIT's interpreted portions.

RouteTastic source and inputs were unchanged. All production parsing, geometry,
search callbacks and routing algorithms are still the original application code.

## Warm application results

Milliseconds; medians of three fresh process rounds, second workflow pass per
process, fresh board/search state each pass. CPU 0, normal threshold 1000,
LLVM 18, int64/double, threaded dispatch, RelWithDebInfo, no LTO/PGO. Mode order
rotates. The saved baseline is the binary immediately before this goal.

| Configuration | Small-board analysis | RP2040 analysis | Four searches | Full two-net autoroute |
|---|---:|---:|---:|---:|
| Before: ordinary JIT | 5.137 | 10286.540 | 704.768 | 11.668 |
| Current interpreter | 1.156 | 9980.836 | 614.037 | 7.155 |
| Current ordinary JIT | 1.210 | 9676.632 | 608.018 | 7.320 |
| Current kernels + interpreter | 1.133 | 439.177 | 594.433 | 7.185 |
| Current kernels + JIT | 1.199 | 433.792 | 592.523 | 7.304 |

| RP2040 phase | Before JIT | Current interpreter | Current JIT |
|---|---:|---:|---:|
| Import + rules | 707.460 | 211.993 | 208.384 |
| Connectivity | 2454.372 | 2502.651 | 2423.337 |
| DRC | 7135.975 | 7265.497 | 7044.911 |

RP2040 import is **3.39× faster** than the saved JIT build and
1.7% faster than the current interpreter. Full ordinary-JIT analysis
uses **5.9% less time** than before and 3.0% less than the interpreter.
The four searches use **13.7% less time** than before and are now at interpreter parity.

An independent five-round search-only run measured 699.785 ms before,
609.145 ms current JIT and 611.221 ms current interpreter. Small-board analysis
and simple autoroute still have small JIT overheads; those are visible above.

Kernels + JIT now complete the warmed board workflow in 433.792 ms.
The original investigation measured 932.443 ms in that configuration before
these fixes; that earlier number is a separate run, not a paired baseline row.
The current interpreter-only workflow takes 23.0× as long as kernels + JIT.

## First-pass costs and scope

First-pass time below includes module imports, parsing, compilation and the
workflow, but excludes VM process startup. Complete process wall times (both
passes and teardown) are also retained in the raw report.

| Configuration | RP2040 first pass including imports | Four-search first pass including imports |
|---|---:|---:|
| Before: ordinary JIT | 10472.364 ms | 716.982 ms |
| Current interpreter | 10146.321 ms | 620.490 ms |
| Current ordinary JIT | 9885.163 ms | 618.277 ms |
| Current kernels + interpreter | 771.937 ms | 791.522 ms |
| Current kernels + JIT | 809.851 ms | 795.180 ms |

Kernel module imports still cost roughly 322 ms for board analysis, versus
137 ms for pure Squirrel. Kernels + JIT's first board pass remains slower than
kernels + interpreter, despite the similar warmed times. These changes do not
remove compilation cost or broaden support for arbitrary methods/callbacks.
Separate untimed diagnostics at threshold 1000 confirm the mechanism: over two
four-search passes, failed loop-discovery attempts fell from **2,065,787 to 88**.
Native coverage stayed identical: one compiled function, 106,334 successful
frameless native calls, and no compiled search loops. All search outputs matched.
[Coverage diagnostics](benchmark-results/routetastic-goal-coverage.json) retain
both summaries. Statistics collection is excluded from the timed results.

Most object-heavy application code still interprets. Native helpers and existing
boxed loops remain available; unsupported code falls back without repeated
analysis. No claim of general application parity with Node follows from this.

The search fixtures use production `RouteSearch.Engine` with synthetic obstacles;
they are not four full-board autoroutes. The two-net autoroute is end-to-end but
small/easy. RP2040 is already connected, so its workflow measures import,
connectivity and DRC. See the [original investigation](realworld-routetastic-benchmarks.md)
for workload definitions and the previous cross-language comparisons.

## Correctness and reproducibility

All 120 workflow outputs in the three-round matrix matched recursively across
modes, fresh process runs and fresh workflow state, including full DRC findings,
search paths/metrics and generated route geometry. Source/input fingerprints
were recorded, and application source fingerprints remained unchanged.

Regression coverage checks that more than eight rejected branch locations stay
rejected, adjacent eligible loops still compile, and the bitmap neither rejects
neighboring locations nor mishandles negative/duplicate queries. Integer tests
compare against independent printf formatting across decimal boundaries and
signed extrema, including string alias preservation.

The 31 selected JIT/interpreter tests pass in both the normal build and an
ASan/UBSan build (62 passes). The six independent Dijkstra-oracle search tests
pass in interpreter, ordinary-JIT and kernel configurations (18 passes).
The five-round, 15-workload runtime suite also retained its performance: SQGI
medians stayed within about 1.1% of the saved binary, and every result matched
the interpreter reference, baseline, Node 26.9.0, GJS and Python.
[Microbenchmark raw results](benchmark-results/routetastic-goal-microbenchmarks.json)
retain the complete comparison.

[Validation output](benchmark-results/routetastic-goal-validation.json) records
the commands and complete test output.

[Application raw results](benchmark-results/routetastic-goal-final.json) and
[five-round search confirmation](benchmark-results/routetastic-goal-search.json)
retain individual samples, reference outputs, output hashes and commands.

```sh
python3 tools/run_routetastic_benchmarks.py \
  --repo ../RouteTastic --sqgi /path/to/current/sqgi \
  --baseline /path/to/pre-goal/sqgi \
  --board '../RouteTastic/apx rp2040.kicad_pcb' \
  --tasks board_small board search autoroute \
  --modes interpreter before_jit jit kernels_interpreter kernels_jit \
  --rounds 3 --repeats 2 --threshold 1000 --cpu 0 \
  --output /tmp/routetastic-goal.json
```

The application runner now defaults to threshold 1000. Use `--threshold 1`
explicitly for aggressive-compilation diagnostics.
