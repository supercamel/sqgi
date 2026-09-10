from pathlib import Path
import json,collections,ast,hashlib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
p=Path('/tmp/sqgi-v28-buffer-probe');rows={}
for label in ['v27','v28']:
 d=json.loads((p/label/'metadata.json').read_text());assert d['entries']=={'rotate_buffers':4};assert d['return_statuses']=={'rotate_buffers:1':4}
 ops=collections.Counter()
 for k,v in d['helper_calls'].items():ops[k.split(':')[-1]]+=v
 rows[label]={'calls_by_opcode':dict(ops),'calls':sum(ops.values()),'metadata_sha256':h(p/label/'metadata.json')}
assert rows['v27']['calls']==1772 and rows['v28']['calls']==1244
assert rows['v27']['calls_by_opcode']['9']==464 and rows['v28']['calls_by_opcode']['9']==8
assert rows['v27']['calls_by_opcode']['14']==76 and rows['v28']['calls_by_opcode']['14']==4
(p/'verification.json').write_text(json.dumps({'verified':True,'rows':rows,'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))},indent=2)+'\n')
ns={};tree=ast.parse(Path('/tmp/sqgi-v27-compare-code.py').read_text());exec('import struct',ns)
for node in tree.body:
 if isinstance(node,ast.FunctionDef):exec(compile(ast.Module(body=[node],type_ignores=[]),'normalization','exec'),ns)
p=Path('/tmp/sqgi-v28-budget-preservation');old=A/'cold-literal-lookup-v27/budget-refined/candidate';d=json.loads((p/'metadata.json').read_text());before=json.loads((old/'metadata.json').read_text());assert set(d['captures'])==set(before['captures']) and len(d['captures'])==16
rows={}
for name in d['captures']:
 assert d['entries'][name]==before['entries'][name]==1
 a=ns['words'](old/(name+'.bin'));b=ns['words'](p/(name+'.bin'));assert ns['normalized'](a)==ns['normalized'](b),name
 rows[name]={'before_bytes':len(a)*4,'after_bytes':len(b)*4,'normalized_equal':True}
(p/'verification.json').write_text(json.dumps({'verified':True,'rows':rows,'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))},indent=2)+'\n')
print('Buffer helpers reduced by 528; all 16 old-fit layouts unchanged')
