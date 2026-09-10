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
            ip=int(gdb.parse_and_eval('$x3'));inst=p['_instructions'][ip];dst=int(inst['_arg0'])
            temp=gdb.parse_and_eval('((SQVM*)$x5)->temp_reg')
            def obj(value):
                typ=str(value['_type']);return {'type':typ,'refs':int(value['_unVal']['pRefCounted'].dereference()['_uiRef']) if typ not in ['OT_NULL','OT_BOOL','OT_INTEGER','OT_FLOAT'] else 0}
            row={'ip':ip,'op':int(inst['op']),'temp':obj(temp),'destination':obj(gdb.parse_and_eval('(SQObjectPtr*)$x1')[dst]) if dst<int(p['_stacksize']) else None}
            records.append(row);finishes.append(Finish(row))
        return False
captures=[Catch('*'+str(int(gdb.parse_and_eval('&'+name))),internal=True) for name in ['_Z22sqjit_a64_precise_stepIL8SQOpcode10ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode13ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode13ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode14ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode14ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode17ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode18ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode19ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode1ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode20ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode21ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode23ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode24ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode26ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode29ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode2ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode30ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode37ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode39ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode3ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode40ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode45ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode46ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode4ELb0EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache', '_Z22sqjit_a64_precise_stepIL8SQOpcode9ELb1EExP12SQJitContextP11SQObjectPtrP9SQClosurexS4_P4SQVMP26SQJitA64PreciseMemberCache']]
end
continue
python
pathlib.Path('/tmp/sqgi-precise-cache-proof-study/route/initial-temp-inspect.json').write_text(json.dumps(records,indent=2)+'\n')
assert any(row.get('result')==0 for row in records),records
print('INITIAL_EXIT_VERIFIED',records)
end
