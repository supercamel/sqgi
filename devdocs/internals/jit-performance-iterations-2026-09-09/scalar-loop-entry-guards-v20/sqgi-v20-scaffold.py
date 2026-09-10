from pathlib import Path
import re
pairs={'closure-witness-guards-v19':'scalar-loop-entry-guards-v20','precise-integer-compare-v18':'closure-witness-guards-v19','/tmp/sqgi-closure-witness-guard-study':'/tmp/sqgi-scalar-entry-guard-study','closure-witness-delta.patch':'scalar-entry-delta.patch','v19':'v20','v18':'v19','V19':'V20','V18':'V19'}
pattern=re.compile('|'.join(map(re.escape,sorted(pairs,key=len,reverse=True))))
conv=lambda s:pattern.sub(lambda m:pairs[m[0]],s)
for name in ['gates.sh','measure.sh','analyze.py','native-summary.py','exit-code.py','kernel-control.py','call-capture.py','extra-call-capture.py','control-summary.py']:
 Path('/tmp/sqgi-precise-v20-'+name).write_text(conv(Path('/tmp/sqgi-precise-v19-'+name).read_text()))
s=conv(Path('/tmp/sqgi-freeze-v19.py').read_text());s=s.replace("previous=json.loads((P/'source-manifest.json').read_text()); extra='test/cpp/test_sqjit_intrinsics.cpp'; assert h(O/extra)==h(Path('/tmp/sqgi-precise-before-v20')/extra); previous[extra]=h(O/extra); changed=", "previous=json.loads((P/'source-manifest.json').read_text()); changed=")
s=s.replace('assert len(changed)==4','assert len(changed)==3')
s=s.replace("assert '[coverage] executed AArch64 native closure lifetime contract' in detail", "assert '[coverage] executed AArch64 native closure lifetime contract' in detail\n  assert '[coverage] executed AArch64 scalar loop entry guard contracts' in detail")
Path('/tmp/sqgi-freeze-v20.py').write_text(s)
S=Path('/tmp/sqgi-scalar-entry-guard-study');(S/'profiles').mkdir(exist_ok=True)
(S/'profiles/dump.gdb').write_text(conv(Path('/tmp/sqgi-closure-witness-guard-study/profiles/dump.gdb').read_text()))
# Five canonical precise functions are unaffected; call captures use a new decoder.
print('Prepared V20 gates, freeze, timing, profiles, and capture drivers')
