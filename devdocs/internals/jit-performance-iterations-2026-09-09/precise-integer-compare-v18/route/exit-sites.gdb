set pagination off
set confirm off
set debuginfod enabled off
start
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-integer-compare-study/route');hits=[];finishes=[];returns=[]
class Finished(gdb.FinishBreakpoint):
 def __init__(self,row):
  super().__init__(gdb.newest_frame(),internal=True);self.row=row
 def stop(self):
  self.row['result']=int(self.return_value);hits.append(self.row)
  return False
class Catch(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQClosure*)$x2')['_function'].dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name.startswith('compare_'):
   ip=int(gdb.parse_and_eval('$x3'));i=p['_instructions'][ip];vm=gdb.parse_and_eval('(SQVM*)$x5');temp=vm['temp_reg'];stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
   row=dict(name=name,ip=ip,op=int(i['op']),temp_type=str(temp['_type']),left_type=str(stack[int(i['_arg2'])]['_type']),right_type=str(stack[int(i['_arg0'])]['_type']))
   finishes.append(Finished(row))
  return False
class ReturnCatch(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQClosure*)$x2')['_function'].dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name.startswith('compare_'):
   ip=int(gdb.parse_and_eval('$x3'));i=p['_instructions'][ip];temp=gdb.parse_and_eval('(SQVM*)$x5')['temp_reg'];stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
   returns.append(dict(name=name,ip=ip,temp_type=str(temp['_type']),temp_bits=int(temp['_unVal']['nInteger']),result=int(stack[int(i['_arg1'])]['_unVal']['nInteger'])))
  return False
symbol=json.loads((out/'candidate-symbols.json').read_text())[0]
breakpoint=Catch('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True)
return_breakpoint=ReturnCatch('*'+str(int(gdb.parse_and_eval('&'+symbol.replace('SQOpcode29E','SQOpcode23E')))),internal=True)
end
continue
python
(out/'exit-sites.json').write_text(json.dumps(hits,indent=2)+'\n')
failed=[h for h in hits if h['result']==0]
assert len(hits)==32 and len(failed)==24,(len(hits),failed)
assert all(h['op']==29 for h in hits),hits
assert sum(h['temp_type']=='OT_USERDATA' for h in failed)==16,failed
assert sum(h['left_type'] in ['OT_BOOL','OT_STRING'] for h in failed)==8,failed
assert all(h['result'] in [1,2] and h['left_type']=='OT_FLOAT' for h in hits if h['result']!=0),hits
(out/'temporary-publication.json').write_text(json.dumps(returns,indent=2)+'\n')
assert len(returns)==76,returns
assert all(h['temp_type']=='OT_BOOL' and h['temp_bits']==int(h['result']==11) for h in returns),returns
print('COMPARISON_TEMPORARY_PUBLICATION_VERIFIED 76')
print('COMPARISON_EXACT_FAILURE_SITES_VERIFIED 24; mixed numeric helper successes 8')
end
