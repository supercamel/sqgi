# Native non-final temporary release, V11

Experimental AArch64 precise tier, enabled by SQGI_JIT_PRECISE_EXITS=1.
This extends V10's scalar array reads and mixed/binary64 arithmetic. V10's
separate targeted comparisons and seven profiles remain preserved.

A scalar array GET can now discard an owning VM temporary directly when there
are no active ancestor journals and its GC-mark-masked physical reference count
is greater than one. These are the existing CanReleaseInContext conditions for
a non-final drop, applied before any helper-local pin. Source bits are loaded
first. Every guard precedes the first write; the decrement preserves the original
mark bit. The old destination's ownership then moves into the temporary and the
scalar result is published. No destructor or callback can run in this path.

Reference/weak sources, final drops and active ancestor journals still use the
checked helper. The comparison is unsigned. Array bounds also use a single
unsigned comparison, rejecting negative and oversized indices before indexing.
The accepted effect set, cache lifetime proof, precise side-exit contract and
exclusion of legacy loop takeover are unchanged. The emission-buffer retry
introduced in V10 continues to preserve existing large-function native coverage.

Generated tests cover an observed userdata temporary with a surviving owner,
exactly one reference remaining after a marked-count decrement, and two ancestor
journals whose pins must not masquerade as a program owner. The last case takes
a real precise side exit. Each witness checks the committed prefix, callback
count and weak-reference death. All earlier numeric, bounds, alias, weak-source,
GET/JCMP release-order, combined-drop, raw rollback and reentrant loop-mapping
witnesses remain active.

All 100 selected tests pass enabled and disabled in Release and strict ASan/UBSan.
All 41 independent holdouts agree with JIT-off in both builds. As previously,
sqgi_test_sqgipkg is excluded; no new failing test is excluded. x64/QEMU retains
exactly its existing 27 release-order and five member-result coverage assertions,
with six of seven executables passing. Those defects remain open.

A checked debugger probe observes five target GET helper calls in V10 and zero
in V11 for the same five native calls that overwrite an owning temporary. Both
preserve the external owner, weak observer and exact prefix count. Entry-symbol
breakpoints and the positive control are saved in route/. Diagnostic timings
are excluded from all performance scores.

Frozen executable: build-jit-audit-20260909/precise-native-release-v11/sqgi,
SHA-256 7d6d7075def2655fa0bab279c2343ce5d626f874ceb41baf6af0935848fae5b0.
Release -O3 -DNDEBUG -g, no PGO/LTO. The V10 delta, source snapshots, a 93-file
manifest, and a byte-exact 27-file patch against the original audited tree are
retained. All 88 original benchmark/test-script/driver hashes are unchanged.

## Targeted comparison

Five rotating V10/V11/Node rounds, CPU4, n200000, five warmups:

| Suite | Geometric speedup versus V10 |
|---|---:|
| Owners | **1.113833×** |
| Methods | **1.044424×** |
| Members | 1.009592× |

Owner times fall from approximately 291–292 ns to 261–262 ns. Table and class
events improve 3.31% and 1.95% in speed respectively. All interpreter checksums
agree. These subsets are not a full-56 aggregate and are not multiplied by the
previous batch's gains to claim a combined score.

## Full-mix results

Five rotating rounds on CPU4, unchanged 56 equal-weight components, give
**1.431996054× aggregate speedup versus the frozen audit**. Suite speedups:
kernels 1.065985×; applications seed17 1.012871×; roots 1.599904×; members
1.009342×; owners **3.399483×**; methods **2.235613×**; floats 1.006907×.
The separate seed83/400003 application result is 0.999427× audit speed, with
no component regression over 5%. Both seeds retain all interpreter checksums;
seed83 is not added to the fixed score.

| Time ratio | Same-batch audit | V11 |
|---|---:|---:|
| Geometric mean / Node | 15.272404× | **10.665116×** |
| Geometric mean / GJS | 10.102286× | **7.054688×** |
| Nearest-rank p90 / Node | 99.948164× | **31.999971×** |
| Nearest-rank p90 / GJS | 50.758421× | **15.735258×** |

No case exceeds a 5% regression in this batch. Class events still take **3.36%
more time** than the audit (457.715 versus 442.845 ns); that remaining regression
is not dismissed because it falls below the investigation threshold. Table
events improve 7.01% in speed (460.240 versus 492.480 ns). Both retain their
original algorithms, order and equal weight.

## Warmup controls, interpreter profitability and profiles

Five rotating direct V9/V11/Node rounds with four warmups confirm **1.178525×
owner speed**, **1.029302× method speed**, and 1.009135× member speed versus V9.
This is a direct combined-change comparison; it does not multiply separate
V9/V10 and V10/V11 batches. Raw samples and all interpreter checksums are saved.

Five alternating JIT-on/off rounds give **0.842822× owner time**, **1.180504×
method time** and **0.261882× root_integer time**. Every owner case is now faster
than its JIT-off median: table ratios are 0.8473–0.8501 and class ratios
0.8363–0.8377. The original owner and integer-root regressions are removed in
these controls. Methods still take about 18% more time than the interpreter.
Together with the <2× full-mix result, that leaves the first milestone unmet.

All seven fresh profiles have **zero lost samples**. Owner self samples:
GETK 18.13%, constant GET 2.61%, dynamic GET **3.47%** (V10 10.58%), constant SET
10.99%, other SET 5.25%, LOAD 9.02%, and contextual release checks 5.54%.
ADD/ARITH_OP remain below the 0.5% reporting threshold. These are sample shares,
not separate speedup measurements. The member and method suites still spend
**57.64% / 41.02%** of self samples in SQVM::Execute. The owner trace has 70
native returns, no guards and no precise side exits.

Five native function captures verify the actual canonical-frame code for
recycle, transfer, publish, table_apply and apply. Local frame sizes are 208,
176, 144, 144 and 144 bytes respectively. Recycle remains 36 bytecodes, with an
8,192-byte page-rounded mapping; the other mappings are 4,096 bytes. Its code
contains the floating arithmetic and three native non-final-count branches,
confirming it did not fall back to the older emitter for code size. Exact emitted
length is not inferred from page-rounded mapping size. Bytecode, assembly, raw
bytes and hashes are saved in profiles/.

The initial capture at the older compile-site breakpoint yielded no functions
and failed its completeness assertion. That log/script is preserved with an
initial- prefix. The replacement captures at the native execution site and
requires all five expected functions; it exits normally. Diagnostic timings
from either capture are excluded from acceptance data.

All original 88 benchmark/test-script/driver hashes and previous frozen binaries
are preserved. Full results, both application seeds, warmup controls, on/off
samples, source reconstruction, sanitizer logs and raw profile manifests are
archived. The experiment stays opt-in; neither milestone nor final performance
targets, matched fresh PGO/LTO, or existing x64 repairs are complete.

Next priorities are scalar reads from validated member-cache hits and the
remaining interpreted loop bodies. The method/event traces reject internal
branches in those loops, even while their callees return natively. The separate
../canonical-loop-entry-next.md note describes requirements for a canonical
loop route without enabling the known-bad legacy takeover. No V12 implementation
or additional performance result is claimed.
