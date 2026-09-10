set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v30-buffer-probe');captures={};counts=collections.Counter();entries=collections.Counter();breakpoints=[];sites={}
returns=collections.Counter();pending={};return_breakpoints={}
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
 def __init__(self,address,op):super().__init__('*'+str(address),internal=True);self.op=op
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'));names=[n for n,c in captures.items() if c['address']<=lr<c['address']+c['mapped_bytes']]
  if not names:return False
  assert len(names)==1;name=names[0];ip=int(gdb.parse_and_eval('$x3'));stack=gdb.parse_and_eval('(SQObjectPtr *)$x1');cl=gdb.parse_and_eval('(SQClosure *)$x2').dereference();proto=cl['_function'].dereference();i=proto['_instructions'][ip]
  assert int(i['op'])==self.op,(name,ip,self.op,int(i['op']))
  k=f'{name}:{ip}:{self.op}';counts[k]+=1
  sites.setdefault(k,dict(name=name,ip=ip,op=self.op,lr_offset=lr-captures[name]['address']))
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=pname(p)
  if name != 'rotate_buffers' or name in captures:return False
  if not captures:
   seen=set()
   for op,symbol in [(10, '_Z22sqjit_a64_precise_stepIL8SQOpcode10ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (13, '_Z22sqjit_a64_precise_stepIL8SQOpcode13ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (13, '_Z22sqjit_a64_precise_stepIL8SQOpcode13ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (14, '_Z22sqjit_a64_precise_stepIL8SQOpcode14ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (14, '_Z22sqjit_a64_precise_stepIL8SQOpcode14ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (15, '_Z22sqjit_a64_precise_stepIL8SQOpcode15ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (16, '_Z22sqjit_a64_precise_stepIL8SQOpcode16ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (17, '_Z22sqjit_a64_precise_stepIL8SQOpcode17ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (18, '_Z22sqjit_a64_precise_stepIL8SQOpcode18ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (19, '_Z22sqjit_a64_precise_stepIL8SQOpcode19ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (1, '_Z22sqjit_a64_precise_stepIL8SQOpcode1ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (20, '_Z22sqjit_a64_precise_stepIL8SQOpcode20ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (21, '_Z22sqjit_a64_precise_stepIL8SQOpcode21ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (23, '_Z22sqjit_a64_precise_stepIL8SQOpcode23ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (24, '_Z22sqjit_a64_precise_stepIL8SQOpcode24ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (26, '_Z22sqjit_a64_precise_stepIL8SQOpcode26ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (29, '_Z22sqjit_a64_precise_stepIL8SQOpcode29ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (2, '_Z22sqjit_a64_precise_stepIL8SQOpcode2ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (30, '_Z22sqjit_a64_precise_stepIL8SQOpcode30ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (37, '_Z22sqjit_a64_precise_stepIL8SQOpcode37ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (39, '_Z22sqjit_a64_precise_stepIL8SQOpcode39ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (3, '_Z22sqjit_a64_precise_stepIL8SQOpcode3ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (40, '_Z22sqjit_a64_precise_stepIL8SQOpcode40ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (45, '_Z22sqjit_a64_precise_stepIL8SQOpcode45ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (46, '_Z22sqjit_a64_precise_stepIL8SQOpcode46ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (4, '_Z22sqjit_a64_precise_stepIL8SQOpcode4ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (6, '_Z22sqjit_a64_precise_stepIL8SQOpcode6ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (8, '_Z22sqjit_a64_precise_stepIL8SQOpcode8ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'), (9, '_Z22sqjit_a64_precise_stepIL8SQOpcode9ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache')]:
    address=int(gdb.parse_and_eval("&'"+symbol+"'"))
    if address not in seen:breakpoints.append(Helper(address,op));seen.add(address)
  native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size']);assert native['_requires_vm_frame'] and address
  instructions=[{k:int(p['_instructions'][j][k]) for k in ['op','_arg0','_arg1','_arg2','_arg3']} for j in range(int(p['_ninstructions']))]
  captures[name]=dict(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size,instructions=instructions)
  (out/(name+'.bin')).write_bytes(bytes(gdb.selected_inferior().read_memory(address,size)))
  breakpoints.append(Enter(address,name));return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)

end
run test/bench_member_workloads.nut --iterations=19 --warmups=0
python
assert set(captures)=={'rotate_buffers'} and all(entries[n]>0 for n in captures)
assert not any(pending.values()),pending
assert sum(entries.values())==sum(returns.values()),(entries,returns)
result=dict(captures=captures,entries=dict(entries),helper_calls=dict(counts),sites=sites,return_statuses=dict(returns))
(out/'metadata.json').write_text(json.dumps(result,indent=2)+'\n')
print('BUFFER_HELPER_PROBE',dict(entries),dict(counts))
end
