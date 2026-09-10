# Native release effects and logical ownership, 2026-09-09

Follow-up: [canonical VM slots and scalar elision](logical-slots-2026-09-09.md)
fix the reproduced AArch64 stack cases and recover exchange coverage. That
prototype remains incomplete and unaccepted; the results below describe the
earlier heap-barrier-only revision, not the current worktree.

Status: **uncommitted, unaccepted, no new performance claim**. The partial
heap-release barrier follows [scoped native VM stores](active-vm-stores-2026-09-09.md).
It fixes the eight reproduced heap-store ordering failures, but twelve new
stack-ordering cases fail on both AArch64 and x64. Native reference exchange
also loses coverage. Neither checksum agreement nor sanitizer silence proves
the required language semantics.

## Partial heap barrier

Before replacing a member or array element, the shared journal checks whether
the displaced object has another program owner. It subtracts every journal
reference, including target, key, displaced value, captured value and saved
stack input, from the object's physical refcount. Nested journals register in
the shared JIT context, so a child cannot mistake a parent's pins for program
owners. Refcount GC mark bits are excluded. Heap object layouts are unchanged.

Small logs scan their inline entries. Larger logs build a lazy borrowed-pointer
count index with checked allocation and append indexing. Allocation failure
rejects the store without mutating the destination. Unobserved string/weakref
leaf objects have no owned graph or callback; other final reference drops
currently require interpreter replay. This is deliberately conservative and
is not a complete logical-ownership model.

The instance-field helper now borrows the raw old slot instead of taking a
temporary strong reference that concealed a final release. x64 owning member
stores call the barrier even when the displaced owner was already cached.
The now-unreachable old owning fast-store emission has been removed; checked
scalar fast stores remain. A journal pin proves physical liveness, not that
postponing a destructor is unobservable.

Unit coverage exercises 73 distinct aliased owners, nested logs, array stores,
weakly observed leaves, allocation failure, and callback re-entry while inline
and heap journals are being destroyed. The latter checks both already-cleared
and not-yet-cleared pins. Cleared entries stay constructed and the journal
stays registered until all callbacks finish. The allocation-failure fixture
now supplies the actual raw old slot, as required by RecordMember's contract.

## New evidence: VM stack and temporary lifetimes

The new stack tests pass the only reference to a release-hook-bearing object
in the actual C API argument slot. No C++ owner or caller local masks the
release. Each case uses direct userdata, an array containing it, and a table
containing it. Warmups require native whole-function successes before testing
the changed argument type.

| Operation | Interpreter result | Native result | Cases |
| --- | ---: | ---: | ---: |
| Overwrite argument with scalar MOVE | 100 | 1 | 3 |
| Overwrite through scalar member GET | 100 | 1 | 3 |
| Overwrite through array-valued member GET | 100 | 1 | 3 |
| Overwrite two arguments aliasing the same owner | 100 | 1 | 3 |

The hook changes a root field from 0 to 99. Both routes eventually release
exactly once; the disagreement is when that release becomes visible. The
interpreter-only controls pass. The native-enabled cases fail identically in
ordinary AArch64 Release, strict ASan/UBSan and x64 under QEMU.

GET has an important extra constraint: SQVM::Execute loads through its shared
`temp_reg`, then swaps the destination with that temporary. The old destination
is not released at the GET itself. A subsequent getter captures the old root
value before clearing the temporary; the following getter sees the hook's
new value. The test returns `before * 1000 + after + 1`: correct timing is 100,
premature release would produce 99100, and the current delayed release gives 1.
Initial test assertions that assumed immediate release on GET were wrong;
they were corrected against interpreter behavior and the actual opcode code.
No interpreter behavior was changed to match native code.

The heap barrier cannot fix this: native scalar writes can leave stale owners
in VM slots, while reference-valued native locals can exist only as borrowed
pointers. The former hide logical releases; the latter cause false rejection
of valid exchanges. The journal alone cannot distinguish these states.

## Cross-backend diagnosis

The x64 focused build uses x86_64-linux-gnu-g++ and QEMU user mode with
`-L /usr/x86_64-linux-gnu`. It is a correctness check, not a performance run.
Write-log and memory tests pass. Member-plan has the twelve ordering failures
plus seven native-route assertions.

