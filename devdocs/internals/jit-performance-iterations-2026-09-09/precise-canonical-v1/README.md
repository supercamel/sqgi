# Experimental canonical-slot side exits

This is an opt-in development tier, enabled with `SQGI_JIT_PRECISE_EXITS=1`.
It is not yet a retained performance improvement or a completed performance goal.
The previous retained comparison remains `aarch64-guards-v1`.

The AArch64 compiler accepts bounded whole functions containing existing-slot
SET operations, supported scalar arithmetic, literal loads, moves, GETs and
branches. It excludes allocation, calls, structural mutation, captured outers
and other unsupported bytecodes. Existing scalar replacement and pure numeric
compilation remain available. Eligibility never examines workload names.

Native branches connect bytecodes; a checked helper currently performs each
non-branch operation. All values stay in canonical VM slots. No raw reference
survives across an instruction and every failed helper leaves that instruction's
incoming state intact. Completed stores are preserved. An empty registered log
supplies ancestor-pin accounting for release guards, but this tier never records
stack snapshots, heap undo entries or intermediate lifetime pins.

A new native status carries the source bytecode IP as an integer result. The
runtime validates the IP, artifact flag and real frame identity before resuming.
Malformed continuations raise an error instead of replaying effects. Frameless
VM calls and AArch64 native closure/constructor helpers reject these artifacts
before entry. Object-plan bodies cannot use source-bytecode continuations.
Counters distinguish native returns, entry-guard replay and precise side exits.

GET preserves read, temporary release, and destination swap order. JCMP models
its temporary write too. SET checks its existing destination before mutation;
reference-owning assignment-result destinations initially exit. DLOAD checks
both aliases' combined drops, excluding ancestor journal pins. Other owning
multi-destination operations outside these proofs exit or remain unsupported.

A new generated-code witness exposed a second issue: immediately entering the
old loop compiler after a side exit could skip JCMP's observable temporary
release. The saved `sqgi-precise-loop-test.log` is the failing witness. Functions
using the experimental tier now keep their fallback in the interpreter; legacy
loop code cannot take over this continuation until it supports the same effect
contract. Performance claims must come from successful native execution, not
this exclusion of unsafe transitions.

Validation of the final prototype:

- 100/100 selected AArch64 Release and 100/100 strict-ASan/UBSan tests pass,
  excluding `sqgi_test_sqgipkg`. The new test explicitly enables the tier for
  its generated-code cases; existing tests retain their default settings.
- All 41 independent holdout components match JIT-off/on in Release and strict
  sanitizers with the experimental tier enabled, 20,003 iterations, one warmup,
  seed 83. Sanitizer holdouts enable leak and stack-use-after-return detection.
- Generated code succeeds during warmup and takes real side exits for a late
  string-add fallback, GET-to-JCMP temporary release, a loop-header temporary
  release, and an atomic two-alias DLOAD release. Earlier stores occur once.
- Independent injected-entry tests cover root/ordinary/tail calls, nested VMs,
  restored active-VM scope, frameless rejection, debug hooks, unchanged-entry
  guards, malformed IPs/tags, and incorrectly flagged/lowered artifacts. These
  establish the runtime ABI separately from generated-code coverage.
- x64/QEMU passes six of seven selected executables, including the new dispatch
  contract, existing contracts and shared write-log tests. Member-plan retains
  exactly 27 known ordering and five assignment-result coverage failures.

The frozen ordinary Release executable is
`build-jit-audit-20260909/precise-canonical-v1/sqgi`, SHA-256
`c5b8a827151485274a42630f2513c479e913ada76ed1ddaed6200ca0cf007377`.
`prototype.patch` is relative to the previous retained worktree, including its
uncommitted changes. No benchmark algorithm or workload count was edited.

Five rotating rounds against the retained build yield **1.0515× owner speedup**,
with component speedups 0.9655–1.1238×. Class cases improve more than table
cases. Five kernel pairs improve dynamic_member from 1.438338 to 1.075844 µs
(1.337×); other kernel differences are small, with no component over 5% slower.
All 15 kernel checksums also match a separate unchanged JIT-off reference.
These are intermediate comparisons, not a full 56-component acceptance result.

Fresh owner sampling records zero lost samples. Snapshot recording and retained
value lookup disappear below the 0.5% reporting cutoff. Remaining self shares
are 52.88% precise_step, 17.30% CanRelease, 12.75% precise_member and 8.67%
sqjit_context. The diagnostic owner run records 70 native returns, zero entry
guard failures and **zero side exits**. Thus this result is not an interpreter
fallback speedup. The next measured candidate inlines scalar arithmetic and
stores and hoists the repeated active-VM lookup, keeping the same before-effect
fallback contract.
