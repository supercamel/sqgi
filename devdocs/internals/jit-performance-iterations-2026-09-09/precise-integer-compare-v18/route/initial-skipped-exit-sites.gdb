set pagination off
set confirm off
set debuginfod enabled off
start
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-integer-compare-study/route');hits=[];finishes=[]
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
symbol=json.loads((out/'candidate-symbols.json').read_text())[0]
breakpoint=Catch('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True)
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
print('COMPARISON_EXACT_FAILURE_SITES_VERIFIED 24; mixed numeric helper successes 8')
end
