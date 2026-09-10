from pathlib import Path
import hashlib,json
p=Path('.');h=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
names=['reference.log','strict-reference.log','exec.log','strict-exec.log','new.log','post-reference.log','post-exec.log','cold-reference.log','cold-exec.log']
for n in names:
 s=(p/n).read_text();assert 'FAULT_PROBE_EXIT=0' in s,n
 if n in ['exec.log','strict-exec.log','new.log','post-exec.log','cold-exec.log']:
  assert 'ATTEMPT 0 compiled=0 retryable=1 category=11 count=1 native=0' in s,n
  assert 'ATTEMPT 1 compiled=1 retryable=0 category=0 count=2 native=1' in s,n
 else:assert 'ATTEMPT 0 compiled=1 retryable=0 category=0 count=1 native=1' in s,n
 if n in ['exec.log','strict-exec.log','post-exec.log','cold-exec.log']:assert 'EXEC_FAILURES=1 EXEC_ATTEMPTS=2' in s,n
 if n=='new.log':assert 'SQGI_NEW_FAULTS=1' in s and 'EXPANDED_NEW_FAULT_INJECTED True' in s
(p/'verification.json').write_text(json.dumps({'engine_sha256':h(Path('/tmp/sqgi-scalar-leaf-20260909/libsqgi.so.1')),'probe_sha256':h(p/'probe'),'log_hashes':{n:h(p/n) for n in names},'verified':True},indent=2)+'\n')
print('V27 allocation failures verified against current engine')
