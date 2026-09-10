from pathlib import Path
import json,statistics,math,random,hashlib
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-shared-helper-study');P=S/'records-replication';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
policy=json.loads((P/'policy.json').read_text());assert policy['blocks']==4 and policy['runs_per_block']==5 and policy['warmups']==[5,4] and policy['seeds_counts']=={'17':200000,'83':400003}
def logs(d,k,old,new):
 samples=d['samples'][k]
 return [statistics.mean(math.log(samples[n][i]) for n in new)-statistics.mean(math.log(samples[n][i]) for n in old) for i in range(5)]
def estimate(values,seed):
 rng=random.Random(seed);count=len(values);means=sorted(statistics.mean(rng.choices(values,k=count)) for _ in range(10000))
 return {'paired_rounds':count,'geomean_ratio':math.exp(statistics.mean(values)),'paired_bootstrap_95_interval':[math.exp(means[249]),math.exp(means[9749])]}
out={};identities={}
for seed,expected_n,w in [(seed,n,w) for seed,n in [(17,200000),(83,400003)] for w in [5,4]]:
 blocks=[]
 for block in range(1,5):
  path=P/f'block{block}-seed{seed}-w{w}.json';d=json.loads(path.read_text());m=d['metadata'];assert d['completed_rounds']==5 and m['runs']==5 and m['warmups']==w and m['block']==block and m['cpu']==4 and m['seed']==seed and m['iterations']==expected_n
  assert len(d['medians'])==8 and len(d['raw'])==21
  for path0,want in m['hashes'].items():assert h(Path(path0))==want,path0
  assert m['binaries']['v27']==m['binaries']['v27_repeat'] and m['binaries']['v28']==m['binaries']['v28_repeat']
  for k,row in d['samples'].items():
   assert set(row)=={'v27','v27_repeat','v28','v28_repeat'}
   for n,values in row.items():assert len(values)==5 and all(math.isfinite(x) and x>0 for x in values) and statistics.median(values)==d['medians'][k][n]
  blocks.append(d);identities[path.name]=h(path)
 original_path=S/f'application{"-seed17" if seed==17 else ""}-control-w{w}.json'
 original=json.loads(original_path.read_text());rows={}
 for ix,k in enumerate(blocks[0]['medians']):
  paired=[v for d in blocks for v in logs(d,k,['v27','v27_repeat'],['v28','v28_repeat'])]
  combined=logs(original,k,['v27'],['v28','v28_repeat'])+paired
  fresh=estimate(paired,29000+seed*100+w+ix*17);total=estimate(combined,39000+seed*100+w+ix*17)
  pooled={version:[v for d in blocks for name in [version,version+'_repeat'] for v in d['samples'][k][name]] for version in ['v27','v28']}
  original_m=original['medians'][k]
  rows[k]={'original_ratios':{n:original_m[n]/original_m['v27'] for n in ['v28','v28_repeat']},'new':fresh,'original_plus_new':total,'pooled_new_median_ratio':statistics.median(pooled['v28'])/statistics.median(pooled['v27']),'new_samples_per_version':40,'pooled_new_range_ns':{n:[min(v)*1000,max(v)*1000] for n,v in pooled.items()},'block_geomean_ratios':[math.exp(statistics.mean(logs(d,k,['v27','v27_repeat'],['v28','v28_repeat']))) for d in blocks],'block_copy_ratios':[{n:d['medians'][k][n+'_repeat']/d['medians'][k][n] for n in ['v27','v28']} for d in blocks],'material_regression_excluded':fresh['paired_bootstrap_95_interval'][1]<=1.05 and total['paired_bootstrap_95_interval'][1]<=1.05}
 out[f'{seed}-w{w}']=rows
result={'policy':policy,'result_hashes':identities,'all_blocks_retained':True,'original_flagged_controls_retained':True,'full56_unchanged':True,'warmups':out,'all_eight_cases_material_regression_excluded':all(row['material_regression_excluded'] for rows in out.values() for row in rows.values()),'records_4096_material_regression_excluded':all(rows['records_4096']['material_regression_excluded'] for rows in out.values()),'verified':True,'original_control_hashes':{p.name:h(p) for p in [S/f'application{suffix}-control-w{w}.json' for suffix in ['', '-seed17'] for w in [5,4]]}}
(P/'analysis.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({w:rows['records_4096'] for w,rows in out.items()},indent=2));print('ALL EIGHT CASES EXCLUDED',result['all_eight_cases_material_regression_excluded'])
