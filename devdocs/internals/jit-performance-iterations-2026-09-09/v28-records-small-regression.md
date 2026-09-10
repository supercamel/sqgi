# V28 retained smaller records slowdown

V28's fixed replication resolves the original greater-than-5% flags under its
predeclared criterion. It does not show that every application case improved.
For records_4096 at seed17/n200000 with four warmups, the new paired ratio is
1.0186893035: about1.87%longer than V27. Its95%paired-bootstrap interval is
[1.0015154944,1.0371698421]. Including the original controls gives ratio
1.0198291290 and interval[1.0046255580,1.0358561699]. This smaller slowdown is
retained in the accepted evidence and is not attributed conclusively to noise.

All eight cases, both seeds/counts, both warmup histories and every original
flag remain in [the sealed replication](shared-helper-v28/study/records-replication/analysis.json).
The maximum combined upper bound across the investigation is1.0429878855.
The full56 study remains unchanged at1.8813082825×audit speedup. Neither the
first2×milestone nor the Node/GJS targets is met.
