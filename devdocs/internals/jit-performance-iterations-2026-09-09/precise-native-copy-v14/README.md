# Native single-destination copies, V14

Experimental AArch64 precise tier, enabled by SQGI_JIT_PRECISE_EXITS=1.

LOAD, LOADINT, LOADFLOAT, LOADBOOL and MOVE can now overwrite non-final owning
destinations directly. Source tag/bits are loaded before any write. An owning
destination requires no active ancestor journals and masked physical count >1,
checked before a new source pin is acquired. Reference sources are pinned first,
then the destination count is reloaded and decremented, preserving aliases and
GC marks. Scalars need no source pin. The VM temporary is untouched.

Plain copies preserve weak-reference objects and their identity; they do not
perform GET's weak dereference. Final or ancestor-sensitive drops retain the
checked helper and precise continuation. DLOAD's combined drops and SET's heap/
result writes are unchanged. No new callbacks, allocation or structural mutation
are admitted. The existing cache lifetime and legacy-loop exclusion remain.

Five bounded emission tiers preserve V13 reference reads, V12 scalar cache hits,
V11 array/float lowering and the older scalar emitter if optional code growth
fills the buffer. Only buffer exhaustion retries, not unsupported shapes or
allocation/install failure. The owner preflight contains eleven source-pin
sites versus V13's nine, confirming that it uses the new copy tier within the
existing 8192-byte mapping. No shared-exit compaction was needed or implemented.

New native tests force direct destination overwrites for all five copy opcodes.
They cover final userdata release before a following member read, real surviving
owners, GC marks, source/destination aliases, two ancestor pins, exact source
counts, retained prototype literals and weak death. Live/dead weak MOVE cases
preserve weak identity and do not pin the referent. Earlier native ownership,
rollback, side-exit, numeric, aliasing and code-budget witnesses remain active.

All four 100-test Release/strict-ASan/UBSan gates pass, enabled and disabled.
All 41 independent holdouts agree with JIT-off in each build. The preexisting
sqgi_test_sqgipkg exclusion is unchanged. x64 retains exactly the same existing
32 member-plan assertions, with six of seven executables passing.

A checked debugger control makes fifteen native calls with no guard failures
or precise side exits. V13 invokes LOAD/MOVE helpers 32 times; V14 invokes them
zero times, with identical values, external owners and prefixes.
The initial prediction of 30 V13 calls omitted two LOADINT instructions at ip1,
destination5, overwriting a live table with three references in reused call-frame
storage. Typed inspection accounts for both; the final positive control requires
all 32. The failed prediction and inspection are preserved separately. Diagnostic
timings do not enter performance scores.

An initial build caught a mismatched emitter signature, corrected before any
runtime verification. Its log is retained. All reported checks and measurements
use the final frozen source and executable.

Frozen executable: build-jit-audit-20260909/precise-native-copy-v14/sqgi,
SHA-256 bd3282611c9ce0bce7716debb8062cccf4c3dd939c41aaa17c6072c1d3bc2aea.
Release -O3 -DNDEBUG -g, no PGO/LTO. The V13 delta, 94-source manifest and complete
27-file audit patch are retained. All 88 original benchmark/test-script/driver
hashes remain unchanged.

Five rotating V13/V14/Node rounds, CPU4, n200000 and five warmups, give
**1.098439x owner speed**, **1.056246x method speed**, and 1.000186x member speed.
Transfer cases improve 4.2–5.7% and publish cases 6.1–6.6%. Member cases remain
approximately unchanged. All interpreter checksums match. These targeted results
are separate from the full-56 aggregate. Full-mix, warmup controls, on/off and
fresh profiles are recorded below.

The goal remains active. First/final milestones, default promotion, existing
x64 repairs, records timing-variance resolution and matched fresh PGO/LTO remain
outstanding. No V15 runtime code is implemented.

