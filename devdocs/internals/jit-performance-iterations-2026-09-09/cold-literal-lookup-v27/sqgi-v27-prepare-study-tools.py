from pathlib import Path
import ast
P=Path('/tmp/sqgi-owning-postincrement-study');S=Path('/tmp/sqgi-cold-literal-lookup-study')
def advance(t):
 for a,b in [('identity-publication-v25','__PREVIOUS__'),('owning-postincrement-v26','cold-literal-lookup-v27'),('sqgi-owning-postincrement-study','sqgi-cold-literal-lookup-study'),('v26','__NEW__'),('V26','__NEWUP__'),('v25','v26'),('V25','V26'),('__NEW__','v27'),('__NEWUP__','V27'),('__PREVIOUS__','owning-postincrement-v26')]: t=t.replace(a,b)
 return t
for relative in ['intrinsic-captures','call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  (S/relative/label).mkdir(parents=True,exist_ok=True)
  (S/relative/(label+'.gdb')).write_text((P/relative/(label+'.gdb')).read_text().replace(str(P),str(S)))
(S/'profiles').mkdir(exist_ok=True)
(S/'profiles/dump.gdb').write_text((P/'profiles/dump.gdb').read_text().replace(str(P),str(S)))
for name in ['measure-initial.sh','captures.sh','verify-exit-code.py','kernel-control.py','application-control.py','application-seed17-control.py','controls.sh','summarize-controls.py']:
 t=advance(Path('/tmp/sqgi-v26-'+name).read_text())
 if name=='controls.sh':t=t.replace('for suite in methods floats;', 'for suite in floats;')
 if name=='summarize-controls.py':t=t.replace("pilot=group in ['owners','members'];", "pilot=group in ['owners','members','methods'];")
 if name.endswith('.py'):ast.parse(t)
 Path('/tmp/sqgi-v27-'+name).write_text(t)
t=advance(Path('/tmp/sqgi-freeze-v26.py').read_text())
t=t.replace('executed 13 AArch64 generated-code groups','executed 14 AArch64 generated-code groups')
t=t.replace("  assert '[coverage] executed AArch64 owning post-increment contracts' in detail", "  assert '[coverage] executed AArch64 cold literal lookup contracts' in detail\n  assert '[coverage] executed AArch64 owning post-increment contracts' in detail")
t=t.replace("probes=json.loads(Path('/tmp/sqgi-v27-probes/verification.json').read_text());assert probes['verified']", "for probe in ['method-probe','budget-refined']:\n probes=json.loads(Path('/tmp/sqgi-v27-'+probe+'/verification.json').read_text());assert probes['verified']")
t=t.replace("(D/'owning-postincrement-delta.patch')", "(D/'cold-literal-lookup-delta.patch')")
t=t.replace('Ten independent', 'Eleven independent')
ast.parse(t);Path('/tmp/sqgi-freeze-v27.py').write_text(t)
t=advance(Path('/tmp/sqgi-v26-compare-code.py').read_text())
start=t.index(" if name=='recycle':")
end=t.index("for relative in",start)
t=t[:start]+''' if name=='recycle':
  assert normalized(old)==normalized(new),(name,'unrelated owner code changed')
 else:
  assert len(new)>len(old) and normalized(old)!=normalized(new),(name,'expected cold literal lookup code')
 result[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':normalized(old)==normalized(new),'expected_cold_lookup_growth':name!='recycle'}
'''+t[end:]
ast.parse(t);Path('/tmp/sqgi-v27-compare-code.py').write_text(t)
t=advance(Path('/tmp/sqgi-v26-verify-study.py').read_text()).replace('80926f469e88e85b0311f03ad81e570b75bb4d7fd4222feb402380f96e970855','368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa')
t=t.replace("code['recycle']['before_bytes']==7296", "code['recycle']['before_bytes']==7344")
t=t.replace("assert all(v['normalized_equal'] for k,v in code.items() if k!='recycle')", "assert all(v['normalized_equal'] for k,v in code.items() if k not in ['transfer','publish','table_apply','apply'])\nassert all(code[k]['after_bytes']>code[k]['before_bytes'] for k in ['transfer','publish','table_apply','apply'])")
ast.parse(t);Path('/tmp/sqgi-v27-verify-study.py').write_text(t)
print('Prepared V27 freeze, study, captures, controls and verification; no execution or freeze yet')
