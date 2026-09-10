# Precise scalar release checks, V4

Experimental, disabled by default. Scalar values bypass the out-of-line
CanRelease call; every reference and combined drop still uses the original
journal predicate. No ownership assumption or release order changes.

Frozen ordinary Release binary: `build-jit-audit-20260909/precise-scalar-check-v4/sqgi`,
SHA-256 `d3d8e8f612f540356af5883fb1fa2c419ffc0faec10982b4e2e3454b98f0f15c`.
The single-file delta applies after V3's complete audit patch. The exact source
file and hash are archived here.

All 100 selected Release and strict ASan/UBSan tests pass with the option on
and off; all 41 holdouts agree in both builds. This changes only the AArch64
experimental implementation; V3's unchanged shared/x64 validation still applies.

Five rotating rounds compare V3, V4 and Node, CPU 4, 200,000 iterations and five
warmups, with an independent interpreter reference:

| Suite | V4 speedup versus V3 |
| --- | ---: |
| Owners | 1.0776× |
| Members | 1.0161× |
| Methods | 1.0071× |

All owner cases improve 1.0756–1.0793×. Table/class event records improve 1.0435×
and 1.0478×, leaving most of V3's event regression unresolved. None of these
22 cases regresses by more than 5%.

Five paired unchanged kernel runs show no material dynamic_member gain (1.0072×)
and another large array_append slowdown (0.8537×). Other kernels stay within
2.5%. Every row/count/checksum was also checked against the independent JIT-off
kernel reference, which is archived. Array append still needs diagnosis; its
full function is outside the precise compiler's instruction subset, so this
measurement alone does not establish an explanation for the slowdown.

No full 56-component or PGO/LTO acceptance claim is made for V4. The successor study includes a separate five-round, four-warmup V3/V4/V5/Node
owner comparison, reproducing V4's gain at 1.0784× versus V3. Its raw data is
in ../precise-specialized-v5/owners-warmups4.json.

A fresh V4 owner profile (499 Hz user cycles, DWARF/8192, CPU 4, 200,000
iterations, five warmups) reports no lost samples: precise_step 60.59%,
precise_member 17.37%, CanRelease 10.76%. A separate trace records 70 native
returns, zero entry-guard failures and zero side exits. Raw data is frozen with
the binary and hashed in profiles/manifest.json.

The successor's identical-binary kernel control produces an apparent 18.5%
array_append speedup. An isolated route/warmup diagnostic has equal aggregate
native-route counters across audit/V3/V4/V5 and medians within 3%. These controls
do not reproduce a precise-path regression or identify the full-suite variance
mechanism; original full-suite samples remain preserved.
