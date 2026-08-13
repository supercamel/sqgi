# Static Analysis With sqgicheck

`sqgicheck` finds definite Squirrel and SQGI API mistakes without executing
the program. It is a separate command installed alongside `sqgi` and
`sqgipkg`.

The checker uses SQGI's bundled Squirrel compiler to produce bytecode and then
abstractly interprets that bytecode. GI names and signatures come from the
same GObject Introspection typelibs used by SQGI, so there is no second lexer,
parser, or hand-maintained copy of library APIs.

## Usage

Check one entry point and its literal local imports:

```sh
sqgicheck main.nut
```

Check several entry points, emit machine-readable diagnostics, or skip local
imports:

```sh
sqgicheck app.nut tools/migrate.nut
sqgicheck --format=json main.nut
sqgicheck --summary main.nut
sqgicheck --no-recursive main.nut
```

`--recursive` is the default. Local imports are resolved in the runtime's
order: the working directory, the importing file's directory, and
`SQGI_APP_SHARE`.

`--summary` writes a one-line report to standard error, so it can be combined
with either text or JSON diagnostics without corrupting standard output. It
reports files checked, diagnostics emitted, and operations whose receiver or
callable was too dynamic to verify:

```text
sqgicheck: checked 24 files; 0 diagnostics; 418 checks skipped for unknown values
```

Exit statuses are:

| Status | Meaning |
| --- | --- |
| `0` | No errors found |
| `1` | One or more source diagnostics |
| `2` | Invalid command-line usage |

## Checks

The initial checker reports:

- Squirrel compiler errors;
- GI namespaces or requested versions that cannot be loaded;
- unknown namespace members, types, enum values, and instance methods;
- definite argument-count mismatches using SQGI's visible-argument rules;
- unknown GObject properties, including constructor property tables;
- unknown signals and detailed `notify::property` signals;
- missing literal `.nut` imports and local-import cycles;
- missing members and wrong arity across statically known local-module exports,
  including exported functions, classes, constructors, static methods,
  instance methods, and inherited script methods.

Close spelling matches include a suggestion:

```text
app.nut:8:6: error SQGI102: Gio.File has no method 'get_paht'
  help: did you mean 'get_path'?
```

JSON output is an array whose entries contain `path`, `line`, `column`,
`severity`, `code`, `message`, and `help` fields.

## Limits

Static analysis is deliberately conservative. Values from dynamic table
lookups, computed import names, callbacks, incompatible control-flow returns,
and APIs with runtime-dependent concrete subtypes may become unknown. The
checker does not report a missing member when it cannot prove the receiver's
type, avoiding speculative errors. Use `--summary` to make those skipped
operations visible.

Only literal strings ending in `.nut` form the recursive project graph.
For those imports, sealed top-level return tables and their statically known
values propagate through the project graph. Nested mutable tables remain open,
and computed imports or incompatible return paths widen to unknown. The
checker does not yet perform full Squirrel value-type checking or prove
general control-flow facts.

## Testing

The native unit suite covers the abstract interpreter, GI resolver,
diagnostics, formatting, nested closures, and in-memory project traversal. An
end-to-end suite covers the command-line interface and real Gio metadata:

```sh
ctest --test-dir build -R sqgicheck --output-on-failure
```

The auditable definition, failure-mode matrix, coverage thresholds, sanitizer
and mutation commands, and platform exclusions are in the
[full-coverage standard](sqgicheck-coverage.md). The release gate requires 100%
eligible functions/lines, at least 95% eligible branches, and an exact
source-anchored rationale for every raw uncovered outcome.
