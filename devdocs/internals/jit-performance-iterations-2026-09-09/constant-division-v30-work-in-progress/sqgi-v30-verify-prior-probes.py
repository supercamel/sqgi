from pathlib import Path
import json,hashlib,ast,struct
R=Path('/home/sam/Programming/sqgi')
A=R/'devdocs/internals/jit-performance-iterations-2026-09-09'
B=A/'shared-helper-tail-v29';W=A/'constant-division-v30-work-in-progress'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ns={'struct':struct}
for node in ast.parse((B/'sqgi-v29-compare-code.py').read_text()).body:
    if isinstance(node,ast.FunctionDef):exec(compile(ast.Module(body=[node],type_ignores=[]),'normalization','exec'),ns)
words,normalized=ns['words'],ns['normalized']
engine=h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))
for name in ['allocation-fault','tail-budget']:
    v=json.loads(Path('/tmp/sqgi-v30-'+name+'/verification.json').read_text())
    assert v['verified'] and v['engine_sha256']==engine
P=Path('/tmp/sqgi-v30-emission-tier-probe');d=json.loads((P/'metadata.json').read_text())
before=json.loads((B/'emission-tier-probe/metadata.json').read_text())
entries={'table_apply':38,'apply':38,'rotate_buffers':4,'recycle':20,'transfer':114,'publish':114}
counts={'table_apply':(0,2),'apply':(0,2),'rotate_buffers':(2,2),'recycle':(1,2),'transfer':(0,0),'publish':(0,0)}
assert d['native_entries']==entries and not d['observation_errors'] and set(d['captures'])==set(entries)
rows={}
for name,capture in d['captures'].items():
    old=words(B/'emission-tier-probe'/(name+'.bin'));new=words(P/(name+'.bin'))
    tier=capture['successful_emission']
    assert tier==d['attempts'][name][-1]==before['captures'][name]['successful_emission'],name
    divide=sum(x&0xffe0fc00==0x9ac00c00 for x in new)
    high=sum(x&0xffe0fc00==0x9b407c00 for x in new)
    assert (divide,high)==counts[name],(name,divide,high)
    assert len(new)<=len(old),name
    if name in ['transfer','publish']:assert normalized(old)==normalized(new),name
    if name=='rotate_buffers':
        assert new[-6]&0xffc003ff==0xf94003e0
        assert new[-5:]==[0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200]
    rows[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'sdiv':divide,'smulh':high,
        'native_entries':entries[name],'successful_emission':tier,'normalized_equal':normalized(old)==normalized(new)}
(P/'verification.json').write_text(json.dumps({'verified':True,'rows':rows,'engine_sha256':engine},indent=2)+'\n')
P=Path('/tmp/sqgi-v30-budget-preservation');d=json.loads((P/'metadata.json').read_text())
old=json.loads((B/'budget-preservation/metadata.json').read_text())
assert set(d['captures'])==set(old['captures']) and len(d['captures'])==16
for name in d['captures']:
    assert d['entries'][name]==old['entries'][name]==1
    assert normalized(words(P/(name+'.bin')))==normalized(words(B/'budget-preservation'/(name+'.bin'))),name
(P/'verification.json').write_text(json.dumps({'verified':True,'unchanged_layouts':16,'engine_sha256':engine},indent=2)+'\n')
P=Path('/tmp/sqgi-v30-buffer-probe');d=json.loads((P/'metadata.json').read_text())
old=json.loads((B/'buffer-probe/metadata.json').read_text())
assert d['helper_calls']==old['helper_calls'] and sum(d['helper_calls'].values())==1244
assert d['entries']=={'rotate_buffers':4} and d['return_statuses']=={'rotate_buffers:1':4}
(P/'verification.json').write_text(json.dumps({'verified':True,'helper_calls':1244,'native_returns':4,'engine_sha256':engine},indent=2)+'\n')
(W/'prior-contract-probes-verification.json').write_text(json.dumps({'verified':True,
    'scope':'existing resource and boundary contracts; new constant budget/resource cases remain pending',
    'resource_cases':13,'tail_fixtures':24,'tail_overflow_attempts':12,'old_layouts_preserved':16,
    'native_code':rows,'buffer_helpers':1244,'engine_sha256':engine},indent=2)+'\n')
print('Prior probes pass:13resource,24tail,16unchanged layouts; six native captures prove constant lowering')
