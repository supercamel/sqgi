from pathlib import Path
import json,hashlib,ast,struct
R=Path('/home/sam/Programming/sqgi');P=Path('/tmp/sqgi-v28-emission-tier-probe');B=Path('/tmp/sqgi-v27-emission-tier-probe')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
module=ast.parse(Path('/tmp/sqgi-v27-compare-code.py').read_text());ns={'struct':struct}
exec(compile(ast.Module(body=[n for n in module.body if isinstance(n,ast.FunctionDef)],type_ignores=[]),'<normalization>','exec'),ns)
words,normalized=ns['words'],ns['normalized'];d=json.loads((P/'metadata.json').read_text());before=json.loads((B/'metadata.json').read_text())
expected={'table_apply':38,'apply':38,'rotate_buffers':4,'recycle':20,'transfer':114,'publish':114}
assert d['native_entries']==expected and not d['observation_errors'] and set(d['captures'])==set(expected)
rows={}
for name,v in d['captures'].items():
 a=words(B/(name+'.bin'));b=words(P/(name+'.bin'));same=normalized(a)==normalized(b)
 assert v['successful_emission']==d['attempts'][name][-1]
 tier=v['successful_emission']
 if name=='rotate_buffers':
  assert tier['tier']>before['captures'][name]['successful_emission']['tier'] and tier['shared_helpers']==1
  assert any(w&0xfc000000==0x94000000 for w in b) and not same
 else:assert same and tier['shared_helpers']==0,name
 rows[name]={'native_entries':expected[name],'before_bytes':len(a)*4,'after_bytes':len(b)*4,'normalized_equal':same,'successful_emission':tier,'attempts':d['attempts'][name]}
result={'verified':True,'binary_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/sqgi')),'rows':rows,'metadata_sha256':h(P/'metadata.json'),'log_sha256':h(P/'capture.log')}
(P/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
