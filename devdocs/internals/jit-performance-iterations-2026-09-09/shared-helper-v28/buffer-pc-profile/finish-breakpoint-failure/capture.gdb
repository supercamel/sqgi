set pagination off
set confirm off
set debuginfod enabled off
set exec-wrapper taskset -c 4
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json,subprocess,signal,struct,time
out=pathlib.Path('/tmp/sqgi-v28-buffer-pc-profile')
assert not (out/'cycles.data').exists(),'Preserve any earlier profile'
record=None;errlog=None;metadata={};entries=0;returns=[];keepers=[];return_bps={};pending={}
def proto_name(p):
 if int(p['_name']['_type'])!=0x08000010:return ''
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Returned(gdb.Breakpoint):
 def __init__(self,address):super().__init__('*'+str(address),internal=True);self.address=address
 def stop(self):
  if not pending.get(self.address):return False
  pending[self.address]-=1;returns.append(int(gdb.parse_and_eval('$x0')))
  if len(returns)==4:
   assert record and record.poll() is None,'perf exited before the captured calls completed'
   record.send_signal(signal.SIGINT);metadata['perf_exit_code']=record.wait(timeout=20);errlog.flush()
   assert metadata['perf_exit_code']==0,metadata
  return False
class Enter(gdb.Breakpoint):
 def __init__(self,address):super().__init__('*'+str(address),internal=True)
 def stop(self):
  global entries,record,errlog
  entries+=1;address=int(gdb.parse_and_eval('$x30'));pending[address]=pending.get(address,0)+1
  if address not in return_bps:return_bps[address]=Returned(address)
  if entries==1:
   errlog=(out/'perf-record.log').open('w')
   command=['perf','record','-e','cycles:u','-F','997','-p',str(metadata['inferior_pid']),'-o',str(out/'cycles.data')]
   metadata['perf_command']=command
   record=subprocess.Popen(command,stdout=errlog,stderr=subprocess.STDOUT)
   time.sleep(0.25)
   assert record.poll() is None,'perf failed to attach; inspect perf-record.log'
  return False
class Compiled(gdb.FinishBreakpoint):
 def __init__(self,native):super().__init__(gdb.newest_frame(),internal=True);self.native=native
 def stop(self):
  assert bool(self.return_value),'buffer precise compilation failed'
  native=self.native.dereference();code=native['_code'];address=int(code['entry']);size=int(code['size']);pid=gdb.selected_inferior().pid
  assert address and bool(native['_requires_vm_frame'])
  raw=bytes(gdb.selected_inferior().read_memory(address,size));words=struct.unpack('<'+'I'*(len(raw)//4),raw);end=4*max(i+1 for i,w in enumerate(words) if w)
  assert end==7408 and words[end//4-10]==0xa9bf7bfd and words[end//4-1]==0xd65f03c0
  metadata.update(inferior_pid=pid,address=address,mapped_bytes=size,code_bytes=end,trampoline_offset=end-40,trampoline_bytes=40)
  (out/'rotate_buffers.bin').write_bytes(raw)
  (out/'rotate_buffers.asm').write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+end),to_string=True))
  mapping=f'{address:x} {end-40:x} rotate_buffers_v28_body\n{address+end-40:x} 28 rotate_buffers_v28_shared_helper\n'
  perfmap=pathlib.Path('/tmp')/f'perf-{pid}.map';assert not perfmap.exists(),perfmap
  perfmap.write_text(mapping);(out/'perf.map').write_text(mapping);metadata['perf_map']=str(perfmap)
  keepers.append(Enter(address));return False
class Compile(gdb.Breakpoint):
 def stop(self):
  if proto_name(gdb.parse_and_eval('proto').dereference())!='rotate_buffers':return False
  keepers.append(Compiled(gdb.parse_and_eval('native')));self.enabled=False;return False
compile_bp=Compile('sqjit_a64_compile_precise',internal=True)
end
run test/bench_member_workloads.nut --iterations=2000000 --warmups=0
python
if record and record.poll() is None:
 record.send_signal(signal.SIGINT);metadata['perf_exit_code']=record.wait(timeout=20)
metadata.update(entries=entries,return_statuses=returns,pending=pending,scope='One unchanged member-suite process; recording spans its four buffer native calls. Body execution has no debugger breakpoints; entry/return observers run only at call boundaries. Diagnostic profile, not accepted benchmark timing.')
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
assert entries==4 and returns==[1,1,1,1] and not any(pending.values()),metadata
assert metadata['perf_exit_code']==0
print('SAME_PROCESS_BUFFER_PROFILE',metadata['inferior_pid'],entries,returns)
end
