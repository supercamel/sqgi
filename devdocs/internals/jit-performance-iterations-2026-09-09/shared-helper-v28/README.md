# V28 shared helper setup — accepted performance iteration

Frozen binary SHA256: `ef6bbeab6b37097be7e2314d6f71067f797ce34bdb40a9c0ddc8454bbd608330`.

The unchanged 56-component, five-round study measures **1.881308282× audit**
speedup. Node/GJS geometric runtime ratios are **8.101546/5.382928**;
p90 ratios are **23.657897/12.577691**. No full56 component regresses
by more than 5% versus the audit. Application seed83 remains
separate and unweighted. [Full results](results/summary.json) retain all 56 cases.

Initial records_4096 controls flagged +6.79% in the seed83 repeat and +8.59%/+8.82% in both seed17 copies with five warmups. A fixed four-block replication retains all eight cases, both seeds/counts, both warmup histories and identical repeats of both versions (40 new samples per version/history/seed). For every case/seed/history, both new-only and original-plus-new 95% paired bootstrap upper bounds are <=1.05. Original flags and raw data remain in [controls](study/regression-control-summary.json) and [replication](study/records-replication/analysis.json). This resolves the flags under the predeclared measured criterion; it does not rule out every host or runtime effect.

Shared helper argument setup preserves native fast paths when the original
layout exhausts the existing 8192-byte budget. All original layouts are attempted
at each tier before shared setup. Buffer rotation now fits tier 3 at 7408 bytes,
versus tier 2 at 7884 bytes. Its actual trace makes four successful native returns
per version: checked helper calls fall 1772→1244 (GETK 464→8; GET 76→4).
Buffer pilots use 0.935086–0.938085 of V27 time across both
warmup histories and identical-binary repeats. The other five canonical
captures and all 16 previous boundary layouts preserve pointer-normalized code.

All 24 tail-budget fixtures execute natively; 20 observed tail-only overflow
attempts retry lower tiers. The 8192/8196-byte boundary is covered. Eleven
resource cases verify reference behavior and failure/retry, including shared
rich code. Diagnostics retain setup failures and their corrections. Six fresh
native captures verify 137 exact resume guards. All four 100-test release/strict
sanitizer runs and both 41-case holdout sets pass; 15 native groups execute.
x64 retains the same 32 known assertions. All 96 source and 88 unchanged benchmark
hashes are verified. All seven fresh profiles have zero lost samples.

An additional diagnostic captures code and PC samples in the same process.
Across four successful buffer native calls it records 2801 samples, with 172
(6.14%) in the shared helper block. These samples can skid and are not causal
speedup estimates. Boundary debugger stops and zero warmups make this separate
from accepted timings. Setup failures and their fixes remain archived.

JIT-on/off geometric runtime ratios are owners **0.395444** and
methods **0.975649**; root_integer is **0.265757**.
[Per-case profitability and acceptance](study-verification.json) retain every
remaining interpreter regression. First milestone met: **False**.
Engine ratio targets met: **False**. Fresh matched PGO/LTO remains
outstanding; this iteration does not complete the full goal.
