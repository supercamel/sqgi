# Opcode-specialized precise helpers, V5

Experimental and disabled by default. The native compiler selects a separate
C++ template instantiation for each bytecode opcode. Constant opcode selection
removes the runtime switch and unrelated temporary-cleanup paths. GET assigns
the borrowed source directly to the VM temporary, eliminating a redundant
helper-local owner. SQObjectPtr assignment copies the bits and adds the new
reference before releasing the previous value; the release guard still runs
before assignment. The following destination/temporary swap is unchanged.

Frozen ordinary Release binary: `build-jit-audit-20260909/precise-specialized-v5/sqgi`,
SHA-256 `b6b4063ea205cb60973b68ff3dee834b5a5c42855c2be36d86aecf72c5e63f5e`.
`specialized-delta.patch` applies after V4. `audit-runtime-tests.patch` reconstructs
the complete current runtime/test changes from the audited working tree, with
byte-for-byte verification across all 26 changed files. All 88 original
benchmark, top-level test-script and benchmark-driver files remain unchanged.

Validation: 100/100 selected tests in Release and strict ASan/UBSan, with the
option both enabled and disabled; all 41 holdouts agree with JIT-off in each
build, seed 83, 20,003 iterations and one warmup. This is an AArch64-only change;
the preceding shared/x64 results still apply, including the open x64 defects.

## Five-round comparisons

Rotating V4/V5/Node runs use CPU 4, 200,000 iterations and five warmups, with an
independent interpreter checksum reference. No build, test, profiling or debugger
work overlaps timing.

| Suite | V5 speedup versus V4 | Component range |
| --- | ---: | ---: |
| Owners | **1.3832×** | 1.3524–1.4137× |
| Members | **1.0517×** | 0.9981–1.1731× |
| Methods | **1.1257×** | 1.1098–1.1395× |

Table owners take about 371 ns; class owners about 409–410 ns per iteration.
Table/class event records improve 1.1731× / 1.1562× versus V4. This does not
establish elimination of their earlier regressions versus the audit.

A separate five-round comparison with **four warmups**, rotating V3/V4/V5/Node,
gives **1.4861× versus V3** (range 1.4520–1.5225×) and **1.3781× versus V4**
(range 1.3465–1.4109×) across all ten owner cases. The large owner gain survives
the changed call history.

Five paired unchanged kernel runs improve dynamic_member from 1.019700 to
0.917594 microseconds (1.1113×). Other kernels stay within 4%, except array_append
which again appears 0.8464× as fast. An identical-binary negative control then
produces an apparent **1.1854× array_append speedup** with exactly the same V5
binary on both sides. Both groups span roughly 0.108–0.147 microseconds. This
control demonstrates substantial instability with five samples; it does not
identify the mechanism or establish a code regression. Original comparisons
and negative controls are retained separately, and no component is dropped or
reweighted in the full-mix metric.

All seven fresh profiles, the route diagnostics and five-round interpreter
comparisons are complete. Every original and identical-control kernel row also
matches the independent interpreter reference, including exact operation counts. Full 56-component timing for V5, both application acceptance
seeds/counts and matched PGO/LTO are still required before promotion or any
claim about the original goal. The goal remains unmet.


## Profiles, controls and remaining interpreter gap

All seven V5 profiles use CPU 4, 499 Hz cycles:u, DWARF/8192, five warmups and
160,000 kernel / 200,000 other-suite iterations, with zero lost samples. Separate
three-run hardware-counter captures and trace logs are archived. The owner
trace again records 70 native returns, no entry-guard failures and no side exits.

| Owner self share | Percent |
| --- | ---: |
| GETK helper (opcode 9) | 23.19% |
| SET helper (13) | 16.13% |
| GET helper (14) | 12.76% |
| CanRelease | 10.77% |
| ADD helper (17) | 6.27% |
| LOAD helper (1) | 5.26% |

Member lookup is inlined into the specialized helpers; disappearance of a
separate precise_member symbol is not elimination of lookup work. GETK/SET/GET
now sum to 52.08% of owner self samples and are the next target. Method samples
still include 32.34% SQVM::Execute, 8.80% CanRelease, and 22.98% in these three
member helpers.

The array diagnostic retains every original kernel body and correctness
initialization, selecting only array_append in the timing driver. Five rotating
rounds of audit/V3/V4/V5 with four and five warmups report matching aggregate
native-route counters (ignoring the added zero-side-exit line). Median times
span 0.108875–0.111912 microseconds across build/warmup groups; all are within
3% of the corresponding audit. Individual slow samples remain. This is a
diagnostic with tracing enabled and is excluded from the accepted full-mix
score. It neither explains nor hides the full-suite variability.

The identical-V5 application control at seed 83 / 400,003 iterations shows
records_4096 at 0.9764×, with all component differences below 2.5%. This does
not reproduce its earlier large ablation regression; records_4096 remains an
open performance investigation with mixed batch results.

Five alternating JIT-off/on rounds, CPU 4, five warmups and 200,000 iterations,
give JIT/interpreter ratios:

| Case or suite | V3 | V5 |
| --- | ---: | ---: |
| Owner geometric mean | 1.8645× | **1.2500×** |
| Method geometric mean | 1.6435× | **1.4652×** |
| root_integer | 1.4342× | **1.2879×** |

These are separate measured batches, not an aggregate comparison. Original
audit penalties were 2.916×, 2.640× and 1.395× respectively. The owner gap has
shrunk substantially, but none of these three milestone conditions is satisfied.
All experiments remain opt-in. V5 still needs its unchanged full 56-component
comparison and both application acceptance seeds/counts; prior V3 aggregate
numbers must not be relabeled as V5. Fresh matched PGO/LTO remains outstanding.
