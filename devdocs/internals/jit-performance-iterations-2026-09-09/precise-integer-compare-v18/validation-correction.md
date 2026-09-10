# Correction to the targeted AArch64 validation claims through V17

During V18's debugger inspection, the new comparison test made zero helper
calls despite exercising final and mixed operands. Inspection found that
SQJIT_CPU_AARCH64 is not defined anywhere in the repository or build commands.
Nine generated-code test groups in test_sqjit_side_exit.cpp (including the new
V18 group) and the loop adaptation/lifetime contracts used that nonexistent
macro. They compiled to empty bodies. The older generated_exits group used the
real SQJIT_HAS_EXTERNAL_NATIVE guard and did execute.

Earlier reports through V17 credited the skipped lifetime, alias, weak, cache,
large-function and loop-contract witnesses as passing validation. Those specific
claims are withdrawn. The selected-test counts accurately described successful
executables but did not establish execution of these guarded bodies. Historical
logs, frozen binaries and hashes are preserved rather than rewritten. CLI
benchmark timings, independent script holdouts and debugger route/capture
measurements are separate evidence and are not invalidated by this test guard.

V18 replaces the nonexistent guard with SQJIT_HAS_EXTERNAL_NATIVE. It adds an
independent host-architecture check requiring all ten generated-code groups and
the loop contracts to run. Detailed CTest output is retained for every Release
and strict-sanitizer configuration, including their activation markers.

Activating the witnesses exposed these distinct issues:

* The frontend already assigned comparison GET directly to its destination;
  the new fixture only recognized a GET/MOVE pair. It now accepts either valid
  shape. RETURN reuses the VM temporary, so its comparison boolean is observed
  at the actual RETURN helper entry by GDB, before the return path changes it.
  All signed-boundary, branch-result and ownership checks remain in C++.
* Parameter literal assignments were separate LOADs, not DLOAD. The two tests
  now explicitly construct valid DLOAD bytecode before compilation, retaining
  both second-destination mutation and repeated-destination precedence checks.
* In the int64/double configuration, float constants use literal LOAD, because
  LOADFLOAT has only 32 payload bits. The copy witness follows the actual opcode
  for the selected numeric representation and retains its lifetime checks.
* Method replacement on a class requires the new-slot operation. Correcting
  that fixture also exposed a real bug: a newly allocated closure at the old
  address could authorize stale inlined code. V18 adds retained weak lifetime
  guards to closure specialization, without keeping the original method alive.
* The eight-exit and 70-member-site functions could not fit any previous tier
  within 8 KiB. A compact final fallback shares helper argument setup and keeps
  native control flow, checked opcode semantics and exact exits. The original
  functions, coverage assertions and 8 KiB limit remain intact.
* The purported dead weak input to cached_kind still had a sole array owner in
  the caller's VM temporary. Its first GET correctly exited to release that
  owner. The fixture now clears that caller temporary and verifies weak death
  before calling the function. The four native successes/no-exit assertion
  and all dedicated final-release witnesses remain.

Initial skipped runs and failing activated runs are retained. They are not
counted as successful V18 validation. All four current 100-test gates and both 41-holdout runs pass with activation
evidence. The final native captures and performance measurements are reported
in README.md; accepted timing began only after the corrected full gates.
