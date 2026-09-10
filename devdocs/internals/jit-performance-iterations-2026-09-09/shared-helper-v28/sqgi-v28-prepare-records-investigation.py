from pathlib import Path
import json,shutil,hashlib,ast
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-shared-helper-study');P=Path('/tmp/sqgi-v28-records-probe');P.mkdir(exist_ok=True)
def convert(s):
 return s.replace('v27','v28').replace('V27','V28').replace('v26','v27').replace('V26','V27').replace('cold-literal-lookup-v28','shared-helper-v28').replace('owning-postincrement-v27','cold-literal-lookup-v27').replace('/tmp/sqgi-cold-literal-lookup-study',str(S))
for label in ['control','candidate']:
 (P/label).mkdir(exist_ok=True);(P/(label+'.gdb')).write_text(convert(Path('/tmp/sqgi-v27-records-probe/'+label+'.gdb').read_text()))
(P/'run.sh').write_text(convert(Path('/tmp/sqgi-v27-records-probe/run.sh').read_text()))
s=convert(Path('/tmp/sqgi-v27-records-replication.py').read_text());Path('/tmp/sqgi-v28-records-replication.py').write_text(s)
s=convert(Path('/tmp/sqgi-v27-analyze-records-replication.py').read_text()).replace('27000+w','28000+w').replace('28000+w+ix*17)\n  pooled','29000+w+ix*17)\n  pooled')
s=s.replace("'verified':True}","'verified':True,'original_control_hashes':{f'application-control-w{w}.json':h(S/f'application-control-w{w}.json') for w in [5,4]}}")
Path('/tmp/sqgi-v28-analyze-records-replication.py').write_text(s)
for name in ['records-replication.py','analyze-records-replication.py']:ast.parse(Path('/tmp/sqgi-v28-'+name).read_text())
v=json.loads((S/'study-verification.json').read_text());assert not v['performance_acceptance_checks_pass']
assert v['control_regressions_over_5pct']=={'application-w5':{'repeat_regressions_over_5pct_against_v27':['records_4096']}},v['control_regressions_over_5pct']
assert not (S/'study-verification-initial-controls.json').exists();shutil.copy2(S/'study-verification.json',S/'study-verification-initial-controls.json')
shutil.copy2('/tmp/sqgi-v28-verify-study.py','/tmp/sqgi-v28-verify-study-initial-controls.py')
print('Initial unresolved control preserved; fixed all-eight-case replication prepared')
