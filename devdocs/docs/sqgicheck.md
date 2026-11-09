# Static Analysis With sqgicheck

`sqgicheck` finds definite Squirrel and SQGI API mistakes without executing
the checked program. It catches syntax errors, misspelled GI APIs, wrong
argument counts, invalid properties and signals, and mistakes across local
module imports before they become runtime failures.

It is installed alongside `sqgi` and `sqgipkg`.

## How It Works

The checker compiles source with SQGI's bundled Squirrel compiler, then
abstractly interprets the resulting bytecode. GI names, inheritance, methods,
signatures, properties, and signals come from the same GObject Introspection
typelibs used by the runtime. There is no separate parser or hand-maintained
copy of library APIs.

Checking does **not** execute top-level statements, imported modules,
initializers, callbacks, native functions, filesystem operations, subprocesses,
or network operations. It is therefore safe to use on an application entry
point as part of an editor, pre-commit, or CI workflow.

## Install And Verify

A normal SQGI build produces `sqgicheck`:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"

build/sqgicheck --version
```

After `cmake --install`, invoke it as `sqgicheck`. From an uninstalled source
build, use `build/sqgicheck` in the examples below.

The checker needs the same GI typelibs as the application. System typelibs are
found automatically. If an application supplies private typelibs, expose them
with `GI_TYPELIB_PATH`, just as when running SQGI:

```sh
GI_TYPELIB_PATH="$PWD/native/build" sqgicheck main.nut
```

## Quick Start

Given this program:

```squirrel
local Gio = import("Gio")

local file = Gio.File.new_for_path("settings.json")
print(file.get_paht())
```

run:

```sh
sqgicheck main.nut
```

The misspelled method is reported with its source location and a suggestion:

```text
/project/main.nut:4:12: error SQGI102: Gio.File has no method 'get_paht'
  help: did you mean 'get_path'?
```

No output means the checker found no definite error. Use `--summary` when a
visible success result is useful:

```sh
sqgicheck --summary main.nut
```

```text
sqgicheck: checked 1 file; 0 diagnostics; 0 checks skipped for unknown values
```

## Command Reference

```text
Usage: sqgicheck [options] FILE...

Options:
  --format=FORMAT  Diagnostic format: text (default) or json
  --summary        Report files, diagnostics, and unknown-value skips
  --recursive      Check literal local .nut imports (default)
  --no-recursive   Check only files named on the command line
  -v, --version    Print version and exit
  -h, --help       Show help and exit
