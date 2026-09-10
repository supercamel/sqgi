from pathlib import Path
import json,hashlib,ast,struct
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';B=A/'shared-helper-v28';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();ns={'struct':struct}
for node in ast.parse(Path('/tmp/sqgi-v28-compare-code.py').read_text()).body:
 if isinstance(node,ast.FunctionDef):exec(compile(ast.Module(body=[node],type_ignores=[]),'normalization','exec'),ns)
words,normalized=ns['words'],ns['normalized'];P=Path('/tmp/sqgi-v29-emission-tier-probe');d=json.loads((P/'metadata.json').read_text());before=json.loads((B/'emission-tier-probe/metadata.json').read_text())
expected={'table_apply':38,'apply':38,'rotate_buffers':4,'recycle':20,'transfer':114,'publish':114}
assert d['native_entries']==expected and not d['observation_errors'] and set(d['captures'])==set(expected)
rows={}
for name,c in d['captures'].items():
 a=words(B/'emission-tier-probe'/(name+'.bin'));b=words(P/(name+'.bin'));tier=c['successful_emission'];assert tier==d['attempts'][name][-1]
 if name=='rotate_buffers':
  assert tier==before['captures'][name]['successful_emission'] and tier['tier']==3 and tier['shared_helpers']==1
  assert len(a)*4==7408 and len(b)*4==7392
  assert normalized(a[:-10])==normalized(b[:-6])
  assert b[-6]&0xffc003ff==0xf94003e0 and b[-5:]==[0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200]
 else:assert normalized(a)==normalized(b) and tier['shared_helpers']==0,name
 rows[name]={'before_bytes':len(a)*4,'after_bytes':len(b)*4,'native_entries':expected[name],'successful_emission':tier,'normalized_equal':normalized(a)==normalized(b)}
(P/'verification.json').write_text(json.dumps({'verified':True,'rows':rows,'metadata_sha256':h(P/'metadata.json'),'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))},indent=2)+'\n')
P=Path('/tmp/sqgi-v29-budget-preservation');d=json.loads((P/'metadata.json').read_text());before=json.loads((B/'budget-preservation/metadata.json').read_text());assert set(d['captures'])==set(before['captures']) and len(d['captures'])==16
rows={}
for name in d['captures']:
 a=words(B/'budget-preservation'/(name+'.bin'));b=words(P/(name+'.bin'))
 assert d['entries'][name]==before['entries'][name]==1 and normalized(a)==normalized(b),name
 rows[name]={'bytes':len(b)*4,'normalized_equal':True}
(P/'verification.json').write_text(json.dumps({'verified':True,'rows':rows,'metadata_sha256':h(P/'metadata.json'),'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))},indent=2)+'\n')
print('Six native captures and 16 preserved budget layouts verified')
