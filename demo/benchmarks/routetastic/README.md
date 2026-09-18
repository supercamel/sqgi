# RouteTastic application comparisons

These drivers import the application's existing modules without modifying them.
The local RouteTastic checkout is an explicit external input: source hashes,
board/project hashes and runtime executable hashes are recorded in every report.
Run benchmarks sequentially on an otherwise idle machine.

```sh
python3 tools/run_routetastic_benchmarks.py \
  --repo ../RouteTastic --sqgi /path/to/current/sqgi \
  --baseline /path/to/before/sqgi \
  --board '../RouteTastic/apx rp2040.kicad_pcb' \
  --tasks board_small board search autoroute spatial geometry \
  --rounds 3 --repeats 2 --threshold 1000 --diagnostics \
  --output /tmp/routetastic.json
```

Modes distinguish the interpreter, the saved earlier JIT, the current JIT,
application kernels with and without bytecode JIT, and Vala/native GI geometry.
`--threshold 1` reproduces the aggressive compilation setting used by the earlier
microbenchmarks; `--threshold 1000` (the default) measures the runtime's normal threshold.
Existing spatial and geometry scripts already compare Squirrel/native/kernel
paths internally, so they run once per bytecode-runtime mode.

- `board_small` / `board`: fresh import, rule setup, connectivity and indexed DRC.
- `search`: four deterministic multilayer maze fixtures using `RouteSearch.Engine`,
  including actual priority queues, tables, callbacks and path construction.
- `autoroute`: the full `route_all` pipeline on the example two-net board, with
  connectivity verification and comparison of all generated segment/via geometry.
- `spatial`: the existing application's 4,096-box, 4,096-query benchmark.
- `geometry`: existing public adapters for five geometry operations, 8,192 calls
  per timed pass, including GI or kernel conversion/call overhead.

The first workflow pass plus module import time is recorded separately from later
passes. That first-pass metric includes compilation triggered within the operation
and module loading; it excludes VM process startup. Full process wall time is also
recorded and includes startup, all repetitions, JSON output and teardown. Later
passes use fresh board/search state in the same VM. They are warm with respect to
modules and previously compiled functions, but may still trigger compilation.

Every mode must produce matching application results, not just matching counts.
Board findings, connectivity results, search paths and metrics are compared
recursively; floating values use 1e-10 relative/absolute tolerance. Component runs
check ordered-result checksums. Diagnostics are separate runs and excluded from
reported timing medians. Execution counters indicate native entries, not the
fraction of CPU time spent in native code.

The drivers perform no hardware access, GUI automation, board export, or network
requests. Their only writes are reports/fixtures at the requested output paths.

## Spatial ports

```sh
python3 tools/run_routetastic_spatial_ports.py \
  --repo ../RouteTastic --sqgi /path/to/current/sqgi --node /path/to/node26 \
  --runs 5 --output /tmp/routetastic-spatial.json
```

`export_spatial.nut` exports the tree built by RouteTastic itself. Node, GJS and
Python traverse precisely that tree and query sequence, avoiding differences in
sort tie-breaking. The ports preserve the stack traversal, bounding-box tests,
result-array materialization and ordered checksum. Fixture parsing and tree
construction are outside query timings. This is a cross-language comparison of
one application component, not a port or benchmark of the entire RouteTastic app.

See the [runtime improvement report](../../../docs/routetastic-runtime-improvements.md)
for the measured cache and integer-formatting fixes and reproducible before/after results.
