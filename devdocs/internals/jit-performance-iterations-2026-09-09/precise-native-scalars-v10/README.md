# Native scalar array reads and mixed arithmetic, V10

Experimental AArch64 precise tier, enabled by SQGI_JIT_PRECISE_EXITS=1.
This is a targeted, profiled checkpoint; no full-56 V10 aggregate is claimed.
The subsequent V11 experiment extends the array-temporary release proof.

Scalar array GET checks receiver/key tags, bounds, source ownership and the VM
temporary's ownership before any write. It loads the scalar source, moves the
old destination into the VM temporary without reference-count changes, and
publishes the scalar result. The destination may itself own a reference or be
the receiver. Reference/weak sources, owning temporaries and other receiver/key
shapes retain the checked helper. Literal integer GETK also uses this lowering;
known constant-key GET sites retain their earlier path.

ADD/SUB/MUL/DIV integer-type failures can select binary64 lowering when both
operands are numeric and at least one is floating. Integer zero/-1 division
guards still go directly to the checked helper. Integer-only results retain word
arithmetic semantics; nonnumeric inputs exit before effects. Mixed conversion,
signed zero, NaN/infinity and floating division by zero match the interpreter.
Float MOD remains in its existing helper.

The optional paths can grow code. If emission fills the 8 KiB buffer, the same
validated function is emitted again without the new paths. Unsupported shapes
and allocation/install failures do not trigger this retry. A large >64-member-
site fixture requires actual native completion and verifies that optional float
instructions were omitted; short arithmetic fixtures require the corresponding
binary64 instructions to be present.

Validation passes 100/100 selected tests with the option enabled and disabled
in both Release and strict ASan/UBSan. All 41 independent holdouts agree with
JIT-off in both builds. Tests cover scalar tags, mixed arithmetic, integer and
nonnumeric errors, signed zero, extrema, subnormals, NaN/infinity, bounds and key
fallback, receiver aliases, array growth between calls, live/dead weak elements,
and a userdata destination transferred to the temporary. A following GET or
JCMP must release that temporary in interpreter order, after exactly one prior
store. The existing ancestor-pin, combined-drop, raw rollback and loop-mapping
witnesses remain active. As before, sqgi_test_sqgipkg is excluded. x64/QEMU still
has exactly its existing 27 release-order and five result-coverage assertions;
the six other executables pass.

Frozen executable: build-jit-audit-20260909/precise-native-scalars-v10/sqgi,
SHA-256 eb58848e3cd36cad9d484f04a295e64c64bb23b20039cae25142f972295a4984.
Release -O3 -DNDEBUG -g, no PGO/LTO. Source snapshots, a 93-file hash manifest,
the V9 delta, and a byte-exact 26-file patch against the original audited tree
are retained. All 88 original benchmark/test-script/driver hashes are unchanged.

## Targeted comparison and fresh profiles

Five rotating V9/V10/Node rounds, CPU4, n200000 and five warmups:

| Suite | Geometric speedup versus V9 |
|---|---:|
| Owners | **1.059213×** |
| Methods | 0.996583× |
| Members | 1.002499× |

All interpreter checksums agree. Owners improve from approximately 308–309 ns
to 291–292 ns across all ten cases. These subsets do not establish a full-mix
score, application acceptance result, interpreter-parity milestone or default
promotion. Complete rounds and per-case medians are archived alongside this file.

Seven fresh profiles have zero lost samples. Owner self samples show GETK
16.86%, dynamic GET 10.58%, constant SET 10.16%, LOAD 8.72%, contextual release
checks 6.60%, and constant GET 3.23%. ADD/ARITH_OP no longer appear above the
0.5% reporting cutoff. The remaining owning-temporary helper route motivates
V11; profile shares alone are not independent speedup measurements.

## Checked helper-bypass control

The same scalar probe returns through native code 24 times with no guards or
side exits in V9 and V10. Entry breakpoints at six GET/arithmetic helper symbols
record **45 target helper calls in V9 and zero in V10**. Both return the expected
prefix count of 24. This confirms execution of the fast paths, beyond merely
finding floating instructions in the mapping. Debugger timings are excluded.

The initial debugger script read a one-character debug-info array as a complete
prototype name, causing its name filter to miss calls. The positive V9 control
caught that measurement defect. Corrected scripts cast the name to a character
pointer, retain breakpoint objects, and pass the 45-versus-zero control. Initial
scripts, logs and their failed control are preserved with initial- prefixes;
they are superseded and are not evidence of helper bypass.

Raw perf data is retained under the frozen executable directory and identified
by profiles/manifest.json. The broad performance goal remains active. V9's
1.3766× full-mix score must not be relabeled as V10's or multiplied by these
subset results. Further native release lowering, full-mix/both-seed validation,
method/event regression work, x64 repairs and matched PGO/LTO remain outstanding.
