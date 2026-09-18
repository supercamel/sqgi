# Typed kernel module compiler: implementation and validation

The LLVM backend now compiles a source module together, with real typed helper
calls and LLVM-controlled inlining. The parser no longer copies helper bodies
or their temporary slots into callers. Source syntax and Squirrel-facing APIs
are unchanged; helpers still precede callers and recursion is unsupported.

Canonical IR separates typed scalar/pointer values, call sites, and addressable
storage. A verifier checks references, signatures, operand types, definite
assignment, return paths, call depth and resource budgets. `LocalZero` preserves
initialization at each execution of a declaration. The test interpreter uses
real call frames; the dependency-free x64 backend uses a bounded flattening
adapter and retains its existing frame capacity.

Each LLVM module owns one LLJIT instance. Private calls pass typed scalars and
pointer/length arguments. Checked calls share fuel and propagate the original
helper's error immediately; non-failing helpers omit the execution context and
return typed values directly. Floating-environment requirements propagate across
the call graph. Module ownership keeps all helper code alive together.

Public entries lower directly from the same IR into the existing `Call*` ABI.
This deliberately avoids wrapping every public entry in an aggregate-return
adapter. The initial adapter inhibited optimization and regressed reductions;
keeping float temporaries/results typed and removing the adapter restored
performance. A separate regression in image processing came from status/fuel
handling around a non-failing clamp helper; transitive effect analysis removed
that overhead. No workload-specific lowering or relaxed arithmetic was added.

The error location fits into the existing eight-byte diagnostic area as two
32-bit fields (line and function), preserving the 32-byte call frame and avoiding
an extra diagnostic store. The frequently used C++ execution adapters are aligned
to 64 bytes on GCC/Clang to reduce sensitivity to code-layout changes. Prepared
Squirrel calls retain their existing guarded
entry paths. Unsupported IR shapes decline explicit caller-side inlining and use
the prepared entry; this change does not add cross-JIT IR importing.

## Resource policies

The former LLVM 384-cell limit is gone. Limits now distinguish virtual values,
source-local storage, call depth, input IR and emitted objects. Current defaults
are documented in the [language guide](README.md). Compilation statistics expose
source instruction/value counts, local bytes, optimized LLVM instruction counts,
emitted-object bytes, and compilation duration through the internal C++ module.

The 64 KiB/function and 256 KiB/call-chain source-storage budgets are conservative
initial policies, not hardware limits. The checked demo corpus's largest module
uses 1,592 source-local bytes; tests additionally execute the full 64 KiB boundary
and reject oversized regions and call chains. Arrays no longer allocate one
compiler temporary per cell. The 16 MiB object budget includes metadata and is
checked before publishing entries. Compiler time is measured, not forcibly
limited. Source-local budgets do not bound machine spills or final stack usage.

The existing declaration-before-use rule gives the frontend a topological call
order, so a separate signature-discovery parser pass was unnecessary for this
migration. LLVM declares all native signatures before emitting bodies. Forward
references, native-x64 out-of-line calls, process-wide compilation caches, and
cross-module Squirrel-JIT inlining remain separate future work.

## Correctness

Validation ran on x86-64 Linux with LLVM 18, int64/double, and no fast-math.

| Configuration | Result |
|---|---:|
| Automatic LLVM JIT plus LLVM kernels | 134/134 |
| Explicit Squirrel LLVM plus LLVM kernels | 121/121 |
| Dependency-free native kernels | 114/114 |
| LLVM kernel/integration suite, ASan + UBSan | 35/35 |
| LLVM kernel/integration suite, helper inlining disabled | 35/35 |

The three full configurations exclude the unrelated sqgipkg packaging test.
The final source, including the verifier return-path guard and entry alignment,
passes all configurations above.
ARM64 and Windows execution were not available on this host; their existing
platform paths are retained, but this report does not claim target validation.

`test/kernel/test_calls.cpp` adds nested failure/partial-write/fuel comparisons,
independent arithmetic models, generated acyclic call graphs, floating-state
checks, same-name module lifetimes, resource boundaries, and corrupted-IR
rejections. Tests compile more than 384 temporaries, 100 helper call sites, and
an 8,192-cell local array. Existing workload, aliasing, local reset, arithmetic,
math, guard-page, and Squirrel-boundary tests remain enabled.

## Performance evidence

The baseline binaries were preserved from commit `36bf531` before edits; they do
not dynamically load a subsequently rebuilt Squirrel or SQGI library. CPU 0 was
used throughout. The [machine-readable report](../benchmark-results/kernel-module-architecture-2026-09-18.json)
contains binary/source hashes, samples, checks, and paths/hashes for raw reports.

The native kernel suite runs 85 cases across 11 workloads, with five alternating
before/after process rounds and matching checksums. The median after/before time
ratio is 1.010 (about 1% slower). The triage rule flags a slowdown exceeding both 5%
and 1 ns; no final case crossed it. This is not a claim of identical timings:
some empty/tiny C++ cases moved by less than a nanosecond, which can be a larger
percentage of their very small baseline. Generated geometry code and the C++
entry adapter were also inspected when investigating these differences.

The original 15-workload SQGI/Node/GJS/Python suite matches all checksums. SQGI's
measurements range from about 1.3% faster to 1.2% slower than the preserved SQGI
baseline in the final run. No arithmetic or runtime correctness checks were disabled to improve
results. Those small shifts are retained in the report rather than presented
as speedups.

Three alternating process rounds additionally cover typed-object drivers,
compiled simulations, and explicit LLVM tiny-call integration. Representative
measurements from the comparison are:

| Workload | Before | After |
|---|---:|---:|
| Compiled scalar method | 4.205 ns | 4.210 ns |
| Typed controller, 4,096 elements | 7.020 us | 7.025 us |
| Compiled simulation, 16 steps | 70.17 ns | 69.98 ns |
| RouteTastic module import, board workflow | 332.54 ms | 236.87 ms |
| RouteTastic warm board workflow | 441.73 ms | 443.94 ms |
| RouteTastic warm search fixtures | 649.64 ms | 646.37 ms |

RouteTastic's live checkout was not edited by this task. Its source changed
between earlier application batches, so those comparisons were discarded. The
final runs use a byte-for-byte snapshot of 176 existing files, with identical
source/input fingerprints for both binaries. The snapshot manifest is retained
in the report. All 24 complete before/after application outputs matched.
The application measurements use three rounds and two repetitions, discarding
the first repetition from warm timings. Before and after application batches ran
sequentially; small warm differences should not be read as established speedups.
The substantial import improvement is consistent with sharing compilation across
functions instead of creating a JIT instance for each one.

Reproduce the kernel comparison with:

```sh
python3 demo/benchmarks/kernels/compare_compiler.py \
  /path/to/before/sqgi_kernel_benchmark_suite \
  /path/to/after/sqgi_kernel_benchmark_suite \
  --runs 5 --cpu 0 --output comparison.json
```

`SQGI_KERNEL_NOINLINE=1 ctest --test-dir /path/to/llvm-build -L kernel
--output-on-failure` exercises actual helper call boundaries. This diagnostic is
for testing; normal builds leave inlining decisions to LLVM.
