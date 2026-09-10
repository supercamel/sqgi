from pathlib import Path
import json,re,hashlib,ast,struct,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';W=A/'constant-division-v30-work-in-progress'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for p,v in json.loads((W/'applied-source-manifest.json').read_text()).items():assert h(R/p)==v,p
engine=h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1'));assert engine=='1c99ebf3649ba2fba1cb0d29fd1ffe153dbc21faf992875401d1e02d2c68c262'
ns={'struct':struct}
for n in ast.parse((A/'shared-helper-tail-v29/sqgi-v29-compare-code.py').read_text()).body:
 if isinstance(n,ast.FunctionDef):exec(compile(ast.Module(body=[n],type_ignores=[]),'normalization','exec'),ns)
words,normalized=ns['words'],ns['normalized']
proof={}
for label in ['v29','v30','asan']:
 s=Path('/tmp/sqgi-v30-constant-proof',label+'.log').read_text();assert s.endswith('PROOF_CASES=6 ALL_PASS\n')
 rows=re.findall(r'PROOF (\w+) native=(\d+) side_exits=(\d+) sdiv=(\d+) smulh=(\d+)',s);assert len(rows)==6
 for name,native,exits,div,mul in rows:
  boolean=name=='dload_boolean';assert int(native)==7 and int(exits)==(7 if boolean else 0)
  assert (int(div),int(mul))==((1,0) if label=='v29' or boolean else (0,1)),(label,name)
 proof[label]=rows
P=Path('/tmp/sqgi-v30-constant-budget');discovery={};num=0
pat=r'CASE (\w+) instructions=(\d+) bytes=(\d+) high=(\d+) divide=(\d+) native=(\d+) result=(-?\d+) prefix=(\d+)'
for file in ['discovery.json','discovery2.json','discovery3.json']:
 rows=json.loads((P/file).read_text());assert rows
 for r in rows:
  assert r['returncode']==0 and not r['stderr'],r
  m=re.fullmatch(pat+'\n',r['stdout']);assert m,r
  name=m[1];vals=dict(zip(['instructions','bytes','high','divide','native','result','prefix'],map(int,m.groups()[1:])))
  assert vals['native']==1 and 0<vals['bytes']<=8192 and vals['bytes']%4==0
  discovery[(r['label'],name)]=vals;num+=1
names={name for label,name in discovery};assert all(('v29',n) in discovery and ('v30',n) in discovery for n in names)
for name in names:
 old,new=discovery['v29',name],discovery['v30',name]
 for key in ['instructions','native','result','prefix']:assert old[key]==new[key],(name,key)
 w=words(P/'v30'/(name+'.bin'));assert len(w)*4==new['bytes']
 assert sum(x&0xffe0fc00==0x9ac00c00 for x in w)==new['divide']
 assert sum(x&0xffe0fc00==0x9b407c00 for x in w)==new['high']
 if new['high']==0:assert normalized(w)==normalized(words(P/'v29'/(name+'.bin'))),name
