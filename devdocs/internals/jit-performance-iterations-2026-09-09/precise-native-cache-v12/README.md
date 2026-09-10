# Native scalar member-cache reads, V12

Experimental AArch64 precise tier, enabled by SQGI_JIT_PRECISE_EXITS=1.

GET/GETK now read scalar values directly from validated activation-local cache
hits. Native code checks the cached slot pointer, receiver tag and raw identity,
and dynamic key tag and bits before dereferencing the borrowed address. Literal
cache groups retain their immutable-key proof. Every hit reloads the current
slot tag and value. Array integer reads retain the V11 bounds path.

The common publication tail retains V11's temporary-release proof: non-owning
temporaries, or non-final owning temporaries with no ancestor journals, can
complete natively. GC marks are preserved during decrements. The old destination
moves into the VM temporary without a drop. Reference/weak sources, misses and
sensitive releases use the checked helper. All guards precede the first write.
No cache address survives an activation, call, allocation or structural mutation.
The accepted effect set and exclusion of legacy loop takeover are unchanged.

Optional code growth has three bounded emission tiers: cache plus array/float,
array/float only, then the older scalar emitter. Only buffer exhaustion retries;
allocation/install failure and unsupported shapes do not. The large-function
native coverage witness remains effective.

New native tests prime a cache before userdata is overwritten and check the
following GET/JCMP release, real surviving aliases, GC-marked counts, ancestor
journal pins, exact committed prefixes and weak death. Replacing a primed scalar
slot with an array, live weak reference, dead weak reference or boolean confirms
that cached addresses reload the current type and value. Existing receiver/key
collisions, inter-activation resize/rehash, aliasing, raw rollback and lifetime
witnesses remain active.

All 100 selected tests pass enabled and disabled in Release and strict ASan/UBSan;
all 41 independent holdouts agree with the interpreter in both builds. The
preexisting sqgi_test_sqgipkg exclusion remains unchanged. x64/QEMU retains exactly
its existing 32 member-plan assertions, with six of seven executables passing.
Those defects remain open.

A checked debugger probe makes twelve native calls with zero guard failures or
precise side exits. The positive V11 control records 129 target GET/GETK helper
calls; V12 records 39, matching the predicted misses and changing dynamic keys.
Both preserve exact results and external owners. Probe scripts, symbols, per-IP
hits and stats are in route/. These diagnostic timings do not enter scores.

Frozen executable: build-jit-audit-20260909/precise-native-cache-v12/sqgi,
SHA-256 53c29b0a2b82694d7e2ff1b5e2a2b4752484b3dceb7fd2c7734ece23a8e0d211.
Release -O3 -DNDEBUG -g, no PGO/LTO. The V11 delta, source snapshots and complete
27-file audit patch are retained. The inherited manifest omitted the leaf test
although it was present in the complete V11 patch; its reconstruction matches
the current file exactly, and V12 corrects the manifest to 94 files. All 88
original benchmark/test-script/driver hashes remain unchanged.

Five rotating V11/V12/Node rounds, CPU4, n200000, five warmups, give 1.043603x
owner speed, 0.988811x method speed and 1.007845x member speed. Transfer cases
lose approximately 2.2–2.7% in time; event cases improve 2.35–2.83% in speed.
Every interpreter checksum matches. These targeted subsets are not a full-mix
score. Full-mix results, warmup controls, on/off comparisons and profiles are below.

Five native captures verify recycle, transfer, publish, table_apply and apply.
Their local frames remain 208/176/144/144/144 bytes. Recycle retains an 8192-byte
page-rounded mapping, five FADD instructions and actual native cache loads;
optional lowering did not force it back to an older emission tier. The other
four mappings remain 4096 bytes. Mapped size is not exact emitted length.

The performance goal remains active. Neither the first milestone nor final
Node/GJS targets, existing x64 repairs, default promotion or fresh matched
PGO/LTO confirmation is complete.

## Full-mix results

Five rotating rounds, unchanged 56 equal-weight components, give **1.437964259x**
aggregate speedup versus the frozen audit. Suite speedups: kernels-seed17 1.052105x; applications-seed17 1.013138x; roots-seed17 1.599053x; members 1.020798x; owners 3.536012x; methods 2.224221x; floats 1.006720x.
The separate seed83/400003 application result is 0.998776x audit speed, with
no >5% component regression. Both seeds retain every interpreter checksum.
Seed83 is excluded from the fixed 56-component aggregate.

| Time ratio | Same-batch audit | V12 |
|---|---:|---:|
| Geometric mean / node | 15.260629x | **10.612662x** |
| Geometric mean / gjs | 10.098997x | **7.023121x** |
| Nearest-rank p90 / node | 99.303998x | **30.734116x** |
| Nearest-rank p90 / gjs | 49.802976x | **15.500620x** |

No component regresses over 5% against the audit. Table events improve
10.12% in speed (446.845 versus 492.070 ns). Class events are approximately
at parity: 441.760 versus 442.985 ns, with overlapping sample ranges.
The direct transfer-method regression against V11 remains visible and is not
cancelled by a positive aggregate against the much older audit.

## Warmup controls, interpreter comparison and profiles

Five rotating V11/V12/Node rounds with four warmups confirm 1.043392x owner
speed, 0.992685x method speed and 1.009021x member speed. Event cases gain about
2.5%; transfer cases lose 1.7–2.4% in time. The five-warmup transfer regression
therefore repeats. Raw samples, interpreter references and both warmup histories
are retained. These controls are direct V11 comparisons, separate from the full
56-component audit comparison; their gains are not multiplied into a new score.

Five alternating JIT-on/off rounds give **0.808679x owner time**, **1.184261x
method time** and **0.262060x root_integer time**. Every owner case beats its
interpreter median. Methods remain about 18% slower; together with the <2x
aggregate, this leaves the first milestone unmet.

All seven fresh profiles have zero lost samples. Owner self samples: GETK
13.64%, constant SET 11.23%, LOAD 10.14%, contextual release 6.28%, other SET
4.53%, dynamic GET 3.23%; constant GET falls below the 0.5% reporting threshold.
These sample shares do not constitute separate speedup measurements. The owner
trace has 70 native returns, no guard failures and no precise side exits.
Method and member suites still spend **40.07% / 56.42%** of self samples in
SQVM::Execute. Their traces have zero native loop executions despite many native
callee returns. The loop-branch coverage limit remains material.

The reference-read fallback is the next bounded experiment: native reference
pinning and proven non-final temporary release may avoid a second checked lookup.
The source must be pinned before the old temporary drops, and source/temp aliasing
must not store a stale refcount. Weak sources retain their resolver semantics;
final releases and ancestor-sensitive cases remain checked. The saved
[next-reference-read.md](next-reference-read.md) records the proof and required
witnesses. Broader canonical loop coverage is a separate follow-up; legacy private
loop takeover remains excluded for precise functions.

All raw measurements, profile data hashes, source reconstruction, correctness
logs and earlier frozen artifacts are preserved. The runtime remains opt-in and
the complete performance goal remains active.
