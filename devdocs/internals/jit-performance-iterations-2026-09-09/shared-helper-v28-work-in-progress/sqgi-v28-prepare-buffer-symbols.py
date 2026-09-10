from pathlib import Path
import subprocess,re,shutil
root=Path('/home/sam/Programming/sqgi')
for label,binary in [('v27',root/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi'),('v28',Path('/tmp/sqgi-scalar-leaf-20260909/sqgi'))]:
 out=Path('/tmp/sqgi-v28-buffer-probe')/label;p=out/'capture.gdb';s=p.read_text();syms=[]
 for line in subprocess.check_output(['nm',str(binary)],text=True).splitlines():
  if 'sqjit_a64_precise_stepI' not in line:continue
  sym=line.split()[-1];m=re.search(r'SQOpcode(\d+)E',sym);assert m,line;syms.append((int(m[1]),sym))
 assert len(syms)==29,len(syms)
 a=s.index('   seen=set()');b=s.index('  native=',a)
 s=s[:a]+f'''   seen=set()
   for op,symbol in {syms!r}:
    address=int(gdb.parse_and_eval("&'"+symbol+"'"))
    if address not in seen:breakpoints.append(Helper(address,op));seen.add(address)
'''+s[b:]
 p.write_text(s)
out=Path('/tmp/sqgi-v28-budget-preservation');out.mkdir(exist_ok=True)
s=Path('/tmp/sqgi-v27-budget-refined/candidate.gdb').read_text().replace('/tmp/sqgi-v27-budget-refined/candidate',str(out))
(out/'capture.gdb').write_text(s)
