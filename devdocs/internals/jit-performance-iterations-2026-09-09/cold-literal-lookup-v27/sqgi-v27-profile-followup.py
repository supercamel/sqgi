from pathlib import Path
import json,re,statistics,math,hashlib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';S=Path('/tmp/sqgi-cold-literal-lookup-study');P=A/'owning-postincrement-v26/study'
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
summary=json.loads((S/'results/summary.json').read_text());assert len(summary['rows'])==56
profiles={}
for suite in ['kernels','applications','roots','members','owners','methods','floats']:
 def read(root):
  path=root/'profiles'/(suite+'-flat.log');s=path.read_text();assert '# Total Lost Samples: 0' in s
  rows=[]
  for line in s.splitlines():
   m=re.match(r'\s*([\d.]+)%\s+\S+\s+(.+?)\s+\[.\]\s+(.+)',line)
   if m:rows.append({'percent':float(m[1]),'object':m[2].strip(),'symbol':m[3].strip()})
  return rows
 before=read(P);after=read(S)
 profiles[suite]={'v26':before,'v27':after,'profile_sha256':h(S/'profiles'/(suite+'-flat.log'))}
tails={engine:sorted([{'suite':r['suite'],'name':r['name'],'sqgi_ns':r['ns']['sqgi'],'engine_ns':r['ns'][engine],'ratio':r['ns']['sqgi']/r['ns'][engine]} for r in summary['rows']],key=lambda r:r['ratio'],reverse=True) for engine in ['node','gjs']}
result={'source':'fresh V27 five-round full56 and seven ordinary flat profiles','aggregation':'56 equally weighted components; seed83 remains separate','profiles':profiles,'ratios_ranked':tails,'full56_speedup':summary['speedup'],'runtime_ratios':summary['totals']['sqgi'],'remaining_uniform_speedup_for_geomean_target':{e:max(1,v['geomean']/3) for e,v in summary['totals']['sqgi'].items()},'symbol_percentages_are_separate_profile_estimates':True,'no_cross_process_native_address_join':True}
(S/'profile-followup.json').write_text(json.dumps(result,indent=2)+'\n')
lines=['# Fresh V27 profile and tail evidence','',f"Full56 speedup versus the frozen audit: {summary['speedup']:.9f}×.",'','Flat profile percentages describe each measured process. They are not direct','before/after speedups, and native addresses from different processes are not','joined. All seven captures report zero lost samples.','']
for engine,rows in tails.items():
 lines += [f'## Largest runtime ratios versus {engine}','','| Workload | SQGI ns/op | Engine ns/op | Ratio |','|---|---:|---:|---:|']
 for r in rows[:12]:lines.append(f"| {r['suite']}/{r['name']} | {r['sqgi_ns']:.3f} | {r['engine_ns']:.3f} | {r['ratio']:.3f}× |")
 lines.append('')
for suite,p in profiles.items():
 lines += [f'## {suite}: leading V27 flat symbols','']
 for row in p['v27'][:8]:lines.append(f"- {row['percent']:.2f}% `{row['symbol']}` ({row['object']})")
 lines.append('')
lines += ['## Follow-up checks','','Confirm the successful emission tier and native helper execution for buffer','workloads before applying the shared-helper draft. Near-full code and absence','of an owning-store opcode alone do not prove the selected tier or a speedup.','Methods still need parent-loop/call overhead analysis; owner DLOAD is a separate','lead. Preserve canonical-frame ownership and exact-exit semantics in every path.','']
(S/'profile-followup.md').write_text('\n'.join(lines))
print(json.dumps({'full56_speedup':summary['speedup'],'ratios':summary['totals']['sqgi'],'node_top6':tails['node'][:6],'gjs_top6':tails['gjs'][:6]},indent=2))
