from pathlib import Path
import json,hashlib,shutil,ast
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-shared-helper-tail-study');S.mkdir(exist_ok=True);P=Path('/tmp/sqgi-v29-pilot');P.mkdir(exist_ok=True)
shutil.copy2('/tmp/sqgi-scalar-leaf-20260909/sqgi',P/'sqgi')
s=Path('/tmp/sqgi-v28-pilot-timings.sh').read_text().replace('v28','v29').replace('v27','v28').replace('cold-literal-lookup-v28','shared-helper-v28').replace('/tmp/sqgi-shared-helper-study',str(S))
s=s.replace('--sqgi v29_repeat=', '--sqgi v28_repeat=build-jit-audit-20260909/shared-helper-v28/sqgi --sqgi v29_repeat=')
Path('/tmp/sqgi-v29-pilot-timings.sh').write_text(s)
s=Path('/tmp/sqgi-v28-verify-pilots.py').read_text().replace('v28','v29').replace('v27','v28').replace('/tmp/sqgi-shared-helper-study',str(S)).replace('ef6bbeab6b37097be7e2314d6f71067f797ce34bdb40a9c0ddc8454bbd608330',hashlib.sha256((P/'sqgi').read_bytes()).hexdigest())
s=s.replace("len(d['raw'])==21", "len(d['raw'])==26").replace("order=['v28','v29','v29_repeat','node']", "order=['v28','v29','v28_repeat','v29_repeat','node']").replace('divmod(n,4)','divmod(n,5)').replace('order[(rnd+slot)%4]', 'order[(rnd+slot)%5]')
s=s.replace("  ratios={}\n", "  assert m['commands']['v28']==m['commands']['v28_repeat']\n  ratios={}\n  copies={}\n")
s=s.replace("   ratios[k]={n:m[n]/m['v28'] for n in ['v29','v29_repeat']}\n", "   ratios[k]={n:m[n]/m['v28'] for n in ['v29','v29_repeat']}\n   copies[k]={'baseline_repeat_over_primary':m['v28_repeat']/m['v28'],'paired_copies_ratio':statistics.geometric_mean([m['v29'],m['v29_repeat']])/statistics.geometric_mean([m['v28'],m['v28_repeat']])}\n")
s=s.replace("'per_case':ratios,", "'per_case':ratios,'copy_diagnostics':copies,")
Path('/tmp/sqgi-v29-verify-pilots.py').write_text(s);ast.parse(s)
policy={'runs':5,'warmups':[5,4],'iterations':200000,'cpu':4,'suites':['methods','members','owners'],'rotation':['v28','v29','v28_repeat','v29_repeat','node'],'purpose':'Retain original primary-baseline >5% flags while adding an identical baseline repeat to expose copy variation. All raw values retained; supplementary paired-copy ratios do not suppress primary-baseline flags. Unchanged workloads and full56 weights.','interpreter_checksum_reference':True}
assert not (S/'pilot-policy.json').exists();(S/'pilot-policy.json').write_text(json.dumps(policy,indent=2)+'\n')
print('V29 pilots prepared with repeated baseline and candidate; original flag rule retained')
