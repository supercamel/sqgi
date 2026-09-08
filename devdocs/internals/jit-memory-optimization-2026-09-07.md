# JIT array and dynamic-key optimization

This pass builds on the [math optimization](jit-math-optimization-2026-09-07.md).
The comparison baseline is the working-tree build after that pass, including its
math guard hoisting. It is not the older `31142ce` commit.

## Implementation

`SQJitX64Memory` shares checked array-read lowering between the x86 whole-function
and loop compilers. It replaces five runtime read helpers and the duplicated
emission around those helpers. The x86 compiler shrinks from 2,908 to 2,610 lines;
the shared memory module owns the new behavior.

Native reads check the array receiver, unsigned index bounds (including negative
indices), and element tag before loading the value. They reload array size and
storage at each access. Compilation samples an element to select integer, float,
or nested-array lowering; this sample is only a hint, never a runtime invariant.
Nested observations allow the existing matrix loop to compile with float loads.
Mixed types and weak array elements use interpreter fallback.

Loop regions can also borrow an array's string element for subsequent integer
table reads and writes. These keys are confined to one basic block and cannot
escape, cross calls/allocations, or be copied as general objects. The VM stack
owns the source array, and any displaced owning values remain in the rollback
log until exit. Tests cover overwriting the source array slot before using its
borrowed key. General object-valued locals and stores remain outside this path.

The shared rollback log now deduplicates repeated scalar member writes by target
identity and key, using its existing bounded hash storage. It always retains
owning intermediate values. This matters for long table-update loops: the first
experiment filled the 65,536-entry log and repeatedly replayed the loop, making
the dynamic-key benchmark substantially slower. Deduplication fixes that failure;
the regression suite now requires a 100,000-iteration member loop to complete
natively without guard failures.

The lifetime review also found that member setters recorded dereferenced values
from normal member reads. Rollback could consequently replace a weak reference
with its target or null. x86 table writes now read the raw slot through
`SQTable::GetRaw`; AArch64 table/instance logging also preserves raw values.
Direct artifact tests check both live and dead weak references before interpreter
replay can conceal incorrect restoration.

No bytecode opcodes or serialized bytecode formats change in this pass.

## Measurements

Linux x86_64, Intel Core i7-12700, GCC 13.3 Release. Five alternating baseline/current
comparisons pinned to CPU 0, at 80,000 benchmark iterations and hotness threshold
1, with no concurrent builds or tests. The harness multiplies the iteration count
by 20 for direct calls, numeric loops, and the two new array-read kernels. These
are warmed runtime measurements; they do not establish compilation-time gains.
Times are median microseconds per benchmark iteration.

| Kernel | Previous JIT | Current JIT | Previous/current speedup | Interpreter/current speedup |
| --- | ---: | ---: | ---: | ---: |
| array_append | 0.039187 | 0.038850 | 1.009x | 1.652x |
| array_float | 0.017944 | 0.002141 | 8.381x | 8.885x |
| array_read | 0.002324 | 0.002152 | 1.080x | 8.880x |
| array_write | 0.010038 | 0.010212 | 0.983x | 3.140x |
| direct_call | 0.036086 | 0.036229 | 0.996x | 1.856x |
| dynamic_key_get_set | 0.065950 | 0.024550 | 2.686x | 2.494x |
| dynamic_member | 0.265087 | 0.265837 | 0.997x | 0.996x |
| math_intrinsic | 0.020650 | 0.020962 | 0.985x | 13.210x |
| math_variable | 0.031925 | 0.032563 | 0.980x | 7.391x |
| matrix | 0.428338 | 0.071687 | 5.975x | 6.051x |
| numeric_loop | 0.009786 | 0.009781 | 1.001x | 3.593x |
| object_member_write_fallback | 0.191612 | 0.192738 | 0.994x | 0.986x |
| vector | 2.845187 | 2.777375 | 1.024x | 1.001x |

The largest gains come from making previously interpreted loops run natively.
Separate route observations at 80,000 iterations show dynamic-key execution
changing from 80 failed native entries and no successes to two successes and no
failures. Matrix and float-array loops change from rejected compilation to two
successful native entries each. Integer-array reads already compiled before this
pass; their smaller gain comes from the changed lowering.

Untargeted differences are approximately -2% to +2.4%. Array writes measured 1.7%
slower despite an earlier experiment showing a gain. These small differences have
not been isolated from code-layout and execution variability. Hardware performance
counters remain unavailable; this is not a sampled hardware profile.

## Validation

- Release: 86/86 tests pass, excluding the previously failing external packaging
  download test.
- ASAN/UBSAN with leak detection: 86/86 pass with the same exclusion.
- The final expanded memory and write-log tests pass in both builds.
- Nine focused AArch64 core executables pass under `qemu-aarch64-static`; the
  final memory test additionally covers instance weak-reference rollback.
- Three focused x86 core executables (memory, write log, contracts) pass with
  `SQUSEDOUBLE`, ASAN and UBSAN, including the final memory test additions.
- New native-route assertions for float reads and string-key loops fail against
  the saved pre-change library and pass with the new lowering.
- Coverage includes negative/out-of-range indices, zero-trip loops, mixed element
  and key types, missing members after earlier writes, nested weak array elements,
  borrowed-key source overwrites, string live-out fallback, long member loops,
  hash growth/target identity, owning intermediate values, and raw weakref rollback.

Windows runtime performance and correctness have not been established here.
AArch64 results are emulated correctness checks, not hardware speed claims.

## Remaining priorities

1. Keep loops with small Squirrel leaf calls native. This requires callee identity,
   argument/return contracts, and a clear reentry boundary; the existing pure-call
   guard-hoisting assumptions must be revised before admitting general calls.
2. Extend dynamic member specialization beyond temporary string keys and integer
   table values only when a benchmark demonstrates a useful gain.
3. Investigate repeated receiver checks and register spills using precise guard
   and compilation-cost telemetry before adding more complex optimizations.

Session evidence is in `/tmp/sqgi-jit-memory-20260907/`: `baseline/` contains the
saved executable and shared library with its SONAME symlink, `paired-samples.json`
and `paired-medians.log` contain the final comparison, and `baseline-routes.log`
and `routes.log` contain route observations. `initial-comparison/` retains the
failed log-growth experiment. Build/test logs and the double-precision core build
are also there. The permanent benchmark remains
`tools/run_jit_median_benchmarks.py --sqgi BUILD/sqgi --runs 5 80000`, using the
matching `LD_LIBRARY_PATH` for each build.
