set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 0
python
import gdb,pathlib,json
out=pathlib.Path('/tmp/sqgi-v22-native-profile/gdb-floats');seen={}
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name not in ['filter','channels','pressure','integration','retained','branching','helper_control'] or name in seen:return False
  code=p['_jit'].dereference()['_loop_code'];entry=int(code['entry']);size=int(code['size'])
  if not entry or not size:return False
  seen[name]=dict(entry=entry,size=size);(out/(name+'-loop.bin')).write_bytes(bytes(gdb.selected_inferior().read_memory(entry,size)))
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468',internal=True)
end
run test/bench_float_workloads.nut --iterations=1003 --warmups=1
python
assert len(seen)==7,seen
(out/'metadata.json').write_text(json.dumps(seen,indent=2)+'\n')
print('CAPTURED seven float loop code signatures; addresses are not joined to perf samples')
end
