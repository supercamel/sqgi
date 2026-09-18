# Commit plan for the expanded runtime work

Audit and implementation: 2026-09-18. This series was assembled and validated
on `feature/llvm-runtime`; see [validation and recorded exceptions](runtime-series-validation.md).

## Starting point

After fetching origin, `feature/typed-kernels` and its remote both point at
`045ead9` (Add typed runtime kernels with LLVM and native x64 backends). This is
one commit ahead of `origin/master` at `5d96066`; master has no divergent commits.
The packaging and earlier x64 correctness fixes are already on master.

Before this plan was added, the working tree had 32 modified tracked files and
148 untracked files, with nothing staged. The untracked inventory includes
roughly 1 MB of benchmark reports as well as substantial compiler, runtime,
application-driver and test code. A tracked-only diff understates the scope.

## Branch and preservation strategy

Continue the published kernel commit on a new branch named `feature/llvm-runtime`.
Keep the existing published kernel branch and its commit unchanged. The scope is
now typed kernels, automatic LLVM bytecode compilation and interpreter/runtime
performance, so the broader name reflects what reviewers will actually receive.
No force push or rewriting of the published kernel commit is needed.

Before reconstructing intermediate commits, capture the complete tracked diff
and intentional untracked files in a recoverable local snapshot, with a file
inventory/checksums. Reconstruct the series in an isolated worktree using that
snapshot as its source. Keep the original working tree intact during assembly.
At the end compare the reconstructed tree to the snapshot, accounting explicitly
for any documentation curation or fixes made during validation.

## Implemented commit series

Each feature commit includes its own build registration, tests and feature
reference documentation. Shared files require hunk-level reconstruction; staging
entire directories or all of CMakeLists.txt would create invalid intermediate
states.

| Order | Commit subject | Scope and dependencies |
|---|---|---|
| 1 | `feat(runtime): add a restricted native leaf call ABI` | Public SQLEAFFUNCTION APIs, native-closure storage/copying, sqapi helpers, VM leaf invocation and test_sqnativeleaf. Establish lifetime, scalar-result, debug-hook, environment and failure contracts before kernel callers use them. |
| 2 | `feat(kernels): expand typed modules and prepared calls` | Kernel parser/IR, LLVM and native backends, classes/methods, borrowed and local storage, dynamic extents, remainder/math, prepared bindings and scalar-call specialization. Include src/kernel/math.h, relevant inline descriptors, kernel reference tests, integration tests, demo/kernels fixtures and matching docs. Depends on 1. |
| 3 | `perf(interpreter): streamline dispatch and common operations` | sqdispatch.h, optional threaded dispatch, generic VM lookup/call/arithmetic fast paths, integer correctness fixes, dispatch/edge tests and interpreter-performance documentation. Exclude leaf invocation already in 1, LLVM hooks assigned below, and the final decimal formatter assigned to 6. |
| 4 | `feat(jit): add an LLVM bytecode backend and guarded lowering` | Shared LLVM discovery, backend selection, external code ownership, scalar inlining, local arrays/object graphs, numeric intrinsics, private dynamic arrays, class/method inlining and boxed loops. Include internal opcode facts, leaf-plan changes, math binding identity, VM integration and LLVM regression tests. Keep these interdependent passes together initially: the current backend directly references all of them. |
| 5 | `feat(experimental): retain explicit boxed Squirrel LLVM compilation` | src/sqgi_llvm.cpp, function-prototype lifetime fields, VM entry hook, kernel inline descriptors/registration, dedicated method/environment/region/scalar tests and experimental API docs. This is the alternative configuration currently enabled with LLVM kernels and SQ_ENABLE_JIT=OFF, not the automatic backend from 4. Keep its review and supported configuration explicit. |
| 6 | `perf(runtime): eliminate rejected-loop churn and integer formatting overhead` | Permanent rejection bitmap in JIT metadata/policy; direct decimal conversion in ToString/StringAppendInPlace; branch-heavy rejection/neighbor-loop regressions and signed-boundary/alias tests. These are the measured RouteTastic fixes. Depends on the previous runtime/compiler changes. |
| 7 | `bench: add kernel and application workloads with reproducible results` | Remaining demo/benchmarks/kernels programs, native benchmark targets, cross-runtime runners, RouteTastic drivers/ports, benchmark READMEs and selected raw evidence/reports. Preserve the distinction between synthetic hot-loop performance and real application performance. |

Commit 4 is the largest cohesive change. Splitting it further into a minimal
backend followed by optimization passes is possible, but requires deliberately
rebuilding earlier pipeline stages and splitting the large LLVM test file. Do
that only if the resulting stages are meaningful, independently passing states;
do not create a cosmetic history with missing symbols or disabled failing tests.

The explicit boxed compiler in 5 should remain a distinct commit even if retained
in this series. It can later be moved to a follow-up branch without entangling the
automatic LLVM backend. No experimental implementation should be silently dropped
while organizing history.

## Validation before accepting each commit

Use clean build directories for the applicable configurations. The recent
31-test runs validate the current LLVM/interpreter changes, not every kernel,
legacy emitter or explicit boxed-compiler configuration in this proposed series.

- Interpreter with JIT/kernels disabled, switch dispatch and threaded dispatch.
- Existing AUTO/native bytecode JIT, with LLVM not required.
- Typed kernels using NATIVE and LLVM backends; run language, integration,
  generated, guard-page, math, prepared-call and demo tests as applicable.
- LLVM bytecode JIT with kernels disabled and enabled; run JIT correctness,
  release/lifetime, side-exit, delegation and optimization tests.
- Explicit boxed LLVM configuration: LLVM kernels enabled, SQ_ENABLE_JIT=OFF;
  run its dedicated method/environment, inline, region and scalar tests.
- ASan/UBSan for touched lifetime-sensitive runtime/compiler paths.

Inspect compiler/platform guards rather than claiming untested Windows or
AArch64 support. Run those builds/tests where the required environment exists,
and record any platform validation that cannot be performed locally.

After the final tree is assembled, rerun applicable full correctness suites and
the original runtime and RouteTastic benchmark comparisons sequentially. Save
commands, configuration and binary/source identities. A mid-series commit needs
correctness validation; it does not need to repeat every expensive benchmark.

## Documentation and evidence

Put language/API docs with their implementation, and benchmark evidence with
its reproducible runner. Keep historical reports clearly dated and distinguish
before-fix results from current results. Include the current original-suite
rerun and RouteTastic before/after evidence; review redundant intermediate JSON
captures before adding them, and update links for any deliberate consolidation.
Keep the complete local snapshot regardless of what evidence is selected for Git.
No generated binaries, perf.data files, LLVM SDK files or external application
checkouts belong in the series.

The eventual PR should describe the final architecture and user-visible behavior:
optional LLVM ordinary-bytecode JIT, expanded typed kernels, guarded transitions,
and cheaper interpreter fallback. Its validation should report both synthetic
wins and the still-limited compilation coverage of arbitrary methods/callbacks.

The final benchmark/integration commit also registers the optional compiler APIs
with sqgicheck and updates corpus handling for external application drivers, as
required by the full-suite findings. See the validation report for exact scope.
