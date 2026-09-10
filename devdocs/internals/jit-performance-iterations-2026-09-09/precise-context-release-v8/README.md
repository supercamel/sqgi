# Contextual release checks, V8

Experimental, enabled only by `SQGI_JIT_PRECISE_EXITS=1`. The precise tier
records no journal entries, pins or pending writes. It now stores the shared
JIT context in its native frame and omits the empty SQJitWriteLog constructor,
registration, commit and destructor. Canonical VM slots and exact side-exit IPs
retain the earlier lifetime and continuation contract.

`CanReleaseInContext` delegates to the existing complete pin census whenever
an ancestor journal is active. With none, a GC-mark-masked physical refcount
greater than the instruction's combined drop count proves a surviving owner
before scanning array contents. Every final drop retains the existing string,
weak-observer and bounded scalar-array checks. The original CanRelease method
is unchanged, including its behavior for contextless/unregistered logs. No
reference becomes eligible merely because of a helper-local pin: GET and SET
check before copying reference values; arithmetic temporaries are numeric;
LOAD's prototype literal remains a real surviving owner.

Generated-code tests put a SET's two discarded aliases behind two enclosing
journals, require one precise side exit and one committed prefix, and verify
that journal release hooks see the completed store. Shared tests cover pending
pins, restored ancestor chains, GC mark masking, weak death, real surviving
aliases and pin-index allocation failure. Cache lifetime/structural assumptions
and the exclusion of legacy loop takeover remain unchanged.

Validation: 100/100 selected tests pass with the option enabled and disabled
in both Release and strict ASan/UBSan. All 41 holdouts agree with JIT-off in
both builds, seed83/20003 with one warmup. Rebuilt x64/QEMU passes six of seven
executables; member_plan retains exactly the same 27 release-order and five
native-coverage failures as V3. The new contextual journal tests pass on x64.
These existing backend defects remain open; this is not a full cross-backend pass.
As in the audit, sqgi_test_sqgipkg is excluded from the selected 100-test suite;
no newly failing check is excluded.

Frozen binary: `build-jit-audit-20260909/precise-context-release-v8/sqgi`, SHA-256
`57f7ef67f6cd3a90ce6d9846fb69879df5b22744a0f5bc984af29052f5fcd5e5`.
Ordinary Release -O3 -DNDEBUG -g, no PGO/LTO. The delta applies after V7; the
complete audit-relative patch reconstructs 26 runtime/test files byte for byte.
The unchanged full-mix timing study is complete; warmup, profile and
interpreter checks are recorded below. The candidate remains opt-in.


## Full-mix results

Five rotating rounds on CPU4, unchanged 56 equal-weight components, give
**1.344599233× aggregate speedup versus the frozen audit**. Speedups by suite:
kernels 1.049868×; applications seed17 1.010779×; roots 1.107646×; members
1.004391×; owners **2.896097×**; methods **2.162933×**; floats 1.009756×.
The separate seed83/400003 application result is 0.993068×, with no component
regression over 5%; it remains outside the fixed 56-case score.

| Time ratio | Same-batch audit | V8 |
|---|---:|---:|
| Geometric mean / Node | 15.302923× | **11.381029×** |
| Geometric mean / GJS | 10.151926× | **7.550150×** |
| Nearest-rank p90 / Node | 99.629363× | **36.920825×** |
| Nearest-rank p90 / GJS | 50.785469× | **17.714817×** |

No component exceeds a 5% regression against the audit in this batch. The
previously confirmed event regressions shrink substantially: table events are
4.9% faster, while class events remain 4.6% slower (0.464210 versus 0.443675 us).
The class-event sample ranges still do not overlap, so the remaining slowdown
is not dismissed merely because it is below the 5% investigation threshold.

Four-warmup V7/V8/Node replication gives **1.075053× owners**, **1.176809×
methods**, and **1.043650× members** versus V7. Table/class events improve
1.131773× / 1.132039×, confirming the change in a separate timing batch.

All seven fresh profiles report zero lost samples. Owner self samples:
GETK 15.65%, dynamic GET 12.81%, ADD 10.93%, constant-key SET 7.72%, LOAD 7.26%,
and CanReleaseInContext **5.49%** (V7 CanRelease was 14.70%). ARITH_OP is another
3.11%. These are profile shares, not independent speedup measurements. The owner
trace has 70 native returns, zero guard failures and zero precise side exits.
Member-suite VM execution is 56.45% of self samples. Native array/member reads
and floating/mixed arithmetic are the next measured hotspots.


## Interpreter parity and receiver-history control

Five alternating JIT-on/off rounds give **0.995662× owner time**, **1.216587×
method time** and **1.184149× root_integer time**. Owners are approximately at
interpreter parity: table cases remain 0.09–0.27% slower and class cases are
about 1% faster. This is not a decisive owner win. Method and integer-root
penalties remain, and the 2× aggregate first milestone is still unmet.

A separate same-binary case-order control changes only the order in which the
four root cases run. Five alternating original/reversed rounds with four and
five warmups preserve all JIT-off checksums. With five warmups, root_integer
moves from **285.950 ns to 62.685 ns**, while receiver_integer moves from
**53.870 ns to 212.955 ns**. Four-warmup medians repeat the swap (288.515→62.925 ns
and 53.895→213.335 ns). The other two root cases remain nearly unchanged.

Both one-warmup traces have the same aggregate guard/backoff totals:
counter_work records 208 loop guard failures,
26 backoffs and 599,795 skips, with one successful loop compilation. Together
with the single cached loop artifact and the source-level receiver ordering,
this supports receiver-specialization history as the cause of the reversal.
Aggregate trace counts alone do not identify which receiver phase fails.
It does not establish an implementation fix. Original benchmark order remains
unchanged in the accepted full-mix score; diagnostic samples are not substituted.
The reproducer is ../diagnose_root_history.py; generated variant, raw samples,
host snapshots, binary/script hashes and traces are in root-history/.

The native recycle capture exits normally and shows **208 bytes of local frame
storage**, down from V7's 1,200 bytes. The mapping is still 8,192 bytes; mapping
size is page-rounded and is not the local-frame measurement. Exact bytecode,
native assembly and bytes are saved alongside the profiles.

All 88 original benchmark/test-script/driver hashes remain unchanged. Complete
raw results, logs, source manifests and patch reconstruction evidence accompany
this report. The goal remains active and all precise-tier changes remain opt-in.
Final <=3× geometric / <=10× p90 targets and matched fresh PGO/LTO confirmation
are still outstanding. Next priorities are receiver-adaptive loop specialization
and native member/array reads plus mixed/float arithmetic, with the existing
lifetime and exact-continuation witnesses retained.
