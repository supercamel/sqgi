set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT_PRECISE_EXITS 1
python
import gdb,struct,collections,pathlib,json
out=pathlib.Path('/tmp/sqgi-scalar-entry-guard-study/route');seen=set();bps=[];failures=[]
class Guard(gdb.Breakpoint):
 def __init__(self,addr,cond,offset):
  super().__init__('*'+str(addr),internal=True);self.cond=cond;self.offset=offset
 def stop(self):
  flags=int(gdb.parse_and_eval('$cpsr'));n=bool(flags&(1<<31));z=bool(flags&(1<<30));c=bool(flags&(1<<29));v=bool(flags&(1<<28))
  taken=[z,not z,c,not c,n,not n,v,not v,c and not z,not c or z,n==v,n!=v,not z and n==v,z or n!=v,True,False][self.cond]
  if taken and len(failures)<10:
   row=dict(offset=self.offset,cond=self.cond,regs={r:int(gdb.parse_and_eval('$'+r)) for r in ['x0','x1','x2','x3','x9','x10','x11','x12','x13','x19','sp']})
   failures.append(row);print('PARAMETER_GUARD_FAILURE',row)
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name!='guard_parameter' or name in seen:return False
  code=p['_jit'].dereference()['_loop_code'];entry=int(code['entry']);size=int(code['size'])
  if not entry:return False
  seen.add(name);raw=bytes(gdb.selected_inferior().read_memory(entry,size));(out/'parameter.bin').write_bytes(raw);words=struct.unpack('<'+'I'*(size//4),raw)
  branches=[]
  for i,w in enumerate(words):
   if w&0xff000010!=0x54000000:continue
   off=(w>>5)&0x7ffff
   if off&(1<<18):off-=1<<19
   branches.append((i,i+off,w&15))
  target=collections.Counter(b[1] for b in branches).most_common(1)[0][0]
  (out/'parameter.asm').write_text(gdb.execute('disassemble /r '+str(entry)+','+str(entry+size),to_string=True))
  (out/'parameter-bytecode.json').write_text(json.dumps([dict(ip=i,op=int(p['_instructions'][i]['op']),args=[int(p['_instructions'][i][a]) for a in ['_arg0','_arg1','_arg2','_arg3']]) for i in range(int(p['_ninstructions']))],indent=2))
  print('PARAMETER_ENTRY',entry,'failure_target',target*4)
  for i,t,c in branches:
   if t==target:bps.append(Guard(entry+i*4,c,i*4))
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468',internal=True)
end
run
python
(out/'parameter-failures.json').write_text(json.dumps(failures,indent=2)+'\n')
assert failures
end
