# V15: shared precise side-exit return code

This candidate changes only AArch64 cold exit emission. Every helper failure
still branches to its own stub selecting the exact unexecuted bytecode IP in
x9. All stubs branch to one result publication and frame-restoration block;
x10 carries OT_INTEGER without overwriting the selected IP. The result is the
same fresh output object and status remains SIDE_EXIT. The final bytecode is
required to be RETURN, so normal execution cannot fall through into this block.

No helper, ownership rule, hot instruction lowering, frame layout, optional
lowering tier, code-buffer limit, bytecode allowance or interpreter continuation
rule changes. Buffer exhaustion still retries the five bounded tiers, and the
existing large-function fallback assertion remains unchanged.

A new AArch64 semantic witness warms a function containing eight divisions,
then causes a divide-by-zero at each distinct position. All eight calls must
use native SIDE_EXIT (not entry guard failure), preserve every prior store once,
and perform no later store. Existing release-order, alias, weak-reference,
ancestor-journal, invalid-resume and native-coverage witnesses remain intact.

The first build command used an incorrect target name and failed before
compilation. Its log is retained. An early test invocation ran before the
corrected build completed and is not candidate-validation evidence. The focused
test log was produced after the final build and includes the new witness.

The completed measurements and verification are recorded below.

## Correctness and frozen build

Release and strict ASan/UBSan each pass all 100 selected tests with precise
exits enabled and with the default configuration. Both builds pass the 41
independent holdouts against JIT-off checksums. The preexisting sqgipkg exclusion
is unchanged. x64/QEMU retains the same 32 assertions in member_plan; six of
seven cross-backend executables pass. Those failures remain unresolved.

Frozen CLI: build-jit-audit-20260909/precise-shared-exit-v15/sqgi
SHA256: 2d487564d42242918bbd145c3c24deec01f9e94417787a48c74f1dba5cfb2fe1
The reconstructed audit patch contains 27 files, the source manifest has 94,
and all 88 original benchmark/test-script/driver hashes remain unchanged.

## Native code evidence

Five captured functions retain their hot lowering and local frames. A decoder
checks every failure branch, all stub IP immediates, the common integer result
publication, SIDE_EXIT status and return. All 87 stubs correspond exactly to the
expected bytecodes. Each function has one publication instead of one per guard.
The reduction equals 36 bytes per guard minus the 40-byte shared block, confirming
that these captures save only duplicated cold return code. Counts below decode
the last instruction and verify zero padding; they are distinct from mapped size.

| Function | Code bytes V14 | Code bytes V15 | Mapping V14 | Mapping V15 |
|---|---:|---:|---:|---:|
| recycle | 7924 | 6740 | 8192 | 8192 |
| transfer | 3196 | 2768 | 4096 | 4096 |
| publish | 2360 | 2040 | 4096 | 4096 |
| table_apply | 4176 | 3676 | 8192 | 4096 |
| apply | 4176 | 3676 | 8192 | 4096 |

Frame bytes remain 208/176/144/144/144. Native reference pins, cached reads and
floating additions remain present. The first decoder invocation ran while GDB
was still collecting files and failed on the absent publish capture; its log is
retained. The final decoder runs only after all five captures completed normally
and passes every check. This initial collection race was not runtime evidence.

## Full-mix timing

Five rotating rounds on the unchanged 56 equal-weight components give
**1.514416839x speedup versus the audit**. V14 measured 1.519988960x
in its separate batch; this 0.37% aggregate difference is not a demonstrated
incremental regression or gain. Direct V14/V15 comparisons are recorded separately.

| Suite | Audit / V15 time |
|---|---:|
| kernels-seed17 | 1.059920x |
| applications-seed17 | 0.996821x |
| roots-seed17 | 1.604327x |
| members | 1.025318x |
| owners | 4.460254x |
| methods | 2.443974x |
| floats | 1.005678x |

| Time ratio | Same-batch audit | V15 |
|---|---:|---:|
| geomean / node | 15.268104x | 10.081837x |
| p90 / node | 100.872251x | 25.501541x |
| geomean / gjs | 10.113963x | 6.678454x |
| p90 / gjs | 50.473371x | 14.698213x |

There are no >5% case regressions in the fixed mix. The separate seed83/400003
application batch is 1.008503x audit speed, also with no >5% case regression.
All checksums agree. The second seed is not added to the fixed aggregate.
Earlier records_4096 identical-binary timing variance remains unresolved; this
batch does not replace or invalidate that evidence. The full target and first
2x aggregate milestone remain unmet.

## Profile priorities

The owner profile attributes 17.07% self samples to constant-key SET and 5.69%
to other SET, followed by PINCL 8.10%, DLOAD 7.93%, JCMP 6.13% and contextual
release 4.86%. These are sampled shares, not predicted independent speedups.
Method/member SQVM::Execute shares remain 43.12% / 57.11%. This supports native
single-output stores as the next bounded change while keeping broader native
coverage on the roadmap. No code is changed after this candidate's freeze.

## Direct controls and profiles

Five rotating rounds for each warmup history compare frozen V14/V15 directly.
Values below are V14 time divided by V15 time; differences stay below 0.5%
at the suite level. No direct-control case exceeds a 5% regression.

| Suite | Four warmups | Five warmups |
|---|---:|---:|
| owners | 0.997665x | 0.997611x |
| methods | 1.003271x | 1.003091x |
| members | 1.000687x | 1.000913x |

Five alternating on/off rounds give owner time **0.648098x**, method time
**1.073574x**, and root_integer time **0.262459x** interpreter time.
Methods remain 7.36% slower. The >=2x aggregate first milestone and
its no-method-regression requirement remain unmet.

All seven fresh profiles have zero lost samples. Detailed self shares and trace
counts are preserved in followup-summary.json and profiles/. Native stores,
DLOAD, increments and interpreter coverage remain the next costs to address.
The decoder script and native-summary.json verify retained fast operations,
unchanged frames and exact shared exits in all five sampled functions.

## Decision and remaining work

Retain this bounded code-size improvement: the five captures save 2932 emitted
bytes and 8192 mapped bytes, with approximately flat direct throughput. Do not
claim an incremental speedup. Source/test changes and frozen results are fully
reproducible from the attached delta and combined audit patches.

Next implement and measure native existing-slot SET with no separate result
write, following next-native-store.md. The restored code headroom is useful for
that experiment but is not proof that its full lowering will fit. Broader native
coverage is still required; intrinsic-coverage-followup.md records a bounded
builtin option alongside the earlier canonical-loop-region design. Neither SET
lowering, intrinsic extension nor new loop-region support is implemented here.
Keep all lifetime and weakref witnesses, the old private-loop exclusion, the
unchanged 56-component mix, both seeds, holdouts, and future matched PGO/LTO
confirmation. The known x64 failures and records_4096 variance remain open.
