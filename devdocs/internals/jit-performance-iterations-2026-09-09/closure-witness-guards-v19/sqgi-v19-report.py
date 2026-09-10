from pathlib import Path
import json,hashlib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'closure-witness-guards-v19'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());c=json.loads((D/'regression-control-summary.json').read_text())
ratio=s['totals']['sqgi'];rows=[]
for group,v in s['groups'].items():rows.append(f"| {group} | {v['speedup']:.6f}× |")
reg='\n'.join(f"- {r['suite']}/{r['name']}: {(1/r['speedup']-1)*100:.3f}% slower than audit." for r in s['regressions_over_5pct']) or 'None exceed 5% in this batch.'
control=[]
for label,d in c.items():
 if label=='native_call_captures':continue
 control.append(f"- {label}: geometric time ratio V19/V18 {d['geomean_v19_over_v18']:.6f}; cases over 5% slower: {', '.join(d['regressions_over_5pct_against_v18']) or 'none'}.")
route={name:json.loads((D/'witness-route'/f'{name}.json').read_text()) for name in ['contracts','intrinsics']}
hits=sum(map(len,route.values()));dead=sum(r['type']=='OT_NULL' for a in route.values() for r in a)
text=f'''# V19: fold closure lifetime checks into existing identity helpers

V19 removes the separate eight-instruction lifetime check at guarded closure lookups.
The existing C++ helper receives a retained SQWeakRef instead of the raw expected
closure pointer. It validates the weak object's type before borrowing the current
member and comparing identities. A dead witness remains dead if the allocator
reuses the former closure's address. Guards stay at their existing execution point,
without strong closure pins or new effects. Direct whole-prototype calls retain
the earlier separate check before argument materialization.

This follows the V18 regression investigation. The corrected, activated tests
remain authoritative; see [V18's correction](../precise-integer-compare-v18/validation-correction.md)
before relying on earlier targeted-test claims. Existing frozen evidence is unchanged.

## Measurement

The unchanged equal-weight 56-component mix is **{s['speedup']:.9f}× faster than audit**.
This is nearly flat against V18; the 0.14% cross-batch aggregate difference is not
a demonstrated overall gain. Paired controls show small call improvements but
pressure is 2.3–3.4% slower than V18. See [the regression investigation](regression-investigation.md).
Time ratios to Node/GJS are **{ratio['node']['geomean']:.6f}× / {ratio['gjs']['geomean']:.6f}×**;
nearest-rank p90 ratios are **{ratio['node']['p90']:.6f}× / {ratio['gjs']['p90']:.6f}×**.
The original performance goal remains active, including the 2× first milestone,
interpreter profitability, full target, x64 repairs, and matched fresh PGO/LTO.

| Suite | Speedup over audit |
|---|---:|
{chr(10).join(rows)}

Second application seed/count speedup: {f['applications_seed83']['speedup']:.6f}×.
Full-mix regressions remain in the score:

{reg}

Both four- and five-warmup controls use five rotating rounds, the unchanged full
15-kernel and seven-float scripts, interpreter references, and identical-candidate
repeat labels. These are diagnostic controls, not replacement score components.

{chr(10).join(control)}

JIT-on/off time ratios: owners {f['profitability']['owners']['geomean_on_off']:.6f},
methods {f['profitability']['methods']['geomean_on_off']:.6f}, integer root
{f['profitability']['roots']['per_case']['root_integer']:.6f}. The source and all
56 per-case values, tails, rounds, host snapshots, and both application seeds
are retained. Array-append variability from earlier iterations remains open.

## Correctness and route evidence

- Release and strict ASan/UBSan: 100/100 tests with precise exits enabled and
  default settings, in each configuration. Both binaries pass all 41 holdouts.
- Detailed test logs require the ten generated-code groups, loop adaptation and
  lifetime contracts, and the new native-closure lifetime marker. Release actually
  reuses the removed native closure address; sanitizer permits allocator quarantine.
- The new native test warms a real compiled math loop, releases its observed
  native closure, checks weak death, installs a different native function at the
  reused address, and requires a native guard failure and the replacement result.
- GDB observes {hits} helper calls across the existing closure and new native
  lifetime tests, including {dead} null/dead witnesses; every dead witness returns
  guard failure. No helper treats recycled raw addresses as live identities.
- Eight benchmark code captures compare V18/V19: retained weak witnesses become
  existing helper arguments and redundant emitted guards disappear. The array
  append artifact remains structurally unchanged. Comparisons mask relocated wide
  constants and branch offsets; they are structural evidence, not equivalence
  proofs for arbitrary masked constants.
- Five canonical precise functions retain their decoded exact exits and native
  stores/comparison. Seven fresh profiles report zero lost samples.
- x64/QEMU retains the same 32 known assertions (27 release order, five member
  result coverage), with six of seven executables passing. This is an open defect,
  not a passing cross-backend claim.

## Reproduction and retained artifacts

`binary.sha256`, 95-file `source-manifest.json`, unchanged original 88 benchmark/
script hashes, the four-file V18 delta, and the reconstructable 28-file combined
runtime/test patch identify the build. The additional tracked source is the
previously unchanged intrinsic test. The frozen executable and raw profiles live
in `build-jit-audit-20260909/closure-witness-guards-v19`.

Use the archived gates and measurement scripts from the repository root. Builds,
tests, GDB and sampling profiles did not overlap accepted timing. Retained native
test executables use their retained engine through `LD_LIBRARY_PATH` pointing to
that build's `native-validation` directory; its resolved dependency and hashes
are included. Release uses GCC 13.3, O3/DNDEBUG/debug symbols, int64/double on
AArch64 CPU 4. No PGO/LTO is included. All earlier artifact hashes were verified
before updating the mutable progress report.
'''
(D/'README.md').write_text(text)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md'
main.write_text(main.read_text()+f'''\n\n## V19: closure witness helper guards\n\nV19 folds lifetime checks into the existing closure identity helper and retains\nweak witnesses. The new native-closure address-reuse contract executes a real\ncompiled loop and rejects stale inlined math after closure death. Four 100-test\nruns and both 41-holdout sets pass; the same 32 x64 assertions remain open.\n\nUnchanged full56 speedup is {s['speedup']:.9f}× audit; Node/GJS geometric ratios\n{ratio['node']['geomean']:.6f}/{ratio['gjs']['geomean']:.6f}, p90\n{ratio['node']['p90']:.6f}/{ratio['gjs']['p90']:.6f}. Both warmup histories, repeated\ncontrols, exact per-case regressions and seven fresh profiles are retained in\n[the V19 evidence](jit-performance-iterations-2026-09-09/closure-witness-guards-v19/README.md).\nThe original performance goal remains active.\n''')
p=A/'precise-next-steps.md';p.write_text(p.read_text()+'''\n\n## V19 checkpoint\n\nClosure weak checks now run inside the existing identity helpers. Preserve the\nnew native-closure address-reuse test and V18's activated test requirements.\nReview closure-witness-guards-v19/README.md and the fresh profiles for the measured\nlimits. Postfix increment currently falls back when its result destination owns\na reference: consider the existing checked non-final assignment proof, guarding\nthe integer source and every release before either publication. Same-slot\npost-increment and final-release/ancestor cases need explicit generated witnesses.\nAlso investigate loop-guard-followup.md and weak-identity-followup.md in the V19
evidence: repeated borrowed lookup and closure guards account for 26.24% of the
fresh float profile. Pressure remains 2.3–3.4% slower than V18 despite smaller
code. No unmeasured hoist or replacement identity scheme is accepted.
Wider canonical loop/call coverage, x64 repairs, array-append variance and matched\nfresh PGO/LTO remain open. Preserve the unchanged full goal and benchmark weights.\n''')
print('Wrote V19 report and progress notes')
