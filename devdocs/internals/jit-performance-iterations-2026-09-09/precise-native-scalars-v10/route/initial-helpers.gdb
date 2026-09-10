set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start /tmp/sqgi-precise-native-scalars-study/route/scalars.nut
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-native-scalars-study/route')
hits=[]
class Catch(gdb.Breakpoint):
    def stop(self):
        closure=gdb.parse_and_eval('(SQClosure*)$x2')
        name=closure['_function'].dereference()['_name']['_unVal']['pString'].dereference()['_val'].string()
        if name.startswith('route_'):
            hits.append(dict(name=name,ip=int(gdb.parse_and_eval('$x3'))))
            print('SCALAR_HELPER_HIT',name,hits[-1]['ip'])
        return False
for name in json.loads((out/'symbols.json').read_text()):
    address=int(gdb.parse_and_eval('&'+name))
    Catch('*'+str(address),internal=True)
end
continue
python
(out/'helper-hits.json').write_text(json.dumps(hits,indent=2)+'\n')
assert not hits,hits
print('SCALAR_HELPERS_BYPASSED')
end
