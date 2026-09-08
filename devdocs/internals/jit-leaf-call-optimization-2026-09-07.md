# JIT scalar leaf-call inlining

This completes the first remaining priority in the
[memory optimization report](jit-memory-optimization-2026-09-07.md): x86 callers
and loop regions can now inline small, guarded Squirrel scalar functions. The
comparison baseline is the working tree after that memory pass, including the
earlier math improvements, rather than commit `31142ce`.

## Analysis and lowering

`sqgicheck` analyzes function-prototype bytecode rather than an AST. Its useful
pattern here is tracking register values through instructions and merging those
values at control-flow joins. Its GI-specific values and coarse scalar category
are not suitable as a machine-code type contract, so the JIT shares the existing
bytecode facts and applies that pattern in a separate `SQJitLeafPlan`.

The plan tracks integer, float and boolean types, plus integer/boolean constants.
All edges must go forward, allowing a topological analysis without a general
worklist. Incompatible types at live joins or returns reject inlining; dead values
can become unknown. The plan is backend independent. A separate x86 leaf emitter
uses it from the existing shared whole-function/loop call lowerer.

Eligibility is deliberately bounded: at most 64 bytecode instructions, 32 slots
and eight parameters including the implicit receiver. A caller can inline at most
256 callee instructions. Accepted bodies contain scalar loads, copies, arithmetic,
selected comparisons, forward branches and returns. Captures, defaults, varargs,
generators, receiver reads/writes, loops, heap operations and further calls are
rejected. Float equality/remainder and mixed return tags are also outside this
path. General native-to-VM calls have not been introduced.

Observed callees and argument types only select a specialization. Runtime guards
check the table lookup's function-prototype identity, absence of a bound
environment, and scalar argument tags. Prototype identity suffices because the
eligible body cannot access closure-specific state. Callee guards run at
`PREPCALLK`, preserving prepared-call semantics when argument evaluation changes
the original table member. Pure regions can hoist root-table guards to entry;
mutating regions keep their guards at the preparation site.

`SQJitCode` retains weak references to dependent prototypes. It neither keeps
obsolete functions alive nor trusts a potentially reused prototype address.
Replacing or collecting a callee makes the guard fail. Resetting an artifact
releases its dependencies; failed code installation preserves the old artifact.

Callee parameters and locals use private scratch slots, preserving pass-by-value
arguments and nested prepared calls. Mixed arithmetic performs the same scalar
integer-to-float conversions as the VM. Integer division/remainder requires a
positive divisor, conservatively avoiding zero and signed division overflow;
other divisors replay through the interpreter. Internal guards use the caller's
existing exit and rollback path. The leaf itself performs no heap writes or VM
reentry. Tests verify that a mutation before a failing inline guard occurs once
after rollback and replay, including the throwing division-by-zero case.

No opcodes or serialized bytecode formats change.

## Measurements

Linux x86_64, Intel Core i7-12700, GCC 13.3 Release. Five alternating baseline/current
comparisons, pinned to CPU 0, threshold 1, 80,000 benchmark iterations, with no
concurrent builds/tests. Direct, branch and float call kernels each multiply the
iteration count by 20. These are warmed runtime medians in microseconds per
benchmark iteration.

| Kernel | Previous JIT | Current JIT | Previous/current | Interpreter/current |
| --- | ---: | ---: | ---: | ---: |
| direct_call | 0.037487 | 0.006549 | 5.724x | 9.377x |
| branch_call | 0.029526 | 0.006510 | 4.535x | 10.243x |
| float_call | 0.054436 | 0.011007 | 4.946x | 4.028x |
| array_append | 0.039963 | 0.038550 | 1.037x | 1.590x |
| array_float | 0.002171 | 0.002191 | 0.991x | 8.531x |
| array_read | 0.002234 | 0.002249 | 0.993x | 8.291x |
| array_write | 0.010200 | 0.008975 | 1.136x | 3.402x |
| dynamic_key_get_set | 0.024763 | 0.024850 | 0.996x | 2.356x |
| dynamic_member | 0.273950 | 0.261438 | 1.048x | 1.000x |
| math_intrinsic | 0.021100 | 0.021450 | 0.984x | 13.679x |
| math_variable | 0.032950 | 0.033337 | 0.988x | 7.606x |
| matrix | 0.073600 | 0.070787 | 1.040x | 5.969x |
| numeric_loop | 0.010011 | 0.009929 | 1.008x | 3.282x |
| object_member_write_fallback | 0.198512 | 0.187625 | 1.058x | 0.991x |
| vector | 2.832025 | 2.775025 | 1.021x | 0.989x |

