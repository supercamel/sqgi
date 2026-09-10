from pathlib import Path
import json,statistics,struct
S=Path('/tmp/sqgi-precise-integer-compare-study');result={}
for w in [4,5]:
 for group in ['kernel','floats']:
  d=json.loads((S/f'{group}-control-w{w}.json').read_text())
  if group=='kernel':
   assert d['completed_rounds']==5 and len(d['raw'])==21
   assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
  else:
   assert d['metadata']['runs']==5
   assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
  per={}
  for k,m in d['medians'].items():
   per[k]={'medians_ns':{name:value*1000 for name,value in m.items()},'v18_over_audit':m['v18']/m['audit'],'v18_over_v17':m['v18']/m['v17'],'identical_repeat_over_v18':m['v18_repeat']/m['v18']}
  result[f'{group}-w{w}']={'per_case':per,'regressions_over_5pct_against_v17':[k for k,v in per.items() if v['v18_over_v17']>1.05],'geomean_v18_over_v17':statistics.geometric_mean(v['v18_over_v17'] for v in per.values())}
metadata={label:{} for label in ['control','candidate']};locations={};captures={}
for relative in ['call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  part=json.loads((S/relative/label/'metadata.json').read_text());assert not (metadata[label].keys() & part.keys())
  metadata[label].update(part)
  for key in part:locations[key]=relative

assert metadata['control'].keys()==metadata['candidate'].keys(),metadata
for k in metadata['control']:
 row={}
 for label in ['control','candidate']:
  raw=(S/locations[k]/label/(k+'.bin')).read_bytes();words=struct.unpack('<'+'I'*(len(raw)//4),raw)
  row[label]={'code_bytes':max(i+1 for i,v in enumerate(words) if v)*4,**metadata[label][k]}
 row['added_code_bytes']=row['candidate']['code_bytes']-row['control']['code_bytes'];captures[k]=row
 assert not any(v['type'] in ['OT_CLOSURE','OT_NATIVECLOSURE'] for v in row['control']['weak_witnesses']),row
 assert any(v['type'] in ['OT_CLOSURE','OT_NATIVECLOSURE'] for v in row['candidate']['weak_witnesses']) == (k!='array_append_kernel-entry'),row
result['native_call_captures']=captures
(S/'regression-control-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
