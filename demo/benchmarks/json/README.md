# JSON benchmarks

[Latest optimization results](../../../docs/json-optimization.md).

Compare SQGI's `sqgi.json`, Node/GJS `JSON`, and Python's standard `json` module
on the same generated JSON documents. Run from any directory:

```sh
python3 demo/benchmarks/json/run.py \
  --sqgi /path/to/sqgi --node /path/to/node \
  --runs 5 --mib 16 --cpu 0 --output results.json
```

All four runtimes must be installed. `--gjs` and `--python` override their paths.
`--baseline-sqgi /path/to/preserved/sqgi` adds a before/after runtime to the
rotation, with the same correctness checks.
CPU pinning uses Linux `sched_setaffinity`; omit `--cpu` to inherit affinity.

Nine shapes each have parse, compact stringify, and stringify-then-parse cases:

- Small message: fields, booleans, null, strings, fractional coordinates.
- Integer array: 8,192 signed integer values.
- Long strings: 128 strings of roughly 1 KiB, without escapes.
- Whitespace: 64 records encoded with 16-space indentation.
- Numeric array: 8,192 signed, exactly representable fractional values.
- Records: 512 objects with nested arrays, optional parents, and repeated keys.
- Wide object: 1,024 distinct property names and integer values.
- Nested document: 32 nested wrappers around mixed primitive values.
- Escaped Unicode: 256 strings containing multilingual text, emoji, quotes,
  backslashes, and control characters. Input uses JSON Unicode escapes; output
  uses each runtime's normal compact representation.

Each case runs in a fresh process. Fixture loading and initial parsing are
excluded. One full batch warms the case, followed by one timed batch; the default
five process rounds rotate runtime order. Batch size targets 16 MiB of source
JSON, bounded to 100–100,000 operations. This is a repeatable workload size, not
an adaptive minimum-duration measurement. Reported times include allocation,
reference counting/GC that occurs during the batch, and the small result-consumer
loop. There is no forced GC. Process startup and final validation are excluded.

Every iteration consumes the parsed marker or serialized length. After each
sample the runner checks that checksum and decodes the entire final result,
comparing it with the independent Python fixture. Object key order and equivalent
JSON number spellings may differ. Python emits compact UTF-8 JSON with NaN
rejected; no nonstandard encoders or hooks are used. The length checksum accounts
for Squirrel's byte strings, JavaScript's UTF-16, and Python's code points.
The report retains output byte sizes, all samples, medians, fixture hashes,
runner hashes, runtime binary hashes/versions, and JSON implementation source hashes. Throughput comparisons should
account for differing output lengths, particularly integral floats (`1.0`/`1`).

These are warm, repeated-document library benchmarks, not streaming parsers,
cold-start measurements, varied-schema traffic, malformed-input tests, or kernel
benchmarks. The SQGI executable can have its ordinary LLVM JIT enabled, but the
JSON parser and writer themselves are native C implementations. Results primarily
measure those libraries and their object allocation rather than JIT arithmetic.
