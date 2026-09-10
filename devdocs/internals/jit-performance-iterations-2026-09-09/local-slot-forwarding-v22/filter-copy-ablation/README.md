# Isolated float-copy ablation

Both modes use the exact frozen V22 executable and same diagnostic preload.
The preload matches all 298 normalized instructions in the captured filter_stream
loop; only GP mode restores ten original V21 copy instructions. Both modes perform
the same permission transitions, cache synchronization, matching and logging.
Separate installed-code GDB captures verify those exact ten replacements and no
other normalized code differences. Runtime source and frozen binary are unchanged.

Five rotating rounds run the full eight-application script with two copies of
each mode, both seeds/counts and warmup histories. All interpreter checksums match,
and exactly one generated mapping matches in every measured process. This is a
benchmark-specific diagnostic experiment, not a production specialization or a
replacement for the accepted uninstrumented full56 results.

| Seed/warmups | FP ns | Restored GP ns | FP repeat ns | GP repeat ns | GP/FP |
|---|---:|---:|---:|---:|---:|
| seed17-w5 | 57.910 | 56.300 | 57.870 | 56.410 | 0.972198 |
| seed17-w4 | 58.045 | 56.280 | 57.720 | 56.090 | 0.969593 |
| seed83-w5 | 58.187 | 56.125 | 58.122 | 56.150 | 0.964554 |
| seed83-w4 | 58.005 | 56.350 | 58.080 | 56.662 | 0.971468 |

This isolates the copy-instruction contribution within V22; it does not establish
the cause of the remaining difference from the original audit. ASLR, scheduling
and preload overhead remain possible sources of residual variation. The next
production change should preserve GP copies when forwarding does not apply or
fails, then validate the full unchanged workload mix without this instrumentation.

`prepare.py` regenerates the exact instruction specification from paired captures.
Build with `cc -O2 -fPIC -shared -Wall -Wextra -Werror -o patch.so patch.c`.
`run.py` performs controls; `finish.sh` captures/validates the installed variants.
The preload is Linux/AArch64 diagnostic code, not a concurrent JIT patching API.
