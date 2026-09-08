# Further bytecode and JIT optimization

Exploration of commit `31142ce` on Linux x86_64, GCC 13.3, Intel Core i7-12700.
This follows the [first architecture refactor](jit-refactor-stage1-2026-09-07.md).
The production changes are now described in the
[implementation report](bytecode-jit-implementation-2026-09-07.md).
Production runtime code was unchanged during the original investigation. The write-log
experiment below ran in a separate worktree and is **not suitable to merge**.

The strongest opportunities are safe bytecode simplification, cheaper rollback
logging, and increasing the fraction of hot loops that actually execute natively.
A newly reproduced boolean-tag error must be fixed first. Shared value and
control-flow analysis would support both correctness and these optimizations.

## 1. Correctness prerequisite: equality loses its boolean type on x86

On the current x86 backend, this function produces an integer when JIT compiled:

```squirrel
function eq(x) { return x == 1 }
local value = eq(1)
print(typeof value)
print(value == true)
```

Run it with `SQGI_JIT=0`, then with `SQGI_JIT=1 SQGI_JIT_THRESHOLD=1`.
The interpreter prints `booltrue`; the JIT prints `integerfalse`.
Both equality and inequality reproduce the wrong tag for true and false results.
This changes observable program behavior, despite ordinary truth tests passing.

In [the x86 compiler](../../Squirrel3/squirrel/jit/sqjit_backend_x64.cpp),
`emit_integer_equality` (line 833) marks the result as an integer (line 853).
Return materialization consequently uses the integer output helper (line 1413).
Loop equality lowering also marks its result as an integer. The x86 slot-kind
enum has no boolean alternative; AArch64 has one. The reproduced failure is the
whole-function return path; loop exits and stores need separate regression tests.

Add type-sensitive interpreter/native differential tests before optimizing this
path: `EQ` and `NE`, both outcomes, direct and frame returns, loop live-outs,
array/member stores, and subsequent comparisons and arithmetic. Tests must assert
that the intended native route ran. A boolean represented internally as 0/1 must
retain its Squirrel tag and must not silently acquire integer arithmetic behavior.

## 2. Bytecode simplification has substantial room to grow

[SQFuncState::AddInstruction](../../Squirrel3/squirrel/sqfuncstate.cpp) already
does useful peephole work: literal GET/PREPCALL, compare-and-branch fusion,
immediate array appends, move elimination/pairing, paired loads and tail calls.
`OptimizeBytecode` (line 670) mainly threads jump chains and conditionally removes
a trailing null return. There is no general constant propagation, reachability
analysis, dead-code elimination or loop-invariant analysis.

Dumping compiled prototypes confirmed these cases:

| Source | Current bytecode | Candidate improvement |
| --- | --- | --- |
| `return (2 + 3) * 4` | Seven instructions, including ADD, MUL and the trailing null return | Fold to a load of 20 and return; remove the trailer only when metadata permits |
| `local scale = 2 + 3; return x * scale` | ADD remains | Fold the literal expression; propagate its value |
| `if (false) { x = x + 999 }; return x + 1` | LOADBOOL, branch and unreachable addition remain | Prune the constant branch; this also removes the LOADBOOL that currently rejects x86 native compilation |
| `local unused = 2 * 3; return x + 1` | Dead multiplication remains | Remove proven pure, unused scalar work |
| `sum += (2 + 3) * i` in a loop | Recomputes the literal addition | Fold before JIT compilation |

