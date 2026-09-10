# V27 cold literal lookup — accepted performance iteration

Frozen binary SHA256: `368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa`.

The unchanged 56-component, five-round study measures **1.878306123× audit**
speedup. Node/GJS geometric runtime ratios are **8.123046/5.399528**;
p90 ratios are **23.026169/12.619815**. No full56 component regresses
by more than 5% versus the audit. V27 is the latest accepted performance result.
[Full results](results/summary.json) retain all 56 equally weighted components;
application seed83 remains separate and unweighted.

Cold immutable string/integer/boolean keys now check the current table or
instance-class first bucket directly. Full type and identity checks precede
slot access, and instance fields also check member encoding and bounds. A
successful lookup fills only the activation-local borrowed cache. Collisions,
equal non-interned strings, missing fields, class methods and unsuitable
receivers use the existing checked helper. Existing weak-value, temporary-swap,
nonfinal-release, ancestor-journal and precise-exit behavior is preserved.

Methods pilots use 0.935393–0.936459 of V26 time
across both warmup histories and identical-binary repeats. The fourteen paired
control groups cover both application seeds and identical repeats. Initial
seed83 records_4096 controls flagged +8.20%/+7.86% in different candidate copies.
A predeclared four-block replication retained all eight application cases and
40 samples per version per warmup history, with repeats of both versions.
New paired ratios were1.001013/0.998660. Including the original flagged runs,
95% upper bounds were1.017432/1.030123, below the predeclared1.05 threshold.
All eight cases met that criterion. Original flags and every sample remain in
[controls](study/regression-control-summary.json) and
[the investigation](study/records-replication/analysis.json); full56 is unchanged.
This excludes a material regression under that measured criterion, not all
possible runtime or host effects. Other control groups had no>5%flag.

An actual native trace verifies 84 successful native returns from transfer and
publish: constant GET/GETK/SET helper calls fall from 252 to zero. All 56 code-size
fixtures execute natively; fourteen prove that the larger lookup code falls back
to the original layout at the same optimization tier. Resource-failure probes
cover nine cases, including cold lookup installation and later retry. Diagnostic
setup failures and their corrections are retained. Six fresh native captures
verify 137 exact resume guards; [code comparison](study/native-code-comparison.json)
records size changes and pointer-normalized comparisons. The separate emission
tier probe verifies that rotate_buffers tries tiers6/5/4/3 before fitting tier2
at7884 bytes. All six probe captures match independent native captures after
pointer normalization. [Fresh profile and tail evidence](study/profile-followup.md)
retains the remaining engine gaps and helper costs.

All four 100-test release/strict-sanitizer runs and both 41-case holdout sets
pass. Eleven AArch64 coverage markers execute, including fourteen native groups
in the side-exit suite. x64 retains the same 32 known assertions. All 96 source
hashes and 88 unchanged benchmark/script hashes are verified; the audit source
reconstruction remains reproducible. All seven fresh profiles have zero lost samples.

JIT-on/off geometric runtime ratios are owners **0.394387** and
methods **0.976511**; root_integer is **0.265311**.
Two individual method cases still trail JIT-off: publish_table by1.56% and
publish_class by4.76%, despite the method group's improvement.
First milestone met: **False**. Engine ratio targets met:
**False**. Fresh matched PGO/LTO remains outstanding; this
iteration does not complete the full goal.
