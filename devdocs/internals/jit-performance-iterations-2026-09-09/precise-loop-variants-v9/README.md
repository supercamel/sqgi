# Bounded alternate loop mappings, V9

Continuation on 2026-09-10 of the September 9 performance audit. Experimental,
AArch64 adaptation enabled by `SQGI_JIT_PRECISE_EXITS=1`.

After an existing loop has returned successfully, its first later replayable
GUARD_FAILED execution may compile one additional specialization. Both code
mappings are immutable and live until the prototype dies. Subsequent entries
try the last successful mapping first, then the other after a guard failure.
At most two mappings and one extra compile attempt exist per prototype's cached
loop. Unsupported inputs retain the existing rollback/backoff behavior. The
precise whole-function tier still excludes legacy loop takeover after a side exit.

The compiler's optional explicit destination must be empty. Alternate emission
therefore cannot reset/unmap the original code, including while an enclosing
native call executes it. Dependencies remain owned by their respective mappings.
A returned compile failure preserves the original artifact. std::bad_alloc during
optional compilation cleans up any unexecuted alternate and falls back; this
includes failure while retaining dependencies after executable installation.
This does not add support for arbitrary native callbacks or new bytecodes.

Tests require real native loop success in both receiver orders and on every
alternating call. They preserve the primary and alternate addresses through
third-receiver fallback and method replacement. An actual closure-address reuse
witness passes in Release; ASan quarantine can prevent physical reuse, while
removed-method weak death is checked in both builds. A separate injected mapped
trampoline reenters a child VM, compiles the actual alternate from bytecode, then
returns through the still-live original mapping. It validates mapping lifetime
and VM context restoration, not compiler support for arbitrary callbacks.

Validation: 100/100 selected tests pass with the flag enabled and disabled in
Release and strict ASan/UBSan. All 41 holdouts agree with JIT-off in each build,
seed83/20003, one warmup. As before, sqgi_test_sqgipkg is excluded; no newly
failing check is excluded. Rebuilt x64/QEMU passes six of seven executables,
retaining exactly the old 27 release-order and five member-result coverage
assertions. Automatic adaptation is AArch64-only, but the destination API is
also checked on x64. The no-native-backend source compiles with the new API.

Two Release fault-injection runs throw std::bad_alloc inside alternate compilation:
one at its first C++ allocation, one while retaining a dependency after mapping
installation. Each logs exactly one injected fault, an allocation-failure reject,
normal process exit and all four JIT-off root checksums. The latter also witnesses
cleanup of the installed alternate. GDB traces and the forwarding operator-new
shim are in allocation-fault/. These diagnostic timings are excluded from scores.

Frozen binary: `build-jit-audit-20260909/precise-loop-variants-v9/sqgi`, SHA-256
`782913eac3f51bc556d6ced35760ac0009e54bdd3c759d7fbf9715ee20ac29e7`.
Ordinary Release -O3 -DNDEBUG -g, no PGO/LTO. The V8 delta and complete audit-
relative patch are included; the latter reconstructs 26 runtime/test files
byte for byte. Earlier failed development build logs remain preserved.

## Root comparison and history control

Five rotating V8/V9/Node/GJS/Python rounds, CPU4, n200000, five warmups, retain
the original benchmark order and all interpreter checksums. Root-suite geometric
speedup versus V8 is **1.465513×**. Integer-root stores improve **4.584374×**,
from 286.340 to **62.460 ns**. Receiver-field stores remain 53.705 ns (V8 53.690),
root references 84.090 ns (84.365), and transformed root results 64.300 ns (64.505).
This is a four-case comparison, not a new full-mix aggregate.

The independent original/reversed case-order diagnostic repeats with four and
five warmups. Receiver-field medians stay 53.665–53.850 ns and integer-root
medians 62.575–62.650 ns across both orders and warmup counts. The previous
54↔213 ns / 63↔286 ns history dependence no longer occurs. Diagnostic order
changes are excluded from the fixed-mix score; original benchmark files remain
unchanged. Both traces and all raw samples/hashes are in root-history/.

## Full-mix results

