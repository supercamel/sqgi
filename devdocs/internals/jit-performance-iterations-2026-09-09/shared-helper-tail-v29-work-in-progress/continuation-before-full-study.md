# Active V29 checkpoint

V28 is ACCEPTED,535local files sealed. Global reseal8530entries passed before
V29 began, including unchanged V24–V27local seals. See `/tmp/sqgi-v28-global-seal.log`.
The active goal remains unmet: V28full56 speedup1.8813082825, Nodegeo8.101546,
GJSgeo5.382928, p9023.657897/12.577691. Original records flags and the resolved
both-seed replication are retained; smaller seed17/w4 slowdown1.87%is explicit.
No V28artifact has changed since local sealing. New V29WIP updates mean the
global manifest is again historical, not a claim about current mutable files.

V29 APPLIED and COMPILED. Backup all96V28source files:
`/tmp/sqgi-precise-before-v29`. Only backend precise.inc and native side-exit test
changed. The helper tail is24bytes (canonical arguments, BRx16), retaining the
original BL continuation without a temporary FP/LR frame. Tests exercise both
24-add rich and56-add compact forms, all branch outcomes, key/cache arguments,
committed prefix, exact late exit and actual native returns. All15native groups
pass. First build session94556 TERMINAL0. NO V29timings yet.

**LIVE correctness session99170** runs `/tmp/sqgi-v29-correctness.sh`: first
release-enabled100, then release-default100,41holdouts, ASAN rebuild, both
100-test modes and41holdouts, x64build/comparison against V28's32known asserts.
Poll this EXACT handle before GDB/profiling/timings. Do not overlap jobs.
Source and release binary identities are in application-status.json.

Prepared but NOT EXECUTED: `/tmp/sqgi-v29-tail-budget/capture.gdb` and
`/tmp/sqgi-v29-verify-tail.py`, created by `/tmp/sqgi-v29-prepare-tail-budget.py`.
Expected24fixtures; pads1–14fit tier6, pads15–24tier4;12tail-only overflow
witnesses; pad14exact8192bytes, pad15requires8196. Verify actual results rather
than changing these expectations to hide a failure. Structural check requires
LDRcontext, four canonical MOVs, BRx16; do not reuse the old40-byte decoder.
Compiler breakpoint lines1022/1127 and runtime610are still applicable, but
validate them against debug info if observation fails.

Next: finish correctness, run tail/budget/layout/helper probes sequentially,
adapt11resource cases for the new24-byte tail and validate actual shared rich
and compact routes; then five-round pilots and full56/both-seed/profile/control
work. Consider adding repeated BASELINE binaries to initial paired controls:
V28's fixed replication was needed to quantify baseline/copy variation. Keep
all cases, original flags, both seeds/counts and warmup histories intact.
Do not apply further compiler changes until V29 is measured and reviewed.

A same-process V28buffer PC profile (PID727250) has2801samples/0lost, with172
in the shared helper block and98at its removable frame/return instructions.
This supports the V29hypothesis but is NOT a measured speedup. Artifacts are in
accepted V28/buffer-pc-profile; two initial diagnostic failures are preserved.
Broader loop/call coverage remains a larger gap (methods ~50%VM execution);
see canonical-loop-continuation-v28-review.md and canonical-loop-entry-next.md.
