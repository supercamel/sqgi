# Activation-local member addresses, V6

Experimental; `SQGI_JIT_PRECISE_EXITS=1` remains required. Each native invocation
constructs at most 64 cache entries in its own frame. Entries contain raw owner
and key bits, tags and a slot address, with no owning SQObjectPtrs. Compatible
operand locations share entries. Dynamic keys check tag and bits; GETK groups
belong to a single immutable prototype literal and check receiver identity.
Array indexing keeps its direct bounds-check path. Root/delegate fallback is
not cached. Reads always reload the current slot value and dereference weak
values using the same rules as V5.

The admitted instruction set cannot allocate JS objects, structurally mutate
containers, invoke user callbacks or relocate the VM stack. This prevents slot
movement and live owner-address reuse during an activation. Caches begin empty
on each new call and do not survive a side exit. New instructions invalidating
this proof require invalidation or a different cache contract. Class-pinning
interpreter caches are deliberately not reused.

Tests cover alternating false/integer-zero keys (same raw bits, different tags),
polymorphic tables/instances/arrays, current values after stores, replacement
of weak slots, rehash and resize between calls, and more than 64 member sites
with native coverage. All 100 selected Release and strict ASan/UBSan tests pass
with the option enabled and disabled; all 41 holdouts agree in each build.
Existing lifetime/release-hook and side-exit checks are unchanged.

Five rotating V5/V6/Node rounds use CPU 4, 200,000 iterations and five warmups,
with independent interpreter references. Owners improve **1.0844×** (tables
about 1.044×, classes 1.126×), members **1.0136×**, and methods regress slightly
at **0.9893×**. No component among these 22 cases exceeds a 5% slowdown. These
are targeted results, not a full-mix acceptance or promotion claim.

Frozen binary: `build-jit-audit-20260909/precise-member-cache-v6/sqgi`, SHA-256
`002898fe726947b2cdcb6b3527b9be7533b49e0c584bbe903990af5e1b6d5613`.
`member-cache-delta.patch` applies after V5; exact changed source and tests are
archived. Fresh owner/method profiles and native/bytecode inspection are archived in
profiles/. Both profiles use 499 Hz user cycles, DWARF/8192, CPU 4, 200,000
iterations and five warmups, with zero lost samples. Owner self shares are
17.31% SET, 13.27% CanRelease, 13.00% GETK and 12.47% GET. Method shares include
33.11% SQVM::Execute and 10.46% SET. Denominators changed; these percentages
alone do not establish absolute increases.

GDB exits normally and captures recycle's 8,192-byte code mapping, including
a 1,264-byte native local frame. Captured bytecode shows current/epoch/scale
stores loading constant field names through reused key registers, while GETK
loads identify the literals directly. V6 consequently groups these stores as
dynamic accesses. The next experiment follows dominating literal definitions
within a basic block to share read/write entries, with explicit branch-join,
copy and DLOAD-overwrite witnesses. Diagnostic/GDB timings are excluded from
benchmark results.
