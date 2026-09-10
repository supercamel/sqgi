# Next experiment: precise equality and default-length fallback tier

Local-source findings while V23 timing is active; no runtime implementation yet.
V22 buffers_7/buffers_31 were ~432 ns versus Node ~12.4 ns. rotate_buffers
(test/bench_member_workloads.nut:45) has SET, conditional equality, PREPCALLK/CALL
for caption.len(), and no allocation in the function. The current precise compiler
rejects EQ/NE/PREPCALLK/CALL; the private compiler does not execute this workload
natively. Object-member-write additionally has allocation in its prologue, so this
whole-function experiment alone will not solve that case.

SQVM::IsEqual (sqvm.cpp:749) compares identities/scalars/strings and does not invoke
metamethods. EQ/NE must honor COND_LITERAL operands, float NaN and signed zero,
numeric coercion, string content equality and destination release semantics.

SQVM::_OP_CALL has an existing nargs==1, sq_nativeclosure_is_default_len shortcut
(sqvm.cpp:926), reading array/table/string size directly. It creates no call frame,
clears no arguments and writes the result only when present. A precise helper can
match this exact shortcut with a fresh scalar result and the existing authoritative
release check. Other closures/types must side-exit before CALL effects.

PREPCALLK must reproduce the VM's exact sequence, not merely bind a callee:
- Array special len-key path: receiver assignment, then TARGET assignment from
  shared-state array_len_closure; temp_reg is untouched.
- Normal path (start with immutable string receiver/default delegate): resolve
  borrowed raw default-delegate slot, including weak dereference; check all releases
  before adding helper-local pins; assign method to temp_reg, assign receiver, swap
  TARGET/temp_reg. Combined drops of aliased old temp/receiver need a conservative
  combined logical-release census. All alias orders must match actual VM bytecode.
- Literal 'len' may establish compile-time CALL provenance, but actual native closure
  identity/classifier and receiver type remain runtime guards. Never specialize on
  workload/function names. Mutable delegate replacement must take an exact exit.

Avoid hijacking successful private-compiler routes: keep the existing strict
precise tier first, then try the existing compiler, then this expanded precise
shape only after a non-resource compilation refusal. Require all CALL sites to be
proven adjacent PREPCALLK len/nargs1 candidates, not arbitrary calls. No accepted
helper may allocate, reenter, structurally mutate containers or relocate the VM
stack. This preserves the activation-local member-cache proof.

Tests should prove real native coverage for an independent mutating loop with
conditional strings/default length, plus exact exits on delegate override, wrong
receiver/callee, owning final destination, combined aliases, ancestor logs, weak
observers, and result-discarding/receiver-result aliases. Compare interpreter
semantics and callbacks; cover NaNs, signed zero, string contents and literal EQ.
Retain exact side-exit IP and no prefix replay. Add native-route observer assertions.

After sealing V23, implement a bounded candidate, run Release/native contracts and
an initial unchanged member-suite pilot. If useful, perform the full original
correctness/holdout/rotating/seed/warmup/profile gates. Broader canonical loop entry
is a later architectural step, not permission to enable legacy private-spill
loops for precise continuations. Method outer-loop script calls remain a separate
larger gap; this change does not satisfy the full performance goal by itself.

Additional method finding: each precise activation initializes its own member
caches, so first accesses still use the checked helper. The interpreter uses
SQMemberCache across calls; its table path stores only an integer slot hint and
checks current bounds/key type/key bits on every access (sqmembercache.h and
SQTable::GetCachedSlot). A future native cold-access table hint can use that same
receiver-independent contract without retaining a table or trusting a layout
version. SQTable already exports RawNodesOffset, RawNodeCountOffset, RawNodeSize,
RawNodeKeyOffset and RawNodeValueOffset. Equal-but-nonidentical string keys must
miss to normal content lookup. Rehash/delete/reinsert, mixed receivers, weak slot
values, combined drops and ancestor journals remain required tests. Do not reuse
an unguarded raw pointer across activations or add strong class pins casually.

A test addition is staged at `/tmp/sqgi-precise-intrinsic-tests-draft.cpp`, NOT
applied/built. It covers real native looping/equality, delegate override and
CALL-result final/nonfinal/MARK/ancestor ownership. Its explicit TODO still needs
PREPCALL combined-temp/receiver cases, array-special publication, discarded results,
wrong receivers/callees, direct aliases and allocation-failure tests before use.
The compiler draft catches optional expanded-tier std::bad_alloc, discards its
unpublished mapping and returns a retryable resource failure. Existing routes stay
first. Actual bytecode/rejection captures must confirm this route reaches the slow
functions before applying the candidate. No performance result exists for it yet.

V23 post-measurement GDB now confirms rotate_buffers has 53 instructions / 12
slots, EQ at13 and adjacent PREPCALLK len/CALL at25/26. Actual whole-proto
rejection is "unsupported CALL array len" at26; loop rejection is "unsupported
loop branch shape" at14. Thus the proposed fallback can reach the rejected
function without replacing a successful existing compiler route. See the V23
coverage-gaps artifact. This is route evidence, not an implementation/timing result.