Separate route observations confirm all three call kernels change from rejected
whole-function and loop compilation to successful x86 whole-function artifacts,
with one successful frame entry and one successful direct entry each, and no
guard failures. Previously some callees ran natively, but their callers did not.

Untargeted movements have not been isolated from execution variability and code
layout. In particular, the 13.6% array-write gain is not evidence of a new array
optimization. The largest untargeted regression is 1.6% in constant math calls.

A second harness measures the first invocation of an already bytecode-compiled
function in a fresh VM, including JIT compilation/fallback and 32 loop iterations.
Each process samples 300 fresh VMs; the numbers below are medians of those medians
from five alternating baseline/current runs, also pinned to CPU 0. VM creation,
source compilation and function lookup are outside the timed interval.

| First invocation | Previous JIT | Current JIT |
| --- | ---: | ---: |
| integer call loop | 10.822 us | 8.430 us |
| branching call loop | 13.710 us | 10.779 us |

These cases show no first-use penalty, but do not isolate compilation cost or
establish process-startup performance. Inlining adds analysis, private stack slots
and machine code, and needs broader compile-cost/code-size telemetry before its
limits are expanded.

## Validation and scope

- Release: 87/87 tests pass, excluding the previously failing external packaging
  download test (`sqgi_test_sqgipkg`).
- ASAN/UBSAN with leak detection: 87/87 pass with the same exclusion.
- Ten focused AArch64 core executables pass under `qemu-aarch64-static`.
- Four focused x86 core executables (leaf, memory, write log, contracts) pass with
  `SQUSEDOUBLE`, ASAN and UBSAN.
- Final added leaf assertions pass in all four configurations above.
- `test_sqjit_leaf.cpp` covers whole-function frame/direct entry, loop entry,
  branch joins and early returns, mixed numeric arguments, boolean result tags
  and equality, parameter isolation, nested prepared calls, argument-evaluation
  mutation, callee rebinding, bound environments, expired dependencies, late
  guard rollback, and debugger suspension. It checks rejection of captured,
  variadic, looping, recursive, default-parameter and effectful bodies.
- The new branch/float benchmarks check results with both interpreter and JIT.

The new lowering is x86-64 only. AArch64 checks exercise shared analysis and
artifact lifetime without claiming hardware speedups. Existing Win64 encoder/ABI
tests pass in the host suite; Windows runtime validation remains open.

Next priorities are precise guard-site and compilation-cost telemetry, followed
by measured receiver-check/spill reduction. Broader member specialization and
non-leaf calls need separate evidence and contracts. The present pure-call
guard-hoisting rules must not be extended to calls that can mutate or reenter.

Session evidence is in `/tmp/sqgi-jit-leaf-20260907/`: `baseline/` holds matching
pre-pass binary/library files, `paired-samples.json` and `paired-medians.log`
hold the five-run comparison, `routes.log` and `baseline-routes.log` hold route
observations, and `cold-call.cpp`/`cold-results.log` hold the first-invocation
experiment. Build/test logs are saved there too. The permanent warm benchmark
command is `tools/run_jit_median_benchmarks.py --sqgi BUILD/sqgi --runs 5 80000`,
with the matching `LD_LIBRARY_PATH` for each build.
