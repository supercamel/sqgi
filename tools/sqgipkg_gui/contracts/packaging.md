# C-PKG: packaging protocol

Requirements: R-PKG-01 through R-PKG-10; R-SCOPE-03 through R-SCOPE-05.

## Interface version 1

`sqgipkg describe --json` emits capabilities, field schema/templates, CLI option
metadata, host targets, and `protocol_version: 1`.

`sqgipkg check|explain --json --manifest FILE` emits exactly one JSON object to
stdout: `{protocol_version, ok, diagnostics, configurations}`. Failures also
produce this envelope and a nonzero exit code. Diagnostics have `severity`,
`code`, `path` (JSON path array), `message`, and optional file/target. Normal
human-readable modes keep their established text interface.

`--manifest - --base-dir DIR` consumes object JSON from stdin for local inspection
only. It resolves relative paths exactly as a file at DIR/sqgipkg.json would.
It cannot build/clean/write locks. Diagnostic paths use authored keys where known;
unmapped resolution errors point to the document root without guessing.

**C-PKG-01 Shared resolution:** both renderers use the same normalized options,
selected target configurations, diagnostics, and recipe/plan functions. Structured
output is not produced by parsing terminal messages. A plan includes target,
architecture, name, entry, output, runtime selection, native commands, packages,
file inclusion evidence, and unresolved generated outputs.

**C-PKG-02 No side effects:** describe/check/explain do not fetch/build/execute
application hooks. Check may compile Squirrel for syntax without executing it.
File scanning stays within declared inputs and existing scanning semantics.
Local schema-invalid input yields diagnostics while preserving authored data.

**C-PKG-03 Runtime defaults:** runtime_recipe configure commands explicitly set
JIT ON, kernels ON, bytecode backend LLVM, kernel backend LLVM. An explicit
runtime.jit=false sets JIT OFF only. These options appear on reconfiguration too.
Expose requested runtime settings separately from verified binary/build metadata.
Existing runtime metadata cannot be inferred solely from source defaults.

**C-PKG-04 Operations:** classify each current CLI option as a field, invocation,
action, or alias. Invocation arguments stay separate from the manifest. Per-run settings are documented for terminal use. Describe available target/host combinations clearly.

**C-PKG-05 Compatibility:** schema and Squirrel validation agree on supported
fields/types. Unknown legacy data is retained with warnings; strict v2 invalid
data is rejected for check/build. Existing CLI tests must pass.

**C-PKG-06 CLI boundary:** the GUI launches the `sqgipkg` entry point for
check/explain, passing argv directly and JSON through stdin. It cannot call
packaging/build methods. Future Build actions must likewise invoke the CLI
against a saved manifest; no GUI packaging implementation is permitted.

**C-PKG-07 Asynchronous inspection:** check/explain receive exact draft bytes and
base directory through argv/stdin. GTK stays responsive. Cancel terminates and
reaps the inspection process, which executes no application/hooks. Results
retain their draft identity; later edits are visibly stale. Process errors,
invalid output, and unsupported protocol versions are surfaced as errors.

Acceptance IDs: `PKG-protocol`, `PKG-equivalence`, `PKG-inspection`,
`PKG-runtime-defaults`, `PKG-operations`, `PKG-compatibility`, `PKG-cli-boundary`, `PKG-async-inspection`.
