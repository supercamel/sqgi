# V18: integer comparisons and activated AArch64 validation

Read [the validation correction](validation-correction.md) first. A nonexistent architecture macro had
silently skipped several targeted tests through V17; their previous validation
claims are withdrawn. V18 activates them, checks that their bodies execute, and
repairs the defects they exposed without dropping their semantic or native
coverage requirements.

The precise tier now lowers signed integer JCMP directly. Both operand guards
precede all effects. A boolean is assigned to the canonical SQVM temporary with
the existing release proof: a native reference drop requires no ancestor logs
and a masked count greater than one. Marks and weak semantics are preserved.
Sensitive temporaries and mixed operands retain checked helpers. x0 carries the
existing false/true status to native control flow. The optional comparison tier
falls back only when code emission exhausts the buffer.

Closure specializations also retain weak identity witnesses. A closure may die
without being pinned by generated code, but its cleared weak witness prevents
an unrelated allocation at the same address from authorizing stale code. Both
loop and whole-function closure/native-closure guards use the witness; direct
native closure calls check it before argument materialization. Failed compilation
releases temporary weak owners; successful code installation retains its own.

A final compact tier admits the existing large-function witnesses within the
unchanged 8 KiB buffer. It shares the five invariant helper arguments through a
local native trampoline, preserving the instruction IP and cache pointer. The
trampoline preserves its return address and stack alignment. All native branch
and side-exit behavior remains; each operation uses its original checked helper.
This final fallback is attempted only after all faster tiers exhaust emission.

Focused activated tests pass. GDB verifies 76 native comparison booleans at the
RETURN helper, 24 exact JCMP failure sites (16 final/journal-sensitive temporary
cases and eight nonnumeric cases), and eight mixed numeric helper successes.
The frozen CLI comparison control reduces 40 helper calls to four mixed-float
calls with 40 native successes and no exits. Its 42 attempts include two
unsupported main prototypes; they are not native successes.

Final validation and measurements are recorded below.

## Frozen build and full validation

Frozen CLI: build-jit-audit-20260909/precise-integer-compare-v18/sqgi
SHA256: 7bbbf925b5f7d9c1777a300a3d23646b0c0f47f9f9cdc5998033dd6f8f84ab12

Release and strict ASan/UBSan each pass 100 selected tests with precise exits
enabled and with the default disabled configuration, plus all 41 independent
script holdouts. The unchanged sqgipkg exclusion remains. Detailed CTest output
contains both activation markers in every configuration: ten AArch64 generated
code groups and the loop adaptation/lifetime contracts. The new host-architecture
assertions fail if these bodies are skipped. x64/QEMU still has the same 32 known
member_plan assertions; six of seven executables pass.

The combined 27-file audit patch reconstructs exactly. All 94 source hashes
and 88 original benchmark/test-script/driver hashes match. Five source files
change from V17. Historical evidence is preserved, with the validation correction
explicitly recorded. These current passes do not retroactively validate old
binaries against the formerly skipped tests.

## Frozen native evidence

All 87 exact-IP exits in the five benchmark-function captures still pass decoding.
The new integer JCMP appears in recycle; the other four precise functions have
no JCMP and retain their V17 code size. Frames and mapping sizes are unchanged.

| Function | V17 code bytes | V18 code bytes | Mapping bytes | Native JCMPs |
|---|---:|---:|---:|---:|
| recycle | 7148 | 7296 | 8192 | 1 |
| transfer | 2416 | 2416 | 4096 | 0 |
| publish | 1896 | 1896 | 4096 | 0 |
| table_apply | 3544 | 3544 | 4096 | 0 |
| apply | 3544 | 3544 | 4096 | 0 |

The two original large-function witnesses now use the compact fallback:

| Function | Code bytes | Mapping bytes | Native helper calls | Exact exits |
|---|---:|---:|---:|---:|
| exit_sites | 5096 | 8192 | 123 | 122 |
| cached_many | 6056 | 8192 | 147 | 146 |

Their decoder verifies every local BL target, the trampoline's 16-byte aligned
frame and saved return address, and each exact-IP exit branch. The original
functional tests cover all eight distinct division failures and all 70 member
sites; their coverage requirements and the 8 KiB buffer limit remain unchanged.

## Full-mix timing

Measurements retain the audit configuration: RK3588S CPU4, GCC 13.3 Release
with -O3/-DNDEBUG/-g, int64/double values, JIT threshold 1, no PGO/LTO,
Node 18.19.1 and GJS 1.80.2. Precise exits are enabled for this experiment.

Five rotating rounds use all 56 equally weighted components and the original
checksums. No case or sample is removed. Profiler/debugger/build activity is
separate from accepted timing.

**Audit / V18 time: 1.610484881x.**

