from pathlib import Path
import ast
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';S=Path('/tmp/sqgi-constant-division-study');old=Path('/tmp/sqgi-shared-helper-tail-study')
def convert(s):
 return s.replace('v29','TEMP_V30').replace('V29','TEMP_UPPER30').replace('v28','v29').replace('V28','V29').replace('TEMP_V30','v30').replace('TEMP_UPPER30','V30').replace('shared-helper-tail-v30','constant-division-v30').replace('shared-helper-v29','shared-helper-tail-v29').replace('/tmp/sqgi-shared-helper-tail-study',str(S)).replace('24b4f8c1961001ffbad7a4735b998a912b87853f93bf71a10eab369a96ea9718','e2d9658d4001b5711069d19f41d431875bf9e5387be06b2cd0b3b9f26d696728')
for name in ['measure-initial.sh','captures.sh','controls.sh','kernel-control.py','application-control.py','application-seed17-control.py','summarize-controls.py','verify-exit-code.py','profile-followup.py']:
 s=convert(Path('/tmp/sqgi-v29-'+name).read_text())
 if name=='profile-followup.py':
  a=s.index("lines += ['## Follow-up checks'");b=s.index("(S/'profile-followup.md')",a)
  s=s[:a]+"lines += ['## Follow-up checks','','Constant positive divisors now use multiply/shift sequences in eligible','private and precise paths. Check the saved instruction counts against the','same-process native captures. Buffer helper count remains 1244 across four','successful native calls; arithmetic changes do not alter helper semantics.','Parent-loop/call coverage and private-path resource retry remain follow-ups.','Profile fractions are not speedup estimates.','']\n"+s[b:]
 Path('/tmp/sqgi-v30-'+name).write_text(s)
 if name.endswith('.py'):ast.parse(s)
for relative in ['intrinsic-captures','call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  dest=S/relative;dest.mkdir(parents=True,exist_ok=True);(dest/label).mkdir(exist_ok=True)
  (dest/(label+'.gdb')).write_text(convert((old/relative/(label+'.gdb')).read_text()))
(S/'profiles').mkdir(exist_ok=True);(S/'profiles/dump.gdb').write_text(convert((old/'profiles/dump.gdb').read_text()))
s=convert(Path('/tmp/sqgi-freeze-v29.py').read_text())
s=s.replace("previous=json.loads((P/'source-manifest.json').read_text()); changed=", "previous=json.loads((P/'source-manifest.json').read_text()); previous.update(json.loads((A/'constant-division-v30-work-in-progress/additional-source-inputs.json').read_text())['files']); changed=")
s=s.replace('assert len(changed)==2','assert len(changed)==8').replace('executed 15 AArch64','executed 16 AArch64').replace('len(manifest)==96','len(manifest)==97').replace('shared-helper-tail-delta.patch','constant-division-delta.patch')
s=s.replace("for probe in ['buffer-probe','budget-preservation','tail-budget']:","for name in ['test-gates-verification.json','prior-contract-probes-verification.json','constant-probes-verification.json']:\n verified=json.loads((A/'constant-division-v30-work-in-progress'/name).read_text());assert verified['verified'] and verified['engine_sha256']==h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))\nfor probe in ['buffer-probe','budget-preservation','tail-budget']:")
s=s.replace("'sqgi_test_cpp_sqjit_aarch64_emit']:","'sqgi_test_cpp_sqjit_aarch64_emit','sqgi_test_cpp_sqjit_arithmetic','sqgi_test_cpp_sqjit_leaf']:")
a=s.index("(D/'README.md').write_text(")
s=s[:a]+'''for name in ['constant-budget','constant-proof','resource-retry']:
 shutil.copytree(A/'constant-division-v30-work-in-progress'/name,D/name)
for name in ['test-gates-verification.json','prior-contract-probes-verification.json','constant-probes-verification.json','verify-constant-probes.py','constant-probe-evidence-sha256.json']:
 shutil.copy2(A/'constant-division-v30-work-in-progress'/name,D/name)
(D/'README.md').write_text("# V30 frozen constant-division candidate — performance acceptance pending\\n\\nAll four 100-test runs and both 41-case holdout runs pass; 16 native groups execute. x64 retains the same 32 known member assertions across eight tests. Original allocation/tail contracts plus constant proof, budget fallback, and repeated-call probes are preserved. An unchanged private proto/loop allocation-failure retry gap remains a follow-up. V29 remains latest accepted full performance result.\\n")
'''
ast.parse(s);Path('/tmp/sqgi-freeze-v30.py').write_text(s)
print('V30 full-study, controls and freeze tools prepared; capture arithmetic comparison still requires V30-specific verifier')
