from pathlib import Path
import json,hashlib,ast,struct
P=Path('/tmp/sqgi-v28-records-probe');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();ns={'struct':struct}
for node in ast.parse(Path('/tmp/sqgi-v28-compare-code.py').read_text()).body:
 if isinstance(node,ast.FunctionDef):exec(compile(ast.Module(body=[node],type_ignores=[]),'normalization','exec'),ns)
for label in ['control','candidate']:
 d=json.loads((P/label/'metadata.json').read_text());assert d['entries']=={'record_updates-loop':4} and d['return_statuses']=={'record_updates-loop:1':4},d
before=ns['words'](P/'control/record_updates-loop.bin');after=ns['words'](P/'candidate/record_updates-loop.bin');assert len(before)*4==len(after)*4==2100 and ns['normalized'](before)==ns['normalized'](after)
(P/'verification.json').write_text(json.dumps({'verified':True,'normalized_equal':True,'before_bytes':2100,'after_bytes':2100,'native_successful_returns_per_binary':4,'control_log_sha256':h(P/'control.log'),'candidate_log_sha256':h(P/'candidate.log'),'limitation':'The same emitted loop does not rule out surrounding VM, allocation, memory-layout or host effects on timing.'},indent=2)+'\n')
print('Records loop unchanged at 2100 bytes; four successful native returns per binary')
