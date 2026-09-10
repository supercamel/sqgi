from pathlib import Path
import re
S=Path('/tmp/sqgi-closure-witness-guard-study');S.mkdir(exist_ok=True)
pairs={'precise-integer-compare-v18':'closure-witness-guards-v19','precise-cache-proofs-v17':'precise-integer-compare-v18','/tmp/sqgi-precise-integer-compare-study':str(S),'integer-compare-delta.patch':'closure-witness-delta.patch','v18':'v19','v17':'v18','V18':'V19','V17':'V18'}
pattern=re.compile('|'.join(map(re.escape,sorted(pairs,key=len,reverse=True))))
convert=lambda s:pattern.sub(lambda m:pairs[m[0]],s)
for name in ['analyze.py','native-summary.py','exit-code.py','kernel-control.py','call-capture.py','extra-call-capture.py']:
 Path('/tmp/sqgi-precise-v19-'+name).write_text(convert(Path('/tmp/sqgi-precise-v18-'+name).read_text()))
s=convert(Path('/tmp/sqgi-freeze-v18.py').read_text()).replace('assert len(changed)==5','assert len(changed)==4').replace("shutil.copytree(S/'route',D/'route')",'')
s=s.replace("assert '[coverage] executed AArch64 loop adaptation and lifetime contracts' in detail", "assert '[coverage] executed AArch64 loop adaptation and lifetime contracts' in detail\n  assert '[coverage] executed AArch64 native closure lifetime contract' in detail\n  assert '(address reuse=1)' in detail if mode=='release' else True")
Path('/tmp/sqgi-freeze-v19.py').write_text(s)
s=convert(Path('/tmp/sqgi-precise-v18-kernel-control.py').read_text()).replace('Identical frozen V19 binary appears under two labels.', 'Identical frozen V19 binary appears under two labels; V18 is the immediate control.')
Path('/tmp/sqgi-precise-v19-kernel-control.py').write_text(s)
# Capture the same five canonical precise functions using the existing checked driver.
(S/'profiles').mkdir(exist_ok=True)
g=Path('/tmp/sqgi-precise-integer-compare-study/profiles/dump.gdb').read_text().replace('/tmp/sqgi-precise-integer-compare-study',str(S))
(S/'profiles/dump.gdb').write_text(g)
# Final candidate timing is isolated from builds, tests, GDB, and profiles.
s=convert(Path('/tmp/sqgi-precise-v18-measure.sh').read_text())
s='\n'.join(l for l in s.splitlines() if not l.startswith('gdb '))+'\n'
s=s.replace('for mode in profitability profiles; do','for mode in profitability; do')
s+='''python3 /tmp/sqgi-precise-v19-kernel-control.py > /tmp/sqgi-precise-v19-kernel-control.log 2>&1
for warmups in 5 4; do
 python3 tools/run_member_benchmarks.py --suite floats --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v18=build-jit-audit-20260909/precise-integer-compare-v18/sqgi --sqgi "v19=$candidate" --sqgi "v19_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/floats-control-w${warmups}.json" > "$study/floats-control-w${warmups}.log" 2>&1
done
python3 "$artifact/run_scalar_array_study.py" profiles --baseline build-jit-audit-20260909/baseline/sqgi --candidate "$candidate" --output "$study"
gdb -q -batch -x "$study/profiles/dump.gdb" "$candidate" > "$study/profiles/dump.log" 2>&1
for label in control candidate; do
 if [ "$label" = control ]; then binary=build-jit-audit-20260909/precise-integer-compare-v18/sqgi; else binary="$candidate"; fi
 gdb -q -batch -x "$study/call-regression-captures/$label.gdb" "$binary" > "$study/call-regression-captures/$label.log" 2>&1
 gdb -q -batch -x "$study/call-regression-captures/extra/$label.gdb" "$binary" > "$study/call-regression-captures/extra/$label.log" 2>&1
done
'''
Path('/tmp/sqgi-precise-v19-measure.sh').write_text(s)
print('Created V19 freeze, timing, profile, and native capture drivers')
