set pagination off
set confirm off
set debuginfod enabled off
set environment LD_PRELOAD /tmp/sqgi-v22-filter-ablation/patch.so
set environment SQGI_DIAG_COPY_MODE fp
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json
out=pathlib.Path('/tmp/sqgi-v22-filter-ablation/fp');seen=[]
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name!='filter_stream' or seen:return False
  code=p['_jit'].dereference()['_loop_code'];entry=int(code['entry']);size=int(code['size'])
  if not entry:return False
  seen.append(dict(name=name,entry=entry,size=size));out.with_suffix('.bin').write_bytes(bytes(gdb.selected_inferior().read_memory(entry,size)))
  out.with_suffix('.asm').write_text(gdb.execute('disassemble /r '+str(entry)+','+str(entry+size),to_string=True));return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468',internal=True)
end
run test/bench_application_workloads.nut --iterations=1003 --warmups=1 --seed=17
python
assert len(seen)==1,seen
out.with_suffix('.json').write_text(json.dumps(seen,indent=2)+'\n')
print('FILTER_STREAM_CAPTURED')
end
