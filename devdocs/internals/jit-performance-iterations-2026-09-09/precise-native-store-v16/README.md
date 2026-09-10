# V16: native existing-slot stores

SET with no separate result write (arg0 == NO_RESULT or arg0 == arg3) now uses
native existing-slot assignment. Integer-array accesses keep unsigned bounds
checks. Cached table/instance slots require matching owner tag/bits and dynamic
key tag/bits before dereferencing the slot. Cold misses retain the resolver;
root/delegate fallback is not cached. Source tag/bits are loaded before effects.

Single-destination assignment is shared with COPY: check the old destination
before adding a source pin, require no ancestor journals and a masked physical
count >1 for native reference drops, acquire the source, reload/drop the old
count for aliases, then publish tag/bits. Weak-reference objects are stored raw,
without dereferencing or pinning their referents. Sensitive final releases and
separate-result SETs keep the existing checked helper and combined-drop proof.
GET uses the same address-emission helper but retains its distinct temp/Swap
semantics. This does not permit callbacks, allocation, arbitrary calls or
structural mutation inside an activation.

A sixth optional lowering tier adds stores above V15's five tiers. Only emission
buffer exhaustion retries; the 8 KiB limit, allocation/install failure behavior,
private-loop exclusion and existing large-function fallback witness remain.

## Targeted correctness and native-route evidence

New C++ witnesses exercise both no-result and source-as-result SET forms over
arrays, tables and instance fields. Thirty ownership cases cover final userdata,
surviving owners, marked counts, self-aliases and two ancestor journals. The first
SET primes the cache; clearing its source leaves the target as the final program
owner before the second SET. The release hook checks that heap publication is
already visible and precedes the following member read. Exact source counts and
weak death are checked after cleanup. Twenty-four direct weak cases check live,
dead and aliased weak objects without an intervening array GET.

Additional store-only loops change key tags, receiver identities and class
layouts without a target GET refreshing the cache. Four late failures cover
negative/out-of-range array indices, a scalar with a previous owner's pointer
bits, and a missing key. Every failure must preserve the committed prefix once
and use native SIDE_EXIT. Existing separate-result, allocation-failure, ancestor,
weak, alias, invalid-resume and native-coverage witnesses remain unchanged.

The debugger's frozen V15 control executes 36 SET helpers; the candidate executes
8, all cold table/instance resolutions. Both have 12 successful native returns,
zero guard failures, zero side exits and matching source identity/type, including
direct live/dead weak locals. The initial postprocessor expected a nonexistent
native_calls statistic and stopped before creating the gates driver; corrected
checks use the actual proto exec success counter. The debugger runs themselves
passed and were not repeated for that label correction. Logs are retained.

Preflight captures find 4/3/3/2/2 native stores in recycle/transfer/publish/
table_apply/apply. Recycle fits at 7468 emitted bytes; member callees grow to
4196 bytes and therefore 8 KiB mappings again. This code-size cost must accompany
any throughput claim. Final frozen captures and full measurements follow the
Release/sanitizer/holdout gates.

## Frozen build and correctness gates

Frozen CLI: build-jit-audit-20260909/precise-native-store-v16/sqgi
SHA256: f99f3a6a2386bca4a09095ba8fc6c41695484fd33003688989c7e182475a7273
Release and strict ASan/UBSan each pass all 100 selected tests with the precise
experiment enabled and with its default disabled configuration. Both builds pass
all 41 independent holdouts against interpreter checksums. The existing sqgipkg
exclusion is unchanged. x64/QEMU retains the same 32 member_plan assertions;
six of seven executables pass. Those failures remain unresolved.

The reconstructed audit patch covers 27 files; all 94 source hashes and all 88
original benchmark/test-script/driver hashes match. No code changes follow this
freeze. New tests live in the existing side-exit test executable.

## Frozen native captures

All five frozen captures pass the exact-IP/shared-exit decoder. Every eligible
SET in these functions has native heap publication; all source pins, cached
reads and floating operations remain. Local frames are unchanged.

| Function | Code bytes V15 | Code bytes V16 | Mapping V16 | Native stores |
|---|---:|---:|---:|---:|
| recycle | 6740 | 7468 | 8192 | 4 |
| transfer | 2768 | 3236 | 4096 | 3 |
| publish | 2040 | 2508 | 4096 | 3 |
| table_apply | 3676 | 4196 | 8192 | 2 |
| apply | 3676 | 4196 | 8192 | 2 |

These five functions add 2704 emitted bytes and 8192 mapped bytes versus V15. Code growth is retained
in the result alongside the timing benefit; no mapping size is presented as
exact emitted length. The decoder validates the terminal instruction and zero
padding when deriving code length.

## Full-mix timing

Five rotating rounds on the unchanged 56 equal-weight components give
**1.571985665x speedup versus the frozen audit**. All checksums match.
The aggregate includes the array_append regression below.

| Suite | Audit / V16 time |
|---|---:|
| kernels-seed17 | 1.051786x |
| applications-seed17 | 1.000930x |
| roots-seed17 | 1.603006x |
| members | 1.039752x |
| owners | 5.457511x |
| methods | 2.459781x |
| floats | 1.010693x |

| Time ratio | Same-batch audit | V16 |
|---|---:|---:|
| geomean / node | 15.261838x | 9.708637x |
| p90 / node | 101.072867x | 24.934516x |
| geomean / gjs | 10.110953x | 6.431963x |
| p90 / gjs | 50.206118x | 14.265827x |

The separate seed83/400003 application batch is 0.996844x audit speed, with no
>5% case regression. The first seed application batch and roots also have no
>5% case regression. The second seed remains outside the fixed aggregate.

