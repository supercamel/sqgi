set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
start /tmp/sqgi-precise-cache-proof-study/route/initial-proofs.nut
python
import gdb,json,pathlib
records=[];finishes=[]
class Finish(gdb.FinishBreakpoint):
    def __init__(self,row):
        super().__init__(internal=True);self.row=row
    def stop(self):
        self.row['result']=int(gdb.parse_and_eval('$x0'));return False
class Catch(gdb.Breakpoint):
    def stop(self):
        c=gdb.parse_and_eval('(SQClosure*)$x2');p=c['_function'].dereference()
        name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
        if name=='route_key':
            temp=gdb.parse_and_eval('((SQVM*)$x5)->temp_reg')
            row={'ip':int(gdb.parse_and_eval('$x3')),'temp_type':str(temp['_type']),'temp_refs':int(temp['_unVal']['pRefCounted'].dereference()['_uiRef'])}
            records.append(row);finishes.append(Finish(row))
        return False
capture=Catch('*'+str(int(gdb.parse_and_eval('&_Z22sqjit_a64_precise_stepIL8SQOpcode9ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache'))),internal=True)
end
continue
python
pathlib.Path('/tmp/sqgi-precise-cache-proof-study/route/initial-temp-inspect.json').write_text(json.dumps(records,indent=2)+'\n')
assert len(records)==1 and records[0]['temp_type']=='OT_TABLE' and records[0]['temp_refs']==1 and records[0]['result']==0,records
print('INITIAL_EXIT_VERIFIED',records)
end
