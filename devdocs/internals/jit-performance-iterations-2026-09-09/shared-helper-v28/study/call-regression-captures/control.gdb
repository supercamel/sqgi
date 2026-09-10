set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json
out=pathlib.Path('/tmp/sqgi-shared-helper-study/call-regression-captures/control');seen=set();metadata={}
class Capture(gdb.Breakpoint):
 def __init__(self,spec,mode):
  super().__init__(spec,internal=True);self.mode=mode
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name not in ['direct_call_kernel','float_call_kernel','channels','pressure','retained','math_intrinsic_kernel','math_variable_kernel']:return False
  key=name+'-'+self.mode
  if key in seen:return False
  jit=p['_jit'].dereference()
  if self.mode=='entry':
   if int(jit['_entry'])==0:return False
   code=jit['_entry'].dereference()['_code']
  else:code=jit['_loop_code']
  entry=int(code['entry']);size=int(code['size'])
  if not entry or not size:return False
  seen.add(key);raw=bytes(gdb.selected_inferior().read_memory(entry,size));(out/(key+'.bin')).write_bytes(raw)
  (out/(key+'.asm')).write_text(gdb.execute('disassemble /r '+str(entry)+','+str(entry+size),to_string=True))
  vec=code['weak_references']['_M_impl'];start=vec['_M_start'];end=vec['_M_finish'];witnesses=[]
  for i in range(int(end-start)):
   weak=start[i].dereference();witnesses.append(dict(address=int(start[i]),type=str(weak['_obj']['_type']),type_bits=int(weak['_obj']['_type']),tag_offset=int(weak['_obj']['_type'].address)-int(start[i]),referent=int(weak['_obj']['_unVal']['raw'])))
  metadata[key]=dict(mapped_bytes=size,weak_witnesses=witnesses,requires_vm_frame=bool(jit['_entry'].dereference()['_requires_vm_frame']) if self.mode=='entry' else False,stack_live_slots=int(jit['_entry'].dereference()['_stack_live_slots']) if self.mode=='entry' else None)
  print('CALL_CAPTURE',key,size,witnesses);return False
breakpoints=[Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610','entry'),Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468','loop')]
end
run test/test_jit_perf_correctness.nut --bench --iterations=1003 --warmups=1 --seed=17
run test/bench_float_workloads.nut --iterations=1003 --warmups=1
python
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
assert all(any(k.startswith(name+'-') for k in seen) for name in ['direct_call_kernel','float_call_kernel','channels','pressure','retained','math_intrinsic_kernel','math_variable_kernel']),seen
print('CALL_CAPTURE_VERIFIED',sorted(seen))
end
