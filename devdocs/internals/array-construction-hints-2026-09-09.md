# Guarded array-construction hints, 2026-09-09

Next iteration: [inline scalar ownership checks](inline-ownership-checks-2026-09-09.md).

Status: experimental, uncommitted, unaccepted; ordinary Release with native
AArch64 JIT ON, PGO/LTO OFF. Continues the
[compact journal investigation](compact-values-2026-09-09.md).

## Profile before changing code

The frozen compact-inline executable was profiled after its timing runs
finished, with CPU 4, cycles:u at 499 Hz and DWARF/8192 call stacks. No
builds/tests/benchmarks from this iteration ran concurrently. All three captures report zero lost
samples. The array capture invokes the existing array_read_kernel three
times at 24 million iterations, after its normal correctness checks; each
returns 60,000,000. The other captures use the original eight applications
(3 million iterations, seed 83, one warmup) and ten owner workloads
(400,000 iterations, one warmup).

Array self shares: FinishStackWrite 24.01%, RecordStackSlot 21.79%, the
finish helper 9.52%, write_log_ensure 7.97%, CanRelease 7.25%, and the boxed
array-pointer getter 5.25%. Application self shares include RecordMember
12.08% and the boxed stack-array getter 5.90%. Owner shares include
RecordStackSlot 14.67%, FinishStackWrite 12.39%, RetainValue 9.49%,
CanRelease 9.26% and CountPins 7.30%.

Artifacts: `/tmp/sqgi-compact-inline-{array,applications,owners}.data`,
corresponding `-flat.log` and `-profile.log` files. This identifies a wider
remaining ownership cost; the present change addresses only one well-defined
source of unnecessary boxed operations, not all those costs.

A debugger diagnostic runs identical integer reductions over a local literal
array and a parameter array, twelve calls of eight reads each. In the frozen
predecessor, local construction executes 96 boxed reads and 96 checked GET
finishes, while parameters execute 96 scalar-elision checks and no boxed
reads/finishes. The local constructor has no observed live array at compilation,
so the existing lowering cannot select its already guarded numeric path.
`/tmp/sqgi-compact-inline-get-diagnostic.log` records the result.

## Mechanism and safety boundary

A compile-time raw-type mask records values appended to an array. Integer,
float and literal appends contribute their tags; unknown or unsupported stack
values contribute a nonnumeric tag. Only an exclusively integer or exclusively
float mask selects a hint. Empty, mixed and unknown constructions remain boxed.
Array-pointer copies preserve the mask; replacing a slot clears it.

This is a preference, not an invariant or an alias analysis. Copies, calls,
writes and control flow can make a hint stale. Every selected numeric load
retains the existing bounds and exact element-tag guards; misses follow the
ordinary journal rollback and interpreter replay. No guard is removed, no
unknown array defaults to integer, and no array representation, native ABI,
runtime journal size or release policy changes. Only whole-function AArch64
array-pointer reads consume the new hints; loop/x64 lowering is unchanged.

The revised diagnostic has zero boxed reads and zero checked GET finishes
for both local and parameter arrays, and 96 scalar-elision checks each.
Checksums still match. `/tmp/sqgi-array-construction-get-diagnostic.log`.

## Separate correctness finding

New mixed/unknown-construction tests exposed an existing raw-pointer boxed
getter that returned a stored weakref rather than its referent. The frozen
predecessor reproduces `weak -> weakref equal=false`; the interpreter returns
the array. The helper now uses the same `_realval` operation as SQArray::Get.
Numeric guards and undo snapshots continue to inspect raw stored tags.

Reproduction: `/tmp/sqgi-array-construction-diagnostic.nut`, with
`/tmp/sqgi-array-construction-diagnostic-{baseline,candidate}.log`. The
candidate returns `weak -> array equal=true`. This fix is independent of
hint selection and does not credit the hints with fixing the existing bug.

## Validation and provenance

Expanded memory tests cover local integer/float arrays, aliases, mixed and
unknown constructors, zero-trip loops, branch-selected constructors, late
integer-to-float/string replacement, signed/out-of-range indices, empty arrays,
exactly-once external writes during replay, live weakrefs and host-supplied
dead weakrefs. Raw dead weakrefs are passed directly through the host API:
reading one from a table would dereference it before reaching the array test.

Whole-function success assertions use separate VMs with clean entry slots.
The mixed-caller checks also preserve the existing conservative final-release
fallbacks; they do not claim every constructed-array call stays native. In
particular, stale owning VM temporaries can still cause those fallbacks.

