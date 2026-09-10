from pathlib import Path
import json,statistics,hashlib
r=Path('/tmp/sqgi-precise-native-reference-study');out={}
for seed,w in [(17,5),(83,4)]:
 d=json.loads((r/f'application-control-seed{seed}-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['medians'])==8
 assert d['metadata']['binaries']['v13']==d['metadata']['binaries']['v13_repeat']
 assert all(len(a)==5 for row in d['samples'].values() for a in row.values())
 m=d['medians']['records_4096'];key=f'seed{seed}_warmups{w}'
 out[key]={'records_medians_ns':{k:v*1000 for k,v in m.items()},'records_ranges_ns':{k:[min(a)*1000,max(a)*1000] for k,a in d['samples']['records_4096'].items()},'identical_v13_repeat_over_v13':m['v13_repeat']/m['v13'],'v13_over_v12':m['v13']/m['v12'],'v13_repeat_over_v12':m['v13_repeat']/m['v12'],'v13_over_audit':m['v13']/m['audit'],'v13_repeat_over_audit':m['v13_repeat']/m['audit'],'full_application_speedup_v12_v13':statistics.geometric_mean(m['v12']/m['v13'] for m in d['medians'].values()),'cpu_frequencies':sorted({x[k]['cpu_frequency'].get('scaling_cur_freq','unknown') for x in d['raw'] if 'host_start' in x for k in ['host_start','host_end']})}
out['interpretation']='Original full-mix records_4096 regression remains included. Identical V13 process commands have a 17.6% median spread in seed17; seed83 controls are closer. A repeatable V13 code regression is not established, but the source of the benchmark variance is unresolved. No control sample replaces or reweights the fixed56 study.'
(r/'application-control-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
