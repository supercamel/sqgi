# Follow-up: read-only table predicates

SQGI now lowers small read-only table predicates through LLVM with ordinary
`SQGI_JIT=1`. A representative example is:

```squirrel
function is_alive(entity) {
    return entity != null && entity.alive && entity.hp > 0.0
}
```

This is an additional change after the floating-point/clamp improvement in
[the initial report](README.md). All implementation and test changes are in
SQGI. SqLegends is used only as a workload.

## Results

The standalone [SQGI benchmark](table_benchmark.nut) mixes live entities,
dead entities without an `hp` field, zero health, null entities, and integer
health. It warms 2000 calls and measures one million calls, including the
Squirrel driver loop. Both builds use JIT with its default threshold and no
statistics collection, pinned to CPU 6 on the same aarch64 host.

| Seven alternating pairs, median | Before table lowering | After |
| --- | ---: | ---: |
| Predicate benchmark | 270.374 ms | 233.088 ms |
| Frozen 90-second simulation, process wall time | 2.748 s | 2.741 s |

The predicate benchmark takes **13.8% less time**, or **1.16× throughput**, with
identical checksums. The whole simulation difference is about 0.3%, within
run-to-run variation; this is **not evidence of a whole-game speedup**.
See [helper samples](table-timings-final.json) and
[simulation samples](table-game-timings.json).

In the actual simulation, `is_alive` changes from 220,284 interpreted entries
to 1000 warmup entries, one successful framed native execution, and **219,284
successful direct native calls**. Total direct native successes rise from
989,930 to 1,209,214; the new path adds no guard failures to this workload.
The before/after game output matches byte-for-byte in every run.
See [before statistics](table-game-before-stats.txt),
[after statistics](table-game-after-stats.txt), and
[game output](table-game-output.txt).

The game was changing externally during the preceding work. To keep this
comparison stable, 20 headless source/kernel files were copied read-only from
SqLegends into `/tmp/sqgi-table-workload` and both executables ran against that
same snapshot. No original game file was edited. The
[snapshot hashes](table-workload-sha256.json) identify this workload; its counts
should not be compared directly to the earlier snapshot's counts.

## Implementation and safety boundary

`sqjit_llvm_table_predicate.cpp` accepts bounded forward control flow with
literal-key field reads, scalar comparisons, null/identity checks, boolean
negation, and value-preserving `&&`/`||`. Table fields are looked up at runtime;
the numeric field type can change between calls without recompilation.

Arguments stay unchanged and pin their owners. Scratch values and returned
values must be null, boolean, integer or float. The native body uses private
non-owning scalar storage and changes no heap or VM stack slots. Missing
fields, non-table receivers and reference-valued fields fail before committing
anything; the interpreter handles delegation, weak references, metamethods and
errors. No side-exit opt-in is required.

The existing release checks protect the VM temporary and the framed return's
receiver drop. The temporary is cleared only after successful execution of a
path that would overwrite it. A failure after an earlier successful field read
leaves the temporary and output unchanged. The compiler rejects parameter
writes, captured variables, default parameters, loops, calls and heap mutation.
This deliberately keeps ownership and replay rules small enough to audit.

Each field site has a receiver-independent integer slot hint. The new
`SQTable::GetRawSlotHint` checks the key and bounds before using that index,
then falls back to normal lookup when needed. It stores no table pointer or
owning value, so tables can be resized, cleared, replaced or destroyed without
leaving a dangling cached slot. Raw weak-reference tags stay intact and are
handled by fallback.

## Validation

- All **30 JIT-labelled CTests pass**, including the expanded LLVM suite:
  [test log](tests-table-jit.txt).
- The member-cache test passes, including borrowed hint comparisons against
  ordinary lookup over 4096 mutation rounds, 17 receivers and 32 keys:
  [focused tests](tests-table-focused.txt).
- Predicate tests cover short-circuit missing fields, nulls, scalar return
  tags, changing numeric types, receiver fields, rehashing, deletion/reinsertion,
  delegate `_get` and `_cmp` fallback exactly once, weak fields and reference
  returns, release hooks, and failure after a successful earlier read.
- Differential interpreter/native tests exercise all four numeric ordering
  operators and fused branches on table fields, including NaN payloads, signed
  zero, infinities and integers beyond exact double precision.

## Reproduce

The baseline for this follow-up is `/tmp/sqgi-before-table-predicates`, which
already includes the preceding clamp and diagnostics changes. The updated
binary is `build-install-release/sqgi`; `/usr/local/bin/sqgi` is unchanged.

From the SQGI repository:

```sh
cmake --build build-install-release -j4
ctest --test-dir build-install-release -L jit --output-on-failure -j2
ctest --test-dir build-install-release -R '^sqgi_test_cpp_sqmembercache$' --output-on-failure
env -u SQGI_JIT_TRACE SQGI_JIT=1 taskset -c 6 build-install-release/sqgi \
  reports/sqlegends-jit-2026-09-20/table_benchmark.nut
```

The remaining high-frequency gaps are still `write_row` and the targeting
wrappers: they combine conversions, captured state, native calls and writes.
`Targeting.ready` also needs reference-valued/nested field handling. Those
operations need broader lifetime and effect handling than this scalar-field
predicate path.