Start with checked integer-literal folding and constant branches. Follow with
block-local propagation, then a control-flow fixed point when the simpler pass
is stable. LLVM's documented SCCP/DCE sequence is a useful reference for combining
constant values with reachable blocks; it does not establish a speedup for SQGI.
[LLVM pass documentation](https://llvm.org/docs/Passes.html#sccp-sparse-conditional-constant-propagation)

The optimizer needs an explicit semantic boundary:

- `x + 0` cannot become `x`: passing `"a"` currently returns `"a0"`.
  Reusing `(x * 7)` across two expressions can suppress a `_mul` metamethod call.
- Begin with integer operations whose results are representable and whose error
  behavior is unchanged. Defer overflow, division by zero, floating-point
  reassociation, NaNs and signed zero until their semantics have explicit tests.
- Squirrel treats numeric zero as false. Constant-branch evaluation must use its
  actual truth rules, including boolean tags, rather than importing another
  language's rules.
- A discarded destination may release an object. Dead-store removal needs
  ownership/effect information, not just proof that the new value is unused.
- Preserve traps, captured locals, CLOSE, error locations, line information and
  local-variable ranges. Instruction removal needs an old-to-new IP map.
- Decode instructions precisely: DMOVE performs sequential assignments, and
  POSTFOREACH has a different branch-offset convention from JMP.

Add an internal optimizer toggle for differential tests. Compare optimized and
unoptimized interpreter execution, then both JIT modes, including serialized
bytecode round trips and debug metadata. Bytecode-shape assertions alone will not
catch semantic regressions.

## 3. Measure native coverage, not just compilation or wall time

Five-run medians with the existing correctness benchmark, 80,000 iterations,
hotness threshold 1. Times are microseconds per benchmark iteration; speedup is
interpreter time divided by JIT-enabled time. These are local measurements,
without confidence intervals or a claim that differences near 1x are significant.

| Workload | Interpreter | JIT enabled | Speedup |
| --- | ---: | ---: | ---: |
| numeric_loop | 0.032436 | 0.010188 | 3.184x |
| direct_call | 0.061416 | 0.035661 | 1.722x |
| array_append | 0.060400 | 0.036713 | 1.645x |
| array_write | 0.029825 | 0.050563 | 0.590x |
| dynamic_key_get_set | 0.059813 | 0.062500 | 0.957x |
| dynamic_member | 0.255500 | 0.260938 | 0.979x |
| math_intrinsic | 0.279825 | 0.276713 | 1.011x |
| matrix | 0.417300 | 0.409650 | 1.019x |
| vector | 2.664037 | 2.749388 | 0.969x |
| object_member_write_fallback | 0.185687 | 0.185175 | 1.003x |

A separate route-observation run at 8,000 iterations explains important limits:

| Workload | Observed native execution on x86 |
| --- | --- |
| numeric_loop, array_write | Whole functions execute natively |
| direct_call | `scalar_step` executes natively; the caller loop rejects PREPCALLK |
| array_append | Append loop rejects PREPCALLK; the later summing loop executes natively |
| math_intrinsic | Whole function and loop reject PREPCALLK; the kernel does not execute natively |
| dynamic_key_get_set | Loop compiles, but all 56 observed entries guard-fail; zero successes |
| matrix | Whole function rejects float APPENDARRAY; loop rejects an operand combination |
| vector, dynamic_member | Main kernels fail compilation; some small C++ specializations can still execute |

The dynamic-key kernel reads strings from an array; the x86 loop GET path's
integer specialization is a likely explanation for its repeated failures.
That explanation is inferred from the source, since current observations do not
identify the exact runtime guard site.

The existing capability matrix must therefore be read per backend and execution
route. In particular, an `array_append` timing win does not demonstrate native
append support, and a passing math benchmark does not establish native coverage.

Demo medians at scale 3 reinforce the same pattern: numeric 4.904x,
numeric-kernel 4.735x, array 1.476x, function-call 1.280x, and empty-loop 30.934x;
table 1.035x, string 1.007x and GLib-clock 1.004x. The empty-loop result should not
be used as an application-wide performance claim.

Add per-guard-site failures, native iterations or estimated bytecode work saved,
compile time, generated bytes and peak write-log size. Count successful work,
not just successful artifact installation. Use these metrics to prioritize new
lowerings and to stop retrying specializations that never make useful progress.

## 4. Rollback logging: a large win with an equally large trap

[The x86 helpers](../../Squirrel3/squirrel/jit/sqjit_backend_x64_helpers.cpp)
append a retained old-value entry for every array write, including repeated
writes to the same element. Storage grows with total writes. Rollback replays
entries in reverse to recover the original state.

An isolated prototype retained only the first old value for each array/index,
using a linear search of existing log entries. In five-run 80,000-iteration
medians, the existing `array_write` workload changed as follows:

| Version | Interpreter time | JIT time | Speedup over its interpreter run |
| --- | ---: | ---: | ---: |
| Current | 0.029825 us | 0.050563 us | 0.590x |
| Linear deduplication prototype | 0.030075 us | 0.008912 us | 3.375x |

That is about **5.67x faster than the current JIT** on this repeated-write
workload. Six focused correctness/contract tests passed in both Release and
ASAN+UBSAN builds of the prototype. This is encouraging evidence, not proof of
complete ownership or rollback correctness.

The adversarial benchmark changes the conclusion about this implementation.
Both kernels write integers into preallocated arrays; one cycles through eight
indexes and the other writes a different index every time. Five-run medians:

| Shape | Writes | Current JIT, us | Prototype JIT, us |
| --- | ---: | ---: | ---: |
| Repeated indexes | 8,000 | 368 | 52 |
| Distinct indexes | 8,000 | 253 | 18,160 |
| Repeated indexes | 16,000 | 492 | 121 |
| Distinct indexes | 16,000 | 427 | 73,712 |

The linear search makes the distinct-index workload quadratic: approximately
173x slower at 16,000 writes. AArch64's array-log deduplication also uses a linear
search; copying it directly would import this scaling problem.

The production candidate is a common log contract with first-value capture,
a small bounded inline lookup, and an indexed spill representation for larger
sets of destinations. Aim for storage proportional to unique destinations and
expected constant-time lookup. Cap resource usage with a correct rollback and
fallback path. Table keys, structural changes and array growth need their own
careful treatment; deduplicating scalar array replacement is the first scope.

Validation must cover repeated and distinct destinations, aliases, late guard
failure, target lifetime, old object references, growth interactions and
allocation failure. Deduplication changes which intermediate values remain
retained, so release-hook timing needs explicit scrutiny. Do not eliminate the
write log or relax rollback just to reproduce the favorable benchmark.

## 5. Share analysis before growing backend-specific lowering

The next architectural unit should describe opcode operands, control-flow
successors, types and effects independently of instruction encoding. It should
serve bytecode optimization and both native backends. The checker can consume
the low-level decoder and graph facts while retaining its own abstract domain.

Start with basic blocks, branch targets, read/write sets, liveness and loop-written
sets. Record calls/reentry, allocation, throwing, mutation and reference-release
effects. Represent integer, float, boolean and owned/borrowed object values
explicitly, with checked transitions and materialization at exits.

Two current x86 costs make this useful beyond organization:

- Whole-function compilation scans every remaining instruction for a backedge
  at each IP (line 884), even in straight-line code. Additional scans discover
  loop-written slots. Precomputed graph facts remove this repeated work.
- Loop exit liveness uses a linear first-read/first-write scan. Graph-based
  liveness should replace it before more complex control flow is supported.

A **compile-cost smoke experiment**, not a median benchmark, compiled and freed
each straight-line function 1,000 times in one warm process. Mean time, including
native emission and executable mapping/release but excluding front-end parsing,
rose from 3.620 us for 18 bytecode instructions to 18.132 us for 258 and 47.917 us
for 502. This does not isolate the contribution of the repeated scans; add
phase-level measurements before claiming a specific compile-time improvement.

Once the shared analysis works, use a small typed lowering plan for existing
arithmetic, booleans, moves, comparisons and branches. Then add audited numeric
conversion/math intrinsics and eligible calls. x86 currently lacks PREPCALLK/CALL
lowering in its compiler; AArch64 has considerably more call machinery. Share
argument and guard contracts instead of duplicating its large compiler fragments.
Intrinsic guards must establish the actual callee identity, not just its name,
and preserve rebinding, argument, error and reentry behavior.

## 6. Later opportunities, contingent on measurements

**Register allocation and frame layout.** The x86 emitter pins only a few slots
to registers and spills most others; native frames reserve roughly 2 KB around
the maximum slot count even for small functions. Shared liveness enables actual
frame sizing and local register allocation, including float registers and ABI
clobber rules. Measure emitted loads/stores and performance before expanding the
compiler's instruction/code-size limits.

**Access cache storage and reuse.** Follow-up implementation review confirmed
that the interpreter already has per-site GETK/PREPCALLK member caches. Improve
their instruction-wide allocation and reuse their checked lookups in native
intrinsic guards. Keep caches outside serialized bytecode and guard method
identity and appropriate object-layout/version facts.
Table rehashing, slot insertion/deletion and delegate changes must invalidate
assumptions. Start with one measured monomorphic case and a cheap generic fallback.
PEP 659 provides a primary description of adaptive instructions, inline caches
and counters; its reported performance is not a forecast for SQGI.
[PEP 659](https://peps.python.org/pep-0659/)

**Guard placement and resumable exits.** Hoist array bounds/type guards only when
length and storage stability are proven across the relevant region. Never keep
raw pointers across stack growth or reentry without a validity contract. A later
exit-snapshot design could resume at an exact bytecode IP after committed work,
reducing long rollback transactions. This requires live-value reconstruction,
correct tags/ownership and a precise record of completed heap effects. LuaJIT's
snapshot implementation is a useful reference for restoration mechanics, without
requiring SQGI to become a tracing JIT.
[LuaJIT snapshot implementation](https://github.com/LuaJIT/LuaJIT/blob/v2.1/src/lj_snap.c)

Defer a wholesale LLVM backend, broad object unboxing, SIMD and a full optimizing
SSA pipeline until coverage and cost measurements justify their maintenance cost.

## Suggested implementation sequence

Each row is a reviewable change, with the larger lowering work split by opcode
family as needed. The log work can proceed independently after the boolean fix.

| Order | Change | Acceptance evidence |
| --- | --- | --- |
| 1 | Fix x86 boolean representation and output materialization | Type-sensitive differential tests for frame/direct/loop routes; native execution asserted; sanitizer suite |
| 2 | Add bounded array-write-log deduplication and shared semantics | Correct rollback and lifetimes; repeated-index improvement; distinct-index scaling remains near linear; both backends tested |
| 3 | Introduce shared opcode/CFG/effect facts and liveness | Decode/branch/DMOVE/trap tests; unchanged runtime behavior; compile-cost measurements; accurate rejection details |
| 4 | Add conservative integer folding and branch pruning | Optimizer-on/off differential tests; fewer executed bytecodes; preserved debug/serialized metadata; reduced native rejections |
| 5 | Move existing scalar lowering onto typed contracts | Cross-backend semantic parity; native route coverage retained; guard/exit/ownership tests |
| 6 | Add selected conversions, intrinsics and calls | Named math/call kernels execute natively; rebinding/guard-failure tests; five-run median improvements |
| 7 | Tune frames/registers and improve existing access-cache storage | Reduced spill/frame costs or access cost; bounded cache overhead; mixed-shape and invalidation regressions covered |

Keep JIT-off, x86 Release and sanitizer coverage throughout. Shared changes need
native AArch64 execution; Windows ABI encoding tests alone do not establish
Windows runtime correctness. Performance runs should remain serial and report
both favorable and adversarial shapes, with native-route assertions alongside
timings. The existing suite passing did not detect the boolean bug above.

## Reproduction and session evidence

Existing benchmark commands, from the repository root:

```sh
python3 tools/run_jit_median_benchmarks.py --sqgi /tmp/sqgi-jit-review-20260907/release/sqgi --runs 5 80000
python3 tools/run_sqgi_demo_median_benchmarks.py --sqgi /tmp/sqgi-jit-review-20260907/release/sqgi --runs 5 --scale 3
```

Focused tests used for the temporary prototype:

```sh
ctest --test-dir /tmp/sqgi-optim-explore-20260907/prototype-build --output-on-failure -R 'sqgi_test_jit_(correctness|loop_regressions|perf_correctness)|sqgi_test_cpp_sqjit_contracts'
ctest --test-dir /tmp/sqgi-optim-explore-20260907/prototype-asan --output-on-failure -R 'sqgi_test_jit_(correctness|loop_regressions|perf_correctness)|sqgi_test_cpp_sqjit_contracts'
```

Temporary probes and the detached prototype worktree are under
`/tmp/sqgi-optim-explore-20260907/`: `boolean_result.nut`, `bytecode_cases.nut`,
`probe.cpp`, `compile_cost.cpp`, `write_shapes.nut`, `write_shapes.py`, and
`prototype/`. The probe enables internal `SQJitObservation` snapshots and prints
each prototype's bytecode and execution routes. Its shared-library lookup needs
`LD_LIBRARY_PATH=/tmp/sqgi-jit-review-20260907/release` on this host to avoid an
older installed SQGI library. These are session artifacts, not permanent tooling.

Raw logs use `/tmp/sqgi-optim-explore-` followed by `medians.log`,
`demo-medians.log`, `routes.log`, `bytecode.log`, `bool-off.log`, `bool-on.log`,
`compile-cost.log`, `prototype-medians.log`, `write-shapes.log`,
`prototype-tests.log`, or `prototype-asan-tests.log`.
