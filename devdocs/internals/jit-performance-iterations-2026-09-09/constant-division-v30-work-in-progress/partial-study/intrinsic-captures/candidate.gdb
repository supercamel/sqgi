set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-constant-division-study/intrinsic-captures/candidate');captures={};counts=collections.Counter();entries=[]
wanted=['rotate_buffers','event_records']
def pname(p):
 if int(p['_name']['_type'])!=0x08000010:return ''
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Enter(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):counts[self.name]+=1;return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=pname(p)
  if name not in wanted or name in captures:return False
  native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size'])
  if not address or not size:return False
  entries.append(Enter(address,name))
  raw=bytes(gdb.selected_inferior().read_memory(address,size));(out/(name+'.bin')).write_bytes(raw)
  (out/(name+'.asm')).write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+size),to_string=True))
  instructions=[]
  for ip in range(int(p['_ninstructions'])):
   i=p['_instructions'][ip];instructions.append(dict(ip=ip,op=int(i['op']),arg0=int(i['_arg0']),arg1=int(i['_arg1']),arg2=int(i['_arg2']),arg3=int(i['_arg3'])))
  captures[name]=dict(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size,requires_vm_frame=bool(native['_requires_vm_frame']),stacksize=int(p['_stacksize']),parameters=int(p['_nparameters']),instructions=instructions)
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run test/bench_member_workloads.nut --iterations=1003 --warmups=1
python
(out/'metadata.json').write_text(json.dumps(dict(captures=captures,entries=dict(counts)),indent=2)+'\n')
if 'candidate'=='candidate':
 assert captures['rotate_buffers']['requires_vm_frame'] and counts['rotate_buffers']>0
 assert any(i['op']==6 for i in captures['rotate_buffers']['instructions'])
 assert any(i['op']==15 for i in captures['rotate_buffers']['instructions'])
print('INTRINSIC_ROUTE_CAPTURED','candidate',dict(counts))
end
