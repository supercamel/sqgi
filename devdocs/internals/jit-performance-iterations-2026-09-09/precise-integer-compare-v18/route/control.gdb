set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start /tmp/sqgi-precise-integer-compare-study/route/compare.nut
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-integer-compare-study/route');hits=[]
class Catch(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQClosure*)$x2')['_function'].dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name.startswith('route_'):
   ip=int(gdb.parse_and_eval('$x3'));i=p['_instructions'][ip];stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
   hits.append(dict(name=name,ip=ip,op=int(i['op']),left_type=str(stack[int(i['_arg2'])]['_type']),right_type=str(stack[int(i['_arg0'])]['_type'])))
  return False
breakpoints=[Catch('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True) for symbol in json.loads((out/'control-symbols.json').read_text())]
print('COMPARISON_HELPER_BREAKPOINTS',len(breakpoints))
end
continue
python
(out/'control-hits.json').write_text(json.dumps(hits,indent=2)+'\n')
assert len(hits)==40,hits
assert all(h['op']==29 for h in hits),hits
assert sum(h['left_type']=='OT_FLOAT' for h in hits)==4,hits
assert all(h['right_type']=='OT_INTEGER' for h in hits),hits
print('COMPARISON_HELPERS_VERIFIED control 40')
end
