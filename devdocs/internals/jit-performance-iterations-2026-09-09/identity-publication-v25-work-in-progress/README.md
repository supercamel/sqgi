# V25 identity publication — work in progress

Two files change from frozen V24: the AArch64 private compiler and native
side-exit tests. An exact type/pointer match avoids redundant unstaged reference
publication. Changed values still use the journal; staged writes and GET swaps
are unchanged. The repeated receiver test covers real native execution, changed
final/nonfinal/marked owners, two ancestor pins, exact weak death, and complete
rollback after a late array-read guard. The release enabled run passes 100 tests
and all twelve native groups. All four 100-test runs, both 41-holdout sets and allocation-failure probes subsequently passed; x64 retains the same 32 assertions. See ../identity-publication-v25 for the frozen candidate.

The isolated native capture verifies six added instructions, full tag/pointer
comparisons, and exact branch destinations. For 319 appends across two native
invocations, receiver publications fall from 319 to two; native append execution
is unchanged. No addresses are joined between debugger and perf processes.

Completed warmup5 five-round pilot: array_append V23 126.488 ns, V24 167.687 ns,
V25 126.087 ns, identical V25 repeat 126.681 ns. Math-intrinsic improvement is
retained. All 15 checksums match interpreter references, with no >5% kernel
regression versus V23 or V24. Warmup4 also completes all five rounds: V23 127.869 ns, V24 166.569 ns, V25 126.131 ns, repeat 126.100 ns. It also has no >5% kernel regression. Both timing jobs are terminal; remaining correctness gates are running.
This is a pilot, not full56 acceptance. The full performance goal remains open.
