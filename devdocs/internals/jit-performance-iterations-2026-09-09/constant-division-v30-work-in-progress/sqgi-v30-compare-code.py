from pathlib import Path
import struct,json,ast
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';S=Path('/tmp/sqgi-constant-division-study');P=A/'shared-helper-tail-v29/study'
ns={'struct':struct}
for n in ast.parse((A/'shared-helper-tail-v29/sqgi-v29-compare-code.py').read_text()).body:
 if isinstance(n,ast.FunctionDef):exec(compile(ast.Module(body=[n],type_ignores=[]),'normalization','exec'),ns)
words,normalized=ns['words'],ns['normalized'];result={}
def row(old,new):
 counts=lambda w:{'sdiv':sum(x&0xffe0fc00==0x9ac00c00 for x in w),'smulh':sum(x&0xffe0fc00==0x9b407c00 for x in w)}
 return {'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':normalized(old)==normalized(new),'before_arithmetic':counts(old),'after_arithmetic':counts(new)}
expected={'recycle':(7344,7328,1,2),'transfer':(3572,3572,0,0),'publish':(2984,2984,0,0),'table_apply':(3940,3928,0,2),'apply':(3940,3928,0,2),'rotate_buffers':(7392,7364,2,2)}
for name in ['recycle','transfer','publish','table_apply','apply','rotate_buffers']:
 if name=='rotate_buffers':
  old=words(S/'intrinsic-captures/control/rotate_buffers.bin');new=words(S/'intrinsic-captures/candidate/rotate_buffers.bin')
 else:old=words(P/'profiles'/(name+'-frame.bin'));new=words(S/'profiles'/(name+'-frame.bin'))
 v=row(old,new);e=expected[name];assert (v['before_bytes'],v['after_bytes'],v['after_arithmetic']['sdiv'],v['after_arithmetic']['smulh'])==e,(name,v)
 # Independent current-engine tier probes already verified feature selection and native entries.
 assert normalized(new)==normalized(words(Path('/tmp/sqgi-v30-emission-tier-probe')/(name+'.bin'))),name
 if name in ['transfer','publish']:assert v['normalized_equal']
 if name=='rotate_buffers':
  assert new[-6]&0xffc003ff==0xf94003e0 and new[-5:]==[0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200]
  v['shared_helper_layout']=True
 result[name]=v
for relative in ['call-regression-captures','call-regression-captures/extra']:
 root=S/relative;a=json.loads((root/'control/metadata.json').read_text());b=json.loads((root/'candidate/metadata.json').read_text());assert a.keys()==b.keys()
 for name in sorted(a):
  old=words(root/'control'/(name+'.bin'));new=words(root/'candidate'/(name+'.bin'));v=row(old,new)
  assert 0<len(new)*4<=8192
  assert b[name]['requires_vm_frame']==a[name]['requires_vm_frame'] and b[name]['stack_live_slots']==a[name]['stack_live_slots'],name
  assert [(w['type_bits'],w['tag_offset']) for w in a[name]['weak_witnesses']]==[(w['type_bits'],w['tag_offset']) for w in b[name]['weak_witnesses']],name
  v['new_native_route']=False;v['native_route_retained']=True
  v['needs_arithmetic_diff_review']=not v['normalized_equal']
  result[name]=v
assert len(result)==18
(S/'native-code-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
