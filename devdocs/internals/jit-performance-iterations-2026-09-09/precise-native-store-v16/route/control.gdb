set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start /tmp/sqgi-precise-native-store-study/route/store.nut
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-native-store-study/route');hits=[]
class Catch(gdb.Breakpoint):
    def stop(self):
        closure=gdb.parse_and_eval('(SQClosure*)$x2')
        name=closure['_function'].dereference()['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
        if name=='route_store':
            ip=int(gdb.parse_and_eval('$x3'));inst=closure['_function'].dereference()['_instructions'][ip]
            stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
            hits.append(dict(ip=ip,base=int(inst['_arg1']),source=int(inst['_arg3']),source_type=str(stack[int(inst['_arg3'])]['_type']),owner_type=str(stack[int(inst['_arg1'])]['_type'])))
            print('STORE_HELPER_HIT',hits[-1])
        return False
breakpoints=[]
for symbol in json.loads((out/'symbols.json').read_text()):
    address=int(gdb.parse_and_eval('&'+symbol));breakpoints.append(Catch('*'+str(address),internal=True))
print('STORE_HELPER_BREAKPOINTS',len(breakpoints))
end
continue
python
(out/'control-hits.json').write_text(json.dumps(hits,indent=2)+'\n')
assert len(hits)==36,hits
targets=[h for h in hits if h['base']==2]
assert len(targets)==24 and sum(h['source_type']=='OT_WEAKREF' for h in targets)==12,targets
print('STORE_HELPER_VERIFIED control 36')
end
