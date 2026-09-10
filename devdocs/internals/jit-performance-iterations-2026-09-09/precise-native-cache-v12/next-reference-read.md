# Follow-up: owning sources in native GET

V12's targeted five-warmup comparison improves owners 1.043603x and event
cases 1.0235–1.0283x versus V11, but transfer cases regress 2.2–2.7% in time.
This is a hypothesis for the next experiment, not implemented behavior.

Transfer reads array-valued fields repeatedly. V12 validates a cache hit and
loads its tag, then sends every reference source back through the checked helper,
which repeats the lookup. The existing assignment already defines a bounded
extension: retain the source, discard a proven non-final temporary, move the
old destination into that temporary, and publish the source. Weak source slots
must still use the resolver, which distinguishes weak dereference semantics.

A native path must load source tag/bits and perform every guard before its
first refcount or canonical-slot write. Check temporary releasability before
adding the source pin, matching the helper's conservative decision. An owning
temporary requires no ancestor journals and masked physical count >1; final
or ancestor-sensitive releases keep the helper. Increment the source before
releasing the old temporary, with explicit source==temporary alias coverage.
Use the same refcount width and mark handling as SQObjectPtr; do not store a
stale pre-increment count if source and temporary alias. Destination/base/key
aliases remain covered by loading source bits first and transferring, rather
than dropping, the old destination. Never carry cache addresses across calls.

Require positive-control helper probes for owning cache and array reads, and
native witnesses for final/non-final userdata, source/temp/destination aliasing,
GC marks, ancestor pins, live/dead weak sources, callback order and both checked
fallback and native paths. Keep the emission-budget retry coverage and measure
method on/off profitability, both warmup histories and the unchanged full mix.
This may remove the reference fallback penalty more effectively than spending
more code on scalar-only cache checks. Broader loop coverage remains a distinct
larger task described in canonical-loop-entry-next.md.
