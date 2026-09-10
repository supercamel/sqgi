from pathlib import Path
import json,statistics,math,hashlib,sys
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-cold-literal-lookup-study');sys.path.insert(0,str(R/'tools'))
from run_execution_benchmarks import parse
from decimal import Decimal
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
out={};expected_sha='368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa'
for w in [5,4]:
 for suite,count in [('methods',6),('members',6),('owners',10)]:
  p=S/f'{suite}-pilot-w{w}.json';d=json.loads(p.read_text());m=d['metadata'];assert m['runs']==5 and m['warmups']==w and m['cpu']==4 and m['iterations']==200000
  for path,want in m['hashes'].items():assert h(Path(path))==want,path
  assert m['hashes'][m['commands']['v27'][0]]==expected_sha and m['commands']['v27']==m['commands']['v27_repeat']
  assert len(d['medians'])==count and len(d['raw'])==21
  ref=parse(d['raw'][0]['stdout']);assert len(ref)==count
  order=['v26','v27','v27_repeat','node']
  for n,raw in enumerate(d['raw'][1:]):
   rnd,slot=divmod(n,4);assert raw['round']==rnd+1 and raw['runtime']==order[(rnd+slot)%4]
   rows=parse(raw['stdout']);assert rows.keys()==ref.keys()
   assert not any(x in raw['stdout']+raw['stderr'] for x in ['SCRIPT ERROR','AN ERROR HAS OCCURRED','FAIL:','[FAIL]'])
   for k,v in rows.items():assert v['iterations']==200000 and Decimal(v['checksum'])==Decimal(ref[k]['checksum'])
  ratios={}
  for k,m in d['medians'].items():
   for name,v in m.items():
    samples=d['samples'][name][k];assert len(samples)==5 and all(math.isfinite(x) and x>0 for x in samples) and statistics.median(samples)==v
   ratios[k]={n:m[n]/m['v26'] for n in ['v27','v27_repeat']}
  out[p.stem]={'geomean':{n:statistics.geometric_mean(v[n] for v in ratios.values()) for n in ['v27','v27_repeat']},'per_case':ratios,'regressions_over_5pct':{k:v for k,v in ratios.items() if max(v.values())>1.05},'result_sha256':h(p)}
result={'candidate_sha256':expected_sha,'groups':out,'verified':True,'no_regressions_over_5pct':all(not v['regressions_over_5pct'] for v in out.values())}
(S/'pilot-verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:{a:b for a,b in v.items() if a!='per_case'} for k,v in out.items()},indent=2))
assert result['no_regressions_over_5pct'],'Investigate pilot regression before freezing'
