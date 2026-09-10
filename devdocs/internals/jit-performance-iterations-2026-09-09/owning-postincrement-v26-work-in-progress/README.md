# V26 owning post-increment — work in progress

The two-file draft has been applied to the production worktree. The first build,
all thirteen generated-code groups and the 100-test release-enabled suite pass.
The release executable SHA256 is
`80926f469e88e85b0311f03ad81e570b75bb4d7fd4222feb402380f96e970855`.
Other release/sanitizer/holdout/cross-backend gates and full56 acceptance remain.
V25 remains the latest accepted performance version (1.825291247x audit).

The precise PINCL fast path checks an integer source and preflights its old
result owner before either bytecode write. An owning result requires no active
ancestor journal and a mark-masked reference count greater than one; otherwise
the existing checked helper handles the opcode. The fast path decrements only
a proven surviving owner, then writes the old scalar and incremented source in
VM order. Overlapping result/source slots leave the incremented value. Every
failure branch reaches the helper before either native write executes.

The new native test group compares representable numeric inputs with the
interpreter, including final/nonfinal old userdata, marks, two ancestor logs
with and without a real survivor, a VM-temporary alias, callbacks and weak death.
Raw canonical calls verify the exact exit IP, neither write preceding a failed
check, overlapping operands and integer wrap against an unsigned oracle. The
interpreter's signed C++ overflow is not used as an oracle for native word wrap.

The [probe verification](probes/verification.json) confirms 20 native recycle
invocations and 380 loop iterations: PINCL helper calls fall from 380 to zero.
The owner function grows from 7296 to 7344 bytes. All 80 initial code-size
functions execute correctly, but their coarse spacing did not prove the desired
same-tier fallback. An additional 32 legal diagnostic bytecode fixtures add
four-byte jumps in unused-local positions; twelve cases prove that exceeding
8192 bytes with the richer code preserves the original layout at the SAME tier.
All 112 diagnostic functions execute natively. Accepted benchmark sources are
unchanged. Debugger/profiler addresses are never joined across processes.

Allocation probes pass reference, strict, expanded, and new PINCL installation
failure cases. The PINCL probe observes exactly one failed mprotect and one
later successful install: its first attempt is retryable with no native entry,
and its second runs natively. A resource failure never retries the old layout
within that failed attempt. Only buffer exhaustion may select another layout.

The initial GDB symbol probe failed because GDB omits the default false template
argument from this symbol; the corrected probe and failed log are retained.
The initial coarse budget-verifier failure is also retained. These are diagnostic
harness failures, not accepted performance or correctness results.

All four five-round owner/member pilots have completed. Both warmup histories
and identical-binary repeats agree: owner geometric runtime is 0.869–0.870 of
V25 (about 13% less time), while member runtime is 0.997–1.003. No pilot case
regresses by more than 5%. Raw results and a checked summary are in pilot/.
The pilot process is confirmed terminal; remaining correctness gates are now
running. The full goal, method JIT-off regression, known x64 defects and matched
PGO/LTO remain open.

V26 is now accepted. The completed immutable evidence lives in the sibling
owning-postincrement-v26 directory; this work-in-progress directory preserves
the preliminary drafts, diagnostics and pilot history.
