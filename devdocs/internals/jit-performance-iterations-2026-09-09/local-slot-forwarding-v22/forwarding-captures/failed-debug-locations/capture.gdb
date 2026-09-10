set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json,hashlib,struct
out=pathlib.Path('/tmp/sqgi-local-slot-forwarding-study/forwarding-captures');events=[];active={};installed={};finishes=[]
def readbuf(address):
 b=gdb.Value(address).cast(gdb.lookup_type('SQJitA64Buffer').pointer()).dereference();size=int(b['size'])
 assert 0<=size<=8192
 return bytes(gdb.selected_inferior().read_memory(address,size))
class Finished(gdb.FinishBreakpoint):
 def __init__(self,event):super().__init__(gdb.newest_frame(),internal=True);self.event=event
 def stop(self):
  e=self.event;after=readbuf(e['buffer']);e['changed']=int(gdb.parse_and_eval('$x0'))!=0;e['after_bytes']=len(after)
  (out/(e['id']+'-after.bin')).write_bytes(after)
  if not e['changed']:assert after==(out/(e['id']+'-before.bin')).read_bytes()
  else:assert 'offsets' in e,e
  return False
class Forward(gdb.Breakpoint):
 def stop(self):
  frame=gdb.newest_frame();address=int(frame.read_var('buf'));slots=int(frame.read_var('slots'));before=readbuf(address)
  e=dict(id='event-'+str(len(events)),pid=gdb.selected_inferior().pid,buffer=address,slots=slots,before_bytes=len(before));events.append(e);active[(e['pid'],address)]=e
  (out/(e['id']+'-before.bin')).write_bytes(before);finishes.append(Finished(e));return False
class Commit(gdb.Breakpoint):
 def stop(self):
  f=gdb.newest_frame();address=int(f.read_var('buf'));e=active[(gdb.selected_inferior().pid,address)]
  n=e['before_bytes']//4+1;v=f.read_var('offsets')['_M_impl']['_M_start'];e['offsets']=[int(v[i]) for i in range(n)]
  return False
class Installed(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name not in ['filter','channels','pressure','integration','retained','branching','helper_control','direct_call_kernel','float_call_kernel','branch_call_kernel']:return False
  code=p['_jit'].dereference()['_loop_code'];entry=int(code['entry']);size=int(code['size'])
  if not entry:return False
  raw=bytes(gdb.selected_inferior().read_memory(entry,size));pid=gdb.selected_inferior().pid
  matches=[e for e in events if e['pid']==pid and e.get('changed') and raw.startswith((out/(e['id']+'-after.bin')).read_bytes())]
  assert matches,(name,pid)
  installed[name]=[e['id'] for e in matches];(out/(name+'-installed.bin')).write_bytes(raw)
  return False
forward=Forward('sqjit_a64_forward_local_slots',internal=True)
commit=Commit('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp:542',internal=True)
installed_break=Installed('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468',internal=True)
end
run test/bench_float_workloads.nut --iterations=1003 --warmups=1
run test/test_jit_perf_correctness.nut --bench --iterations=1003 --warmups=1 --seed=17
python
assert len(installed)==10,installed
assert all('changed' in e for e in events)
(out/'events.json').write_text(json.dumps(events,indent=2)+'\n')
(out/'installed.json').write_text(json.dumps(installed,indent=2)+'\n')
print('FORWARD_CAPTURED',len(events),'attempts;',len(installed),'installed loop mappings matched exact postpass bytes')
end
