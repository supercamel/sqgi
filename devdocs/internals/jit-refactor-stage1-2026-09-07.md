# JIT refactor: first-stage implementation

Implemented steps 1–2 of the [architecture review](jit-architecture-review-2026-09-07.md):
make native routes observable, then separate the existing components and their
ownership. The runtime manager is now 544 lines, down from 6,658 in the audited
baseline. The x86 compiler remains a substantial 2,901-line driver; shared
analysis and lowering are subsequent work.

## Resulting boundaries

The [design document](squirrel-bytecode-jit.md#high-level-architecture) lists the
modules. The key boundaries are:

- `sqjit.cpp` coordinates compilation and the three VM execution routes. It
  contains neither instruction encodings nor C++ specialization recognizers.
- `sqjit_policy.*` owns guard backoff and loop rejection policy.
  `sqjit_context.*` holds options and clocks per `SQSharedState`; diagnostic
  records and formatting live separately. Coroutines share their parent state.
- `sqjit_backend_x64_emit.*` generates bytes and handles ABI details;
  `sqjit_backend_x64_helpers.*` performs checked runtime operations and logged
  writes. The compiler calls these through explicit interfaces.
- `SQJitCompileResult` carries success, backend, rejection category, instruction
  position, static reason text and retryability. Each compilation attempt owns
  its failure details; AArch64 no longer uses a global transient-reject flag.
- `SQJitProto` owns typed function metadata and loop code. Noncopyable
  `SQJitCode` owns an RW-to-RX mapping or borrows a C++ stub. Destruction releases
  mappings once. Failed installation preserves the previous artifact, and size
  overflow is rejected before allocating or copying.
- `sqgi-runtime-config` propagates `SQ_ENABLE_JIT` to SQGI runtime consumers,
  including the checker and native tests. The independent bundled Squirrel
  library retains its interpreter-only layout.

The native ABI remains unchanged: object-return and loop-continuation entries
return their existing status values. Guard failure rolls back native writes
before interpreter replay. This stage does not introduce a common IR or change
opcode lowering algorithms.

Environment settings are captured on a shared state's first JIT use. Statistics
are emitted when that state closes, replacing the process-global exit report.
Diagnostics allocate only when enabled and retain the existing fixed limits
(256 function, loop and rejection-site records; 96 reasons). Destroyed prototypes
lose their pointer identity in diagnostics, preventing address reuse from
conflating two functions. Copied names remain available for reporting.

## Tests and correctness changes

`test_sqjit_contracts.cpp` uses `sqjit_observe_proto` snapshots to require:

- generated code executes through frame and direct-call routes;
- repeated writes followed by a late guard failure roll back before replay;
- a loop region both executes natively and falls back after a guard failure;
- C++ specializations are distinguished from generated code;
- unsupported opcodes report a permanent rejection and install no artifact;
- debug hooks suspend native execution, and repeated guard failures enter backoff;
- simultaneous VMs isolate options, counters and backoff; coroutines share state;
- closing one VM preserves another, and a new VM starts with clean diagnostics;
- executable-code ownership survives failed installation and transitions to a stub.

The tests exposed missing x86 rejection details during extraction. They also
cover missing output artifacts and out-of-range loop ends, now rejected before
compilation on both backends. These input-bound checks and mapping-size overflow
checks are the small correctness changes accompanying the structural refactor.

The x86 encoder test checks immediates, branches, relocation capacity, spills,
argument registers and helper calls. It also builds with the Win64 ABI selected,
checking nonvolatile registers, shadow space and alignment. The existing
AArch64 encoder test now runs on non-AArch64 hosts.

## Validation

On Linux x86_64, GCC 13.3, Intel Core i7-12700:

| Configuration/check | Result |
| --- | --- |
| Release, JIT enabled | 79/79 tests passed, including all 14 JIT tests |
| Debug, ASAN + UBSAN, JIT enabled | 79/79 tests passed |
| Debug, JIT disabled | 74/74 tests passed |
| Checker coverage gate | Passed: 100% adjusted checker-owned lines, functions and branches |
| Checker mutation gate | All five mutants killed |
| AArch64 compiler | Syntax check passed with AArch64 code enabled on the x86 host |
| Interpreter-only backend | Syntax check passed |

Each full suite excluded `sqgi_test_sqgipkg`: its external native-fixture download
had an HTTP 404 during the earlier audit. Native AArch64 and Windows execution
were not available here; encoder and syntax checks do not replace those runs.

The correctness workload preserves the baseline compilation counts: functions
91 attempts / 34 successes / 57 failures; loops 31 / 5 / 26. Diagnostics now report
all 83 failures (57 opcode, 26 other), versus zero recorded rejections in the
baseline. Some operand-combination failures still have generic `other` reasons;
more detailed shared analysis belongs to step 3.

## Performance

Five-run medians, 8,000 iterations, hotness threshold 1, using the repository's
median runner. Times are microseconds per iteration; speedup is interpreter/JIT.

| Workload | Before JIT time | After JIT time | Before speedup | After speedup |
| --- | ---: | ---: | ---: | ---: |
| numeric_loop | 0.010244 | 0.009937 | 3.310x | 3.302x |
| direct_call | 0.034913 | 0.035325 | 1.817x | 1.774x |
| array_append | 0.036500 | 0.033375 | 1.688x | 1.730x |
| array_write | 0.039000 | 0.039000 | 0.776x | 0.772x |
| dynamic_key_get_set | 0.064750 | 0.061875 | 0.965x | 0.929x |
| dynamic_member | 0.259125 | 0.263750 | 0.997x | 1.035x |
| math_intrinsic | 0.279500 | 0.272500 | 1.010x | 0.991x |
| matrix | 0.432625 | 0.397625 | 0.995x | 1.036x |
| vector | 2.737000 | 2.666875 | 1.001x | 0.990x |
| object_member_write_fallback | 0.184375 | 0.181125 | 0.999x | 0.986x |

The main numeric-loop, direct-call and append wins remain. Direct-call JIT time
increased about 1.2%; these short local measurements do not establish whether
that small difference is systematic. Array-write remains slower than the
interpreter and was not tuned in this stage. The harness permits fallback;
route assertions, rather than timing parity, establish native execution.

Reproduction:

```sh
cmake -S . -B /tmp/sqgi-jit-release -G Ninja -DCMAKE_BUILD_TYPE=Release -DSQ_ENABLE_JIT=ON
cmake --build /tmp/sqgi-jit-release -j 4
ctest --test-dir /tmp/sqgi-jit-release -E '^sqgi_test_sqgipkg$' --output-on-failure
python3 tools/run_jit_median_benchmarks.py --sqgi /tmp/sqgi-jit-release/sqgi --runs 5 8000
python3 tools/run_jit_reject_summary.py --sqgi /tmp/sqgi-jit-release/sqgi --threshold 1 test/test_jit_correctness.nut
```

Session evidence is in `/tmp/sqgi-jit-refactor-*.log`. The pre-refactor source
snapshot, including the earlier audit fixes, is under
`/tmp/sqgi-jit-refactor-20260907/baseline/`. Existing working-tree changes were
preserved throughout the refactor.

## Remaining work

Review these boundaries before starting step 3. Operand/flow analysis, slot and
ownership invariants, write-log semantics and function/loop lowering still have
backend-specific implementations. The large AArch64 fragments and x86 drivers
remain the main maintainability issue. Steps 3–5 address that duplication,
incremental shared lowering, and evidence-based pruning. This first stage
provides the ownership and execution checks needed to make those changes safer.
