from pathlib import Path
import json,subprocess,os
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v30-resource-retry')
build=['g++','-std=gnu++11','-O2','-g','-DSQ_ENABLE_JIT','-ISquirrel3/include','-ISquirrel3/squirrel',str(D/'probe.cpp'),'-L/tmp/sqgi-scalar-leaf-20260909','-Wl,-rpath,/tmp/sqgi-scalar-leaf-20260909','-lsqgi','-o',str(D/'probe')]
(D/'build-command.json').write_text(json.dumps(build,indent=2)+'\n');subprocess.run(build,check=True,cwd=R)
rows=[]
for label,lib in [('v29',str(R/'build-jit-audit-20260909/shared-helper-tail-v29/native-validation')),('v30','/tmp/sqgi-scalar-leaf-20260909')]:
 for kind,b,p in [('proto',105,38),('proto',105,39),('precise',10,71),('precise',10,72),('loop_store_flat',100,22),('loop_store',100,22)]:
  for fault in [False,True]:
   env=dict(os.environ,LD_LIBRARY_PATH=lib);env.pop('LD_PRELOAD',None)
   if fault:env['LD_PRELOAD']='/tmp/sqgi-v30-allocation-fault/fail_exec.so'
   cmd=[str(D/'probe'),kind,str(b),str(p),str(D)]
   r=subprocess.run(cmd,env=env,capture_output=True,text=True);assert r.returncode==0,(cmd,r.stdout,r.stderr)
   rows.append(dict(label=label,kind=kind,blocks=b,pad=p,fault=fault,command=cmd,library_path=lib,stdout=r.stdout,stderr=r.stderr,returncode=r.returncode))
   print(label,kind,p,'fault',fault,r.stdout.replace('\n',' | '),r.stderr)
(D/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
print('24 retry/reference cases passed result and prefix checks')
