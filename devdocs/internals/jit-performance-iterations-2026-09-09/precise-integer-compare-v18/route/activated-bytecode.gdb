set pagination off
set confirm off
set debuginfod enabled off
start
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-integer-compare-study/route');seen={}
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQFunctionProto*)$x0').dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name in ['exit_sites','cached_many','cached_kind','proof_double','cached_double','copy_move','copy_literal','copy_integer','copy_float','copy_bool','compare_l'] and name not in seen:
   rows=[]
   for ip in range(int(p['_ninstructions'])):
    i=p['_instructions'][ip];rows.append({k:int(i[k]) for k in ['op','_arg0','_arg1','_arg2','_arg3']})
   seen[name]=rows
  return False
symbol='_ZL25sqjit_a64_compile_preciseP15SQFunctionProtoP11SQObjectPtrP11SQJitNative'
breakpoint=Capture('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True)
end
continue
python
(out/'activated-bytecode.json').write_text(json.dumps(seen,indent=2)+'\n')
print('CAPTURED',list(seen))
end
