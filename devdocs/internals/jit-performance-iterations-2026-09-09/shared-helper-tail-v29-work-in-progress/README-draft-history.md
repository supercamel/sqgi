# V29 shared helper tail branch — isolated draft

This draft has not been applied, compiled, or timed. V28 remains frozen while
its full sequential measurement pipeline runs (session34064). Do not build,
run GDB, or alter production source during that pipeline.

The local BL at each shared helper call site already places its status-guard
continuation in LR. Replacing the trampoline's save/call/restore/return sequence
with argument setup followed by BR x16 would let the checked helper return
directly to that continuation. Context is loaded at the original SP displacement;
x6 remains the original activation-local cache address. The shared tail shrinks
from40to24bytes. This does not by itself establish a runtime improvement.

The draft native test retains existing interpreter/native agreement, both
branch outcomes, noninterned-key lookup/cache use, committed count, exact late
GETK continuation, and absence of ancestor journals. It runs both24-add rich
and56-add compact forms. Every direct BL must target the six-instruction
canonical argument/tail-branch sequence. Both forms must return through actual
native execution, and the rich form must retain native arithmetic.

Before applying: review the fresh V28 profiles and full-suite results; confirm
the live pipeline is terminal; preserve all current source and accepted evidence.
Then compile and validate both forms, lifetime and precise-exit gates, strict
sanitizers, holdouts, shared backend checks, allocation/install failure and retry,
and code-size boundaries. Update the boundary and disassembly verifiers to
check the24-byte tail exactly, without dropping any semantic assertions. Only
five-round unchanged workload timings can justify performance acceptance.

Fresh V28 diagnostic evidence now supports testing this proposal. Code capture
and cycle samples from the same process (PID727250) place172of2801samples in
the40-byte shared helper block. The four save/frame/restore/return instructions
that this draft removes account for98samples. This is not a speedup prediction:
sampling can skid, branch behavior can change, and the diagnostic uses boundary
debugger stops with zero warmups. The ordinary seven-profile study remains
separate. The same focused profile puts13.23%in LOAD,8.78%in CanReleaseInContext,
and about13%in SET helpers; those are further general optimization leads.

V28 acceptance is now held on records_4096 flags in both application seeds.
A fixed four-block replication is active in session21523. Do not apply this
draft or compile while that timing job is running. If V28 is rejected, retain
its evidence and review/rebase this proposal against the latest accepted base.

Update: V28's both-seed replication is complete, and V28 is accepted with all
original flags retained and the smaller seed17/w4 records slowdown documented.
Session21523 is terminal0. Global sealing is pending. This draft remains
unapplied/uncompiled until the accepted source is backed up and verified.
