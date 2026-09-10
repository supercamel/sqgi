set pagination off
set confirm off
set debuginfod enabled off
start
python
import gdb,json,pathlib,subprocess
out=pathlib.Path('/tmp/sqgi-precise-integer-compare-study/route');hits=[];finishes=[]
class Finished(gdb.FinishBreakpoint):
 def __init__(self,row):
  super().__init__(gdb.newest_frame(),internal=True);self.row=row
 def stop(self):
  self.row['result']=int(self.return_value);hits.append(self.row);return False
class Catch(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQClosure*)$x2')['_function'].dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name=='cached_kind':
   ip=int(gdb.parse_and_eval('$x3'));i=p['_instructions'][ip];temp=gdb.parse_and_eval('(SQVM*)$x5')['temp_reg'];stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
   def desc(obj):
    d=dict(type=str(obj['_type']),bits=int(obj['_unVal']['raw']))
    if int(obj['_type']) & 0x08000000:d['refs']=int(obj['_unVal']['pRefCounted']['_uiRef'])
    return d
   row=dict(name=name,ip=ip,op=int(i['op']),temp=desc(temp),slots=[desc(stack[k]) for k in range(int(p['_stacksize']))])
   finishes.append(Finished(row))
  return False
syms=[x.split()[-1] for x in subprocess.check_output(['nm','-an','/tmp/sqgi-scalar-leaf-20260909/libsqgi.so'],text=True).splitlines() if 'precise_stepIL' in x]
breakpoints=[Catch('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True) for symbol in syms]
end
continue
python
(out/'cached-kind-exit.json').write_text(json.dumps(hits,indent=2)+'\n')
print('FAILED_HELPERS',[h for h in hits if h['result']==0])
end
