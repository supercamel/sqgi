# V29 shared helper tail branch — accepted performance iteration

Frozen binary SHA256: `24b4f8c1961001ffbad7a4735b998a912b87853f93bf71a10eab369a96ea9718`.

The unchanged 56-component, five-round study measures **1.882226095× audit**
speedup. Node/GJS geometric runtime ratios are **8.119330/5.370798**;
p90 ratios are **23.761645/12.629266**. No full56 component
regresses by more than 5% versus the audit. Application seed83 remains separate
and unweighted. [Full results](results/summary.json) retain all 56 components.

All fourteen paired control groups have no greater-than-5% flag against V28.
Both baseline and candidate copies are retained; primary-baseline flags are
not suppressed by the supplemental paired-copy ratios. Both application
seeds/counts and warmup histories remain in the controls.

The shared helper block prepares canonical arguments and tail-branches through
x16, allowing the checked helper to return directly to the original call site.
It shrinks from 40 to 24 bytes; rotate_buffers shrinks 7408→7392 bytes at the
same tier. Its body is pointer-normalized equal and its actual helper count
remains 1244 over four successful native returns. The buffer pilots across both warmup histories
and candidate copies use 0.953855–0.957015 of V28 runtime.
All seventeen unrelated native captures and sixteen previously fitting
boundary layouts retain pointer-normalized code.

All 24 tail-budget fixtures execute natively. Twelve tail-only overflow
attempts retry lower tiers; the 8192/8196-byte boundary is covered. Thirteen
resource cases cover reference behavior, allocation/install failure and retry,
including rich and compact shared code. Six native captures verify 137 exact
resume guards. All four 100-test release/strict sanitizer runs and both 41-case
holdout sets pass; 15 native groups execute. x64 retains its 32 known assertions.
All 96 source and 88 unchanged benchmark hashes are verified. Seven fresh
profiles have zero lost samples. [Profile and tail review](study/profile-followup.md).

JIT-on/off geometric runtime ratios are owners **0.395913**,
methods **0.976888**, and root_integer
**0.266085**.
[Per-case profitability](study-verification.json) retains remaining interpreter
regressions. First milestone met: **False**.
Engine ratio targets met: **False**. Fresh matched PGO/LTO
remains outstanding; this iteration does not complete the goal.
