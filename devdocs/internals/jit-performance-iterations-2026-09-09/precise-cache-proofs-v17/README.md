# V17: proofs for native cache checks

This candidate omits two kinds of redundant checks in the AArch64 precise tier.
A cache group cannot hit at its first lexical use unless the site lies within a
backward-branch span. Such definitely cold probes are omitted while direct array
paths and helper cache population remain. Every backward branch is considered,
so first loop sites retain probes for subsequent iterations. Earlier conditional
uses conservatively permit probing; the nonnull slot check remains mandatory.

Complete bytecode write facts also identify canonical parameters that never
change. After a helper fills a cache slot, identity checks for such fixed receiver
and key parameters are redundant during this no-call/no-allocation activation.
Mutable operands retain their tag/bits comparisons. Literal keys retain their
existing prototype identity proof. Values always reload, root/delegate fallback
remains uncached, and no cache survives an activation. No ownership guard, helper
semantics, instruction allowance, code-buffer limit or fallback tier changes.

## Targeted validation

Existing focused tests pass, including the original large-function fallback
assertion unchanged. New witnesses cover loop-first use, varied receiver/key
types across activations, mutable receiver parameters, bool/integer key changes,
conditional first uses, invalid fixed parameters, zero-iteration bypass, and
receiver replacement through DLOAD's second destination. All valid cases require
native stores; four invalid cases require exact side exits without prefix replay.

The debugger control and candidate each make 14 necessary SET helper calls and
20 successful native returns, with no guard failures or side exits. Loop-first
stores keep their fast paths, while mutable receiver/key changes require fresh
resolution. Direct live/dead weak inputs preserve result identity and type.

The initial caller layout took one existing V16 DLOAD exit before route_key's
stores. Debugger entry/return inspection verifies IP0/opcode4, a sole-owner table
destination, scalar VM temporary and helper result0. The final probe retains
real program owners of prior containers to exercise the non-final helper-bypass
path. Final-release C++ tests are unchanged. An initial GET-only inspection found
no matching call; all-opcode inspection identified DLOAD. Initial scripts/logs
are preserved; they are not counted as successful native-route controls.

Preflight captures show code sizes 7148/2416/1896/3544/3544 bytes for recycle,
transfer,publish,table_apply,apply. Member mappings return to 4 KiB. Publisher
stores are all definitely cold and go directly to their helpers. Loop and later
store paths remain present. Frozen validation and measurements are recorded below.

## Frozen build and gates

Frozen CLI: build-jit-audit-20260909/precise-cache-proofs-v17/sqgi
SHA256: 63de3d98bca2856a0ce2589ae1615fa80f0c11218bc1010d1cbc787363692d4e

Release and strict ASan/UBSan each pass 100 selected tests with precise exits
enabled and with the default disabled configuration, plus all 41 independent
holdouts against interpreter checksums. The existing sqgipkg exclusion is
unchanged. x64/QEMU retains the same 32 known member_plan assertions; six of
seven executables pass. Those failures remain open.

The audit patch reconstructs all 27 changed runtime/test files. All 94 source
hashes and 88 original benchmark/test-script/driver hashes match. The binary was
frozen before accepted timing; no build, test or profiler overlaps timing.

## Frozen native captures

All 87 helper exit sites retain their exact bytecode IP and common SIDE_EXIT
publication. The decoder checks emitted code length separately from mappings.
Local frame sizes stay 208/176/144/144/144 bytes. Direct array guards, source pins
and floating operations remain; definitely cold cache paths are omitted.

| Function | Code bytes V16 | Code bytes V17 | Mapping V17 | Native stores |
|---|---:|---:|---:|---:|
| recycle | 7468 | 7148 | 8192 | 4 |
| transfer | 3236 | 2416 | 4096 | 2 |
| publish | 2508 | 1896 | 4096 | 0 |
| table_apply | 4196 | 3544 | 4096 | 2 |
| apply | 4196 | 3544 | 4096 | 2 |

The five functions save 3,056 emitted bytes and 8,192 mapped bytes.

## Full-mix timing

Five rotating rounds on the unchanged 56 equally weighted components give
**1.584081995x speedup against the frozen audit**. Integer checksums match
exactly; floating checksums use the existing tolerance. No case or sample is
removed from the aggregate.

