With five warmups, V16 and V15 are nearly equal (V16 takes 0.18% longer), while
V16/audit is 1.0902 and the identical V16 repeat/audit is 1.0716. With four
warmups, V16/audit is 0.9058 and the repeat/audit is 0.9684. The identical V16
commands differ by **6.90% in median time** in that second history. Ranges overlap
widely: the five-warmup V15 range is 110.744–149.237 ns, and the four-warmup audit
range is 112.950–157.975 ns. Full-kernel V15/V16 aggregate speedups in these
controls are 1.001539x and 1.005263x; they do not replace the accepted full mix.

A separate diagnostic filters only the timed driver to array_append, retaining
the original function and startup correctness checks. It is explicitly outside
the accepted mix. Five rotating audit/V15/V16 rounds per warmup history give
median times 116.337/116.569/113.969 ns with four warmups and
113.825/114.513/119.456 ns with five. V16/audit ranges from 0.9796 to 1.0495.
Recorded route counters (including startup checks) agree across binaries; V15
and V16 have zero precise side exits. This does not prove identical machine code
or explain the timing differences.

A consistent V16-specific regression is not established by these controls.
The source of the array_append variance remains **unresolved**, and the original
11.08% slowdown remains in the full56 aggregate. No control median replaces an
original sample; no component is reweighted. Endpoint frequency snapshots in
the full-script controls are 2304000 kHz, which does not measure frequency inside
timed regions or establish a cause. Earlier records_4096 variance remains open
as well. These results do not claim that the variance or every possible
warmup-dependent performance effect has been eliminated.
