Additional follow-up evidence from V25 (no implementation)

The ordinary application profile is NOT predominantly VM execution: Execute
17.18%, RecordMember 14.30%, root_fallback_safe 5.49%, array_get_object 5.06%,
member_set_integer_logged 4.85%, Table::Get 4.77%. Application rows remain roughly
unchanged versus audit. record_updates has an allocating prologue then a mutation
loop; native canonical loop coverage could remove journal overhead, but requires
the explicit committed-continuation ABI. Do not enable unsafe legacy takeover.

The loop compiler already inlines forward-branch scalar leaves using
SQJitLeafPlan (compile_loop.inc around emit_inline_leaf_call). The whole-function
compiler primarily uses emit_direct_native_closure_call and a simple accessor
inliner. A possible broader improvement is reusing bounded scalar-leaf inlining
inside whole-function compilation while preserving ownership/materialization,
closure lifetime, parameter isolation, and exact rollback checks. This is a
candidate to investigate, not a demonstrated cause: capture route_events,
pricing_events and filter_stream native entries AND loops and count actual
call_native_closure helper calls before choosing it. filter_stream already has
captured loop code, so do not assume every application uses whole-function calls.

Methods still spend 47.33% in Execute and 9.04% in constant-key SET helpers.
First lexical constant-key sites have cache_may_hit=false. Thus their precise
fast address path receives no cache and relies on the checked helper; this is
plausible per-invocation lookup overhead in short publish/transfer functions.
An inline validated table bucket probe or current-class field lookup may help
without persistent borrowed-pointer caches. Verify actual call-site counts and
native code. Missing fields, collision chains, weak values, aliasing and final
owner releases must retain helper semantics. This is not permission to bypass
managed frames for calls to precise native callees.