Selected Release tests pass 97/98, retaining the existing assign_refs coverage
failure. Final strict-alignment ASan/UBSan tests pass 98/99 with the same
coverage failure and no sanitizer reports (leak and stack-use-after-return
detection enabled). The expanded memory test passes in both. Focused x64/QEMU tests pass 2/3:
memory and write-log pass, member-plan retains its 27 stack-order and seven
route failures. Logs: `/tmp/sqgi-array-construction-{release,asan,x64}-tests.log`.
All 41 independent application/member/method/owner/float/root components
pass with strict ASan/UBSan, JIT off and on, 20,003 iterations, one warmup,
seed 83. The validation rejects script/sanitizer errors, checks expected row
counts and iteration counts, and compares checksums within 1e-10 relative
tolerance. Log: `/tmp/sqgi-array-construction-asan-holdouts.log`. These are
correctness checks, not timing samples. Release timing confirmation follows.

Frozen executable: `/tmp/sqgi-array-construction-release-20260909.mSbyBy/sqgi`,
SHA-256 `ab4be51f528d770b287282b793db81f06ec4388072806db1cf3065c1ed771335`.
CMakeCache is alongside: GCC 13.3 Release, int64/double, JIT ON, PGO/LTO/ASan OFF.
Full tracked delta from committed 953b5b4, excluding untracked reports:
`/tmp/sqgi-array-construction-source.patch`, SHA-256
`bc3c37e2f25ed84b327e92369ba2d8e3fa69c213beee4daf6eacc5ebc5d1c581`.

Immediate predecessor:
`/tmp/sqgi-compact-values-inline-release-20260909.xCPsDY/sqgi`, SHA-256
`41285a98bc757043a96ba0d3d16e5023bc07933a466c74048162c90908da664d`.
The small-record regression and broader ownership gaps remain open. No
commit, push, fresh PGO training or parity claim is warranted yet.

## First paired timing results: not accepted

Five alternating pairs, five warmups, CPU 4, ordinary Release/JIT, no
concurrent SQGI build, test or profiler jobs. Unrelated workstation activity and
ondemand frequency scaling are not controlled. All checksums match; the
paired runner uses the first baseline output as its reference.

Original kernels, 160,000 base iterations (3.2 million for scaled kernels):

| Workload | Compact-inline ns | Construction-hint ns | Speedup |
| --- | ---: | ---: | ---: |
| direct_call | 34.37 | 34.48 | 0.997x |
| branch_call | 31.95 | 32.36 | 0.987x |
| float_call | 20.84 | 20.61 | 1.011x |
| numeric_loop | 22.89 | 22.97 | 0.996x |
| vector | 384.39 | 383.97 | 1.001x |
| dynamic_member | 1652.49 | 1648.41 | 1.002x |
| dynamic_key_get_set | 186.09 | 185.88 | 1.001x |
| object_member_write_fallback | 473.49 | 471.98 | 1.003x |
| array_append | 128.98 | 127.98 | 1.008x |
| array_write | 82.04 | 37.11 | 2.211x |
| array_read | 59.16 | 9.64 | 6.139x |
| array_float | 6.82 | 9.38 | 0.727x |
| math_intrinsic | 204.86 | 209.09 | 0.980x |
| math_variable | 225.92 | 225.44 | 1.002x |
| matrix | 317.21 | 316.86 | 1.001x |

The integer gains do not justify the 37.6% float-array regression. Float
construction can now compile as a whole function, whereas the preceding
prototype rejects it and uses a faster loop region. Those routes have
different ownership bookkeeping. The scalar GET elision helper remains a
call on the new whole-function route. The next action is to profile this
regression and revise the general guarded lowering, not select a backend
based on the benchmark name or drop the float case.
[Kernel ablation](array-construction-release-kernels-ablation-2026-09-09.json).

A separate five-pair committed-baseline comparison puts array_read at
9.37 -> 9.65 ns (3.0% slower), array_write 34.01 -> 37.11 ns (9.1% slower),
array_float 6.85 -> 9.38 ns (37.0% slower). Thus the large ablation gains
mostly recover experimental overhead, not committed-baseline superiority.
Dynamic members remain 731.58 -> 1655.02 ns, append 63.66 -> 115.08 ns,
vector 378.51 -> 385.83 ns, matrix 306.64 -> 319.35 ns. Calls and math
retain earlier-series gains; they are not attributed to these hints.
[Committed comparison](array-construction-release-kernels-baseline-2026-09-09.json).

Eight applications, seed 83 / 400,003 iterations: all except records_4096
are within 1.6% of the preceding compact prototype. records_4096 is
314.06 -> 336.74 ns (7.2% slower), with very wide preceding/candidate ranges
of 275.69-453.90 / 219.95-385.73 ns. This is unresolved, not discarded or
called an improvement. records_64 is 137.64 -> 135.47 ns (1.6% faster),
which alone does not resolve the prior compact-vs-logical-slot regression.
[Application ablation](array-construction-release-applications-ablation-2026-09-09.json).

