# V26 owning post-increment — accepted performance iteration

Frozen binary SHA256: `80926f469e88e85b0311f03ad81e570b75bb4d7fd4222feb402380f96e970855`.

The unchanged 56-component, five-round study measures **1.866476378× audit**
speedup. Node/GJS geometric runtime ratios are **8.186695/5.425420**;
p90 ratios are **24.987213/13.449750**. No full56 component regresses
by more than 5% versus the audit. V26 is the latest accepted performance result.
[Full results](results/summary.json) retain all 56 equally weighted components;
application seed83 remains separate and unweighted.

The new precise integer post-increment path checks its source and proves a
nonfinal old-result drop before either bytecode write. It preserves mark bits,
source/result aliases and machine-word wrap. Final owners, active ancestor
journals and non-integer sources retain the checked helper and exact resume IP.
Richer emission first falls back to the original layout at the same tier;
only buffer exhaustion permits that retry, never resource failure.

Owner pilots use 0.869–0.870 of V25 time across both warmup histories and
identical-binary repeats. The full owner group measures 7.288826× audit, at
122.72–123.38 ns per operation. Member pilots remain unchanged. All fourteen
paired control groups pass, including both warmup histories, both application
seeds and identical candidate repeats; no >5% regression versus V25 appears.
See [the control summary](study/regression-control-summary.json).

An actual native trace verifies 20 owner invocations and 380 loop iterations:
PINCL helper calls fall from 380 to zero, while recycle grows 48 bytes to 7344.
All 112 budget fixtures execute natively; twelve prove that richer code exceeding
8192 bytes preserves the old layout at the same tier. Six fresh native captures
verify 137 exact resume guards. Other captured precise functions, math entries,
loops and append code remain unchanged after masking pointer materialization.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Ten independent AArch64 coverage markers execute, including thirteen
native groups in the side-exit suite. Resource-failure probes cover the new
post-increment install path and preserve later retry. x64 retains the same
32 known assertions. All 96 source hashes and 88 unchanged benchmark/script
hashes are verified; the 30-file audit reconstruction remains reproducible.

JIT-on/off geometric runtime ratios are owners **0.395969** and
methods **1.040916**; root_integer is **0.265052**.
The first milestone remains unmet: aggregate speedup is below 2× and methods
still regress versus the interpreter. Both final engine-ratio targets and fresh
matched PGO/LTO remain open. This iteration does not complete the full goal.

All seven ordinary profiles have zero lost samples. DLOAD now leads owner helper
cost at 12.04%; method VM Execute is 48.66%. Follow-up tracing verifies 252 cold
member helper calls with current first-bucket matches. Application route/pricing/
filter calls already complete in native loops with no native-closure call helper.
See [follow-up evidence](follow-up-evidence.md), including retained diagnostic
failures and their corrections. The next cold literal lookup draft is not yet
applied or compiled.
