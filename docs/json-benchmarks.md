# JSON benchmark results — 2026-09-18

This is the pre-optimization baseline. See the [optimized results](json-optimization.md)
for the subsequent implementation and comparison.

SQGI LLVM JIT build versus Node 26.9.0, GJS 1.80.2, and Python 3.12.2.
Intel Core i7-12700, Linux x86-64, CPU 0. Five process rounds per case,
one full warmup batch per process, rotating runtime order. Medians below are
microseconds per operation; smaller is better. All 360 timed samples passed
checksum and complete final-document validation.

SQGI uses the existing `/tmp/sqgi-jit-llvm/sqgi` RelWithDebInfo build, LLVM
bytecode and kernel backends, int64/double. This task changes no runtime code.
These exercise native JSON libraries and allocation; no typed kernels are used.

| Document | Operation | SQGI | Node | GJS | Python | SQGI / Node |
|---|---|---:|---:|---:|---:|---:|
| small_message | parse | 0.935 | 0.385 | 0.456 | 1.270 | 2.43× |
| small_message | stringify | 0.820 | 0.142 | 0.647 | 1.996 | 5.78× |
| small_message | roundtrip | 1.909 | 0.590 | 1.180 | 3.421 | 3.23× |
| numeric_array | parse | 549.496 | 139.391 | 207.244 | 425.556 | 3.94× |
| numeric_array | stringify | 1103.041 | 109.756 | 344.322 | 849.798 | 10.05× |
| numeric_array | roundtrip | 1671.933 | 237.951 | 544.700 | 1286.773 | 7.03× |
| records | parse | 472.723 | 163.901 | 151.921 | 335.059 | 2.88× |
| records | stringify | 342.812 | 63.825 | 209.782 | 390.808 | 5.37× |
| records | roundtrip | 814.901 | 227.104 | 360.927 | 743.476 | 3.59× |
| wide_object | parse | 125.001 | 71.176 | 81.309 | 82.269 | 1.76× |
| wide_object | stringify | 78.784 | 49.474 | 45.836 | 68.660 | 1.59× |
| wide_object | roundtrip | 210.116 | 125.381 | 121.989 | 151.592 | 1.68× |
| nested | parse | 8.906 | 4.160 | 4.377 | 6.807 | 2.14× |
| nested | stringify | 5.803 | 1.366 | 4.593 | 8.906 | 4.25× |
| nested | roundtrip | 16.200 | 5.728 | 9.733 | 15.883 | 2.83× |
| escaped_unicode | parse | 52.079 | 41.051 | 62.662 | 75.321 | 1.27× |
| escaped_unicode | stringify | 26.414 | 20.364 | 9.843 | 38.161 | 1.30× |
| escaped_unicode | roundtrip | 68.682 | 38.065 | 61.832 | 82.594 | 1.80× |

Node is faster in all 18 cases. The largest gap is numeric-array serialization
(about 10×); record serialization is about 5.4× slower. SQGI beats Python in
some small-message, nested serialization, and Unicode workloads, but trails
on the numeric-array workloads. The broader JIT results do not imply parity
between the JSON implementations.

Source inspection suggests useful profiling targets: `src/sqgi_json.c` formats
each float through `g_ascii_dtostr`, copies numeric tokens before parsing, and
walks arrays/tables through the public VM stack API. These are candidates for
measurement, not a profile-proven attribution of the timing gap.

Inputs use exactly representable numbers within the shared numeric range.
Stringification preserves each runtime’s normal numeric spelling and key order;
output sizes are recorded. Unicode input uses escaped JSON; serializer output
uses normal raw Unicode. Round-trip means stringify then parse and therefore
does not parse the same bytes as the standalone parse case. Input preparation,
startup, and validation are excluded; allocation and collection during execution
are included. Results cover warm repeated documents, not varied live traffic.

See the [harness and methodology](../demo/benchmarks/json/README.md) and
[raw samples, hashes, and output sizes](benchmark-results/json-2026-09-18.json).

Reproduce:

```sh
python3 demo/benchmarks/json/run.py \
  --sqgi /tmp/sqgi-jit-llvm/sqgi \
  --node /tmp/sqgi-modern-node/node-v26.9.0-linux-x64/bin/node \
  --runs 5 --mib 16 --cpu 0 \
  --output docs/benchmark-results/json-2026-09-18.json
```
