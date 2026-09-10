# V24 development snapshot — not an accepted benchmark result

V23 remains the latest accepted timing result. No V24 performance timings have
been accepted. This directory preserves ongoing correctness work, including
failed experiments; it does not establish completion of the performance goal.

The expanded precise fallback supports equality and the VM's default string/array
length shortcut. It runs after the existing compiler rejects a function, with
precise exits enabled. The original rotate_buffers benchmark enters this tier;
the diagnostic route smoke is not a timing measurement.

Expanded ownership tests exposed an older private-compiler defect. A PREPCALLK
receiver overwriting a parameter remained only a private alias, leaving the old
VM-slot owner alive. With the VM temporary aliasing the same userdata, a later
GET observed the release callback too late: native returned 3, interpreter 4.
The unchanged pre-fix witness reproduces against frozen V23. Both references
release once; the difference is observable callback ordering.

Private PREPCALL and PREPCALLK now publish their receiver through the existing
journal. Observable final releases guard out with rollback; actual surviving
owners remain native. Unconditional publication initially lost three native
math-route assertions by increasing the required live VM stack. The subsequent
optimization elides ignored built-in receivers only in a proved straight-line
argument region, when dead after CALL and dynamically non-refcounted. A raw
whole-function witness covers non-owning success, owning rejection, rollback,
marks, weak death, and ancestor journals. Existing native assertions are retained.

A further callee-destination alias exposed the same delayed-release result
mismatch after the receiver-only pilot passed its gates. That superseded pilot
is retained separately. The current revision publishes both values for private
array-length preparation, preserving the VM's distinct cached-key and ordinary
delegate paths. It also publishes lowered intrinsic CALL results through the
scalar result barrier. New matrix cases cover callee and result aliases as well
as the receiver, with successful native execution required for real survivors.

The expanded precise fixture includes a later known-string length operation to
select that tier. Its critical first PREPCALL covers strings and arrays, a sole
old owner, an alias in the VM temporary, a real surviving owner, a marked owner,
and two ancestor journals. Tests also cover exact CALL-result publication,
delegate replacement, dead/live weak methods, wrong receivers, discarded results,
literal equality, NaN, and signed zero.

Executable-install failure is distinguished from unsupported bytecode in both
precise entry attempts. Fault probes show exactly one failed installation, no
installed entry, a retryable resource result, interpreter execution with one
prefix effect, and a successful native retry. A targeted std::bad_alloc at the
expanded compiler entry likewise falls back and retries successfully. These are
fault-injection correctness probes, never benchmark runs.

The callee revision passes all four release/strict-sanitizer 100-test runs and
both 41-case holdout runs. x64 retains the same 32 known assertions. Earlier
unprefixed logs belong to the superseded receiver-only pilot; current gate logs
use the `sqgi-v24-callee-` prefix. The candidate is now frozen in
`../precise-length-v24`, with binary SHA256
`321747879be6301d431d9118a1bbfb138887e14e930e0d90e2f0ba6cfd1223f7`.
The unchanged five-round study, profitability measurements, and fresh profiles
are running sequentially. Fresh code captures, warmup/regression controls, and
final archival validation remain required before performance acceptance.

Development logs retain failed fixture-selection attempts and the temporarily
lost math coverage. Source snapshots cover the three changed files relative to
V23; all other 93 manifest files are unchanged. The V23 backup is checked against
all 96 frozen hashes before generating the patch. This is a development snapshot,
not a sealed accepted artifact.