| Suite | Audit / V17 time |
|---|---:|
| kernels-seed17 | 1.063602x |
| applications-seed17 | 1.005608x |
| roots-seed17 | 1.611951x |
| members | 1.045868x |
| owners | 5.504717x |
| methods | 2.503011x |
| floats | 1.007276x |

| Time ratio | Same-batch audit | V17 |
|---|---:|---:|
| geomean / node | 15.261138x | 9.634058x |
| p90 / node | 100.052060x | 24.522956x |
| geomean / gjs | 10.110702x | 6.382689x |
| p90 / gjs | 50.373219x | 14.191829x |

No fixed-mix case is more than 5% slower than audit.

The separate seed83/count400003 application suite runs at 1.005397x audit speed; no case is more than 5% slower. Both application seeds remain validated.

## Direct V16/V17 controls

Five rotating V16/V17/Node rounds in each warmup history. Values are V16 time
divided by V17 time; per-case medians and raw samples remain in the JSON files.

| Suite | Four warmups | Five warmups |
|---|---:|---:|
| owners | 1.013055x | 1.013086x |
| methods | 1.021482x | 1.018271x |
| members | 1.004869x | 1.004001x |

| Method case | Four warmups | Five warmups |
|---|---:|---:|
| transfer_table | 1.034489x | 1.028686x |
| transfer_class | 1.013607x | 1.008166x |
| transfer_mixed | 1.020295x | 1.016824x |
| publish_table | 1.031627x | 1.029099x |
| publish_class | 1.012533x | 1.010551x |
| publish_mixed | 1.016556x | 1.016490x |

## Profitability and profiles

owners geometric mean on/off time ratio: 0.521151304.
methods geometric mean on/off time ratio: 1.045156469.
roots geometric mean on/off time ratio: 0.284646935.
root_integer on/off time ratio: 0.261063144.

Seven separate fresh profiles have zero lost samples; raw perf data is kept with the frozen binary. Top owner self-time entries:

```
10.28%  sqgi     sqgi                   [.] sqjit_a64_precise_step<(SQOpcode)39, false>
9.17%  sqgi     sqgi                   [.] sqjit_a64_precise_step<(SQOpcode)4, false>
6.20%  sqgi     sqgi                   [.] sqjit_a64_precise_step<(SQOpcode)29, false>
4.65%  sqgi     sqgi                   [.] SQVM::ObjCmp
3.51%  sqgi     sqgi                   [.] SQJitWriteLog::CanReleaseInContext
2.55%  sqgi     sqgi                   [.] SQVM::CMP_OP
1.85%  sqgi     sqgi                   [.] SQVM::IsFalse
1.75%  sqgi     [JIT] tid 595956       [.] 0x0000ffffb566c62c
1.67%  sqgi     [JIT] tid 595956       [.] 0x0000ffffb566b404
1.49%  sqgi     [JIT] tid 595956       [.] 0x0000ffffb566c32c
```

The owner profile places PINCL at 10.28%, DLOAD at 9.17%, and JCMP plus
ObjCmp/CMP_OP/IsFalse at 15.25% combined self time. These sampled proportions
identify candidates; they are not predicted speedups. Method execution still
spends 46.59% self time in SQVM::Execute, supporting the need for broader native
coverage alongside helper reductions.

## Decision and remaining work

Retain the source-level proofs. Owners gain 1.3% in both warmup histories; methods
gain 1.8–2.1%. The table publisher improves 2.9–3.2% directly over V16, whose
report recorded a modest publisher regression. No direct case regresses by more
than 5%. Member-suite change remains small. These gains accompany smaller code
without altering helper or release semantics.
The full aggregate remains below the 2x first milestone and far from the final
Node/GJS thresholds; method profitability and x64 failures remain open. Older
array_append and records_4096 timing variance is not declared resolved by a new
batch. No old sample is replaced.

comparison-followup.md records the next bounded native integer comparison
proposal, including the canonical temporary release proof. No comparison code
is implemented in V17. Broader guarded builtin and canonical loop/call coverage,
x64 repairs, and matched fresh PGO/LTO excluding holdouts remain necessary.
Preserve the full goal and every lifetime, alias, weak, rollback and exit gate.
