# Possible next experiment: activation-level guards for pure scalar loops

Source finding, not implemented or accepted behavior. V19 only folds the existing
checks; it does not move them. In compile_loop.inc, PREPCALLK emits the member
closure/intrinsic identity helper within the bytecode loop; ip_to_offset[start_ip]
is after capture/preload setup. The captured direct_call/float_call and scalar
float workloads therefore remain candidates for repeated lookup cost.

A conservative experiment could check an invariant canonical root/callee slot
once before the native backedge target, only if the complete loop and every
inlined callee are proved to have no observable heap mutation, arbitrary native
call, interpreter reentry, allocation, or callback-capable final release. All
receiver/slot writes and delegated/root lookup provenance need explicit handling.
Reject unknown operations. Recognized audited scalar math evaluators can be
considered separately from arbitrary native closures. No raw pointer-only
lifetime assumption is sufficient; retain V19 weak witnesses and existing guards
between activations, including actual closure/native-closure address reuse.

Compilation-time observed purity alone cannot authorize a different callee.
Entry must validate current identity before any specialized callee code executes.
Zero-iteration loops, callee rebinding between activations, default-delegate and
bound-environment changes, aliases that mutate the root or receiver, and any
post-effect fallback must retain interpreter behavior. If effects cannot be
proved absent, keep the existing per-site guard. Do not hoist checks across a
mutation based only on the root register being syntactically unchanged.

This may affect more unchanged full56 components than another owner-only opcode
optimization. Use fresh V19 profiles and both warmup controls before choosing;
no speedup is asserted here. Native postfix increment with owning destinations
is another bounded option. Broader canonical-loop/call coverage, x64 correctness,
and matched fresh PGO/LTO remain required by the original active goal.
