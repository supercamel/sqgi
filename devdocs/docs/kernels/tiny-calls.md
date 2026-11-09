# Tiny-call optimization pass

The first pass removes repeated call setup work without changing the typed
kernel language or bypassing validation:

- Each host closure retains a prepared executable entry. Calls no longer look up
  the executable by module index every time. The holder retains the owning module.
- Integer-only generated functions leave MXCSR untouched. Any f64 IR instruction
  conservatively retains the existing floating-environment normalization and
  restoration, including inlined helpers and error exits.
- Scalar exports and methods with up to four explicit scalar arguments use small
  arity-specific adapters. They still check every type, the argument count, and
  the receiver's module/schema identity. Unsupported signatures use the existing
  general adapter. Guards fall back before execution; execution errors never replay.
- LLVM-compiled ordinary callers resolve direct userdata delegate slots without
  returning to the interpreter. This applies to registered leaf methods. The slot
  is re-read on every lookup, so there is no cached stale method or receiver.
  Missing/dynamic/non-leaf lookups retain interpreter behavior.

Debug hooks and bound environments retain the normal native frame path.
Prepared entries are internal borrowed handles: the module's executable storage
must remain alive while using them.

## Evidence

Development i7-12700, pinned CPU 0, LLVM 18, RelWithDebInfo; handwritten JIT, LTO
and PGO off. Times are nanoseconds, compilation excluded:

| Case | Before | After |
|---|---:|---:|
| Tiny integer export in an LLVM caller loop | 19.35 | 15.19 |
| One-step compiled oscillator workflow, existing Squirrel driver | 34.45 | 29.25 |
| Scalar controller method in an LLVM caller loop, before/after lookup lowering | 40.93 | 33.21 |

The first two comparisons include prepared entries and specialized adapters.
The method-loop comparison isolates the additional lookup change after adapter
optimization. The equivalent interpreted loop measured about 44 ns per method
call. The older benchmark with an extra Squirrel `invoke` closure per iteration
remains about 62 ns; do not conflate those caller shapes.

A matched Node 18.19.1 whole-caller benchmark measured about 0.42 ns for the
integer-function iteration and 1.68 ns for the scalar controller method. Node
can inline these same-language functions. SQGI still validates/marshals boxed
arguments and crosses a native boundary; this pass does not claim Node parity.

After perf was enabled, a cycles profile of the existing typed-object suite
collected roughly 22,000 samples with no lost samples. About 44% of self samples
were in `SQVM::Execute`, 3.9% in `StartCall`, and 2.5% in `LeaveFrame`; the small
method adapter accounted for about 5.1%. These are whole-suite sample shares,
not isolated call-latency measurements. They motivated compiling the whole
caller loop and eliminating its per-lookup interpreter handoff.

`tiny_calls.nut` checks results and controller state, alternates interpreter and
LLVM order, and reports 11-sample medians. Before lookup lowering its million-call
method loop entered LLVM about a million times per invocation; afterward it
enters once. `node_tiny_calls.js` uses fresh processes per case, warms for at least
100 ms, checks results/state, and also reports 11-sample medians.

```sh
taskset -c 0 build/sqgi demo/benchmarks/kernels/tiny_calls.nut
taskset -c 0 node demo/benchmarks/kernels/node_tiny_calls.js integer_export
taskset -c 0 node demo/benchmarks/kernels/node_tiny_calls.js scalar_method
```

The prepared-entry test checks hostile floating-point modes, gradual underflow,
inlined float comparisons, errors and exact MXCSR restoration. Adapter tests
cover arities zero through four, general fallback, strict scalar types, methods,
foreign receivers, partial writes without replay, debugger/bound-environment
fallback and module ownership. The existing LLVM integration tests also check
changing receivers and fallback to an ordinary Squirrel receiver.
