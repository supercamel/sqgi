# Root presence queries, 2026-09-09

Status: development candidate, uncommitted and not accepted. Continues the
[owner-index/reference-read work](owner-index-2026-09-09.md). The preceding
correctness fix preserves receiver default-delegate precedence over root, but
adds 18–26% to call-heavy applications. Its profile attributes 2.35% self /
6.98% inclusive application samples to the root safety helper, and annotation
shows value-returning SQTable::Get and a temporary SQObjectPtr used only for
presence. The profile is `/tmp/sqgi-root-receivers-applications-profile.data`;
annotation `/tmp/sqgi-root-receivers-root-annotate.log`.

The new change uses existing GetRawSlot only as a boolean presence query. No
borrowed address escapes the check, no default-delegate lookup is skipped,
and no new cache/invalidation assumption is introduced. Null and dead weakref
members still shadow root; added tests require their expected failure rather
than allowing a root value to be read. Existing ten-receiver native coverage,
runtime default-delegate mutation and recursive metamethod tests remain.

Selected Release tests pass 98/98; strict-alignment ASan/UBSan passes 99/99.
Release excludes the existing root-owned-install-manifest test and sqgipkg;
sanitizers include install and exclude only sqgipkg. Logs:
`/tmp/sqgi-root-presence-{release-build,release-tests,asan-build,asan-tests}.log`.

Frozen binary: `/tmp/sqgi-root-presence-release-20260909.Qc3Ubv/sqgi`, SHA-256
`68e907b0d1457beffd3e5a647819d67609e98b45f13be54013ad8efe6600655e`.
Tracked source delta from `953b5b4`: `/tmp/sqgi-root-presence-source.patch`,
SHA-256 `1b662e777e9db26b3f384c2059f4e1b1a95023b82523f9be9fca2e894d361eb1`.
GCC 13.3 Release, AArch64 native JIT ON, int64/double, PGO/LTO OFF. Previous
optimized binaries and profiles remain unchanged.

All 37 sanitized holdout components pass (8 applications, 6 members, 6 methods,
10 owner workloads and 7 floating workloads); logs have no script, ASan or
UBSan errors. Ordinary timing confirmation is complete. The seed-83
application ablation compares against the corrected-root development binary
`d10b51df...`, whereas the seed-17 application and original-kernel gates compare
against committed `953b5b4` ordinary Release (`192855dd...`). These baselines
must not be interchanged, and none is a new PGO/LTO comparison.

Five rotating rounds, five warmups, CPU 4, checksum validated. No build,
sanitizer or profiler ran concurrently. The workstation and ondemand CPU
frequency remain uncontrolled; all raw samples are retained.

| Application | Committed Release ns | Presence-query ns | Baseline/candidate |
| --- | ---: | ---: | ---: |
| route_balanced | 52.925 | 58.755 | 0.901x |
| route_skewed | 48.755 | 57.860 | 0.843x |
| pricing_events | 54.735 | 62.925 | 0.870x |
| filter_stream | 51.150 | 61.660 | 0.830x |
| records_64 | 287.975 | 133.495 | 2.157x |
| records_4096 | 318.075 | 247.385 | 1.286x |
| word_count | 262.165 | 261.215 | 1.004x |
| graph_walk | 10.940 | 10.940 | 1.000x |

The 4,096-record candidate ranges from 240.780 to 322.890 ns (33.2% of
its median), so its exact speedup is not stable. Against the immediately
preceding corrected-root candidate, the four call-heavy application medians
improve 5.1-7.3%, but still take 11-21% longer than committed Release. The
15 original kernel medians vary between 0.9% slower and 3.0% faster; this
does not establish a broad application improvement. The candidate remains
unaccepted and has not been retrained for PGO/LTO.

[Application baseline samples](root-presence-release-applications-baseline-2026-09-09.json),
[presence-only ablation samples](root-presence-release-applications-ablation-2026-09-09.json),
[original kernel samples](root-presence-release-kernels-2026-09-09.json).

Fresh profile of this frozen candidate: CPU 4, cycles:u at 499 Hz, DWARF
8,192-byte stacks, all eight applications at 3,000,000 iterations, one
warmup, seed 83. `/tmp/sqgi-root-presence-applications-profile.{data,log}`
records zero lost samples and approximately 12.464 billion cycles.
Self samples: VM Execute 13.84%, journal ContainsMember<false> 12.85%,
SQTable::Get 9.29%, root_fallback_safe 5.39% (now includes its inlined
presence lookup), array_get_object 4.55%, member_store_slot 4.30%, and
member_closure_guard 2.27%. Guard lookups and temporary member-value
ownership remain a general call-path opportunity; sample shares are not
wall-time savings estimates.

The next broader loop opportunity was inspected, not implemented: AArch64
already emits branch instructions, but its linear slot-state lowering must
reconcile incoming representations and deferred VM-stack aliases at joins.
Simply removing the internal-branch preflight rejection would be unsafe.
