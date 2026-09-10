from pathlib import Path
oldstudy='/tmp/sqgi-local-slot-forwarding-study';newstudy='/tmp/sqgi-transactional-float-copies-study'
def adapt(s):
 return s.replace('local-slot-forwarding-v22','__NEW__').replace('receiver-entry-guards-v21','local-slot-forwarding-v22').replace('__NEW__','transactional-float-copies-v23').replace('v22','__23__').replace('v21','v22').replace('__23__','v23').replace(oldstudy,newstudy).replace('local-slot-forwarding-v23','local-slot-forwarding-v22')
files=['measure.sh','analyze.py','native-summary.py','exit-code.py','kernel-control.py','call-capture.py','extra-call-capture.py','control-summary.py','application-control.py','application-summary.py','application-seed17-control.py','application-seed17-summary.py']
for name in files:Path('/tmp/sqgi-precise-v23-'+name).write_text(adapt(Path('/tmp/sqgi-precise-v22-'+name).read_text()))
p=Path('/tmp/sqgi-freeze-v23.py');s=adapt(Path('/tmp/sqgi-freeze-v22.py').read_text())
s=s.replace("previous=json.loads((P/'source-manifest.json').read_text()); extra='test/cpp/test_sqjit_aarch64_emit.cpp'; assert h(O/extra)==h(Path('/tmp/sqgi-precise-before-v23')/extra); previous[extra]=h(O/extra); changed=", "previous=json.loads((P/'source-manifest.json').read_text()); changed=")
s=s.replace("assert '[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)' in detail","assert '[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)' in detail\n  assert '[coverage] executed AArch64 typed-copy forwarding and fallback contracts' in detail")
s=s.replace("(D/'local-slot-delta.patch')","(D/'typed-copy-delta.patch')")
p.write_text(s)
# Include first-seed controls in the serial main measurement before profiling.
p=Path('/tmp/sqgi-precise-v23-measure.sh');s=p.read_text().replace('python3 "$artifact/run_scalar_array_study.py" profiles', 'python3 /tmp/sqgi-precise-v23-application-seed17-control.py > /tmp/sqgi-precise-v23-application-seed17-control.log 2>&1\npython3 "$artifact/run_scalar_array_study.py" profiles');p.write_text(s)
# Captures expecting forwarding still preserve the prior entry-guard checks.
for name in ['route.py','route-summary.py','forward-capture.py','forward-code.py','paired-code.py']:
 Path('/tmp/sqgi-v23-'+name).write_text(adapt(Path('/tmp/sqgi-v22-'+name).read_text()))
# Commit breakpoint moves when typed-copy normalization is added; use source text.
p=Path('/tmp/sqgi-v23-forward-capture.py');s=p.read_text();source=Path('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp').read_text().splitlines();line=source.index('    *buf=output;')+1
s=s.replace('sqjit_backend_aarch64_emit.cpp:542',f'sqjit_backend_aarch64_emit.cpp:{line}');p.write_text(s)
print('Prepared V23 freeze, serial measurement, controls, analysis and code captures; commit line',line)
