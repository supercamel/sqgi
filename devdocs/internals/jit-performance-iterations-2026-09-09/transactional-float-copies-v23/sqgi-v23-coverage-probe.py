from pathlib import Path
D=Path('/tmp/sqgi-transactional-float-copies-study/coverage-gaps');D.mkdir(exist_ok=True)
g='''set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE 1
python
import gdb,pathlib,json
out=pathlib.Path('OUT');functions={};rejects=[];wanted=['rotate_buffers','object_member_write_fallback_kernel','members','event_records']
def name(p):
 if int(p['_name']['_type'])!=0x08000010:return ''
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Compile(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();n=name(p)
  if n not in wanted or n in functions:return False
  native=gdb.parse_and_eval('native').dereference()
  if bool(native['_scalarized']):return False
  instructions=[]
  for ip in range(int(p['_ninstructions'])):
   i=p['_instructions'][ip];instructions.append(dict(ip=ip,op=int(i['op']),arg0=int(i['_arg0']),arg1=int(i['_arg1']),arg2=int(i['_arg2']),arg3=int(i['_arg3'])))
  literals=[]
  for k in range(int(p['_nliterals'])):
   v=p['_literals'][k];row=dict(index=k,type=int(v['_type']))
   if row['type']==0x08000010:row['string']=v['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
   literals.append(row)
  functions[n]=dict(stacksize=int(p['_stacksize']),parameters=int(p['_nparameters']),instructions=instructions,literals=literals);return False
class Reject(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto')
  if int(p)==0:return False
  n=name(p.dereference())
  if n not in wanted:return False
  r=gdb.parse_and_eval('result');rejects.append(dict(name=n,ip=int(r['ip']),category=int(r['category']),reason=r['reason'].string()));return False
compile=Compile('sqjit_backend_compile_proto',internal=True)
reject=Reject('sqjit_diag_record_reject',internal=True)
end
run test/bench_member_workloads.nut --iterations=1003 --warmups=1
run test/bench_member_methods.nut --iterations=1003 --warmups=1
run test/test_jit_perf_correctness.nut --bench --iterations=1003 --warmups=1 --seed=17
python
assert 'rotate_buffers' in functions and 'object_member_write_fallback_kernel' in functions,functions.keys()
(out/'functions.json').write_text(json.dumps(functions,indent=2)+'\\n')
(out/'rejects.json').write_text(json.dumps(rejects,indent=2)+'\\n')
print('COVERAGE_GAPS_CAPTURED',list(functions),len(rejects))
end
'''.replace('OUT',str(D));(D/'capture.gdb').write_text(g)
