set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v28-tail-budget')
names=set(['budget_pad_1', 'budget_pad_2', 'budget_pad_3', 'budget_pad_4', 'budget_pad_5', 'budget_pad_6', 'budget_pad_7', 'budget_pad_8', 'budget_pad_9', 'budget_pad_10', 'budget_pad_11', 'budget_pad_12', 'budget_pad_13', 'budget_pad_14', 'budget_pad_15', 'budget_pad_16', 'budget_pad_17', 'budget_pad_18', 'budget_pad_19', 'budget_pad_20', 'budget_pad_21', 'budget_pad_22', 'budget_pad_23', 'budget_pad_24'])
attempts=collections.defaultdict(list);captures={};entries=collections.Counter();keepers=[];errors=[]
def name_of(p):
 p=p.dereference()
 if int(p['_name']['_type'])!=0x08000010:return None
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Attempt(gdb.Breakpoint):
 def stop(self):
  try:
   name=name_of(gdb.parse_and_eval('proto'))
   if name not in names:return False
   values={key:int(gdb.parse_and_eval(key)) for key in ['tier','owning_postincrement','cold_lookups','shared_helpers']}
   attempts[name].append(values);print('EMIT_ATTEMPT',name,values)
  except Exception as exc:
   errors.append(str(exc));print('ATTEMPT_OBSERVATION_ERROR',exc)
  return False
class Entry(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):entries[self.name]+=1;return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto');name=name_of(p)
  if name not in names or name in captures:return False
  p=p.dereference();native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size'])
  assert bool(native['_requires_vm_frame']) and address and size
  assert attempts[name],name
  raw=bytes(gdb.selected_inferior().read_memory(address,size));(out/(name+'.bin')).write_bytes(raw)
  captures[name]={'pid':gdb.selected_inferior().pid,'address':address,'mapped_bytes':size,'successful_emission':attempts[name][-1],'instructions':int(p['_ninstructions'])}
  keepers.append(Entry(address,name));return False
def clear_entry_breakpoints(event):
 for bp in keepers:bp.delete()
 keepers.clear()
gdb.events.exited.connect(clear_entry_breakpoints)
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
tails=collections.defaultdict(list)
class Tail(gdb.Breakpoint):
 def stop(self):
  try:
   name=name_of(gdb.parse_and_eval('proto'))
   if name not in names:return False
   tails[name].append({'attempt':len(attempts[name])-1,'tier':int(gdb.parse_and_eval('tier')),'shared_helpers':bool(gdb.parse_and_eval('shared_helpers')),'body_bytes':int(gdb.parse_and_eval('buf.size'))})
  except Exception as exc:errors.append(str(exc));print('TAIL_OBSERVATION_ERROR',exc)
  return False
tail=Tail('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc:1127',internal=True)
attempt=Attempt('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc:1022',internal=True)
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run /tmp/sqgi-v28-tail-budget/functions.nut
python
result={'attempts':dict(attempts),'captures':captures,'native_entries':dict(entries),'observation_errors':errors,'mutated':mutated,'tails':dict(tails)}
(out/'metadata.json').write_text(json.dumps(result,indent=2)+'\n')
assert len(mutated)==24
assert set(captures)==names and set(entries)==names and not errors,(captures.keys(),entries,errors)
print('EMISSION_TIERS_VERIFIED',json.dumps({k:v['successful_emission'] for k,v in captures.items()}))
end
