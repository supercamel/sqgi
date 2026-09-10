# V30 checkpoint — stopped at user request

The user requested ending optimization work and committing/pushing the current
work on 2026-09-10. Pilot session 68917 was interrupted and returned exit130.
No optimization, test, profile or timing process remains running.

V29 remains the latest accepted full56 result: 1.882226095x audit,
Node 8.119330 / p90 23.761645, GJS 5.370798 / p90 12.629266.
The target and first milestone are not achieved. Matched PGO/LTO is outstanding.

Current source includes the V30 positive constant-divisor experiment in all
three AArch64 compiler paths. It is correctness-validated, not performance-accepted.
All four 100-test runs and two 41-holdout runs passed; 16 native groups executed.
Eight x64 tests retain the same 32 known member assertions. Original 13 allocation
cases, 24 tail fixtures, 16 old budget layouts, six native captures and 1244 buffer
helpers passed. New 48 paired budget fixtures, 14 installation reference/fault
cases and six copied-constant fixtures across reference/release/strict sanitizer
builds passed. Source manifest has 97 files.

Twenty-four repeated-call reference/fault cases expose an unchanged retry gap:
precise functions retry on the next call; private proto/loop cache executable
allocation failure and remain interpreted across three calls. Results and prefix
effects remain correct. This gap is recorded, not repaired.

Four of six pilot groups completed with five rotating rounds, repeated copies
of both versions and interpreter checksum references. No completed group has a
primary-comparison regression over 5%. Paired runtime changes versus V29:

- methods-pilot-w5: -0.277%.
- members-pilot-w5: +0.721%.
- owners-pilot-w5: -0.642%.
- methods-pilot-w4: -0.220%.

Warmup4 members was interrupted; warmup4 owners did not run. Their absence is
explicitly recorded in partial-study/partial-pilot-verification.json; the original
six-group verification requirement is retained in sqgi-v30-verify-pilots.py.
The two calibration cases in warmup5 members regressed about 2.3–2.6%.
No V30 full56, both-seed application controls, profitability or seven fresh
profiles were collected. Do not infer an overall V30 improvement.

The partial study, raw logs, probe evidence and prepared study scripts are saved
here. Prepared freeze/full-study/capture scripts have not been executed; changed
secondary native captures still require arithmetic-diff review before acceptance.
A future restart must explicitly choose how to continue the incomplete pilot
without overwriting the preserved results. All frozen older evidence is retained.
