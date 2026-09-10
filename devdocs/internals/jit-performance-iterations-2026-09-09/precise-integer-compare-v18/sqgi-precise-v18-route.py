from pathlib import Path
import subprocess,json
r=Path('/home/sam/Programming/sqgi');s=Path('/tmp/sqgi-precise-integer-compare-study');d=s/'route';d.mkdir(parents=True,exist_ok=True);(s/'profiles').mkdir(exist_ok=True)
(d/'compare.nut').write_text('''function route_g(r,a,b) { r.count=r.count+1; if(a>b) return 11; return 22; }
function route_ge(r,a,b) { r.count=r.count+1; if(a>=b) return 11; return 22; }
function route_l(r,a,b) { r.count=r.count+1; if(a<b) return 11; return 22; }
function route_le(r,a,b) { r.count=r.count+1; if(a<=b) return 11; return 22; }
local functions=[route_g,route_ge,route_l,route_le];
local pairs=[[-2000000000,2000000000],[2000000000,-2000000000],[-2000000000,-2000000000],[2000000000,2000000000],[-1,0],[0,-1],[0,0],[1,0],[0,1],[-0.5,0]];
local record={count=0};local calls=0;
for(local relation=0;relation<4;++relation) foreach(pair in pairs) {
 local a=pair[0],b=pair[1];local truth=relation==0 ? a>b : relation==1 ? a>=b : relation==2 ? a<b : a<=b;
 local actual=functions[relation](record,a,b);
 if(actual!=(truth ? 11 : 22)) throw "comparison route result";
 ++calls;
}
if(calls!=40 || record.count!=40) throw "comparison route prefix";
print("COMPARISON_ROUTE_OK 40\\n");
''')
for label,binary in [('control',r/'build-jit-audit-20260909/precise-cache-proofs-v17/sqgi'),('candidate',Path('/tmp/sqgi-scalar-leaf-20260909/sqgi'))]:
 syms=[x.split()[-1] for x in subprocess.check_output(['nm','-an',str(binary)],text=True).splitlines() if 'precise_stepIL8SQOpcode29E' in x];assert len(syms)==1,syms
 (d/(label+'-symbols.json')).write_text(json.dumps(syms)+'\n')
 expected=40 if label=='control' else 4
 g=f'''set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
start {d}/compare.nut
python
import gdb,json,pathlib
out=pathlib.Path('{d}');hits=[]
class Catch(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('(SQClosure*)$x2')['_function'].dereference()
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name.startswith('route_'):
   ip=int(gdb.parse_and_eval('$x3'));i=p['_instructions'][ip];stack=gdb.parse_and_eval('(SQObjectPtr*)$x1')
   hits.append(dict(name=name,ip=ip,op=int(i['op']),left_type=str(stack[int(i['_arg2'])]['_type']),right_type=str(stack[int(i['_arg0'])]['_type'])))
  return False
breakpoints=[Catch('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True) for symbol in json.loads((out/'{label}-symbols.json').read_text())]
print('COMPARISON_HELPER_BREAKPOINTS',len(breakpoints))
end
continue
python
(out/'{label}-hits.json').write_text(json.dumps(hits,indent=2)+'\\n')
assert len(hits)=={expected},hits
assert all(h['op']==29 for h in hits),hits
assert sum(h['left_type']=='OT_FLOAT' for h in hits)==4,hits
assert all(h['right_type']=='OT_INTEGER' for h in hits),hits
print('COMPARISON_HELPERS_VERIFIED {label} {expected}')
end
'''
 (d/(label+'.gdb')).write_text(g)
(s/'profiles/dump.gdb').write_text(Path('/tmp/sqgi-precise-cache-proof-study/profiles/dump.gdb').read_text().replace('/tmp/sqgi-precise-cache-proof-study','/tmp/sqgi-precise-integer-compare-study'))
