# JSON optimization — 2026-09-18

SQGI's JSON implementation now uses bounded SIMD scans, locale-independent
numeric conversions, reusable escape storage, and direct scalar traversal.
No third-party JSON implementation or new runtime library dependency was added.
The numeric conversion helper uses the C++17 standard library's floating-point
`to_chars` and `from_chars`; the rest of the runtime retains its C/C++11 settings.

## Implementation

- SSE2 on supported x86 targets, NEON on supported ARM targets, and a scalar
  fallback scan strings and whitespace. Loads occur only when at least 16 bytes
  remain. Inputs need neither padding nor alignment, including at page ends.
- Unescaped strings are interned directly from the input. Escaped strings reuse
  one lazily allocated scratch buffer per parse; ordinary spans are copied in
  bulk rather than appended byte by byte.
- Integer conversion avoids `printf`/`strtoll` on the common path, with checked
  signed-64-bit boundaries. Floating-point conversion uses bounded, locale-free
  standard-library routines. Range failures retain the prior GLib fallback.
- Serialization reads primitive array/table values directly, avoiding repeated
  public VM stack operations. Every non-primitive remains rooted on the VM stack
  before recursion or `_tojson` execution. No backing-array pointer survives a
  callback; callbacks can resize containers, reenter JSON, and collect garbage.
- Parsing inserts directly into newly created, rooted arrays/tables. It does not
  construct a second JSON DOM or bypass user-visible hooks on existing objects.

Floating-point output now uses shortest round-trippable spelling; its textual
representation can differ from the old GLib output. Floating values still retain
an exponent or decimal point, including `-0.0`. This preserves numeric round trips
and float types, not byte-identical serialized text. Key order remains the table's
iteration order. Error handling, depth limits, and `_tojson` remain supported.

