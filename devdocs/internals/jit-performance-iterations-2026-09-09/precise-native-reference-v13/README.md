# Native reference-valued reads, V13

Experimental AArch64 precise tier, enabled by SQGI_JIT_PRECISE_EXITS=1.

GET/GETK now copy strong reference sources directly from array slots and validated
activation-local cache hits. Weak sources retain checked dereference semantics.
The source tag and bits are loaded before every write. The temporary-release
proof is checked before acquiring any new source pin: a non-final owning
temporary needs no ancestor journals and masked physical count >1. Final or
ancestor-sensitive drops retain the helper and precise side-exit behavior.

After the guards, native code increments the source reference count, then
reloads and decrements the old temporary count. Reloading is essential when
source and temporary alias; storing the pre-pin count would lose an owner.
The old destination moves into the VM temporary, and the result is published.
No callback can run in this sequence. GC marks, receiver/destination aliases,
cache identity/lifetime rules and the accepted effect set are preserved.

Four bounded emission tiers retain V12 cache lowering, V11 array/float lowering
and the older scalar emitter if optional growth exhausts the code buffer.
Unsupported shapes and allocation/install failures do not trigger retries.
Legacy private-spill loop takeover remains excluded for precise artifacts.

Native userdata witnesses cover array and primed-cache reads with final drops,
real surviving aliases, marked counts, source==temporary, and two ancestor pins.
They check callback-visible order, exactly one committed prefix, exact remaining
source counts, weak death and absence of leaked owners. The native source-pin
store must be present. Earlier bounds, numeric, weak-source, changed-slot-type,
receiver/key alias, raw rollback and reentry tests remain active.

All four selected 100-test Release/strict-ASan/UBSan gates pass, enabled and
disabled. All 41 independent holdouts agree with JIT-off in each build. The
existing sqgi_test_sqgipkg exclusion is unchanged. x64 retains exactly its
existing 32 member-plan assertions, with six of seven executables passing.

An optional NO_GARBAGE_COLLECTOR syntax check exposed three preexisting missing
_sharedstate members in the test fixture; the V12 source control fails with the
same three errors. This configuration is not claimed as supported or passing.
A new test count check was made conditional on GC support; all four primary
gates were rerun against the final test source. Holdout executable hashes remain
unchanged by that test-only adjustment.

A checked debugger control makes twelve native calls with zero guard failures
and zero side exits. V12 makes 36 target read-helper calls; V13 makes 21: three
cold cache misses and eighteen live/dead weak reads. Strong array reads and warm
strong cache reads bypass the helper. Exact results, prefixes and external
owners match. Initial symbol discovery used an incorrect mangled-name substring
and failed before producing scripts; missing-script logs are retained separately
and provide no route evidence. The replacement validates symbols against nm and
requires both exact counts and normal native completion.

Frozen executable: build-jit-audit-20260909/precise-native-reference-v13/sqgi,
SHA-256 b22c01c31262464b473061400789601973384ba52ce080bd8cbdc5c1e967b2de.
Release -O3 -DNDEBUG -g, no PGO/LTO. The V12 delta, source snapshots, 94-file
manifest and byte-exact 27-file complete audit patch are retained. All 88
original benchmark/test-script/driver hashes are unchanged.

Five rotating V12/V13/Node rounds on CPU4, n200000, five warmups, give
**1.135445x owner speed**, **1.040873x method speed**, and 1.006250x member speed.
Transfer cases improve about 5.1–5.2%, recovering V12's loss; publish cases gain
2.8–3.3%. Table/class events gain 1.82% / 2.06%. All interpreter checksums match.
These targeted results are separate from the full-56 score. Full-mix results,
warmup controls, on/off comparisons and profiles are recorded below.

The complete performance goal remains active. Neither milestone, default
promotion, existing x64 repairs nor matched fresh PGO/LTO is complete.

## Full-mix results

Five rotating rounds on the unchanged 56 equal-weight components give
**1.474809236x speedup against the audit**. Suite speedups: kernels-seed17 1.050905x; applications-seed17 0.986848x; roots-seed17 1.605036x; members 1.022906x; owners 4.053592x; methods 2.293635x; floats 1.016333x.

