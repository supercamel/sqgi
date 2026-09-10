from pathlib import Path
root=Path('/tmp/sqgi-v26-probes');root.mkdir(exist_ok=True)
owner=root/'owner';owner.mkdir(exist_ok=True)
budget=root/'budget';budget.mkdir(exist_ok=True)
lines=[]
for n in range(1,81):
 lines.append('function budget_%d(r,n) { local sum=0;for(local i=0;i<n;i++){r.slot=i;%s}return sum;}'%(n,'sum+=r.count;'*n))
lines.append('local r={slot=0,count=3};')
for n in range(1,81):
 lines.append('if(budget_%d(r,3)!=%d || r.slot!=2) throw "budget value";'%(n,9*n))
(budget/'functions.nut').write_text('\n'.join(lines)+'\n')
header='''set pagination off
set confirm off
set breakpoint pending on
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
'''
for label in ['control','candidate']:
 out=owner/label;out.mkdir(exist_ok=True)
 g=header+'''python
import gdb,pathlib,json,re,collections
out=pathlib.Path('OUT');captured={};entries=[];counts=collections.Counter();breakpoints=[]
class Entry(gdb.Breakpoint):
 def stop(self):
  f=gdb.parse_and_eval('(SQObjectPtr *)$x0');entries.append(int(f[3]['_unVal']['nInteger']));return False
class Helper(gdb.Breakpoint):
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'))
  if captured['address']<=lr<captured['address']+captured['mapped_bytes']:counts[lr-captured['address']]+=1
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference()
  if int(p['_name']['_type'])!=0x08000010:return False
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name!='recycle' or captured:return False
  native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size'])
  assert bool(native['_requires_vm_frame']) and address and size
  captured.update(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size)
  (out/'recycle.bin').write_bytes(bytes(gdb.selected_inferior().read_memory(address,size)))
  (out/'recycle.asm').write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+size),to_string=True))
  target=int(gdb.parse_and_eval('&sqjit_a64_precise_step<(SQOpcode)39>'));captured['helper_address']=target
  breakpoints.extend([Entry('*'+str(address),internal=True),Helper('*'+str(target),internal=True)])
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run test/bench_member_owners.nut --iterations=19 --warmups=0
python
assert captured and entries
captured.update(entries=entries,helper_calls=sum(counts.values()),helper_sites=dict(counts))
(out/'metadata.json').write_text(json.dumps(captured,indent=2)+'\\n')
print('POSTINCREMENT_CAPTURE',captured)
end
'''.replace('OUT',str(out))
 (owner/(label+'.gdb')).write_text(g)
 out=budget/label;out.mkdir(exist_ok=True)
 g=header+'''python
import gdb,pathlib,json,collections
out=pathlib.Path('OUT');captured={};entries=collections.Counter();breakpoints=[]
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
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run SCRIPT
python
assert len(captured)==80 and set(entries)==set(captured),(len(captured),len(entries))
assert all(v>0 for v in entries.values())
(out/'metadata.json').write_text(json.dumps(dict(captures=captured,entries=dict(entries)),indent=2)+'\\n')
print('BUDGET_CAPTURE',len(captured),'actual native functions')
end
'''.replace('OUT',str(out)).replace('SCRIPT',str(budget/'functions.nut'))
 (budget/(label+'.gdb')).write_text(g)
print('Prepared owner helper-count and 80-function emission-budget diagnostics; not executed')
