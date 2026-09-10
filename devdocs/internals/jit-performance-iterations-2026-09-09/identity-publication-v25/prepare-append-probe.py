from pathlib import Path
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v25-self-publication-study/append-regression');D.mkdir(exist_ok=True)
s=(R/'test/test_jit_perf_correctness.nut').read_text();needle='function bench_one(name, iterations, fn) {';assert s.count(needle)==1
(D/'only-array_append.nut').write_text(s.replace(needle,needle+'\n    if(name != "array_append") return;'))
for label in ['control','candidate']:
 g='''set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('OUT');ranges=[];bps=[];counts=collections.Counter();offsets=collections.Counter();entries=[];symbols={};captured_pid=0
class NativeEntry(gdb.Breakpoint):
 def stop(self):
  frame=gdb.parse_and_eval('(SQObjectPtr *)$x0');entries.append(int(frame[1]['_unVal']['nInteger']));return False
class Helper(gdb.Breakpoint):
 def __init__(self,name,address):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'))
  for start,end in ranges:
   if start<=lr<end:counts[self.name]+=1;offsets[(self.name,lr-start)]+=1;break
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  global captured_pid
  p=gdb.parse_and_eval('proto').dereference()
  if int(p['_name']['_type'])!=0x08000010:return False
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name!='array_append_kernel' or ranges:return False
  code=p['_jit'].dereference()['_entry'].dereference()['_code'];address=int(code['entry']);size=int(code['size'])
  captured_pid=gdb.selected_inferior().pid
  ranges.append((address,address+size));bps.append(NativeEntry('*'+str(address),internal=True))
  (out.parent/(out.stem+'.bin')).write_bytes(bytes(gdb.selected_inferior().read_memory(address,size)))
  (out.parent/(out.stem+'.asm')).write_text(gdb.execute('disassemble /r '+str(address)+','+str(address+size),to_string=True))
  for name in ['sqjit_a64_helper_publish_stack_write','sqjit_a64_publish_array_len_preparation','sqjit_a64_helper_array_ptr_append_integer']:
   try:
    target=int(gdb.parse_and_eval('&'+name));symbols[name]=target;bps.append(Helper(name,target))
   except gdb.error:pass
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)
end
run SCRIPT --bench --iterations=19 --warmups=0 --seed=17
python
assert ranges and entries,(ranges,entries)
result=dict(pid=captured_pid,entries=entries,symbols=symbols,ranges=ranges,counts=dict(counts),sites=[dict(helper=name,return_offset=offset,count=count) for (name,offset),count in offsets.items()])
out.write_text(json.dumps(result,indent=2)+'\\n')
print('APPEND_HELPER_COUNTS',result)
end
'''.replace('OUT',str(D/(label+'.json'))).replace('SCRIPT',str(D/'only-array_append.nut'))
 (D/(label+'.gdb')).write_text(g)
