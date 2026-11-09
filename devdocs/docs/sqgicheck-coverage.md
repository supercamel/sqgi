# sqgicheck Full-Coverage Standard

For `sqgicheck`, **full coverage** means that the checker has an auditable,
repeatable test for every identified contract and failure mode, and that
measurement shows no untested checker-owned function or executable line.
It does not mean that every possible Squirrel program or third-party typelib
has been enumerated.

## Release gate

A release may claim full `sqgicheck` coverage only when all of these hold:

1. Every row in the failure-mode matrix below has an automated test.
2. Eligible checker-owned C++ reaches 100% function coverage, 100% executable-
   line coverage, and at least 95% branch coverage. “Eligible” excludes only
   compiler-generated arcs and defensive outcomes forbidden by an upstream
   compiler, GLib, or valid-GI-metadata contract.
3. Every raw uncovered line and branch outcome is recorded in
   `tools/sqgicheck_tests/coverage_exclusions.json` with its exact file, line,
   source text, count, reason, and mitigating test. The gate rejects stale
   anchors/counts and any unlisted miss. Exclusions cannot hide ordinary
   hard-to-test behavior.
4. ASan/UBSan tests, bounded fuzz/property tests, the supported demo corpus,
   non-execution tests, staged-install tests, and mutation tests pass.
5. Every surviving mutation is either killed by a new test or documented as
   equivalent with a review note.

"Checker-owned" means these files:

- `tools/sqgicheck/analyzer.cpp`
- `tools/sqgicheck/metadata.cpp`
- `tools/sqgicheck/project.cpp`
- `tools/sqgicheck/main.cpp`

Bundled Squirrel, GLib/GI, the standard library, test code, and inline STL code
are excluded from the numeric metric. Their contracts at the checker boundary
are included in the matrix.

The branch metric is produced with GCC, `-fno-exceptions`, and `-fno-inline`.
This avoids exception arcs and most inlined standard-library decisions. GCC
still attributes some temporary cleanup and static-container arcs to checker
lines; those are individually audited rather than silently discarded.

## Failure-mode matrix

| Area | Required cases |
| --- | --- |
| Process contract | help/version aliases; no input; unknown option; both format syntaxes; invalid/missing format; `--`; option precedence; multiple inputs; exit 0/1/2; stdout/stderr separation |
| Safety | top-level and imported source cannot perform filesystem, process, network, environment, or native-library side effects; no initializers or callbacks execute |
| Squirrel compiler | empty input; valid grammar families; syntax/lexical errors; nested functions; generators; async lowering; source lines/columns; duplicate-diagnostic suppression |
| Abstract values | every value kind; literals; unknown propagation; moves; tables; closures; call results; equal and unequal merge states |
| Control flow | fallthrough; unconditional/conditional jumps; short-circuit `and`/`or`; comparisons; loops and foreach; try/catch/throw; early/tail returns; converging branches; unreachable code |
| Captures | local and transitive outers; mutation via `setouter`; repeated closure contexts; shadowing; unknown captures |
| Calls and arity | fixed, ranged, variadic, alternate and unconstrained arity; type calls; dynamic callees; import arity; visible versus raw GI arguments |
| GI imports | name and version success/failure; built-in `system`; nonliteral import; all runtime-exposed info categories; constants; missing members and suggestions |
| GI types | object/interface/struct type and instance members; constructors/factories; inheritance; implemented interfaces; fields; `__gtype`; unknown types |
| GI returns | scalar, object/interface/struct, enum/flags, void, out/inout, unknown metadata, constructors, async wrappers, dynamic GStreamer subtype |
| GI helpers | signal helpers; properties; detailed `notify`; SQGI built-ins; JSON table; async/raw aliases; Cairo namespace/type overlays |
| Diagnostics | SQGI000/001/100-105/110-111; exact path/line/column/severity/code/message/help; stable sort; deduplication; near/far/tied suggestions |
| Formatting | empty/one/many text and JSON diagnostics; warnings/errors; every JSON escape including control bytes; valid JSON schema |
| Imports | absolute, CWD, importer-relative and `SQGI_APP_SHARE`; precedence; nested, duplicate and shared imports; self/multi-file cycles; missing/unreadable files; canonical `.`/`..`; recursive toggle; exported tables, functions, classes, inheritance and constructor/method arity across module chains |
| Conservative boundary | computed member/import/property/signal names, nested mutable module values, callbacks, uncertain merges and dynamic subtypes never produce speculative errors; skipped unknown-value checks are deterministic and visible in `--summary` |
| Real filesystem | regular/empty/binary/unreadable/missing paths; canonicalization; relative entries; filenames beginning with `-` |
| Real typelibs | portable GLib/GObject/Gio coverage plus optional Gtk/Gst/cairo/Soup/GdkPixbuf cases when installed; absent optional namespaces are reported or skipped explicitly |
| Robustness | deterministic bounded generated programs; malformed-byte input; deep nesting/import graphs; repeated analysis; sanitizer run; stable diagnostics and no crashes/timeouts |
| Corpus | every supported repository demo classified clean, expected diagnostic, or environment-skipped; no unreviewed false positives |
| Installation | `sqgi`, `sqgicheck`, `sqgipkg` share the install `bin`; installed checker runs without `libsqgi`; help/version and real check work from another CWD |
| Mutation | mutations to resolution precedence, arity boundaries, state merging, metadata categories, and exit codes are killed |