```

Both `--format=json` and `--format json` are accepted. Options are processed
from left to right, so the last `--recursive` or `--no-recursive` wins. Use
`--` before a filename beginning with a hyphen:

```sh
sqgicheck -- -generated-entry.nut
```

You can check several application entry points in one invocation. A shared
module reached by more than one entry point is checked once:

```sh
sqgicheck app/main.nut worker/main.nut tools/migrate.nut
```

### Exit Status

| Status | Meaning |
| --- | --- |
| `0` | No source errors were found |
| `1` | One or more source diagnostics were emitted |
| `2` | The command line was invalid |

This contract makes the default command directly usable as a CI gate.

## Project And Import Checking

Recursive checking is enabled by default. An import participates in the
project graph when its name is a literal string ending in `.nut`:

```squirrel
local Helpers = import("lib/helpers.nut")
```

Relative local imports use SQGI's resolution order:

1. the current working directory;
2. the directory containing the importing file; and
3. `SQGI_APP_SHARE`, when that environment variable is set.

Absolute imports are used directly. Paths are canonicalized, duplicate imports
are checked once, and cycles are reported.

The checker propagates statically known exports from a module's top-level
return value into its importers. This includes sealed tables, functions,
classes, constructors, static methods, instance methods, and inherited script
methods. For example, it can diagnose both calls below without running either
file:

```squirrel
// lib/model.nut
class Model {
    constructor(path) {}
    function save(force = false) {}
}
return { Model = Model }
```

```squirrel
// main.nut
local Lib = import("lib/model.nut")
local model = Lib.Model() // wrong constructor arity
model.saev()              // unknown method; suggests save
```

Use `--no-recursive` to check only files explicitly named on the command line.
In that mode local module contents and exported values are not followed.

## What Is Checked

### Squirrel source

- lexical and syntax errors from the bundled Squirrel compiler;
- statically known calls to script functions, methods, and constructors with
  the wrong number of arguments;
- missing members on statically known local-module exports; and
- missing, unreadable, or cyclic local imports.

### GI namespaces and types

- unavailable namespaces and explicitly requested versions;
- unknown namespace functions, constants, types, enum/flag members, static
  functions, constructors, instance methods, fields, and inherited members;
- definite argument-count mismatches using SQGI's script-visible arguments;
- return values that flow into subsequent member and method checks; and
- SQGI's generated async method aliases, raw async aliases, built-in helpers,
  JSON helper table, and Cairo/GStreamer metadata adaptations.

### GObject properties and signals

- property assignment and literal `get_property`/`set_property` names;
- constructor property tables passed through `sqgi.new_object`;
- literal signal names passed to `connect` and `emit`; and
- detailed `notify::property` signal names.

The checker follows GObject inheritance and implemented interfaces when
resolving these names.

## Diagnostics

Text diagnostics use the conventional `path:line:column` form, followed by a
stable code, message, and optional help line. Diagnostics are sorted by path,
location, code, and message, making output deterministic.

| Code | Meaning |
| --- | --- |
| `SQGI000` | The internal compiler VM could not be created |
| `SQGI001` | Squirrel compilation failed |
| `SQGI100` | A GI namespace or requested version could not be loaded |
| `SQGI101` | A statically known namespace, type, enum, table, or class has no such member |
| `SQGI102` | A statically known instance has no such method |
| `SQGI103` | A function, method, constructor, or `import` call has the wrong arity |
| `SQGI104` | A statically known GObject has no such property |
| `SQGI105` | A statically known GObject has no such signal |
| `SQGI110` | An entry file or literal local import could not be read or resolved |
| `SQGI111` | The local import graph contains a cycle |

Close spelling matches produce a `did you mean ...?` help message where a
single useful suggestion can be made.

## JSON Output

Use JSON when another tool will consume the results:

```sh
sqgicheck --format=json main.nut
```

Standard output contains one JSON array. A clean result is `[]`. Each
diagnostic has exactly these fields:

```json
[
  {
    "path": "/project/main.nut",
    "line": 4,
    "column": 12,
    "severity": "error",
    "code": "SQGI102",
    "message": "Gio.File has no method 'get_paht'",
    "help": "did you mean 'get_path'?"
  }
]
```

`--summary` remains safe with JSON: diagnostics are written to standard output
and the summary is written to standard error.

## Understanding `--summary`

Static analysis sometimes reaches an operation whose receiver or callable
cannot be proven. The checker skips that operation rather than guessing and
possibly producing a false error. `--summary` exposes how often this happens:

```text
sqgicheck: checked 24 files; 0 diagnostics; 418 checks skipped for unknown values
```

A nonzero skipped count is not an error. It is a review signal: a lower count
usually means the checker understood more of the program, while a high count
may identify heavily dynamic code where additional static checking is not
possible. Counts are deterministic for the same source and metadata.

## Editor And CI Workflows

The default text format works with tools that recognize
`path:line:column` compiler diagnostics. Configure the tool to run from the
project root so local-import resolution matches normal SQGI execution:

```sh
sqgicheck --summary app/main.nut
```

For a simple GitHub Actions or other CI step:

```yaml
- name: Check Squirrel source
  run: build/sqgicheck --summary app/main.nut worker/main.nut
```

Build or install any private native module and its typelib before this step,
then set its paths for the checker:

```yaml
- name: Check Squirrel source with private GI modules
  env:
    GI_TYPELIB_PATH: ${{ github.workspace }}/native/build
    SQGI_APP_SHARE: ${{ github.workspace }}/share/myapp
  run: build/sqgicheck --summary main.nut
```

Because status `1` means source diagnostics, no extra shell logic is required
to fail the job. Use JSON only when a reporting tool needs structured output.

## Conservative Limits

`sqgicheck` reports errors only when it can establish them. It deliberately
does not guess through:

- computed member, property, signal, or import names;
- arbitrary values returned by callbacks or native calls;
- incompatible values merged from different control-flow paths;
- nested mutable module data; or
- concrete runtime subtypes selected by plugins or external state.

Those values become unknown and relevant operations contribute to
`--summary`. This avoids speculative errors in dynamic Squirrel code.

The checker is not currently a general scalar type checker. It does not, for
example, prove that every integer/string value passed to a Squirrel function
has the intended application-level type, prove arbitrary control-flow facts,
or report unused values. Its focus is definite compiler, API-shape, and
project-structure mistakes.

## Troubleshooting

### A namespace works at runtime but reports `SQGI100`

Run `sqgicheck` in the same environment as `sqgi`. In particular, make sure
the required `.typelib` is installed or its directory is present in
`GI_TYPELIB_PATH`, and request the same namespace version in the source.

### A local import reports `SQGI110`

Run from the same working directory as the application and check the literal
path's spelling. For packaged layouts, set `SQGI_APP_SHARE` to the directory
that contains shared application scripts. The diagnostic help lists the
locations that were searched.

### A dynamic mistake is not reported

Run with `--summary`. If the relevant value is unknown, the checker
intentionally avoids a speculative diagnostic. Prefer literal imports and
member names, and return sealed top-level module tables when practical, to
make more of the program statically visible.

## Testing And Coverage

Run the checker unit, CLI, corpus, and staged-install tests with:

```sh
ctest --test-dir build -R sqgicheck --output-on-failure
```

The [full-coverage standard](sqgicheck-coverage.md) documents the failure-mode
matrix, exact coverage gate, sanitizer suite, mutation tests, and justified
platform exclusions. The release gate requires 100% eligible function and line
coverage, at least 95% eligible branch coverage, and a source-anchored rationale
for every raw uncovered outcome.
