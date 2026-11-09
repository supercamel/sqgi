# Ordinary loop regions and prepared stateful methods

Explicitly LLVM-compiled Squirrel callers now promote eligible ordinary loops,
even if they make no kernel calls. Values stay in local LLVM registers instead
of being stored back into boxed VM slots on every instruction. Existing scalar
guards still hand off at the exact instruction when types or behavior change.
This preserves wrapping integers, strict floating operations, managed ownership
and ordinary VM metamethods. There is no reassociation or fast-math flag.

Promotion is attempted once at a subsequent function entry, using the first
execution's call profiles. The caller must have a loop, at most 256 instructions
and 64 slots, unchanged parameters, and only supported scalar/control-flow or
eligible kernel-call operations. Other callers keep the boxed baseline. A
first execution that misses a necessary call target can prevent specialization;
there is no polymorphic cache or re-profiling yet. Promotion latency is additional
to initial compilation and excluded from steady-state timings.

## Stateful method calls

```squirrel
local loop = sqgi.llvm.compile(function(controller, n) {
    local result = 0.0;
    for (local i = 0; i < n; i++)
        result = controller.advance(18.0, 0.25);
    return result;
});
loop(controller, 100); // Observe receiver and native method.
loop(controller, 100); // Promote, then execute prepared calls.
print(sqgi.llvm.info(loop).prepared_calls);
```

The receiver must be present among unchanged parameters, with a direct delegate
slot holding a recognized kernel method. Entry guards validate the live receiver,
module/schema, delegate slot, closure identity/token, native signature metadata,
bound environment and native-stack limit. The current receiver's cell pointer is
passed into the compiled region; it is not retained as an unowned cached buffer.
Each method lookup and call still guards the receiver/callee identity and exact
scalar argument types. Changed receivers or delegates use the baseline/VM path.

Within an eligible loop, calls use prevalidated scalar arguments and native
kernel entries. This removes repeated VM call dispatch, delegate lookup and boxed
argument walking. **The method body is not inlined into the caller.** Its existing
execution wrapper still normalizes/restores the floating environment on each
call, resets the kernel fuel budget, and reports native errors. Requirements,
branches, field writes and loops inside methods remain supported. Up to four
scalar arguments are accepted; additional borrowed arrays/instances are excluded.

The receiver owns its delegate, which owns the method closure. These ownership
edges remain stable because kernels cannot reenter the VM, mutate delegates or
allocate managed objects. Old managed temporary slots must be backed by unchanged
parameters or validated method delegates before the region may run. This extends
the existing deferred-materialization proof without pinning VM objects in profiles.
Profiles retain kernel modules; they do not root receiver instances or closures.

A failed type/identity guard materializes locals and hands off before executing
the offending instruction. A native failure can follow field writes: that path
materializes once, raises the kernel error, and returns the VM error sentinel.
It never replays the method. Debug hooks bypass compiled execution as before.
`info().prepared_calls` counts attempted prepared native calls, including failures;
`inlined_calls` continues to count fully inlined pure-integer exports separately.

## Measurements

Reproduce the focused comparison:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_hot_loops.py \
  /tmp/sqgi-kernel-llvm/sqgi --output /tmp/sqgi-hot-loops-prepared
```

Local i7-12700, CPU 0, LLVM 18 RelWithDebInfo; Node 18.19.1, GJS 1.80.2,
CPython 3.12.2. Handwritten JIT, LTO and PGO off. Two fresh processes per runtime,
reversed launch order, matching checksums. SQGI uses 11 samples per process;
ordinary Node/GJS/Python use nine. SQGI uses CPU time; the other ordinary harnesses
use monotonic wall time. Both tiny-call harnesses use CPU time and 11 samples.
All figures are whole-loop throughput in ns/iteration, not isolated-call latency.

| Workload | Previous SQGI | SQGI now | Node | GJS | Python |
|---|---:|---:|---:|---:|---:|
| Integer arithmetic | 3.15 | 0.213 | 0.422 | 1.885 | 22.491 |
| Floating arithmetic | 3.61 | 0.430 | 0.419 | 0.423 | 19.319 |
| Floating recurrence | 4.56 | 1.472 | 1.465 | 1.466 | 15.029 |
| Conditional loop | 2.79 | 0.273 | 0.442 | 1.885 | 21.394 |
| Pure integer kernel call | 0.21 | 0.209 | 0.422 | 2.206 | 34.381 |
| Stateful controller method | 34.50 | 4.202 | 1.681 | — | — |

Previous values are from the preceding full benchmark run, not an interleaved
old/new binary comparison. Small differences should not be treated as meaningful.
Floating loops are approximately level with Node; the stateful method is about
8.2× faster than before but still 2.5× slower than Node. These results concern
eligible explicitly compiled callers, not arbitrary dynamic Squirrel or cold calls.

A separate perf run of 200 million prepared controller calls collected roughly
3,000 cycle samples with none lost. `execute(PreparedCall, Call&)` accounted for
28% of samples and the forwarding helper about 5%; most remaining samples were
in generated caller/kernel code. The remaining method gap includes the native
call boundary and per-call floating-environment handling. Further inlining must
preserve those semantics and exact failures after writes.

## Validation

- `test_llvm_regions.nut`: promoted ordinary loops across integer/float/string/null
  inputs, NaNs/infinities, signed zero, wrapping arithmetic, changing trip counts,
  managed metamethods with GC and excluded parameter mutation.
- `test_llvm_methods.nut`: receiver/delegate replacement, multiple methods and
  receivers, bool/void returns, strict argument types, mid-loop exits, exact
  partial state after errors, per-call fuel reset, arithmetic/fuel failures,
  debug hooks and module lifetime.
- `test_llvm_method_environment.cpp`: hostile rounding/FTZ/DAZ settings, gradual
  underflow, environment restoration after success/failure, and changed native
  signature metadata.

The kernel suites pass 28/28 normally and under ASan/UBSan; the separate NATIVE
backend suite passes 22/22. LLVM Windows support remains unvalidated.
