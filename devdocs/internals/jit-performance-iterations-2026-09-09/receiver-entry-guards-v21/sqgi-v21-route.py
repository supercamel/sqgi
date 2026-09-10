from pathlib import Path
S=Path('/tmp/sqgi-receiver-entry-guard-study');D=S/'route';D.mkdir(exist_ok=True)
script='''function marker(x) { return x; }
function entry_leaf(x) { return x+1; }
function entry_root(n) { marker(0); local sum=0; for(local i=0;i<n;i++) { sum+=entry_leaf(i); sum+=entry_leaf(i); } return marker(sum); }
function entry_parameter(n,fn) { marker(0); local sum=0; for(local i=0;i<n;i++) sum+=fn(i); return marker(sum); }
foreach(n in [7,19,37]) {
 if(entry_root(n)!=n*(n+1)) throw "root entry checksum";
 if(entry_parameter(n,entry_leaf)!=n*(n+1)/2) throw "parameter entry checksum";
}
'''
(D/'entry-guards.nut').write_text(script)
for label in ['control','candidate']:
 g='''set pagination off
set confirm off
set debuginfod enabled off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb,pathlib,json,collections,struct
out=pathlib.Path('OUTPUT');ranges=[];bps=[];entries=collections.Counter();hits=[];finishes=[];seen=set()
class Enter(gdb.Breakpoint):
 def __init__(self,address,name):super().__init__('*'+str(address),internal=True);self.name=name
 def stop(self):entries[self.name]+=1;return False
class Finished(gdb.FinishBreakpoint):
 def __init__(self,row):super().__init__(gdb.newest_frame(),internal=True);self.row=row
 def stop(self):self.row['result']=int(gdb.parse_and_eval('$x0'));hits.append(self.row);return False
class Helper(gdb.Breakpoint):
 def __init__(self,symbol):super().__init__('*'+str(int(gdb.parse_and_eval('&'+symbol))),internal=True);self.symbol=symbol
 def stop(self):
  lr=int(gdb.parse_and_eval('$x30'))
  for name,start,end in ranges:
   if start<=lr<end:
    row=dict(name=name,return_offset=lr-start,helper=self.symbol)
    finishes.append(Finished(row));break
  return False
class Capture(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference();name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if name not in ['entry_root','entry_parameter']:return False
  code=p['_jit'].dereference()['_loop_code'];entry=int(code['entry']);size=int(code['size'])
  if not entry or entry in seen:return False
  seen.add(entry);ranges.append((name,entry,entry+size));bps.append(Enter(entry,name))
  raw=bytes(gdb.selected_inferior().read_memory(entry,size));(out.parent/(out.stem+'-'+name+'.bin')).write_bytes(raw)
  (out.parent/(out.stem+'-'+name+'.asm')).write_text(gdb.execute('disassemble /r '+str(entry)+','+str(entry+size),to_string=True))
  return False
capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:468',internal=True)
end
start
python
symbols=json.loads((out.parent/'symbols.json').read_text());helpers=[Helper(s) for s in symbols]
end
continue
python
result=dict(entries=dict(entries),helpers=hits,ranges=ranges)
out.write_text(json.dumps(result,indent=2)+'\\n')
assert entries['entry_root']>=3 and entries['entry_parameter']>=3,entries
assert all(h['result']==1 for h in hits),hits
print('ENTRY_GUARD_ROUTE_CAPTURED',dict(entries),dict(collections.Counter(h['name'] for h in hits)))
end
'''.replace('OUTPUT',str(D/(label+'-entry.json')))
 (D/(label+'-entry.gdb')).write_text(g)
print('Prepared interpreter-checked root/parameter route probe')
