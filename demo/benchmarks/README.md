# SQGI benchmark demos

Small cross-runtime benchmarks for SQGI, Python, Node.js, and GJS.

Run from the repository root:

```sh
demo/benchmarks/run.sh
```

The runner prints tab-separated rows:

```text
runtime  benchmark  iterations  ms  checksum
```

## Workloads

- `numeric`: integer arithmetic in a tight loop.
- `empty-loop`: loop dispatch with a tiny side effect.
- `function-call`: tiny function call overhead.
- `array`: append values, then read them back in reverse.
- `table`: repeated string-key table/object/dict updates.
- `string`: build a larger string from repeated chunks.
- `glib-clock`: repeated `GLib.get_monotonic_time()` calls through GI. This
  runs for SQGI and GJS, and for Python only when PyGObject is installed. Node.js
  is skipped because it has no built-in GObject Introspection bridge.

These are not scientific language shootouts. They are smoke-sized benchmarks
that make SQGI overhead visible across core interpreter work and GI boundary
crossings. Use `--scale=N` to multiply the default iteration counts:

```sh
demo/benchmarks/run.sh --scale=3
```
