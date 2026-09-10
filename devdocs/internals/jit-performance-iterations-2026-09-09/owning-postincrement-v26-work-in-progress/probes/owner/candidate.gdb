set pagination off
set confirm off
set breakpoint pending on
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,re,collections
out=pathlib.Path('/tmp/sqgi-v26-probes/owner/candidate');captured={};entries=[];counts=collections.Counter();breakpoints=[]
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
(out/'metadata.json').write_text(json.dumps(captured,indent=2)+'\n')
print('POSTINCREMENT_CAPTURE',captured)
end
