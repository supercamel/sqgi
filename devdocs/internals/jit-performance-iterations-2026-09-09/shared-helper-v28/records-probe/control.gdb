set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v28-records-probe/control');captures={};entries=collections.Counter();returns=collections.Counter();helpers=collections.Counter();breakpoints=[]
wanted={'record_updates'}
pending={};return_breakpoints={}
def pname(p):
 if int(p['_name']['_type'])!=0x08000010:return ''
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Returned(gdb.Breakpoint):
 def __init__(self,address):super().__init__('*'+str(address),internal=True);self.address=address
 def stop(self):
  if pending.get(self.address):
   name=pending[self.address].pop();returns[name+':'+str(int(gdb.parse_and_eval('$x0')))]+=1
  return False
class Enter(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):
  entries[self.name]+=1;address=int(gdb.parse_and_eval('$x30'));pending.setdefault(address,[]).append(self.name)
  if address not in return_breakpoints:return_breakpoints[address]=Returned(address)
  return False
class Helper(gdb.Breakpoint):
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'))
  for name,c in captures.items():
   if c['address']<=lr<c['address']+c['mapped_bytes']:
    callee=gdb.parse_and_eval('(SQClosure *)$x0').dereference()['_function'].dereference();helpers[name+':'+pname(callee)]+=1
  return False
class Capture(gdb.Breakpoint):
 def __init__(self,spec,mode):super().__init__(spec,internal=True);self.mode=mode
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=pname(p)
  if name not in wanted:return False
  key=name+'-'+self.mode
  if key in captures:return False
  jit=p['_jit'].dereference()
  if self.mode=='entry':
   if not int(jit['_entry']):return False
   code=jit['_entry'].dereference()['_code']
  else:code=jit['_loop_code']
  address=int(code['entry']);size=int(code['size'])
  if not address or not size:return False
  if not captures:breakpoints.append(Helper('*'+str(int(gdb.parse_and_eval('&sqjit_a64_helper_call_native_closure'))),internal=True))
  captures[key]=dict(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size,requires_vm_frame=bool(jit['_entry'].dereference()['_requires_vm_frame']) if self.mode=='entry' else False)
  (out/(key+'.bin')).write_bytes(bytes(gdb.selected_inferior().read_memory(address,size)))
  (out/(key+'.asm')).write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+size),to_string=True))
  breakpoints.append(Enter(address,key));return False
breakpoints.extend([Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610','entry'),Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468','loop')])
end
run test/bench_application_workloads.nut --iterations=19 --warmups=1 --seed=83
python
assert captures and all(any(k.startswith(name+'-') for k in captures) for name in wanted),captures
assert not any(pending.values()),pending
assert sum(entries.values())==sum(returns.values()),(entries,returns)
result=dict(captures=captures,entries=dict(entries),return_statuses=dict(returns),call_native_closure_helpers=dict(helpers))
(out/'metadata.json').write_text(json.dumps(result,indent=2)+'\n')
print('APPLICATION_CALL_PROBE',dict(entries),dict(returns),dict(helpers))
end
