set pagination off
set confirm off
set breakpoint pending on
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v26-probes/budget-refined/control');captured={};entries=collections.Counter();breakpoints=[]
class Entry(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):entries[self.name]+=1;return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference()
  if int(p['_name']['_type'])!=0x08000010:return False
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if not name.startswith('budget_') or name in captured:return False
  native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size'])
  assert bool(native['_requires_vm_frame']) and address and size
  raw=bytes(gdb.selected_inferior().read_memory(address,size));(out/(name+'.bin')).write_bytes(raw)
  (out/(name+'.asm')).write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+size),to_string=True))
  captured[name]=dict(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size,instructions=int(p['_ninstructions']))
  breakpoints.append(Entry(address,name));return False
mutated={}
class Mutate(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference()
  if int(p['_name']['_type'])!=0x08000010:return False
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if not name.startswith('budget_pad_') or name in mutated:return False
  count=0
  for ip in range(int(p['_ninstructions'])):
   i=p['_instructions'][ip]
   if int(i['op'])==2 and 1515847680<=int(i['_arg1'])<1515847744:
    # The destination is an otherwise unused diagnostic local. Replace its
    # assignment with a legal jump to the following instruction (four native
    # bytes), allowing an exact code-size boundary without changing results.
    gdb.execute('set variable proto->_instructions[%d].op = 28'%ip,to_string=True)
    for field in ['_arg0','_arg1','_arg2','_arg3']:
     gdb.execute('set variable proto->_instructions[%d].%s = 0'%(ip,field),to_string=True)
    count+=1
  assert count==int(name.split('_')[-1]),(name,count)
  mutated[name]=count;return False
mutation=Mutate('sqjit_a64_compile_precise',internal=True)
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run /tmp/sqgi-v26-probes/budget-refined/functions.nut
python
assert len(captured)==32 and set(entries)==set(captured),(len(captured),len(entries))
assert all(v>0 for v in entries.values())
assert len(mutated)==32
(out/'mutations.json').write_text(json.dumps(mutated,indent=2)+'\n')
(out/'metadata.json').write_text(json.dumps(dict(captures=captured,entries=dict(entries)),indent=2)+'\n')
print('BUDGET_CAPTURE',len(captured),'actual native functions')
end
