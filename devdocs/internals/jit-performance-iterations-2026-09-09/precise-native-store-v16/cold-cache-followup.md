# Follow-up: omit cache probes that cannot hit

The first five-round/five-warmup direct control finds 1.227467x owner speed,
1.015738x method speed and 1.013126x member speed versus V15. Transfer cases
improve 3.99–5.38%; publish_table takes about 3.4% longer. Four-warmup controls,
full-mix timing and profiles must remain authoritative; this is not yet a
repeated-regression diagnosis or a replacement for any accepted sample.

There is a statically provable inefficiency in the frozen publish bytecode:
SETs at IP1/IP3/IP5 address three distinct literal cache groups (current,
caption,count), each before any earlier use of its group. Each activation starts
with null cache slots and this function has no backedge. These three cached
native-store attempts therefore always miss before invoking the same helper as
V15. Omitting their impossible cache-hit paths is a general compiler option,
not a function-name or workload special case. Whether that removes the measured
slowdown needs a fresh frozen comparison.

For each cache site, conservatively consider a hit possible if a previous
bytecode uses the same cache group OR the site lies within any backward-branch
span. The second condition preserves first-use sites that may hit in subsequent
iterations. Earlier conditional sites need not dominate: retaining an extra
probe is safe. Do not omit a probe when a later IP can execute first through a
backedge. Validate the rule against full CFG/branch targets, not source order
alone. Unsupported CFG shapes must keep the old emission.

For definitely cold cached SETs, retain any eligible direct integer-array path;
only disable the cache probe. The ordinary helper still receives and populates
the cache for later sites. Constant-key table/instance stores with no direct
array lowering can go straight to the existing helper. Do not skip the store,
change its release proof, or keep cache state alive across calls. Existing strong,
weak, alias, ancestor, result-write and polymorphic-store witnesses remain.
Add native-route checks that later same-group sites and loop-first sites retain
fast stores; compare helper counts and code size. Do not remove large-function
coverage checks merely because the emission budget changes.

No such optimization is included in V16. First finish its measurements, profiles
and archive. Re-evaluate the remaining owner PINCL/DLOAD/JCMP costs from those
profiles, then broader guarded-intrinsic or canonical-loop coverage. The full
56-component target and matched fresh PGO/LTO confirmation remain open.

The same definitely-cold proof could also omit impossible cached GET probes,
while retaining direct array reads and later same-group reads. Evaluate both
read and store sites as a general cache-emission rule rather than restricting it
to the observed publisher. Existing cached-reference witnesses must still
exercise actual hits after priming. If code compaction makes the current large-
function fixture fit a richer tier, retain or strengthen its positive coverage
and construct a genuinely over-budget fixture for fallback; do not simply drop
the fallback assertion. This broader option is also not implemented in V16.