| Suite | Audit / V18 time |
|---|---:|
| kernels-seed17 | 1.049902x |
| applications-seed17 | 1.001241x |
| roots-seed17 | 1.585203x |
| members | 1.042811x |
| owners | 6.396733x |
| methods | 2.521371x |
| floats | 0.964164x |

| Time ratio | Same-batch audit | V18 |
|---|---:|---:|
| geomean / node | 15.354115x | 9.533846x |
| p90 / node | 101.796941x | 25.044114x |
| geomean / gjs | 10.154255x | 6.305092x |
| p90 / gjs | 50.494587x | 14.052388x |

Largest remaining time ratios, retaining every full-mix case:

| Engine | Suite / case | V18 / engine time |
|---|---|---:|
| node | kernels-seed17 / object_member_write_fallback | 37.397560x |
| node | members / buffers_31 | 35.036479x |
| node | members / buffers_7 | 34.798144x |
| node | methods / publish_class | 29.098175x |
| node | methods / publish_table | 28.861813x |
| node | methods / transfer_class | 25.044114x |
| gjs | members / buffers_31 | 23.595687x |
| gjs | kernels-seed17 / math_intrinsic | 21.125079x |
| gjs | members / buffers_7 | 21.037750x |
| gjs | floats / channels_4 | 18.263844x |
| gjs | floats / pressure_8 | 15.674007x |
| gjs | methods / transfer_class | 14.052388x |

| Fixed-mix regression | Audit ns | V18 ns | Slowdown |
|---|---:|---:|---:|
| kernels-seed17 / direct_call | 34.236 | 35.975 | 5.079% |
| kernels-seed17 / float_call | 21.274 | 22.362 | 5.114% |
| floats / channels_4 | 79.180 | 84.105 | 6.220% |
| floats / pressure_8 | 153.290 | 163.715 | 6.801% |
| floats / retained_input | 44.370 | 47.130 | 6.220% |

Seed83/count400003 applications run at 0.989250x audit speed. No case is more than 5% slower. Both application seeds remain validated.

## Direct V17/V18 controls

Each comparison has five rotating V17/V18/Node rounds. Ratios are V17 time divided by V18 time.

| Suite | Four warmups | Five warmups |
|---|---:|---:|
| owners | 1.146247x | 1.147207x |
| methods | 1.000573x | 1.002886x |
| members | 0.999209x | 1.001959x |

Per-case direct regressions over 5%:

owners, warmups=4: {}.
methods, warmups=4: {}.
members, warmups=4: {}.
owners, warmups=5: {}.
methods, warmups=5: {}.
members, warmups=5: {}.

## Profitability and fresh profiles

| Suite/case | JIT on / off time |
|---|---:|
| owners | 0.454062127 |
| methods | 1.043732770 |
| roots | 0.290814243 |
| root_integer | 0.267389491 |

All seven profiles have zero lost samples. Raw data is retained with the frozen binary. Top owner self-time entries:

```
11.87%  sqgi     sqgi                          [.] sqjit_a64_precise_step<(SQOpcode)39, false>
10.56%  sqgi     sqgi                          [.] sqjit_a64_precise_step<(SQOpcode)4, false>
4.47%  sqgi     sqgi                          [.] SQJitWriteLog::CanReleaseInContext
1.81%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb4340
1.61%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb38dc
1.61%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb3498
1.41%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb41cc
1.38%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb4a80
1.29%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb46c0
1.28%  sqgi     [JIT] tid 606516              [.] 0x0000ffff7fcb336c
```

## Regression investigation

[Full controls and code comparison](regression-investigation.md) preserve all
five fixed-mix regressions and the additional branch/filter costs. Repeated
controls and exact added-guard sequences identify real call overhead. The
array-append control remains noisy with an unchanged normalized entry.

## Decision and next work

Retain the correctness repairs, activated tests, native comparison and compact
fallback. Both direct warmup histories support the owner gain; the full score includes all effects of
the weak lifetime guards and compact coverage fallback. The aggregate remains
below the first 2x milestone, and the Node/GJS completion thresholds remain unmet.
Prior array_append and records_4096 timing variance is not declared resolved by a
new batch. Current validation does not repair historical claims by implication.

The comparison gain repeats at 14.6–14.7% for owners; the four comparison-related
helpers fall below the 0.5% owner profile threshold. PINCL is now 11.87% and DLOAD
10.56% self time. First reduce the measured closure-guard cost without weakening
the lifetime fix. Increments and double loads still need their actual release
and multi-output proofs. Broader canonical native loop/call and guarded builtin
coverage remains necessary for applications and the other suites. Preserve all
activated witnesses, the original 56-component goal, remaining x64 repairs and
matched fresh PGO/LTO with independent holdouts excluded from training.
