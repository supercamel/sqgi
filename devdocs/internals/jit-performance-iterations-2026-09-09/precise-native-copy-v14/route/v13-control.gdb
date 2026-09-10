set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start /tmp/sqgi-precise-native-copy-study/route/copy.nut
python
import gdb,json,pathlib
out=pathlib.Path('/tmp/sqgi-precise-native-copy-study/route')
hits=[]
class Catch(gdb.Breakpoint):
    def stop(self):
        closure=gdb.parse_and_eval('(SQClosure*)$x2')
        name=closure['_function'].dereference()['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
        if name.startswith('route_'):
            ip=int(gdb.parse_and_eval('$x3'))
            inst=closure['_function'].dereference()['_instructions'][ip]
            dst=int(inst['_arg0']); obj=gdb.parse_and_eval('(SQObjectPtr*)$x1')[dst]
            typ=str(obj['_type']); refs=0
            if typ not in ['OT_NULL','OT_INTEGER','OT_FLOAT','OT_BOOL']:
                refs=int(obj['_unVal']['pRefCounted'].dereference()['_uiRef'])
            hits.append(dict(name=name,ip=ip,op=int(inst['op']),dst=dst,source=int(inst['_arg1']),type=typ,refs=refs))
            print('SCALAR_HELPER_HIT',name,hits[-1]['ip'])
        return False
breakpoints=[]
for name in json.loads((out/'symbols.json').read_text()):
    address=int(gdb.parse_and_eval('&'+name))
    breakpoints.append(Catch('*'+str(address),internal=True))
print('SCALAR_HELPER_BREAKPOINTS',len(breakpoints))
end
continue
python
(out/'v13-helper-hits.json').write_text(json.dumps(hits,indent=2)+'\n')
assert len(hits)==32,hits
extra=[x for x in hits if x['ip']==1]
assert len(extra)==2 and all(x['op']==2 and x['dst']==5 and x['type']=='OT_TABLE' and x['refs']==3 for x in extra),extra
print('V13_CONTROL_HELPER_HITS',len(hits))
end