[RapidJSON's internals](https://rapidjson.org/md_doc_internals.html) informed the
bounded SIMD and numeric-conversion approach. No RapidJSON source was copied.
A baseline `perf` sample of numeric-array stringify attributed 27.67% of samples
to libc's floating-point printf-buffer routine alone; its call chain went through
GLib's formatting path. Raw profile: `/tmp/sqgi-json-before.perf`.

## Validation

- Full x86-64 LLVM-JIT runtime suite: **137/137 passed** (unrelated sqgipkg test excluded).
- ASan + UBSan JSON and extra-coverage tests: **7/7 passed**.
- Dependency-free native-backend JSON and extra-coverage tests: **7/7 passed**.
- Scalar and SIMD scanners compared against independent byte loops across byte
  values, alignments, vector boundaries, and protected-page endings.
- 100,000 generated binary64 bit patterns checked when finite: formatting is
  checked against libc `strtod`, parsing against independently printed 17-digit
  decimals, with bitwise round trips. Additional cases cover subnormals, negative
  zero, extreme values, long decimals, and numeric overflow/underflow fallback.
- Integration tests cover int64 boundaries, float types, malformed grammar,
  duplicate keys, escaping and embedded NUL, callback reentry, container resizing,
  garbage collection, and recovery after callback errors. Existing cycle and
  deterministic fuzz tests remain enabled.
- ARM64 cross-compiled NEON and scalar scan/number tests **passed under QEMU**.
  This validates those components on ARM64; full GI application execution and
  ARM hardware performance have not been measured.

Reproduce the ARM64 component check (cross-toolchain/sysroot required):

```sh
aarch64-linux-gnu-g++ -std=c++17 -O2 -Isrc \
  test/cpp/test_json_fast.cpp src/sqgi_json_numbers.cpp \
  -o /tmp/json-fast-arm64
qemu-aarch64-static -L /usr/aarch64-linux-gnu /tmp/json-fast-arm64
# Add -DSQGI_JSON_SCALAR to exercise the fallback.
```

## Performance

The comparison uses a preserved binary whose SHA-256 matches the original JSON
report, plus the optimized binary, Node 26.9.0, GJS 1.80.2, and Python 3.12.2.
Runtime order rotates across five process rounds on CPU 0. Each process warms one
full batch before timing. The original six fixtures remain unchanged; integer
arrays, long strings, and whitespace-heavy documents add coverage for the new
paths. See the [harness methodology](../demo/benchmarks/json/README.md).

All **675 timed samples** passed checksum and complete final-document checks.
Every original fixture hash matches the baseline report. All 27 cases improved
in median time versus the preserved binary; improvements range from **1.04× to
9.94×**, with a median of **1.89×**. The smallest change (Unicode parse) is small
enough that it should not be read as a robust speedup. SQGI beats Node in five
cases: all three long-string cases, wide-object stringify, and Unicode stringify.

Times below are **microseconds per operation**, medians of five rounds.

| Document | Operation | Before | After | Speedup | Node | GJS | Python |
|---|---|---:|---:|---:|---:|---:|---:|
| small_message | parse | 0.932 | 0.629 | 1.48× | 0.387 | 0.453 | 1.274 |
| small_message | stringify | 0.816 | 0.445 | 1.83× | 0.141 | 0.645 | 2.007 |
| small_message | roundtrip | 1.889 | 1.124 | 1.68× | 0.579 | 1.179 | 3.409 |
| integer_array | parse | 219.553 | 147.336 | 1.49× | 38.477 | 75.922 | 215.451 |
| integer_array | stringify | 346.054 | 65.798 | 5.26× | 51.445 | 110.700 | 195.940 |
| integer_array | roundtrip | 590.238 | 217.726 | 2.71× | 88.935 | 184.705 | 417.345 |
| long_strings | parse | 137.381 | 23.468 | 5.85× | 35.256 | 72.238 | 69.447 |
| long_strings | stringify | 101.040 | 10.167 | 9.94× | 16.732 | 75.873 | 272.508 |
| long_strings | roundtrip | 243.198 | 33.786 | 7.20× | 50.524 | 148.905 | 349.786 |
| whitespace | parse | 30.349 | 16.056 | 1.89× | 12.519 | 17.458 | 28.924 |
| whitespace | stringify | 19.975 | 9.220 | 2.17× | 4.703 | 13.027 | 23.549 |
| whitespace | roundtrip | 46.376 | 27.339 | 1.70× | 13.127 | 20.658 | 38.371 |
| numeric_array | parse | 545.993 | 213.211 | 2.56× | 139.267 | 206.422 | 423.053 |
| numeric_array | stringify | 1099.941 | 360.100 | 3.05× | 109.687 | 342.185 | 845.455 |
| numeric_array | roundtrip | 1739.926 | 584.430 | 2.98× | 237.402 | 542.052 | 1286.258 |
| records | parse | 469.739 | 320.894 | 1.46× | 163.488 | 151.092 | 336.881 |
| records | stringify | 343.911 | 148.931 | 2.31× | 63.925 | 209.901 | 388.479 |
| records | roundtrip | 812.719 | 469.733 | 1.73× | 227.320 | 361.851 | 737.554 |
| wide_object | parse | 125.332 | 94.189 | 1.33× | 70.515 | 81.947 | 82.307 |
| wide_object | stringify | 79.027 | 28.449 | 2.78× | 49.099 | 45.636 | 68.311 |
| wide_object | roundtrip | 210.057 | 126.431 | 1.66× | 124.581 | 122.532 | 151.615 |
| nested | parse | 8.850 | 5.860 | 1.51× | 4.019 | 4.344 | 6.646 |
| nested | stringify | 5.780 | 3.060 | 1.89× | 1.361 | 4.558 | 8.946 |
| nested | roundtrip | 16.152 | 10.273 | 1.57× | 5.777 | 9.687 | 15.833 |
| escaped_unicode | parse | 52.359 | 50.371 | 1.04× | 41.319 | 63.238 | 75.356 |
| escaped_unicode | stringify | 26.724 | 13.183 | 2.03× | 20.374 | 9.788 | 37.948 |
| escaped_unicode | roundtrip | 67.665 | 39.760 | 1.70× | 37.803 | 61.121 | 82.570 |

The biggest remaining gaps include integer-array parse (3.8× Node) and
numeric-array stringify (3.3× Node, down from about 10×). Unicode round-trip and
wide-object round-trip are close in this run, but that is not a general parity
claim for JSON. These are warm repeated-document library workloads.

[Raw samples, binaries, sources, and output sizes](benchmark-results/json-optimized-2026-09-18.json).

```sh
python3 demo/benchmarks/json/run.py \
  --sqgi /tmp/sqgi-jit-llvm/sqgi \
  --baseline-sqgi /tmp/sqgi-json-baseline/sqgi \
  --node /tmp/sqgi-modern-node/node-v26.9.0-linux-x64/bin/node \
  --runs 5 --mib 16 --cpu 0 \
  --output docs/benchmark-results/json-optimized-2026-09-18.json
```
