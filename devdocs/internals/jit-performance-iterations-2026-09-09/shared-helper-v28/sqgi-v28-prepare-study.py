from pathlib import Path
import hashlib,ast
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-shared-helper-study');old=Path('/tmp/sqgi-cold-literal-lookup-study')
sha=hashlib.sha256(Path('/tmp/sqgi-scalar-leaf-20260909/sqgi').read_bytes()).hexdigest()
def convert(s):
 return (s.replace('v27','v28').replace('V27','V28').replace('v26','v27').replace('V26','V27')
 .replace('cold-literal-lookup-v28','shared-helper-v28').replace('owning-postincrement-v27','cold-literal-lookup-v27')
 .replace('/tmp/sqgi-cold-literal-lookup-study',str(S)).replace('368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa',sha))
for name in ['measure-initial.sh','captures.sh','controls.sh','kernel-control.py','application-control.py','application-seed17-control.py','summarize-controls.py','verify-exit-code.py']:
 Path('/tmp/sqgi-v28-'+name).write_text(convert(Path('/tmp/sqgi-v27-'+name).read_text()))
for relative in ['intrinsic-captures','call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  dest=S/relative;dest.mkdir(parents=True,exist_ok=True);(dest/label).mkdir(exist_ok=True)
  (dest/(label+'.gdb')).write_text(convert((old/relative/(label+'.gdb')).read_text()))
(S/'profiles').mkdir(exist_ok=True)
(S/'profiles/dump.gdb').write_text(convert((old/'profiles/dump.gdb').read_text()))
s=convert(Path('/tmp/sqgi-freeze-v27.py').read_text()).replace('14 AArch64 generated-code groups','15 AArch64 generated-code groups')
s=s.replace("for probe in ['method-probe','budget-refined']:","for probe in ['buffer-probe','budget-preservation','tail-budget']:")
s=s.replace("assert '[coverage] executed AArch64 cold literal lookup contracts' in detail", "assert '[coverage] executed AArch64 cold literal lookup contracts' in detail\n  assert '[coverage] executed AArch64 shared precise helper contracts' in detail")
s=s.replace("cold-literal-lookup-delta.patch","shared-helper-delta.patch")
s=s.replace('Eleven independent','Twelve independent').replace('V28 frozen candidate','V28 frozen shared-helper candidate')
Path('/tmp/sqgi-freeze-v28.py').write_text(s)
# Code comparisons must isolate the shared setup's intended change.
s=convert(Path('/tmp/sqgi-v27-compare-code.py').read_text())
a=s.index(" if name=='recycle':");b=s.index("root=S/'intrinsic-captures'",a)
s=s[:a]+''' assert normalized(old)==normalized(new),(name,'unrelated canonical code changed')
 result[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':True}
'''+s[b:]
s=s.replace("assert normalized(old)==normalized(new),'rotate_buffers unexpectedly changed'", "assert len(old)*4==7884 and len(new)*4==7408 and normalized(old)!=normalized(new),'expected shared tier3 buffer layout'")
s=s.replace("result['rotate_buffers']={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':True}","result['rotate_buffers']={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':False,'shared_helper_layout':True}")
Path('/tmp/sqgi-v28-compare-code.py').write_text(s)
s=convert(Path('/tmp/sqgi-v27-verify-study.py').read_text())
a=s.index('# Preserve the original flags.');b=s.index('summary=json.loads',a)
s=s[:a]+"# No old iteration's regression-resolution exception applies here.\nunresolved=dict(regressions);resolution=None\n"+s[b:]
a=s.index("assert all(v['normalized_equal']");b=s.index('result={',a)
s=s[:a]+"assert all(v['normalized_equal'] for k,v in code.items() if k!='rotate_buffers')\nassert code['rotate_buffers']['before_bytes']==7884 and code['rotate_buffers']['after_bytes']==7408\nassert code['rotate_buffers']['shared_helper_layout']\n"+s[b:]
Path('/tmp/sqgi-v28-verify-study.py').write_text(s)
for p in Path('/tmp').glob('sqgi-v28-*.py'):ast.parse(p.read_text(),filename=str(p))
ast.parse(Path('/tmp/sqgi-freeze-v28.py').read_text())
print('V28 freeze/full-study scripts prepared; old control exceptions removed')
