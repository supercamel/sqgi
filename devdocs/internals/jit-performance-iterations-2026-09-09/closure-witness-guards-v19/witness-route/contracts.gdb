set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT_PRECISE_EXITS 1
start
python
import gdb,json,pathlib,collections
out=pathlib.Path('/tmp/sqgi-closure-witness-guard-study/witness-route/contracts.json');hits=[];finishes=[]
class Finished(gdb.FinishBreakpoint):
 def __init__(self,row):
  super().__init__(gdb.newest_frame(),internal=True);self.row=row
 def stop(self):
  self.row['result']=int(gdb.parse_and_eval('$x0'));hits.append(self.row);return False
class Catch(gdb.Breakpoint):
 def __init__(self,symbol):
  self.symbol=symbol
  super().__init__('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True)
 def stop(self):
  reg='x2' if 'closure_slot_guard' in self.symbol else 'x3'
  weak=gdb.parse_and_eval('(SQWeakRef*)$'+reg).dereference()
  row=dict(helper=self.symbol,type=str(weak['_obj']['_type']),referent=int(weak['_obj']['_unVal']['raw']))
  finishes.append(Finished(row));return False
symbols=json.loads((out.parent/'symbols.json').read_text())
breakpoints=[Catch(s) for s in symbols]
end
continue
python
out.write_text(json.dumps(hits,indent=2)+'\n')
dead=[h for h in hits if h['type']=='OT_NULL'];assert dead and all(h['referent']==0 and h['result']==0 for h in dead),dead
assert any(h['result']==1 for h in hits),hits
print('WITNESS_GUARD_ROUTE_VERIFIED',len(hits),'helper calls;',len(dead),'dead witnesses rejected')
end
