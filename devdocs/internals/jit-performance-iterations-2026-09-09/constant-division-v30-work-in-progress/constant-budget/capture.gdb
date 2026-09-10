set pagination off
set confirm off
set breakpoint pending on
set debuginfod enabled off
set environment LD_LIBRARY_PATH /tmp/sqgi-scalar-leaf-20260909
python
import gdb,pathlib,json
out=pathlib.Path('/tmp/sqgi-v30-constant-budget')
all_cases={};requests=[];errors=[];current=None;last_exit=None;finishes=[]
def name_of(p):
 p=p.dereference()
 if int(p['_name']['_type'])!=0x08000010:return None
 return p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
class Request(gdb.Breakpoint):
 def __init__(self,kind):super().__init__('sqjit_backend_compile_'+kind,internal=True);self.kind=kind
 def stop(self):
  global current
  try:
   name=name_of(gdb.parse_and_eval('proto'))
   if not name or not name.startswith('budget_'):return False
   current={'kind':self.kind,'name':name,'events':[]};requests.append(current)
  except Exception as e:errors.append('request: '+str(e))
  return False
class Emit(gdb.Breakpoint):
 def __init__(self,location,kind):super().__init__(location,internal=True);self.kind=kind
 def stop(self):
  try:
   name=name_of(gdb.parse_and_eval('proto'))
   if not name or not name.startswith('budget_'):return False
   assert current is not None and current['name']==name
   row={'event':'emit','kind':self.kind,'constant_division':bool(gdb.parse_and_eval('constant_division'))}
   if self.kind=='precise':
    row.update({key:int(gdb.parse_and_eval(key)) for key in ['tier','owning_postincrement','cold_lookups','shared_helpers']})
   current['events'].append(row)
  except Exception as e:errors.append('emit '+self.kind+': '+str(e))
  return False
class Installed(gdb.FinishBreakpoint):
 def __init__(self,frame,request,event):
  super().__init__(frame,internal=True);self.request=request;self.event=event
 def stop(self):
  try:
   assert self.return_value is not None
   self.event['success']=bool(self.return_value)
   self.request['events'].append({'event':'install_return','success':bool(self.return_value)})
  except Exception as e:errors.append('install return: '+str(e))
  return False
class Install(gdb.Breakpoint):
 def stop(self):
  if current is None:return False
  try:
   length=int(gdb.parse_and_eval('length'));address=int(gdb.parse_and_eval('bytes'))
   event={'event':'install','length':length}
   current['events'].append(event)
   raw=bytes(gdb.selected_inferior().read_memory(address,length))
   path=out/(case_name+'-install-'+str(sum(e['event']=='install' for r in requests for e in r['events']))+'.bin')
   path.write_bytes(raw);event['code_file']=path.name
   finishes.append(Installed(gdb.newest_frame(),current,event))
  except Exception as e:errors.append('install: '+str(e))
  return False
def exited(event):
 global last_exit
 last_exit=getattr(event,'exit_code',None)
gdb.events.exited.connect(exited)
keep=[Request('proto'),Request('loop'),
 Emit('sqjit_a64_compile_integer_proto_impl','proto'),Emit('compile_loop_impl','loop'),
 Emit('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc:1061','precise'),
 Install('SQJitCode::Install',internal=True)]
cases=[('proto',105,38),('proto',105,39),('precise',10,71),('precise',10,72),('precise',10,81),
       ('loop_store_flat',100,22),('loop_store',100,22)]
for fault in [False,True]:
 for kind,blocks,pad in cases:
  case_name=kind+'-'+str(blocks)+'-'+str(pad)+('-fault' if fault else '-reference')
  requests=[];errors=[];current=None;last_exit=None;finishes=[]
  if fault:gdb.execute('set environment LD_PRELOAD /tmp/sqgi-v30-allocation-fault/fail_exec.so')
  else:gdb.execute('unset environment LD_PRELOAD')
  print('RUN_CASE',case_name,flush=True)
  log=gdb.execute('run '+kind+' '+str(blocks)+' '+str(pad)+' '+str(out/'v30'),to_string=True)
  (out/(case_name+'.gdb.log')).write_text(log)
  result={'fault':fault,'requests':requests,'errors':errors,'exit_code':last_exit}
  all_cases[case_name]=result
  (out/'capture-metadata.json').write_text(json.dumps(all_cases,indent=2)+'\n')
  assert last_exit==0 and not errors,(case_name,last_exit,errors)
  installs=[e for r in requests for e in r['events'] if e['event']=='install']
  assert installs and all('success' in e for e in installs),(case_name,installs)
  assert sum(not e['success'] for e in installs)==int(fault),(case_name,installs)
  for request in requests:
   events=request['events'];positions=[n for n,e in enumerate(events) if e['event']=='install']
   assert len(positions)<=1,(case_name,'multiple installs in one backend request',request)
   if positions:
    index=positions[0]
    assert all(e['event']=='install_return' for e in events[index+1:]),(case_name,'emission after installation',request)
  print('CASE_VERIFIED',case_name,[(e['length'],e['success']) for e in installs],flush=True)
print('ALL_CONSTANT_BUDGET_INSTALL_CASES_VERIFIED',len(all_cases))
end
