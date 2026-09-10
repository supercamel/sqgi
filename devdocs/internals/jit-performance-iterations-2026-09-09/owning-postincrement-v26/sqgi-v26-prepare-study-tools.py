from pathlib import Path
import ast
S=Path('/tmp/sqgi-owning-postincrement-study');P=Path('/tmp/sqgi-v25-self-publication-study')
for relative in ['intrinsic-captures','call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  (S/relative/label).mkdir(parents=True,exist_ok=True)
  t=(P/relative/(label+'.gdb')).read_text().replace(str(P),str(S))
  (S/relative/(label+'.gdb')).write_text(t)
(S/'profiles').mkdir(exist_ok=True)
(S/'profiles/dump.gdb').write_text((P/'profiles/dump.gdb').read_text().replace(str(P),str(S)))
t=Path('/tmp/sqgi-v25-compare-code.py').read_text().replace(str(P),str(S)).replace('precise-length-v24/study','identity-publication-v25/study')
t=t.replace(" assert normalized(old)==normalized(new),(name,'established precise artifact changed beyond pointer materialization')\n result[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':True}"," if name=='recycle':\n  assert len(new)*4==len(old)*4+48 and normalized(old)!=normalized(new),(name,'expected one richer PINCL')\n else:\n  assert normalized(old)==normalized(new),(name,'established precise artifact changed beyond pointer materialization')\n result[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':normalized(old)==normalized(new),'expected_postincrement_growth':name=='recycle'}")
Path('/tmp/sqgi-v26-compare-code.py').write_text(t)
for name in ['kernel-control.py','application-control.py','application-seed17-control.py']:
 t=Path('/tmp/sqgi-v25-'+name).read_text().replace(str(P),str(S))
 lines=t.splitlines()
 for i,l in enumerate(lines):
  if l.startswith('bins='):
   lines[i]="bins={'audit':R/'build-jit-audit-20260909/baseline/sqgi','v25':R/'build-jit-audit-20260909/identity-publication-v25/sqgi','v26':R/'build-jit-audit-20260909/owning-postincrement-v26/sqgi','v26_repeat':R/'build-jit-audit-20260909/owning-postincrement-v26/sqgi'}"
  elif "metadata={'seed':" in l:
   prefix=l[:l.index("'purpose':")]
   lines[i]=prefix+"'purpose':'Five rotating rounds against the audit and accepted V25, with both warmup histories, interpreter references and an identical V26 repeat. Controls retain unchanged benchmark sources and do not reweight full56.'}"
 t='\n'.join(lines)+'\n'
 t=t.replace("command(bins['v24'],0)","command(bins['v25'],0)")
 ast.parse(t);Path('/tmp/sqgi-v26-'+name).write_text(t)
Path('/tmp/sqgi-v26-controls.sh').write_text('''#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
export SQGI_JIT_PRECISE_EXITS=1
study=/tmp/sqgi-owning-postincrement-study
candidate=build-jit-audit-20260909/owning-postincrement-v26/sqgi
for warmups in 5 4; do
 for suite in methods floats; do
  python3 tools/run_member_benchmarks.py --suite "$suite" --sqgi audit=build-jit-audit-20260909/baseline/sqgi --sqgi v25=build-jit-audit-20260909/identity-publication-v25/sqgi --sqgi "v26=$candidate" --sqgi "v26_repeat=$candidate" --runs 5 --warmups "$warmups" --iterations 200000 --cpu 4 --output "$study/$suite-control-w${warmups}.json" > "$study/$suite-control-w${warmups}.log" 2>&1
 done
done
python3 /tmp/sqgi-v26-kernel-control.py > /tmp/sqgi-v26-kernel-control.log 2>&1
python3 /tmp/sqgi-v26-application-control.py > /tmp/sqgi-v26-application-control.log 2>&1
python3 /tmp/sqgi-v26-application-seed17-control.py > /tmp/sqgi-v26-application-seed17-control.log 2>&1
python3 /tmp/sqgi-v26-summarize-controls.py > /tmp/sqgi-v26-control-summary.log
''')
print('Prepared capture and control tools; no measurements started')
