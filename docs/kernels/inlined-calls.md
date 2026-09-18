# Guarded kernel inlining into ordinary Squirrel

An explicitly compiled ordinary Squirrel function can now promote to a specialized
LLVM version on a subsequent function entry, using targets observed during its
first execution. Promotion happens when no previous execution of that region is
active. Eligible ordinary loops without kernel calls also promote; see
[ordinary regions and prepared methods](prepared-methods.md).
No additional API call or manual batch kernel is required:

```squirrel
local k = sqgi.kernel.compile("export i64 twice(i64 x){return x*2;}");
local loop = sqgi.llvm.compile(function(fn, n, seed) {
    local sum = seed;
    for (local i = 0; i < n; i++) sum += fn(i);
    return sum;
});
loop(k.twice, 1000, 0); // Collect the call target.
loop(k.twice, 1000, 0); // Compile/promote and execute the guarded region.
print(sqgi.llvm.info(loop).inlined_calls);
```

This version inlines the kernel's integer IR and uses promotable local registers
for the caller. The hot loop no longer performs kernel calls, boxed-helper calls,
reference counting or VM-slot stores on each iteration. LLVM can optimize across
the former call boundary. Register state is materialized once at a return or guard
exit, then the VM handles the exact next instruction normally.

## Supported region and guards

This first tier handles loops with pure, straight-line integer/bool kernel
exports: constants, copies, add/subtract/multiply, negation, comparisons and return,
with at most four scalar arguments and 64 kernel IR instructions. Integer overflow
wraps. Kernels with requirements, division, loops, borrowed memory, class receivers
or floating-point operations are not inlined by this tier. Eligible scalar class
methods can use the separate prepared-call path described above. The caller is limited to
256 instructions/64 slots, supported scalar/control-flow operations, and unchanged
parameters. Unsupported regions retain the baseline compiler.

- Every observed callable must still be present among the unchanged parameters.
  Entry guards check closure identity, the leaf callback/context, a unique holder
  identity token, bound environments, native signature metadata and stack limits.
  The holder token prevents a newly allocated object at a recycled address from
  matching an old profile. Profiles own kernel modules, not Squirrel closures.
- Each inlined call guards the callee and exact scalar argument types. A changed
  callee inside a loop or a type failure exits at that CALL instruction, after
  materializing preceding work. It does not replay earlier iterations or effects.
- Managed values may only be copies of unchanged, rooted parameters. Unrelated
  managed values left in temporary slots cause an entry fallback. Assignments
  cannot destroy a final managed owner while the region runs or materializes.
  Kernels cannot reenter the VM or allocate managed objects in this tier.
- No ordinary runtime helper is called while registers are unmaterialized.
  Metamethods, errors, callbacks and GC execute only after a complete handoff.
  Debug hooks bypass the compiled tiers as before.
- One specialized version is attempted per caller prototype. Changed targets use
  the baseline; returning to the original target can use the specialized version
  again. Kernel modules remain retained until that caller prototype is released.

`info` aggregates `operations`/`direct_operations` across both tiers and reports
`fused_entries` plus `inlined_calls`. `leaf_calls` counts actual native calls, not
inlined calls. `SQGI_SQUIRREL_DUMP_IR=1` dumps both versions for inspection.
Promotion introduces additional compilation latency; benchmark warmups explicitly
include promotion and exclude it from steady-state measurements.

## Comparison with Node

Run fresh processes in reversed launch order:

```sh
taskset -c 0 python3 demo/benchmarks/kernels/compare_inline_calls.py \
  build/sqgi --output /tmp/inline-calls-comparison.json
```

Local i7-12700, CPU 0, LLVM 18 RelWithDebInfo, Node 18.19.1; handwritten JIT,
LTO and PGO off. Medians over two fresh processes × 11 samples each, process CPU
time. Each sample executes 10 million total iterations; full checksums and both
seed values match exactly. All JS results/checksums remain safe integers.

| Pure kernel | Squirrel LLVM, ns/iteration | Node, ns/iteration | Node / SQGI |
|---|---:|---:|---:|
| `x * 2` | 0.315 | 0.422 | 1.34× |
| `x * 3 + 7` | 0.315 | 0.524 | 1.66× |
| `x * x` | 0.322 | 0.418 | 1.30× |

These are whole-caller loop throughput results, **not standalone VM-call latency**.
Both engines may inline/optimize calls. Squirrel uses wrapping i64 arithmetic;
Node uses Number, but the tested ranges are exact in both. The square case uses
10,000 iterations per invocation to keep the total checksum within that range;
the other two use one million. Samples repeat whole invocations as necessary.
The optimized IR retains an arithmetic loop for the demonstrated `x * 2` case;
there is no benchmark-specific summation formula in the implementation.

The simpler existing `tiny_calls.nut` accumulation loop measured about 0.21 ns per
iteration after promotion, down from about 15 ns. The variable-seed comparisons
above are the more conservative cross-process results. Stateful class methods,
floating kernels, cold calls and very short loops do not inherit these wins.
Node remains faster in several of those cases. This is not a claim of universal
Node parity.

`test/test_llvm_inline.nut` checks actual inlining, changing trip counts/types,
multiple targets, bool/void/four-argument exports, mid-loop type/callee exits,
metamethods with GC, excluded effectful/floating kernels, debug hooks and callable
replacement/lifetime. The broader kernel and sanitizer suites run alongside it.

[The next pass](prepared-methods.md) extends register promotion to ordinary loops
and adds prevalidated stateful method calls without changing their native ABI.