The first Squirrel probe stored weak values in a source array, so array GET
dereferenced them before the call. Its counts remain valid for its actual inputs
but do not prove weak-object copying. The C++ weak-identity tests passed weak
objects directly and remain valid. A corrected debugger probe keeps weak objects
in local variables and asserts the returned weakref type. Its V13 operand records
show OT_ARRAY / OT_WEAKREF / OT_WEAKREF MOVE sources; V13 still makes 32 target
helper calls and V14 makes zero. Both make fifteen native returns, no guard
failures and no side exits. The corrected fixture's two extra LOADINT overwrites
occur in copy_literal at ip1/destination4, each dropping a table with three refs.
Original, inspected and corrected scripts/logs are all preserved in route/.

## Full-mix results

Five rotating rounds on the unchanged 56 equal-weight components give
**1.519988960x speedup versus the audit**. Suite speedups: kernels-seed17 1.058032x; applications-seed17 1.025175x; roots-seed17 1.615982x; members 1.024859x; owners 4.466628x; methods 2.434441x; floats 1.004376x.

| Time ratio | Same-batch audit | V14 |
|---|---:|---:|
| Geometric mean / node | 15.254487x | **10.035920x** |
| Geometric mean / gjs | 10.121955x | **6.659229x** |
| Nearest-rank p90 / node | 100.625157x | **26.467130x** |
| Nearest-rank p90 / gjs | 50.080884x | **14.550669x** |

No case exceeds a 5% regression in the fixed mix or the separate seed83/400003
application batch. Seed83 application speed is 0.991173x audit speed. Both seeds
retain all interpreter checksums; the second seed is not added to the score.
Records_4096 timings still have wide ranges in seed17. The earlier V13 identical-
binary variance remains unresolved, and this more favorable batch does not
replace that evidence or establish that its cause has been fixed.

## Warmup controls, interpreter comparison and profiles

Five rotating V13/V14/Node rounds with four warmups confirm **1.100574x owner
speed**, **1.054517x method speed**, and 1.002614x member speed. The five-warmup
results are 1.098439x / 1.056246x / 1.000186x. These are separate direct controls;
no subset gain is multiplied into the full-mix aggregate.

Five alternating JIT-on/off rounds give **0.646362x owner time**, **1.073560x
method time**, and **0.261589x root_integer time**. Methods now take about 7.4%
more time than the interpreter, down from V13's 13.8%, but their regression is
not eliminated. The <2x full aggregate also leaves the first milestone unmet.

All seven fresh profiles have zero lost samples. Owner LOAD/MOVE/GET helpers
fall below the 0.5% reporting threshold. Remaining self samples: constant SET
14.66%, DLOAD 8.67%, PINCL 8.64%, other SET 5.51%, JCMP 4.80%, and contextual
release 4.80%. These are sample shares, not independent speedup measurements.
Method/member SQVM::Execute shares remain 44.27% / 59.13%.

Five native captures verify recycle, transfer, publish, table_apply and apply.
Local frames remain 208/176/144/144/144 bytes. Recycle stays in an 8192-byte
mapping; transfer/publish remain 4096 bytes. Table_apply/apply grow from 4096 to
8192 mapped bytes, a code-size cost despite approximately flat member timing.
Source-pin sites are 11/8/6/7/7, and all earlier floating paths remain present.
Mapped size is not exact emitted length.

## Next work

Stores are now the largest remaining owner helpers. Native existing-slot SET
with no separate result write is a bounded next candidate, retaining exact alias
counts and the helper for sensitive releases and multiple outputs. Cold precise
exit publication/restoration is currently repeated per guard; sharing that cold
epilogue could recover code space before more lowering is added. Neither change
is implemented. The next-stores-and-code-size.md note records the requirements.

Broader native loop/call coverage remains necessary for the larger performance
gap. Keep V13's current-header continuation and call-preparation requirements,
the unchanged benchmark mix, all lifetime witnesses and the exclusion of legacy
private-spill takeover. All earlier frozen evidence is preserved. No V15 code is
implemented, and neither milestone nor the full goal is complete.
