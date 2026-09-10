set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections
out=pathlib.Path('/tmp/sqgi-v26-method-probe');captures={};counts=collections.Counter();entries=collections.Counter();breakpoints=[];sites={}
def pname(p):
 if int(p['_name']['_type'])!=0x08000010:return ''
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Enter(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):entries[self.name]+=1;return False
class Helper(gdb.Breakpoint):
 def __init__(self,address,op):super().__init__('*'+str(address),internal=True);self.op=op
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'));names=[n for n,c in captures.items() if c['address']<=lr<c['address']+c['mapped_bytes']]
  if not names:return False
  assert len(names)==1;name=names[0];ip=int(gdb.parse_and_eval('$x3'));stack=gdb.parse_and_eval('(SQObjectPtr *)$x1');cl=gdb.parse_and_eval('(SQClosure *)$x2').dereference();proto=cl['_function'].dereference();i=proto['_instructions'][ip]
  base=stack[int(i['_arg2'] if self.op==9 else i['_arg1'])];key=proto['_literals'][int(i['_arg1'])] if self.op==9 else stack[int(i['_arg2'])]
  k=f'{name}:{ip}:{self.op}';counts[k]+=1
  row=sites.setdefault(k,dict(name=name,ip=ip,op=self.op,lr_offset=lr-captures[name]['address'],owner_types={},bucket_hits=0,bucket_misses=0,nonfield=0))
  typ=int(base['_type']);ts=str(typ);row['owner_types'][ts]=row['owner_types'].get(ts,0)+1
  table=None;instance=None
  if typ==0x0a000020:table=base['_unVal']['pTable'].dereference()
  elif typ==0x0a008000:
   instance=base['_unVal']['pInstance'].dereference();table=instance['_class'].dereference()['_members'].dereference()
  if table is not None and int(key['_type'])==0x08000010:
   string=key['_unVal']['pString'].dereference();assert bool(string['_hashvalid']);hv=int(string['_hash']);node=table['_nodes'][hv&(int(table['_numofnodes'])-1)]
   hit=int(node['key']['_type'])==int(key['_type']) and int(node['key']['_unVal']['raw'])==int(key['_unVal']['raw'])
   if hit:
    row['bucket_hits']+=1
    if instance is not None and not int(node['val']['_unVal']['nInteger'])&0x02000000:row['nonfield']+=1
   else:row['bucket_misses']+=1
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=pname(p)
  if name not in ['publish','transfer'] or name in captures:return False
  if not captures:
   for op,symbol in [(9,'&sqjit_a64_precise_step<(SQOpcode)9>'),(13,'&sqjit_a64_precise_step<(SQOpcode)13, true>')]:
    address=int(gdb.parse_and_eval(symbol));breakpoints.append(Helper(address,op))
  native=p['_jit'].dereference()['_entry'].dereference();code=native['_code'];address=int(code['entry']);size=int(code['size']);assert native['_requires_vm_frame'] and address
  instructions=[{k:int(p['_instructions'][j][k]) for k in ['op','_arg0','_arg1','_arg2','_arg3']} for j in range(int(p['_ninstructions']))]
  captures[name]=dict(pid=gdb.selected_inferior().pid,address=address,mapped_bytes=size,instructions=instructions)
  (out/(name+'.bin')).write_bytes(bytes(gdb.selected_inferior().read_memory(address,size)))
  breakpoints.append(Enter(address,name));return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)

end
run test/bench_member_methods.nut --iterations=7 --warmups=0
python
assert set(captures)=={'publish','transfer'} and all(entries[n]>0 for n in captures)
result=dict(captures=captures,entries=dict(entries),helper_calls=dict(counts),sites=sites)
(out/'metadata.json').write_text(json.dumps(result,indent=2)+'\n')
print('METHOD_HELPER_PROBE',dict(entries),dict(counts))
end