A separately built diagnostic copy replaces only CanRelease with unconditional
success. This deliberately unsafe ablation restores the exchange and parameter
store native-route assertions, while heap ordering failures return. Five
assignment-result assertions still fail. Those five therefore are not explained
by the release check alone; do not label all seven as new barrier regressions.
The x64 literal-store selector's dependence on hoisted member cells is a
separate coverage gap to investigate. AArch64 has the two exchange/parameter
route failures, not those five assignment-result failures.

Diagnostic source/build:
`/tmp/sqgi-release-barrier-ablation-20260909.b7p07d/`.
CanRelease-disabled source SHA-256:
`2ea9315cb8ff6a35ed05247ab23a37d88a3a80de961a6731204e60ab2cfd8986`.
Diagnostic test executable SHA-256:
`1f8bc2f8d90abb171aee5f5142d2feb31ef5e41c7896904138816e6fc4af7195`.
Log: `/tmp/sqgi-release-barrier-ablation-tests.log`. This executable is never
an accepted runtime or benchmark candidate.

## Validation and provenance

Ordinary AArch64 Release: **97/98 selected tests pass**; member-plan fails
the twelve stack-ordering and two native-route assertions. Existing exclusions
are sqgipkg and the root-owned Release installation artifact. Log:
`/tmp/sqgi-release-barrier-release-tests-v2.log`.

Strict-alignment ASan/UBSan: both full runs are **98/99**, with the same
member-plan failures and no sanitizer reports. Only sqgipkg is excluded;
installation passes. Log: `/tmp/sqgi-release-barrier-asan-tests.log`.
The final run includes the passing cleanup re-entry tests and is recorded at
`/tmp/sqgi-release-barrier-asan-final-tests.log`.

All **41** application/member/method/owner/float/root holdout components pass
sanitized JIT-on and JIT-off runs at 20,003 iterations, one warmup and seed 83.
Checksums are compared between modes (floating tolerance 1e-8 relative), with
expected output counts and explicit script/sanitizer error checks. Leak and
use-after-return detection are enabled without suppressions. These are only
correctness runs; their timings are not performance samples. Logs:
`/tmp/sqgi-release-barrier-asan-{application_workloads,member_workloads,member_methods,member_owners,float_workloads,root_workloads}-jit{0,1}.log`.

Final x64 logs:
`/tmp/sqgi-release-barrier-x64-final-{build,tests}.log`.

Frozen AArch64 executable and CMake cache:
`/tmp/sqgi-release-barrier-release-20260909.FG3Py6/`.
Native JIT ON, Release, int64/double, PGO/LTO OFF. Executable SHA-256:
`64163f7edde8d924a0aa14507f86fe2388a1e2420e5ae62d71f12a457295d6c1`.
Tracked source patch from `953b5b4e563c28b16b84312ac2a3686e47fa658c`:
`/tmp/sqgi-release-barrier-source-20260909.patch`, SHA-256
`74ca8daa6e0e2679ea6805739f9c4e44f1334261f2f3ddd78b6cb41b348728b7`.
It excludes untracked reports/benchmarks. Member-plan test SHA-256:
`a0a501f7a58099097ff5a08ea1c38d9b4e68d3ec3722c8d8affea680fc8e681d`;
write-log test SHA-256:
`233685a78138b6494ddd7356aee331f95be8b0432def852a10bfe43ef5a51663`.

## Next mechanism and acceptance requirements

Native lowering needs explicit logical ownership for VM registers and the VM
temporary, including copy, overwrite, getter swap, loop backedge and nested
call effects. Merely counting all retained values as live locals or clearing
all stale slots early is incorrect. Synchronizing reference slots must also
handle deferred aliases of an overwritten input and must not release operands
before an instruction consumes them.

At an observable release boundary, either guard before the effect and replay
an untouched transaction, or materialize exact state and resume the interpreter
at a precise continuation after committed work. Committing a prefix and then
replaying the original region duplicates effects. A child transaction's stack
entries cannot be merged blindly when they refer to a short-lived call frame.

Keep the native-route assertions as well as semantic comparisons. Recovering
exchange coverage is part of the task, not optional; the conservative heap
barrier is not a substitute for efficient logical owner tracking. After the
ownership mechanism is coherent, rerun broad rotating ordinary-build gates,
fresh profiles, and finally fresh PGO/LTO training plus independent holdouts.
The last measured optimized and ordinary candidates remain the ones documented
in the preceding reports. No new timing, PGO training, commit or push occurred
in this validation step. The full performance-parity goal remains active.
