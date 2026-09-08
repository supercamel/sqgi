# Bytecode and JIT optimization implementation

Implemented after the [exploration of `31142ce`](bytecode-jit-exploration-2026-09-07.md).
A subsequent [math optimization pass](jit-math-optimization-2026-09-07.md)
adds further measured gains and conversion guard fixes.
The largest measured gains in this initial pass are repeated array writes and native math on x86.
The work also fixes observable type errors, shares bytecode/rollback contracts,
and removes bytecode work before either interpreter or native execution.

## Changes and semantic boundaries

| Area | Implementation |
| --- | --- |
| Bytecode analysis | `sqbytecode.h/.cpp` describes operands, successors, effects, liveness and loop-written slots. Compiler, checker and native backends share its facts. |
| Optimizer | `sqoptimizer.h/.cpp` folds checked integer literals, propagates block-local scalar constants, prunes constant branches/unreachable code and removes eligible dead scalar temporary stores. |
| Scalar state | `jit/sqjit_value.h` supplies common types/state. `jit/sqjit_typeflow.h` checks lowered definitions through control flow before native code installation. |
| Rollback | `jit/sqjit_write_log.h/.cpp` replaces both backend logs with a checked, bounded implementation and shared lifetime rules. |
| Intrinsics | `sqnativebuiltins.h` and `jit/sqjit_intrinsics.h/.cpp` describe audited math functions and their real function identities. `jit/sqjit_backend_x64_calls.h/.cpp` handles x86 preparation, conversion and calls for both native routes. |
| Native storage | x86 frames use the actual function slots plus helper scratch space. Its three callee-saved value registers are assigned by weighted static use, with stable slot identity across branches/calls. |
| Member caches | `sqmembercache.h` shares the existing interpreter cache helpers with intrinsic guards. `SQFunctionProto` allocates sparse cache records when that uses less memory. |

Boolean results now retain their Squirrel tag across native returns, copies and
loop exits. Boolean arithmetic falls back and raises the interpreter's error,
including AArch64 mixed float arithmetic. Zero-trip loop exits preserve live
entry values and use normal `SQObjectPtr` assignment when writing back.

Branch-join regressions exposed two further problems: the linearly tracked type
of a conditional assignment could become the return type on both paths, and a
constant loaded on one path could be reused on another. The new check rejects
incompatible live scalar types; constant facts end at control-flow joins, and
immediate lowering requires that its defining load dominate the use. This is a
conservative boundary, not a complete SSA or object-alias analysis.

Operand details have explicit tests: sequential DMOVE assignments, POSTFOREACH
branch offsets, comparisons, conditional definitions and exception liveness.
TAILCALL can fall through when its target is a native callable; retaining its
following RETURN avoids deleting a live instruction. Absolute loop IP tables
are now sized for the prototype rather than assuming every loop lies below IP 512.

The bytecode pass avoids overflow, division by zero and minimum-integer / -1
folding. It preserves untyped addition and metamethod calls, retains named local
stores, and skips functions involving captures/outers or suspension. Instruction
compaction remaps jumps, source lines and local ranges. An internal shared-state
switch supports optimized/unoptimized differential testing; serialization keeps
its existing format. Floating-point reassociation and general CSE are deferred.

The write log keeps eight inline entries, uses indexed lookup for larger unordered
sets, and defers the index for provably distinct ascending writes to one array.
Repeated scalar replacements retain the first value. Intermediate reference-owned
values are retained; weak references are recorded without dereferencing them.
Resize records delimit deduplication epochs so reverse replay remains valid.
Members retain ordered records. Allocation failure or the 65,536-entry limit
causes a guard failure before the next mutation, followed by rollback/fallback.

Math guards verify the actual native function and parameter contract; a different
function named `sqrt` is not an intrinsic. Both backends accept integer and float
math arguments while preserving the argument slots. Tests replace a warmed
intrinsic after an earlier array mutation and assert exact rollback plus native
guard failure. Generic/reentrant calls remain outside this new x86 path.

The interpreter already had GETK/PREPCALLK caches; the exploration document has
been corrected. This change reduces their storage and reuses them. Sparse storage
costs one 32-bit IP mapping per instruction plus records only at access sites;
dense storage remains available when smaller. Table owner/version checks, weak
ownership, field/method checks and generic fallback are preserved. This is a
memory improvement, with no demonstrated broad object-workload speedup.

## Validation

- x86 Release: **85/85** tests pass, excluding the separate packaging test.
- x86 ASAN+UBSAN with leak detection: **85/85** pass with the same exclusion.
- JIT-disabled build: **77/77** pass with the same exclusion.
- Later compile-metadata/test-only changes were rechecked with their affected
  contract, value, intrinsic, optimizer and checker targets.
- AArch64 cross build: **8/8** focused core executables pass under
  `qemu-aarch64-static`: bytecode, optimizer, contracts, values, intrinsics,
  write log, member cache, and invalid-backend-input tests.
- Existing x86, Win64 ABI and AArch64 encoder tests pass on the x86 host.
- Checker coverage gate: adjusted lines/functions/branches **100%**, with existing
  documented exclusions. Existing source-anchored exclusions were relocated and
  one newly covered return-fallback exclusion removed. All **5/5** deliberate
  checker mutants are killed.
- Tracked/new-source whitespace checks and benchmark-tool Python syntax pass.