The fixed mix contains one >5% case regression: array_append is 124.775 ns versus
112.325 ns audit time, an 11.08% slowdown. Candidate samples span 109.725–139.706 ns
and audit samples 111.131–134.856 ns. This remains in the score regardless of the
follow-up controls. Earlier array_append and records_4096 variance is not assumed
fixed or attributed to a cause by this batch. The unchanged full 15-kernel
script, three frozen binaries and an identical V16 repeat will investigate it
under two warmup histories, with no benchmark rewrite or sample substitution.

## Fresh profile and interpreter comparisons

All seven profiles have zero lost samples. Owner SET helpers fall below the
0.5% reporting threshold. Remaining owner self shares include PINCL 10.12%,
DLOAD 9.78%, JCMP 5.36%, ObjCmp 4.85%, contextual release 3.81%, CMP_OP 2.42%,
and IsFalse 1.30%. These sampled shares are not independent speedup estimates.
Method/member SQVM::Execute shares remain 47.87% / 58.44%; method constant-key
SET remains 8.52%, consistent with the importance of cold first stores.

Five alternating on/off rounds give **0.527772x owner time**, **1.063623x method
time**, and **0.262601x root_integer time** relative to the interpreter. Owners
are now substantially faster, but the 6.36% method regression remains. Both the
>=2x aggregate first milestone and its no-method-regression requirement remain
unmet. The full Node/GJS target is also still open.

The initial full-kernel diagnostic driver incorrectly assumed every case reports
160000 iterations; direct_call deliberately reports 3200000. It stopped on that
metadata assertion before accepting a round. Its source and log are retained.
The corrected driver compares each case with its interpreter reference count,
exactly as the unchanged benchmark runner does. No runtime code or benchmark was
changed, and the control begins again with fresh interpreter references.

## Direct V15/V16 controls

Each comparison has five rotating V15/V16/Node rounds. Values are V15 time
divided by V16 time; no case exceeds a 5% direct regression.

| Suite | Four warmups | Five warmups |
|---|---:|---:|
| owners | 1.228271x | 1.227467x |
| methods | 1.011155x | 1.015738x |
| members | 1.012493x | 1.013126x |

The owner gain repeats at 22.7–22.8%. Method gains are only 1.1–1.6%; publish_table
is 2.3–3.4% slower while transfers improve. Keep that individual regression
visible. The three straight-line publisher stores necessarily miss their empty
cache groups on first use, motivating cold-cache-followup.md. Their removal and
invariant-cache-followup.md remain unimplemented proposals, not credited gains.

## Array-append investigation

Forty independent timed processes cover two warmup histories and four rotating
labels: audit, V15, V16 and an identical V16 repeat. Each executes the unchanged
full 15-kernel script at the same nominal count, with per-case iteration and
checksum validation against JIT-off. All five rounds complete in both histories.

| Warmups | Audit ns | V15 ns | V16 ns | Identical V16 repeat ns |
|---|---:|---:|---:|---:|
| 5 | 119.006 | 129.513 | 129.744 | 127.525 |
| 4 | 139.075 | 141.662 | 125.981 | 134.675 |

With five warmups, V16 and V15 are nearly equal (V16 takes 0.18% longer), while
V16/audit is 1.0902 and the identical V16 repeat/audit is 1.0716. With four
warmups, V16/audit is 0.9058 and the repeat/audit is 0.9684. The identical V16
commands differ by **6.90% in median time** in that second history. Ranges overlap
widely: the five-warmup V15 range is 110.744–149.237 ns, and the four-warmup audit
range is 112.950–157.975 ns. Full-kernel V15/V16 aggregate speedups in these
controls are 1.001539x and 1.005263x; they do not replace the accepted full mix.

A separate diagnostic filters only the timed driver to array_append, retaining
the original function and startup correctness checks. It is explicitly outside
the accepted mix. Five rotating audit/V15/V16 rounds per warmup history give
median times 116.337/116.569/113.969 ns with four warmups and
113.825/114.513/119.456 ns with five. V16/audit ranges from 0.9796 to 1.0495.
Recorded route counters (including startup checks) agree across binaries; V15
and V16 have zero precise side exits. This does not prove identical machine code
or explain the timing differences.

A consistent V16-specific regression is not established by these controls.
The source of the array_append variance remains **unresolved**, and the original
11.08% slowdown remains in the full56 aggregate. No control median replaces an
original sample; no component is reweighted. Endpoint frequency snapshots in
the full-script controls are 2304000 kHz, which does not measure frequency inside
timed regions or establish a cause. Earlier records_4096 variance remains open
as well. These results do not claim that the variance or every possible
warmup-dependent performance effect has been eliminated.


## Decision and next work

Retain the native store improvement with its code-size cost and measured
limitations. Owners gain substantially, while methods retain an interpreter
regression and some publisher cases worsen modestly. The full aggregate remains
below 2x audit speed and far from the Node/GJS completion thresholds.

Next evaluate the compiler-wide definitely-cold cache proof for reads/stores,
then proven invariant cache operands. The fresh owner profile also supports
native increments, double loads and comparisons, each with its actual ownership
and output-order proof. Broader guarded builtin or canonical-loop/call coverage
remains necessary. Do not enable legacy private-spill takeover for precise
functions, weaken lifetime witnesses, rewrite the fixed benchmark mix or omit
future matched PGO/LTO confirmation. No V17 code is implemented here.

All earlier frozen evidence is preserved. The x64 failures and older
records_4096/array_append variance remain open unless explicitly resolved by
new evidence; this iteration does not silently dismiss them.