Five rotating rounds on CPU4, original 56 equal-weight components, give
**1.376611662× aggregate speedup versus the frozen audit**. Suite speedups:
kernels 1.052058×; applications seed17 0.993263×; roots **1.613269×**; members
1.000086×; owners **2.885978×**; methods **2.146168×**; floats 1.014034×.
The separate seed83/400003 application result is 0.997691× audit speed, with
no component regression over 5%. Both seeds retain all interpreter checksums;
seed83 remains outside the fixed score.

| Time ratio | Same-batch audit | V9 |
|---|---:|---:|
| Geometric mean / Node | 15.289661× | **11.106735×** |
| Geometric mean / GJS | 10.080655× | **7.322802×** |
| Nearest-rank p90 / Node | 100.150495× | **36.852984×** |
| Nearest-rank p90 / GJS | 50.510360× | **17.778860×** |

Class events remain **5.97% slower** than the audit: 468.530 versus 442.135 ns,
with disjoint sample ranges (467.575–470.010 versus 441.520–444.410 ns). This is
the only >5% regression in the full mix. Table events are 3.88% faster. Earlier
class-event regressions remain relevant; this result is not dismissed as noise.
Direct V8/V9 warmup replication and fresh profiles are recorded below.

The first milestone and final performance targets remain unmet. All changes
stay opt-in, with no default promotion or completion claim. Matched fresh
PGO/LTO remains outstanding.


## Warmup replication, profitability and profiles

Five rotating V8/V9/Node rounds with four warmups give 0.999845× owner speed,
1.003035× method speed and 0.997371× member speed versus V8. Table events take
0.89% more time and class events 1.29% more time. This smaller incremental event
cost is retained alongside the larger audit regression. V8/V9 member trace
counters match exactly: 280,056 native whole-function successes, no precise side
exits or guards, and no native loop executions. Thus this suite does not enter
the new alternate-map execution path; the source of the small incremental cost
is unresolved. It is not evidence of alternate-compilation churn. The complete
counter comparison is saved in member-trace-comparison.json.

Five alternating JIT-on/off rounds give **0.993462× owner time**, **1.216516×
method time** and **0.261728× root_integer time**. Integer-root stores take
62.820 ns versus 240.020 ns in the interpreter: the demonstrated root regression
is removed. Owners are approximately at interpreter parity; every owner median
is no slower in this batch, but table differences are 0–0.18%, not a decisive
win. Methods still take about 22% more time than the interpreter. The first
milestone also requires 2× full-mix speedup and is therefore still unmet.

All seven fresh cycles:u/DWARF profiles report **zero lost samples**. Owner self
samples: GETK 15.04%, dynamic GET 12.60%, constant GET 1.81%, ADD 10.45%, LOAD
8.84%, constant SET 6.82%, CanReleaseInContext 5.12%, and ARITH_OP another 2.91%.
The owner trace has 70 native returns, no guard failures and no precise side
exits. Member and method suites still spend **56.34% / 40.29%** of self samples
in SQVM::Execute. These shares identify remaining costs; they are not independent
speedup measurements.

The fresh five-warmup root trace gives counter_work two successful loop
compilations, 15 native attempts / 14 successes, one guard failure and no backoffs
or skips. The one-warmup history diagnostic gives two compilations, seven attempts
/ six successes, one guard failure and no backoffs/skips in either order. V8's
same one-warmup control had 208 guards, 26 backoffs and 599,795 skips. GDB captures
two distinct 4,096-byte mappings from the real root benchmark and rechecks their
addresses and complete bytes on later calls. Both stay unchanged; execution exits
normally with all four reference checksums. Page-rounded mapping sizes are not
exact emitted-code lengths. Diagnostic timings are excluded from performance
scores. Assembly, raw bytes and mapping hashes are in profiles/.

All 88 original benchmark/test-script/driver hashes remain unchanged. The frozen
binary, 93-file source manifest, complete audit-relative patch, both-seed raw
results, warmup controls, allocation-fault witnesses and correctness logs are
archived here. Raw perf data is retained under the frozen V9 binary directory
and identified by profiles/manifest.json. The original audit and all earlier
frozen results remain preserved.

Next work: lower scalar array/member reads and mixed/float arithmetic directly,
then reduce short-method call/VM costs without weakening lifetime or continuation
contracts. The class-event regression and existing x64 failures remain open.
Neither milestone, default promotion, nor the eventual matched PGO/LTO check is
complete; the performance goal remains active.