New regression targets are `sqgi_test_cpp_sqbytecode`, `sqgi_test_cpp_sqoptimizer`,
`sqgi_test_cpp_sqmembercache`, `sqgi_test_cpp_sqjit_values`,
`sqgi_test_cpp_sqjit_write_log` and `sqgi_test_cpp_sqjit_intrinsics`.
They check observable values/types, mutation counts, lifetimes, error/metadata
behavior and native route success, rather than compilation success alone.

The packaging test was run separately. It passed the earlier native/AppImage
checks, then failed fetching an external artifact with HTTP 404, as in the prior
validation. This remains an external test dependency issue. AArch64 execution
here is emulated; native AArch64 performance and Windows runtime validation
remain outstanding.

## Measurements

Linux x86_64, GCC 13.3 Release, Intel Core i7-12700. Benchmarks run serially with
no concurrent builds/tests. Five-run medians, 80,000 iterations, JIT threshold 1.
Times below are microseconds per benchmark iteration. Near-1x differences are
not treated as meaningful gains; these local measurements have no confidence
intervals. The final metadata allocation cleanup does not change generated code.

| Workload | Interpreter | JIT enabled | Speedup |
| --- | ---: | ---: | ---: |
| array_append | 0.059600 | 0.036175 | 1.648x |
| array_write | 0.030250 | 0.010400 | 2.909x |
| direct_call | 0.060716 | 0.036270 | 1.674x |
| dynamic_key_get_set | 0.058400 | 0.060063 | 0.972x |
| dynamic_member | 0.246750 | 0.244738 | 1.008x |
| math_intrinsic | 0.276462 | 0.087762 | 3.150x |
| matrix | 0.418438 | 0.414263 | 1.010x |
| numeric_loop | 0.032277 | 0.009671 | 3.338x |
| object_member_write_fallback | 0.180338 | 0.185862 | 0.970x |
| vector | 2.715213 | 2.680325 | 1.013x |

Against the original exploration's JIT times, array writes improve from 0.050563
to 0.010400 us (about 4.86x), and math from 0.276713 to 0.087762 us (about 3.15x).
These before/after timings were collected in separate runs. Native route tests
confirm whole-function and loop math execution on both tested backends.
Dynamic-key, dynamic-member, matrix and vector work remain candidates for future
coverage improvements; passing benchmarks do not imply those kernels are native.

The permanent `bench_jit_write_log.nut` and its Python driver measure both repeated
and distinct destinations, with allocation outside the timed region and checksums:

| Shape | Writes | JIT median, us per invocation |
| --- | ---: | ---: |
| distinct | 1000 | 62.0 |
| distinct | 8000 | 343.0 |
| distinct | 16000 | 595.0 |
| repeated | 1000 | 19.0 |
| repeated | 8000 | 121.0 |
| repeated | 16000 | 147.0 |

Distinct writes grow from 343 us at 8,000 to 595 us at 16,000, avoiding the
exploratory linear-dedup prototype's 18,160/73,712 us quadratic behavior.
There is still a tradeoff: the original log measured 253/427 us for those distinct
sizes, so this shared implementation is slower on that streaming case. Repeated
16,000 writes improve from 492 to 147 us. Tiny submillisecond samples are noisy;
keep both shapes in future comparisons instead of reporting only repeated writes.

The demo benchmark (five-run medians, scale 3) measured numeric 5.37x,
numeric-kernel 5.16x, array 1.51x and function-call 1.29x; table/string/GLib were
near parity. Empty-loop 32.98x is a synthetic result, not an application-wide gain.
These demo measurements preceded the removal of redundant old-value reads in
x86 array-write helpers.

A compile-cost **smoke run**, 1,000 compilations per straight-line shape including
native emission and executable map/release but excluding parsing, measured
5.000 us for 17 instructions, 21.210 us for 257, and 37.620 us for 501. The original
smoke run measured 3.620/18.132/47.917 us for 18/258/502 instructions. Shared
analysis adds fixed cost but avoids repeated scans; these smoke runs do not
establish an overall compile-time improvement. Branch-free type checking now
avoids definition-table allocation entirely.

## Reproduction and remaining work

From the repository root, after configuring/building the desired variant:

```sh
ctest --test-dir BUILD -E '^sqgi_test_sqgipkg$' --output-on-failure
cmake --build CHECKER_BUILD --target sqgicheck-coverage sqgicheck-mutation
python3 tools/run_jit_median_benchmarks.py --sqgi BUILD/sqgi --runs 5 80000
python3 tools/run_jit_write_log_benchmarks.py --sqgi BUILD/sqgi --runs 5
python3 tools/run_sqgi_demo_median_benchmarks.py --sqgi BUILD/sqgi --runs 5 --scale 3
```

Session build directories: `/tmp/sqgi-jit-review-20260907/release`,
`/tmp/sqgi-audit-20260907/{asan,default,checker}` and
`/tmp/sqgi-optim-a64/build`. The last uses a temporary standalone core-only CMake
project with `aarch64-linux-gnu-g++`, static test executables and QEMU, without
cross-compiling GI. Logs are `/tmp/sqgi-optim-final-*`; these are session evidence,
not repository build dependencies.

Remaining work is intentionally explicit: native AArch64/Windows validation,
precise runtime guard-site and compilation telemetry, cheaper streaming undo
storage, dynamic object coverage, and further consolidation of backend lowering.
Full linear-scan/float register allocation, object boxing at joins, resumable
exit snapshots, SSA, SIMD and an LLVM backend remain deferred. The weighted
three-register assignment is an incremental tuning step, not a full allocator.
