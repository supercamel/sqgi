set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v28-emission-tier-probe')
names={'rotate_buffers','recycle','transfer','publish','table_apply','apply'}
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
attempt=Attempt('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc:1022',internal=True)
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run test/bench_member_workloads.nut --iterations=19 --warmups=0
run test/bench_member_owners.nut --iterations=19 --warmups=0
run test/bench_member_methods.nut --iterations=19 --warmups=0
python
result={'attempts':dict(attempts),'captures':captures,'native_entries':dict(entries),'observation_errors':errors}
(out/'metadata.json').write_text(json.dumps(result,indent=2)+'\n')
assert set(captures)==names and set(entries)==names and not errors,(captures.keys(),entries,errors)
print('EMISSION_TIERS_VERIFIED',json.dumps({k:v['successful_emission'] for k,v in captures.items()}))
end
