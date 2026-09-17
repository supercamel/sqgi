# LLVM runtime commit-series validation

Validated on Linux x86-64 (Intel i7-12700), LLVM 18, GCC, int64/double.
The published kernel commit `045ead9` remains unchanged. Seven follow-up commits
on `feature/llvm-runtime` separate the native leaf ABI, expanded kernels,
interpreter optimizations, automatic LLVM JIT, explicit boxed compiler,
RouteTastic runtime fixes, and benchmark/integration evidence.

## Preservation and integration changes

A local snapshot recorded the bytes, SHA-256 hashes and permissions of all 181
modified/new files before assembly. The reconstructed tree matched that snapshot
exactly before final validation. The original checkout was retained throughout
assembly in a separate worktree.

Final validation found missing static-checker metadata for the new compiler APIs.
The final integration commit adds `sqgi.kernel`/`sqgi.llvm` metadata, arity and typo
checks, and regression tests. The demo corpus permits unresolved `src/` imports
only for the external RouteTastic drivers; all other diagnostics remain checked.
The math demo uses string concatenation for the caught error's text, preserving
runtime conversion while avoiding an existing checker inference limitation.
These changes, the completed commit plan, and the validation/benchmark artifacts
are intentional differences from the original snapshot. No runtime optimization
was changed during assembly.

## Test matrix

Each row below includes all registered tests except `sqgi_test_sqgipkg`, which
already passed in the initial full LLVM-JIT run and took 157 seconds. The initial
run's only failure was the demo/checker corpus, corrected and rerun. Packaging
ergonomics, checker CLI/corpus/install, GI, async and runtime tests remain included
in the matrix below. Tests ran sequentially across configurations.

| Configuration | Result |
|---|---:|
| llvm-jit | 132/132 passed |
| explicit-llvm | 119/119 passed |
| native-kernels | 113/113 passed |
| interpreter-switch | 87/87 passed |
| legacy-x64 | 100/105 passed |

The legacy x64 failures are `sqjit_memory`, `sqjit_leaf`, `sqjit_objects`,
`sqjit_member_plan`, and `sqjit_float_cache`. The exact same twelve native-execution
assertions fail on a clean build of the original published commit `045ead9`.
They are recorded as existing failures, not hidden, skipped or reported as passes.
The LLVM backend's corresponding tests pass.

Additional checks:

- 24 kernel tests passed on each of NATIVE and LLVM before the kernel commit.
- Six interpreter/leaf/member tests passed with switch and threaded dispatch.
- 33 focused runtime/JIT tests passed normally and under ASan/UBSan.
- Four static-checker tests passed under ASan/UBSan after the integration fix.
- Six independent RouteTastic search-oracle tests passed in each of interpreter,
  ordinary JIT and kernel modes (18 passes).
- Both excluded-from-default-build C++ kernel benchmark targets compiled.

LLVM without typed kernels was exercised by the sanitizer configuration. The
legacy x64 configuration and native-kernel configuration require no LLVM linkage.
Windows and AArch64 execution were not validated on this host.

[Structured validation evidence](benchmark-results/llvm-runtime-series-validation.json)
retains configuration commands, counts, focused test output and baseline failures.

## Final assembled-tree benchmark rerun

Original suite: five fresh process rounds, five warmups, 80,000 iterations,
threshold 1, CPU 0; SQGI, saved pre-RouteTastic SQGI baseline, Node 26.9.0,
GJS and Python. Every result matched. Application matrix: three rounds,
two fresh workflow passes per process, threshold 1000, CPU 0, rotating modes.
All 72 application outputs matched recursively and RouteTastic source fingerprints
stayed unchanged. Builds/tests were finished before benchmark measurements began.

Warm milliseconds (second pass, median of three processes):

| Configuration | RP2040 import | RP2040 analysis | Four searches | Two-net autoroute |
|---|---:|---:|---:|---:|
| interpreter | 212.388 | 9957.777 | 608.886 | 7.113 |
| jit | 208.379 | 9652.126 | 611.388 | 7.336 |
| kernels_jit | 209.001 | 433.009 | 594.338 | 7.348 |

These measurements retain the scope limits of the earlier reports: the original
suite is warmed synthetic work, RP2040 is an already-connected board, the four
searches use synthetic obstacles with production search code, and the full
routing fixture is a small two-net board. Native compilation of arbitrary
methods/callbacks remains limited. Full cold/first-pass timings and process wall
times are retained in the raw application artifact.

- [Original suite raw comparison](benchmark-results/llvm-runtime-series-original-benchmarks.json)
- [RouteTastic raw comparison](benchmark-results/llvm-runtime-series-routetastic.json)
- [Original performance interpretation](llvm-node-parity.md)
- [RouteTastic runtime improvements](routetastic-runtime-improvements.md)