| Time ratio | Same-batch audit | V13 |
|---|---:|---:|
| Geometric mean / node | 15.219456x | **10.319610x** |
| Geometric mean / gjs | 10.060164x | **6.821332x** |
| Nearest-rank p90 / node | 100.248613x | **27.179286x** |
| Nearest-rank p90 / gjs | 50.019360x | **15.026729x** |

The first application seed flags records_4096 at **12.97% more time** than the
audit (277.230 versus 245.395 ns). Ranges are wide and overlap: candidate
235.745–324.065 ns, audit 235.110–290.880 ns. This result remains in the fixed
score. The separate seed83/400003 aggregate is 0.997482x audit speed, with no
>5% case regression; records_4096 is 1.56% slower there. Both seeds retain every
interpreter checksum. Direct controls with an identical-binary repeat are recorded below; no
regression is removed or explained away by these ranges alone.

## Controls and profiles

Five direct V12/V13/Node rounds with four warmups confirm **1.135230x owner
speed**, **1.040905x method speed**, and 1.006769x member speed. The five-warmup
results are 1.135445x / 1.040873x / 1.006250x respectively. Both histories retain
all interpreter checksums, and neither is substituted into the full-mix score.

Five alternating JIT-on/off rounds give **0.711996x owner time**, **1.138319x
method time**, and **0.261081x root_integer time**. The method penalty falls from
V12's 18.4% to 13.8%, but is not eliminated. The aggregate also remains below
2x, so the first milestone is incomplete.

Seven fresh profiles have zero lost samples. Owner GET/GETK helpers now fall
below the 0.5% reporting threshold. Remaining owner self samples include LOAD
13.68%, constant SET 11.49%, DLOAD 5.67%, contextual release 5.64%, JCMP 5.27%
and other SET 4.77%. Sample shares are not independent speedup measurements.
Method/member SQVM::Execute shares are 44.27% / 57.27%; the increased proportion
of VM samples after removing helper cost does not by itself imply slower VM
execution. The remaining interpreted loops and calls still need attention.

Five native captures verify recycle, transfer, publish, table_apply and apply.
Their frames remain 208/176/144/144/144 bytes and mapped sizes 8192/4096/4096/
4096/4096 bytes. Source-pin stores are present at 9/6/3/7/7 emitted sites, and
earlier floating lowering remains present. The owner function did not fall back
to an earlier emission tier. Mapped size is not exact emitted length.

## Records variance investigation

Two five-round controls run the unchanged full application script on CPU4 with
four rotating labels: audit, V12, V13 and the identical V13 executable again.
They use seed17/200000 with five warmups and seed83/400003 with four warmups.
All eight interpreter checksums match on every run. Raw commands, hashes, host
snapshots and timing ranges are preserved in application-control-*.json.

For records_4096, seed17 medians are **299.740 / 232.160 / 236.780 / 278.390 ns**
for audit/V12/V13/V13-repeat. Identical V13 commands therefore differ by **17.57%**
between labels, while both beat that batch's audit median. V12 also spans
220.705–343.120 ns. Seed83 medians are **260.183 / 261.626 / 258.991 / 266.985 ns**;
the identical-label difference is 3.09%. These controls do not establish a
repeatable V13 code regression, but the cause of the variance remains unresolved.
CPU frequency snapshots at process boundaries vary; they do not measure clock
speed inside the timed region and do not establish a cause.

The original 12.97% full-mix slowdown remains reported and included in the
1.474809x aggregate. No component, sample or benchmark weight is replaced by
a more favorable control. This variance needs further investigation and is not
presented as a resolved performance problem.

## Next work

LOAD and SET now dominate the remaining owner helpers. Native copying into
proven non-final destinations and guarded stores are bounded follow-ups, with
source/destination alias counts and callback order retained. Broader canonical
loop coverage remains a larger task; the saved canonical-region-continuation-note.md
adds the execute-current-header and call-preparation concerns to the earlier
canonical-loop-entry-next.md requirements. No V14 runtime code is implemented.

All frozen evidence and original benchmark hashes are preserved. The complete
goal remains active; neither milestone, default promotion, existing x64 repairs,
records-variance resolution nor matched fresh PGO/LTO is complete.