## Reproduce the numeric gate

```sh
cmake -S . -B build-sqgicheck-coverage \
  -DCMAKE_BUILD_TYPE=Debug \
  -DSQGICHECK_ENABLE_COVERAGE=ON
cmake --build build-sqgicheck-coverage --target sqgicheck-coverage -j2
```

The strict gate currently reports 100% eligible line, function, and branch
coverage. Raw GCC coverage is also printed so exclusion growth remains visible.

## Reproduce the mutation gate

```sh
cmake -S . -B build-sqgicheck-mutation \
  -DCMAKE_BUILD_TYPE=Debug \
  -DSQGICHECK_ENABLE_MUTATION_TESTS=ON
cmake --build build-sqgicheck-mutation --target sqgicheck-mutation -j2
```

This builds five deliberate variants and requires their specific contract
assertions to fail: exact maximum arity, unequal state merge, CWD/importer
precedence, constant metadata exposure, and process exit status. A crash or an
unrelated assertion does not count as a kill. All five mutations are killed;
there are no surviving mutations.

## Reproduce the sanitizer gate

```sh
cmake -S . -B build-sqgicheck-asan \
  -DCMAKE_BUILD_TYPE=Debug \
  -DSQGI_ENABLE_ASAN=ON
cmake --build build-sqgicheck-asan -j2
ctest --test-dir build-sqgicheck-asan -R sqgicheck --output-on-failure
```

This runs AddressSanitizer, UndefinedBehaviorSanitizer, and leak detection.
The sole leak suppression is the documented bundled-Squirrel expected-token
intern on its longjmp syntax-error path; checker/GI leaks remain unsuppressed.

The gate accepts `SQGICHECK_MIN_LINE_COVERAGE`,
`SQGICHECK_MIN_FUNCTION_COVERAGE`, and `SQGICHECK_MIN_BRANCH_COVERAGE` only for
local gap analysis. CI and release verification use the defaults.

## Justified exclusions and platform limits

The machine-checked source of truth is
`tools/sqgicheck_tests/coverage_exclusions.json`, reviewed 2026-08-12. It
contains two malformed-typelib guard lines and source-anchored branch outcomes
in four groups: GCC-generated cleanup/static-initializer arcs, bundled compiler
bytecode invariants, valid GI metadata invariants, and documented GLib/GI error
contracts. The adjacent mitigation for every entry names the exercised
boundary. There are no unreviewed uncovered outcomes.

GCC coverage is the normative numeric gate; other compilers still run the
behavioral suite. The generated `SqgicheckTest-1.0.typelib` makes GI category
coverage deterministic and requires `g-ir-compiler` for the coverage build.
GLib/GObject/Gio are portable mandatory real-typelib checks. Gtk, Gdk,
GdkPixbuf, GStreamer, Soup, and cairo demo checks run when installed; their
absence is printed as an explicit corpus skip and cannot hide any other
diagnostic.