exact={'proto-105-38':(8192,105,0),'proto-105-39':(5676,0,105),'precise-10-71':(8192,10,0),'precise-10-72':(8156,0,10),'precise-10-81':(8192,0,10),'loop_store_flat-100-22':(8192,100,0),'loop_store-100-22':(5796,0,100)}
meta=json.loads((P/'capture-metadata.json').read_text());assert len(meta)==14
for key,r in meta.items():
 assert not r['errors'] and r['exit_code']==0
 base,mode=key.rsplit('-',1);fault=mode=='fault';assert r['fault']==fault and base in exact
 installs=[]
 for request in r['requests']:
  events=request['events'];ins=[e for e in events if e['event']=='install'];assert len(ins)<=1
  if not ins:continue
  installs+=ins;i=ins[0];pos=events.index(i)
  assert events[pos+1:]==[{'event':'install_return','success':not fault}],key
  assert i['success']==(not fault) and i['length']==exact[base][0]
  emits=events[:pos];assert emits and all(e['event']=='emit' for e in emits)
  for n,e in enumerate(emits):
   if not e['constant_division']:
    assert n>0
    prev=dict(emits[n-1]);prev['constant_division']=False
    assert prev==e,(key,'fallback must preserve feature set',prev,e)
  raw=words(P/i['code_file']);assert len(raw)*4==i['length']
  assert (sum(x&0xffe0fc00==0x9b407c00 for x in raw),sum(x&0xffe0fc00==0x9ac00c00 for x in raw))==exact[base][1:]
 assert len(installs)==1
 log=(P/'capture.log').read_text().split('RUN_CASE '+key+'\n',1)[1].split('CASE_VERIFIED '+key,1)[0];m=re.search(pat,log);assert m and int(m[6])==(0 if fault else 1),key
 if fault:assert 'EXEC_FAILURES=1 EXEC_ATTEMPTS=1' in log
 reference=meta[base+'-reference'];a=next(e for q in reference['requests'] for e in q['events'] if e['event']=='install')
 assert normalized(words(P/installs[0]['code_file']))==normalized(words(P/a['code_file'])),key
retry=json.loads(Path('/tmp/sqgi-v30-resource-retry/results.json').read_text());assert len(retry)==24
for r in retry:
 assert r['returncode']==0
 cases=re.findall(pat,r['stdout']);states=re.findall(r'RETRY call=(\d+) proto_attempts=(\d+) loop_attempts=(\d+) retryable=(\d+)',r['stdout']);assert len(cases)==len(states)==3
 fault=r['fault'];precise=r['kind']=='precise';loop=r['kind'].startswith('loop')
 assert [int(c[5]) for c in cases]==([0,1,2] if fault and precise else [0,0,0] if fault else [1,2,3])
 for call,p,l,transient in map(lambda x:map(int,x),states):
  assert p==(2 if precise and fault and call>1 else 1)
  assert l==int(loop)
  assert transient==int(precise and fault and call==1)
 if fault:assert 'EXEC_FAILURES=1 EXEC_ATTEMPTS='+('2' if precise else '1') in r['stderr']
for r in retry:
 if r['label']!='v30':continue
 old=next(a for a in retry if a['label']=='v29' and all(a[k]==r[k] for k in ['kind','blocks','pad','fault']))
 assert re.findall(r'RETRY[^\n]+',old['stdout'])==re.findall(r'RETRY[^\n]+',r['stdout'])
result=dict(verified=True,engine_sha256=engine,source_files=97,proof_fixtures=6,proof_builds=['v29','v30','strict-asan-ubsan'],discovery_runs=num,paired_budget_fixtures=len(names),install_cases=14,repeated_call_cases=24,resource_policy='Unchanged: precise compilation retries on next call after one executable-allocation failure. Private proto and private loop cache the failure and do not retry across three calls. This existing gap is a separate pending runtime improvement; one-install-per-request is not a claim of future retry.',exact_boundaries=exact)
(W/'constant-probes-verification.json').write_text(json.dumps(result,indent=2)+'\n')
for src,name in [('/tmp/sqgi-v30-constant-budget','constant-budget'),('/tmp/sqgi-v30-constant-proof','constant-proof'),('/tmp/sqgi-v30-resource-retry','resource-retry')]:
 dest=W/name;shutil.copytree(src,dest,dirs_exist_ok=True)
for src,dest in [('/tmp/sqgi-v30-constant-budget.cpp','constant-budget/probe.cpp'),('/tmp/sqgi-v30-constant-proof.cpp','constant-proof/probe.cpp'),(__file__,'verify-constant-probes.py')]:shutil.copy2(src,W/dest)
(W/'constant-probe-evidence-sha256.json').write_text(json.dumps({str(p.relative_to(W)):h(p) for name in ['constant-budget','constant-proof','resource-retry'] for p in sorted((W/name).rglob('*')) if p.is_file()},indent=2)+'\n')
print(json.dumps(result,indent=2))
