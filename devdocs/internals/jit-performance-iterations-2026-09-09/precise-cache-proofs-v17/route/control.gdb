set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start /tmp/sqgi-precise-cache-proof-study/route/proofs.nut
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-cache-proof-study/route');hits=[]
class Catch(gdb.Breakpoint):
    def stop(self):
        closure=gdb.parse_and_eval('(SQClosure*)$x2')
        name=closure['_function'].dereference()['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
        if name.startswith('route_'):
            ip=int(gdb.parse_and_eval('$x3'));inst=closure['_function'].dereference()['_instructions'][ip]
            stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
            hits.append(dict(name=name,ip=ip,base=int(inst['_arg1']),source=int(inst['_arg3']),source_type=str(stack[int(inst['_arg3'])]['_type']),owner_type=str(stack[int(inst['_arg1'])]['_type'])))
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
from collections import Counter
assert len(hits)==14,hits
assert Counter(h['name'] for h in hits)=={'route_loop':4,'route_straight':4,'route_key':2,'route_owner':2,'route_branch':2},hits
assert all(h['owner_type']=='OT_TABLE' for h in hits),hits
assert sum(h['source_type']=='OT_WEAKREF' for h in hits)==4,hits
print('CACHE_PROOF_HELPERS_VERIFIED control 14')
end
