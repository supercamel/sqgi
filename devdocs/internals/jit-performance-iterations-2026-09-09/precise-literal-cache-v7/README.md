# Dominating literal keys, V7

Experimental, enabled only by `SQGI_JIT_PRECISE_EXITS=1`. V6's activation-local
cache is extended to recognize constant keys loaded into registers before GET
and SET. The compiler follows LOAD, MOVE and DLOAD definitions within a basic
block, stopping at leaders/joins or any other write. DLOAD's second destination
wins if both destinations are equal. Compatible constant-key GET, GETK and SET
sites share an entry and use an opcode helper that needs only receiver identity
checks. Dynamic-key sites keep tag/bit checks and separate cache groups.

All V6 lifetime, callback, structural-mutation and fresh-activation constraints
remain. Extra tests require native execution for branch joins, copied keys and
DLOAD overwrite precedence. An integer deliberately sharing a cached receiver's
pointer bits must miss and side-exit after exactly one committed prefix. No
semantic, release-hook, rollback or native-coverage assertion was removed.

Validation: 100/100 selected tests with the option enabled and disabled in both
Release and strict ASan/UBSan; all 41 holdouts agree with JIT-off in each build,
seed 83, 20,003 iterations, one warmup. This changes the AArch64 experimental
compiler and its generated-code tests. Earlier shared/x64 results still apply,
including the open x64 release-ordering and native-coverage defects.

Frozen binary: `build-jit-audit-20260909/precise-literal-cache-v7/sqgi`, SHA-256
`1dc645bd025ee15b6a73ed56ff983f97cd61378f507d8de54d3f502c097fb574`.
`literal-cache-delta.patch` applies after V6. The complete audit-relative patch
reconstructs all 26 changed runtime/test files, verified byte for byte. Ordinary
Release flags remain -O3 -DNDEBUG -g, without PGO/LTO. The completed five-round study uses the unchanged 56-component mix and both
application acceptance seeds/counts. The experiment remains disabled by default.


Five rotating rounds give **1.296239891× aggregate speedup versus the frozen audit**.
Per-suite geometric speedups: kernels 1.047416×, applications seed17 1.013964×,
roots 1.068772×, members 0.961466×, owners **2.709376×**, methods **1.833909×**,
floats 1.012681×. The separate seed83/400003 application check gives 1.002681×
and no component regression over 5%; it is not added to the fixed 56-case mix.

| Time ratio | Same-batch audit | V7 |
|---|---:|---:|
| Geometric mean / Node | 15.321162× | **11.819697×** |
| Geometric mean / GJS | 10.171772× | **7.847137×** |
| Nearest-rank p90 / Node | 100.809878× | **39.647304×** |
| Nearest-rank p90 / GJS | 50.110079× | **19.236469×** |

The two >5% regressions are table_events_97 (0.920965× speedup; 8.6% more time)
and class_events_97 (0.846659×; 18.1% more time). Their five-sample ranges do not
overlap the audit's. They remain promotion blockers. The former array_append
and records_4096 regressions do not recur in this batch; the earlier data and
identical-binary controls remain intact, and no component was removed or reweighted.

Four-warmup replication rotates V5/V6/V7/Node: owners improve **1.168197× versus
V5** and **1.077387× versus V6**; methods improve 1.029810× / 1.037664×. These
subset comparisons are not substituted for the full-mix score.

Fresh five-round JIT-on/off comparisons give **1.069189× owner time**,
**1.418752× method time** and **1.324953× root_integer time**. All three first-
milestone regressions therefore remain, although owners are close to parity.

All seven fresh 499-Hz cycles:u DWARF profiles report zero lost samples. Owner
self samples: GETK 14.79%, CanRelease 14.70%, dynamic GET 11.10%, ADD 8.54%,
LOAD 7.89%; the remaining member variants retain significant helper overhead.
The member suite still spends 51.18% in SQVM::Execute. Profile traces, counters,
raw samples and a normal-exit GDB capture of recycle bytecode/native assembly
are archived; diagnostic timings are excluded. Raw perf files live alongside
the frozen executable and are hashed in profiles/manifest.json.

All 88 original benchmark scripts, top-level test scripts and timing drivers
match the initial audit snapshot. The goal remains active: neither its 2×
aggregate first milestone nor its <=3× geometric / <=10× p90 completion targets
are met. Fresh matched PGO/LTO confirmation also remains outstanding.
