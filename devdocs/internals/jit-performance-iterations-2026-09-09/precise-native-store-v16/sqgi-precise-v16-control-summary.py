from pathlib import Path
import json,statistics
r=Path('/tmp/sqgi-precise-native-store-study');out={}
for w in [5,4]:
 d=json.loads((r/f'kernel-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['medians'])==15
 assert d['metadata']['binaries']['v16']==d['metadata']['binaries']['v16_repeat']
 assert all(len(a)==5 for row in d['samples'].values() for a in row.values())
 m=d['medians']['array_append'];out[f'warmups{w}']={'array_append_medians_ns':{k:v*1000 for k,v in m.items()},'array_append_ranges_ns':{k:[min(a)*1000,max(a)*1000] for k,a in d['samples']['array_append'].items()},'identical_v16_repeat_over_v16':m['v16_repeat']/m['v16'],'v16_over_v15':m['v16']/m['v15'],'v16_repeat_over_v15':m['v16_repeat']/m['v15'],'v16_over_audit':m['v16']/m['audit'],'v16_repeat_over_audit':m['v16_repeat']/m['audit'],'full_kernel_speedup_v15_v16':statistics.geometric_mean(m['v15']/m['v16'] for m in d['medians'].values()),'per_case_v15_over_v16':{k:v['v15']/v['v16'] for k,v in d['medians'].items()},'cpu_frequencies_at_process_endpoints':sorted({x[k]['cpu_frequency'].get('scaling_cur_freq','unknown') for x in d['raw'] if 'host_start' in x for k in ['host_start','host_end']})}
out['scope']='Original full56 array_append regression remains included. Controls use the unchanged full 15-kernel script. Endpoint frequency snapshots do not measure frequency inside timed regions. No diagnostic sample replaces or reweights the full56 result.'
(r/'kernel-control-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
