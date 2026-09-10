# Experimental scalar instructions with precise exits

This extends the [first canonical-slot prototype](../precise-canonical-v1/README.md).
It remains disabled by default; use `SQGI_JIT_PRECISE_EXITS=1` to evaluate it.
The existing retained 56-component result is unchanged pending promotion gates.

The compiler emits scalar literal loads, non-owning moves, integer addition,
subtraction, multiplication, division/remainder and local increments directly.
Every type/ownership/divisor guard precedes the first VM write and branches to
the same bytecode's checked helper. Floating and mixed arithmetic still use that
helper. The active VM is loaded once into callee-saved x22; this is valid because
the accepted instruction subset cannot call user code or relocate its VM stack.

Five rotating owner rounds, CPU 4, 200,000 iterations, five warmups, compare the
retained build, canonical prototype, scalar prototype and Node. All checksums
match an independent JIT-off reference. Timing does not overlap builds, tests,
profiling or debugger capture.

| Comparison | Owner geometric-mean speedup | Component speedup range |
| --- | ---: | ---: |
| Scalar / retained guards build | **1.3459×** | 1.2578–1.4375× |
| Scalar / canonical prototype | **1.2837×** | 1.2747–1.2918× |

All ten owner cases improve. Table cases take roughly 580–583 ns per iteration;
class cases take roughly 610–612 ns. These are suite-level development results,
not a full-mix or interpreter-profitability claim.

Five independent kernel pairs against the retained build improve dynamic_member
from 1.434800 to 1.024800 µs (**1.4001×**). Array append improves 1.0535× in this
batch. Other cases remain close; intrinsic math is 3.98% slower and floating
call 2.82% slower. No component exceeds a 5% slowdown. All 15 components match
the unchanged independent interpreter reference, including iteration counts.

Fresh owner profiling uses 200,000 iterations, five warmups, CPU 4, 499 Hz
cycles:u and DWARF/8192 stacks, with zero lost samples. Remaining self shares:

| Function | Self share |
| --- | ---: |
| precise_step | 51.08% |
| CanRelease | 20.79% |
| precise_member | 15.24% |
| SQVM::ARITH_OP | 2.09% |

RecordStackSlot, RetainValue and repeated sqjit_context lookup are below the
0.5% reporting cutoff. The separate diagnostic run at 20,003 iterations records
**70 native returns, zero entry-guard failures and zero side exits**. GDB also
captures the generated recycle frame, including integer SDIV instructions, and
exits normally. Debugger timings are excluded from benchmark results.

Validation:

- 100/100 selected default-configuration Release tests and 100/100 strict
  ASan/UBSan tests pass, excluding `sqgi_test_sqgipkg`.
- The new side-exit test explicitly enables the experimental compiler, including
  generated late exits, temporary-release and two-owner DLOAD witnesses,
  integer boundary/divisor cases, mixed floating operands and zero-division
  continuation after a committed store.
- All 41 holdout components match JIT-off/on with the experiment enabled in both
  Release and strict sanitizers, at 20,003 iterations, one warmup and seed 83.
  Sanitizer holdouts enable leak and stack-use-after-return detection.
- The previous shared x64/QEMU validation remains six of seven passing, with
  the existing 27 ordering and five native assignment-result coverage failures.
  This scalar extension changes only AArch64 code and AArch64-specific tests.

**Promotion requires resolving the enabled native-route failures.**
An additional member-plan run with the experiment enabled reports 29 failing
assertions. It combines old raw/frameless and rollback assumptions with genuine
missing native root-store and reference-result coverage. The complete log is
saved; these failures have not been suppressed or relabeled as passes. Existing
public-script checks and targeted generated-code witnesses do not substitute
for resolving this broader native-route matrix. See the
[remaining work](../precise-next-steps.md).

The frozen ordinary Release binary is
`build-jit-audit-20260909/precise-scalar-v2/sqgi`, SHA-256
`ce83aa6984bac4e93c8c553e7f7fa63ca2478bb1ada7ff71baf6c7b9f330e419`.
`prototype.patch` is the complete experimental delta relative to the prior
retained worktree; `scalar-runtime-delta.patch` isolates the AArch64 runtime
extension over canonical-v1. Benchmarks are unchanged. Full 56-component timing,
both application seeds at acceptance counts, varied-warmup replication, final
native-route/lifetime gates and matched fresh PGO/LTO remain outstanding.
