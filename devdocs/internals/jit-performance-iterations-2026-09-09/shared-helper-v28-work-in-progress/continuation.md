# Latest checkpoint

V28 is ACCEPTED and locally sealed. Full pipeline34064, records probe54704,
same-process PC profile82176 and fixed both-seed replication21523 are all
confirmed terminal0. `/tmp/sqgi-v28-acceptance.log` records acceptance.
Global reseal is next via `/tmp/sqgi-v28-reseal-global.py`, not yet run.
No timing/build/GDB jobs remain live at this checkpoint.

The four-block16-file replication met every predeclared criterion, preserving
original flags; worst combined95%upper1.0429878855. A smaller seed17/w4 records
slowdown1.87%is retained explicitly in `v28-records-small-regression.md` and the
main report. V28 frozen SHAef6bbeab6b37097be7e2314d6f71067f797ce34bdb40a9c0ddc8454bbd608330.
Full56 speedup1.8813082824683165; Nodegeo8.101545958342603/p9023.65789735480837;
GJSgeo5.382927636859605/p9012.577691107644304. Targets remain unmet.

V29 tail-helper draft remains UNAPPLIED and UNCOMPILED. Its independent folder
is `shared-helper-tail-v29-work-in-progress`, local `/tmp/sqgi-v29-tail-helper-draft`.
Review, preserve all96current source files against V28manifest, then apply only
the two drafted source files and start native/release gates. Keep strict lifetime,
resource, side-exit, native-coverage, both-seed and warmup checks. Draft tests
exercise24-add rich and56-add compact helper paths. Future tail decoder must
check24bytes and BRx16 exactly. Do not weaken existing40-byte V28 evidence.
