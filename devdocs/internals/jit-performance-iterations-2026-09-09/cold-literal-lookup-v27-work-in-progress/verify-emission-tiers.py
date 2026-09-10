from pathlib import Path
import json,hashlib,ast,struct
R=Path('/home/sam/Programming/sqgi');P=Path('/tmp/sqgi-v27-emission-tier-probe');S=Path('/tmp/sqgi-cold-literal-lookup-study')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
module=ast.parse(Path('/tmp/sqgi-v27-compare-code.py').read_text());ns={'struct':struct}
exec(compile(ast.Module(body=[n for n in module.body if isinstance(n,ast.FunctionDef)],type_ignores=[]),'<normalization>','exec'),ns)
words,normalized=ns['words'],ns['normalized'];d=json.loads((P/'metadata.json').read_text())
expected={'table_apply':38,'apply':38,'rotate_buffers':4,'recycle':20,'transfer':114,'publish':114}
assert d['native_entries']==expected and not d['observation_errors']
assert set(d['captures'])==set(expected)
rows={}
for name,v in d['captures'].items():
 prior=S/'profiles'/(name+'-frame.bin') if name!='rotate_buffers' else S/'intrinsic-captures/candidate/rotate_buffers.bin'
 a=words(prior);b=words(P/(name+'.bin'));assert normalized(a)==normalized(b),name
 assert v['successful_emission']==d['attempts'][name][-1]
 rows[name]={'native_entries':expected[name],'code_bytes':len(b)*4,'mapped_bytes':v['mapped_bytes'],'successful_emission':v['successful_emission'],'attempts':d['attempts'][name],'normalized_equal_to_independent_capture':True}
assert rows['rotate_buffers']['successful_emission']=={'tier':2,'owning_postincrement':0,'cold_lookups':0}
assert [a['tier'] for a in rows['rotate_buffers']['attempts']]==[6,6,5,5,4,4,3,2]
log=(P/'capture.log').read_text();assert 'EMISSION_TIERS_VERIFIED' in log
assert not any(s in log for s in ['SCRIPT ERROR','AN ERROR HAS OCCURRED','ATTEMPT_OBSERVATION_ERROR','Traceback'])
result={'verified':True,'binary_sha256':h(R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi'),'rows':rows,'metadata_sha256':h(P/'metadata.json'),'log_sha256':h(P/'capture.log')}
(P/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
