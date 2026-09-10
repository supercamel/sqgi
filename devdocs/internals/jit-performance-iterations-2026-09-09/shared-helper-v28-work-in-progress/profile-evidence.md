# V27 evidence supporting the shared-helper experiment

V27 full56 is1.878306123×audit. The buffer cases take371.28/372.005 ns,
30.14/30.01×Node and20.32/18.25×GJS respectively. They lead the GJS tail.
The fresh member profile retains GETK8.33%, release checks4.98%, LOAD4.00%,
dynamic GET3.51%, and SET helpers. Percentages are flat samples, not speedups.

A GDB emission probe observes rotate_buffers fail tiers6,5,4,3 before fitting
tier2 at7884 bytes. Four actual native entries execute that artifact. The probe
code matches the independently captured V27 artifact after pointer normalization.
Tier2 lacks owning reads/copies/stores and native comparisons; shared helper
setup may recover some of those paths without changing the code limit.

All other sampled precise functions fit tier6, so the draft should preserve their
existing layouts. Verify this with fresh captures and paired timings after a
build. The V27 controls remain active; the draft is still unapplied/uncompiled.
Use the checked probe in cold-literal-lookup-v27-work-in-progress/emission-tier-probe
and /tmp/sqgi-v27-verify-emission-tiers.py for the current evidence.
