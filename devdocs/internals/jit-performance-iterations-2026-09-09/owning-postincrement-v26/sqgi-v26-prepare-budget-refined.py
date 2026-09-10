from pathlib import Path
root=Path('/tmp/sqgi-v26-probes');d=root/'budget-refined';d.mkdir(exist_ok=True)
lines=[]
for n in range(1,33):
 pad='local padding=1515847680;' + ''.join('padding=%d;'%(1515847680+j) for j in range(1,n))
 lines.append('function budget_pad_%d(r,n) {%slocal sum=0;for(local i=0;i<n;i++){r.slot=i;%s}return sum;}'%(n,pad,'sum+=r.count;'*14))
lines.append('local r={slot=0,count=3};')
for n in range(1,33):lines.append('if(budget_pad_%d(r,3)!=126 || r.slot!=2) throw "budget value";'%n)
(d/'functions.nut').write_text('\n'.join(lines)+'\n')
mutation='''mutated={}
class Mutate(gdb.Breakpoint):
 def stop(self):
  p=gdb.parse_and_eval('proto').dereference()
  if int(p['_name']['_type'])!=0x08000010:return False
  name=p['_name']['_unVal']['pString'].dereference()['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
  if not name.startswith('budget_pad_') or name in mutated:return False
  count=0
  for ip in range(int(p['_ninstructions'])):
   i=p['_instructions'][ip]
   if int(i['op'])==2 and 1515847680<=int(i['_arg1'])<1515847744:
    # The destination is an otherwise unused diagnostic local. Replace its
    # assignment with a legal jump to the following instruction (four native
    # bytes), allowing an exact code-size boundary without changing results.
    gdb.execute('set variable proto->_instructions[%d].op = 28'%ip,to_string=True)
    for field in ['_arg0','_arg1','_arg2','_arg3']:
     gdb.execute('set variable proto->_instructions[%d].%s = 0'%(ip,field),to_string=True)
    count+=1
  assert count==int(name.split('_')[-1]),(name,count)
  mutated[name]=count;return False
mutation=Mutate('sqjit_a64_compile_precise',internal=True)
'''
for label in ['control','candidate']:
 (d/label).mkdir(exist_ok=True)
 s=(root/'budget'/(label+'.gdb')).read_text().replace(str(root/'budget'),str(d)).replace('len(captured)==80','len(captured)==32')
 s=s.replace("capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)",mutation+"capture=Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610',internal=True)")
 s=s.replace("assert all(v>0 for v in entries.values())", "assert all(v>0 for v in entries.values())\nassert len(mutated)==32\n(out/'mutations.json').write_text(json.dumps(mutated,indent=2)+'\\n')")
 (d/(label+'.gdb')).write_text(s)
print('Prepared 32 legal bytecode boundary fixtures; accepted benchmarks untouched')
