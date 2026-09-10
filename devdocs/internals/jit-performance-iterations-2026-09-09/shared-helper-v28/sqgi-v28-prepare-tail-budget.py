from pathlib import Path
D=Path('/tmp/sqgi-v28-tail-budget');D.mkdir(exist_ok=True)
names=[];lines=[]
for pad in range(1,25):
 name=f'budget_pad_{pad}';names.append(name)
 padding='local padding=1515847680;'+''.join(f'padding={1515847680+j};' for j in range(1,pad))
 lines.append(f'function {name}(r,x) {{ r.count=r.count+1; local s=0; local flag=!x; if(flag) s=s+1;'+padding+'s=s+x;'*25+'return s+r.tail; }')
 lines.append(f'local r{pad}={{count=0,tail=7}}; if({name}(r{pad},2)!=57 || r{pad}.count!=1) throw "bad {pad}";')
(D/'functions.nut').write_text('\n'.join(lines)+'\n')
t=Path('/tmp/sqgi-v28-emission-tier-probe/capture.gdb').read_text().replace('/tmp/sqgi-v28-emission-tier-probe',str(D)).replace("names={'rotate_buffers','recycle','transfer','publish','table_apply','apply'}",'names=set('+repr(names)+')')
src=Path('/tmp/sqgi-v27-budget-refined/candidate.gdb').read_text();start=src.index('mutated={}');end=src.index("capture=Capture('/home",start);mutation=src[start:end]
needle="attempt=Attempt('/home";idx=t.index(needle);t=t[:idx]+mutation+'''tails=collections.defaultdict(list)
class Tail(gdb.Breakpoint):
 def stop(self):
  try:
   name=name_of(gdb.parse_and_eval('proto'))
   if name not in names:return False
   tails[name].append({'attempt':len(attempts[name])-1,'tier':int(gdb.parse_and_eval('tier')),'shared_helpers':bool(gdb.parse_and_eval('shared_helpers')),'body_bytes':int(gdb.parse_and_eval('buf.size'))})
  except Exception as exc:errors.append(str(exc));print('TAIL_OBSERVATION_ERROR',exc)
  return False
tail=Tail('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc:1127',internal=True)
'''+t[idx:]
a=t.index('run test/bench_member_workloads.nut');b=t.index('\npython\nresult=',a);t=t[:a]+'run '+str(D/'functions.nut')+t[b:]
t=t.replace("'observation_errors':errors}","'observation_errors':errors,'mutated':mutated,'tails':dict(tails)}")
t=t.replace("assert set(captures)==names", "assert len(mutated)==24\nassert set(captures)==names")
(D/'capture.gdb').write_text(t)
print('Prepared 24 native tail-overflow fixtures; not executed')