Five rotating member/float/method rounds at 200,000 iterations, five warmups,
CPU 4, include Node and an independent JIT-off checksum reference. All match.
All six member medians are within 0.2% of the preceding compact build.
Seven float holdouts range from 0.6% faster to 1.1% slower; retained_input
and helper_control are 1.0% and 1.1% slower. The float-array regression above
is therefore not generalized to all floating workloads, nor hidden by them.

Method medians, ns:

| Workload | Compact-inline | Construction hint | Node |
| --- | ---: | ---: | ---: |
| transfer_table | 1292.60 | 1305.64 | 18.14 |
| transfer_class | 1371.03 | 1377.19 | 18.36 |
| transfer_mixed | 1370.13 | 1379.06 | 29.53 |
| publish_table | 951.25 | 943.31 | 13.67 |
| publish_class | 987.08 | 977.59 | 13.72 |
| publish_mixed | 997.92 | 982.18 | 21.15 |

These range from 1.0% slower to 1.6% faster; there is no broad method
improvement from array-construction hints. The large gap to Node remains.
[Members](array-construction-release-members-2026-09-09.json),
[floats](array-construction-release-floats-2026-09-09.json),
[methods](array-construction-release-methods-2026-09-09.json).

All ten owner checksums also match in five rotating rounds with the same
settings. Median changes range from 2.7% faster to 0.3% slower; nine are
within 1.5%. Table sets 1/5 are 215.55 -> 212.59 and 218.96 -> 212.95 ns,
but sets 2/19 remain 967.13/984.04 ns. Class sets 1/5/257 remain
1153.97/1081.16/1122.64 ns. Node is 8.33-9.07 ns across these ten cases.
The large owner-set/receiver cliffs remain unresolved, and these small
changes do not demonstrate broader gains from the hint mechanism.
[All owner samples](array-construction-release-owners-2026-09-09.json).

## Float regression profile and next action

After every timing process finished, both frozen executables were profiled
on the unchanged array_float_kernel, three calls of 120 million iterations
after its normal correctness run. Every call returns 240,000,000. CPU 4,
cycles:u/499 Hz, DWARF/8192, no concurrent SQGI builds/tests/timings:

- Predecessor: 1,262 samples, none lost, mostly generated loop-region code.
- Candidate: 1,731 samples, none lost, approximately 7.68 billion cycles;
  9.44% self time in scalar_get_can_elide, with most remaining samples in
  generated whole-function code.

Files: `/tmp/sqgi-array-construction-float-{baseline,candidate}.data`,
corresponding `.log` and `-flat.log`; driver
`/tmp/sqgi-array-construction-float-profile.nut`.

A separate debugger run disassembles the constructed float reduction around
its scalar GET. It confirms signed bounds and element-tag checks, followed
by a helper call solely to test destination/VM-temporary ownership. The sum
update also reloads the physical destination tag, constructs a reference mask,
and conditionally branches around the checked stack write. Diagnostic and
disassembly: `/tmp/sqgi-array-construction-float-diagnostic.{nut,gdb}` and
`/tmp/sqgi-array-construction-float-disassembly.log`.

The next coherent optimization is cheaper general lowering of these scalar
ownership predicates: inline their exact checks and assess the redundant
mask/test instruction sequences. It must preserve the active-VM null case
for raw native callers and the actual destination/temporary reference tags;
it must not assume a scalar result implies scalar prior contents. This
applies to typed GETs and scalar writes generally, not just constructed
arrays. The profile does not claim eliminating the helper's 9.44% self cost
alone will recover the full 37.6% regression. No such revision is implemented
in the measured snapshot or current source yet.

All timing and profiling jobs for this snapshot have finished. Acceptance
remains blocked by the measured float regression, unresolved broad-series
performance gaps, and the existing ownership/coverage issues—not by a lack
of permission or an external dependency. The iterative goal remains active.

### Host-contention caveat discovered after profiling

A read-only process check found another project's sanitizer CTest started
at 08:16:51 local time, with a child consuming approximately one CPU during
the float profiles. That process is outside this task and was not stopped.
It overlaps the later method/owner measurements and both float profiles.
Their raw data are retained, but small timing differences and profile shares
must be treated as potentially contended and confirmed under quieter
conditions. No particular regression is attributed to that activity without
evidence. Both five-pair kernel comparisons and the application comparison
finished before this CTest started; the float-array regression is already
present in those earlier kernel runs. At that check, the source delta still matched
the frozen patch hash above. Future timing runs should record start/end
timestamps and host load explicitly to make this kind of overlap auditable.
