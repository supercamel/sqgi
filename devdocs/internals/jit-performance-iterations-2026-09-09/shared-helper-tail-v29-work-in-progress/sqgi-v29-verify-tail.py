from pathlib import Path
import json,struct,hashlib
p=Path('/tmp/sqgi-v29-tail-budget');d=json.loads((p/'metadata.json').read_text());witnesses=[]
assert not d['observation_errors']
assert len(d['captures'])==24
for n in range(1,25):
 name=f'budget_pad_{n}';c=d['captures'][name];tails=d['tails'][name]
 assert d['mutated'][name]==n and d['native_entries'][name]==1
 assert c['successful_emission']['shared_helpers']==1
 assert c['successful_emission']['tier']==(6 if n<=14 else 4)
 tail=tails[-1];size=tail['body_bytes']+24;raw=(p/(name+'.bin')).read_bytes()
 assert size<=8192 and len(raw)==c['mapped_bytes']
 words=struct.unpack('<6I',raw[tail['body_bytes']:size])
 assert words[0]&0xffc003ff==0xf94003e0
 assert words[1:]==(0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200)
 assert tail['attempt']==len(d['attempts'][name])-1
 for t in tails[:-1]:
  assert t['body_bytes']<=8192 and t['body_bytes']+24>8192
  assert t['attempt']<tail['attempt'] and t['tier']>tail['tier']
  witnesses.append(dict(name=name,failed_tail=t,successful_tail=tail))
assert len(witnesses)==12
assert d['tails']['budget_pad_14'][0]['body_bytes']+24==8192
assert d['tails']['budget_pad_15'][0]['body_bytes']+24==8196
log=(p/'capture.log').read_text();assert 'exited normally' in log and 'AN ERROR HAS OCCURRED' not in log and 'CALLSTACK' not in log
h=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
(p/'verification.json').write_text(json.dumps(dict(verified=True,native_functions=24,tail_overflow_retry_witnesses=witnesses,metadata_sha256=h(p/'metadata.json'),engine_sha256=h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'))),indent=2)+'\n')
print('24 native fixtures; 12 tail-only overflow retries verified')
