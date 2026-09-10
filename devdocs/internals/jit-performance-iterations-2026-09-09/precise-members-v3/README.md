# Precise member and caller contracts, V3

Experimental; still enabled only by `SQGI_JIT_PRECISE_EXITS=1`.
The ordinary Release executable is frozen at
`build-jit-audit-20260909/precise-members-v3/sqgi`, SHA-256
`54bbf1e96fd71823ee3586f70337b33a7dc6d9a86bf35aea9638df5188ca7ba6`.

Backend compilation now explicitly accepts an `allow_side_exits` capability,
false by default. Raw backend callers retain their original rollback ABI.
Actual VM frame compilation enables the capability; lowered object-plan and
frameless requests do not. The experimental artifact still rejects frameless
execution before effects.

GET resolves inherited/default/root values through the existing borrow-only
resolver when a raw slot is absent. SET may resolve an existing executing-VM
root slot only for the original implicit receiver, preserving delegation and
`_set` precedence. Reference-valued SET results check combined drops before
either heap or result write. Borrowed lookup creates no helper owner that could
inflate the release proof.

Tests preserve raw rollback and rejection checks. Tests of successful precise
calls use real VM frames and require per-prototype native successes; semantic
interpreter-only success cannot satisfy them. Late-exit tests require explicit
side-exit counters and committed-prefix behavior. A generated SET fixture forces
a heap/result two-alias drop, with userdata, array and table owner graphs. Its
release hook observes the preceding heap write and exactly one prefix update.

Validation is complete for this source snapshot:

- Release: 100/100 selected tests, both experiment disabled and enabled.
- Strict ASan/UBSan: 100/100, both disabled and enabled.
- All 41 independent holdout components agree with the interpreter in Release
  and sanitizers, experiment enabled, seed 83 / 20,003 iterations / one warmup.
  Sanitizer holdouts also enable leak and stack-use-after-return detection.
- Shared x64/QEMU: six of seven tests pass; the unchanged member-plan failures
  comprise 27 release-ordering and five native result-coverage assertions.
  These remain open cross-backend defects.
- `sqgi_test_sqgipkg` is excluded from the selected 100-test suite as in prior
  iterations. No newly failing checks are excluded.

`members-runtime-tests-delta.patch` applies after the frozen V2 prototype patch.
`source-manifest.json` records the tested source. Logs include failed development
runs as well as the final complete runs; they are not all acceptance results.
## Full performance study

Five rotating rounds against the frozen audit, Node 18.19.1 and GJS 1.80.2
use the unchanged 56 equal-weight components, CPU 4 and five warmups. Kernel
counts are 160,000; application seed 17 and other suites use 200,000. The
additional application seed 83 uses 400,003 and is not counted again in the
aggregate. Every component matches the independent interpreter reference.
Timing overlaps no build, tests, profiling or debugger work.

| Suite | Speedup versus audit |
| --- | ---: |
| Kernels | 1.0220× |
| Applications, seed 17 | 0.9768× |
| Roots | 1.0450× |
| Members | 0.8903× |
| Owners | 1.5451× |
| Methods | 1.5959× |
| Floats | 1.0139× |
| **Equal-component aggregate** | **1.1305×** |

Candidate ratios are 13.4718× Node / 8.9336× GJS geometrically, with p90
67.3645× / 32.5515×. In this same batch the frozen audit gives 15.2302× /
10.0997× and p90 99.7916× / 50.7516×. The separate seed-83 applications show
1.0065× aggregate speedup and no component slower by more than 5%.

Four seed-17/full-mix components exceed a 5% slowdown: array_append (0.8424×
speedup), records_4096 (0.8563×), table_events_97 (0.7464×) and class_events_97
(0.6583×). Their raw samples are preserved, including all variation. V3 remains
unpromoted pending repeat/ablation and fresh profiles. The milestone and final
goal remain unmet; these are ordinary Release results without PGO/LTO.


## Ablation, interpreter comparison and fresh profiles

Five alternating rounds in the same frozen binary confirm the precise-path
regressions for table/class events (0.7474× / 0.6691× speedups with the option
on). Buffers and calibration remain within 0.2%. Array append differs by only
0.9%, so this ablation does not reproduce its large full-study regression.
The 400,003-iteration seed-83 records_4096 case is 0.9034× in the ablation,
remaining an unresolved regression despite the earlier seed-83 full-study gain.
Do not attribute either mixed result to noise without further investigation.

Five alternating JIT-off/on rounds give JIT/interpreter time ratios **1.8645×
for owners**, **1.6435× for methods**, and **1.4342× for root_integer**. The other
three root cases are faster than the interpreter (0.3020× receiver_integer,
0.3618× root_reference, 0.2578× root_integer_result). None of the three first-
milestone regression conditions is resolved.

Fresh profiles of all seven suites use CPU 4, 499 Hz cycles:u, DWARF/8192 stacks
and the same 160,000/200,000 counts with five warmups. All report zero lost
samples. Owner self shares are 53.75% precise_step, 18.36% CanRelease and 15.96%
precise_member. Method self shares are 28.25% SQVM::Execute, 25.20% precise_step,
11.29% CanRelease and 8.78% precise_member. Member-suite shares are 46.16%
SQVM::Execute, 13.37% precise_step, 6.12% precise_member and 5.68% CanRelease.

The separate owner diagnostic run has 70 native returns, zero entry-guard
failures and zero side exits. Profiles, hardware counters and traces are
archived here; raw perf data is retained with the frozen binary and checksummed
in profiles/manifest.json. Profile timings are excluded from timing results.

The complete `audit-runtime-tests.patch` reconstructs all 26 changed runtime/
test files from the original audited working tree, verified byte for byte.
This includes preexisting retained performance fixes plus the precise tier;
it is not a patch against repository HEAD. Benchmark algorithm and driver files
are unchanged. The narrower V2-to-V3 patch remains available separately.
