from pathlib import Path
import ast,json,struct,hashlib
S=Path('/tmp/sqgi-v27-budget-refined');source=Path('/tmp/sqgi-v26-compare-code.py').read_text();module=ast.parse(source)
namespace={'struct':struct};exec(compile(ast.Module(body=[x for x in module.body if isinstance(x,ast.FunctionDef)],type_ignores=[]),'normalization','exec'),namespace)
words=namespace['words'];normalized=namespace['normalized'];rows={};witnesses=[];growth=set()
for label in ['control','candidate']:
 log=(S/(label+'.log')).read_text();assert 'Python Exception' not in log and 'Traceback' not in log
 d=json.loads((S/label/'metadata.json').read_text());assert len(d['captures'])==16 and len(d['entries'])==16 and all(n>0 for n in d['entries'].values())
for n in range(1,17):
 name=f'budget_pad_{n}';a=words(S/'control'/(name+'.bin'));b=words(S/'candidate'/(name+'.bin'))
 cold_a=a.count(0xeb0a01bf);cold_b=b.count(0xeb0a01bf)
 equal=normalized(a)==normalized(b);owning_store=0xf900056c in a
 if cold_b and not cold_a:growth.add((len(b)-len(a))*4)
 if equal and owning_store and not cold_b:witnesses.append(name)
 rows[name]={'before_bytes':len(a)*4,'after_bytes':len(b)*4,'cold_probe_compares_before':cold_a,'cold_probe_compares_after':cold_b,'normalized_equal':equal,'owning_heap_store_before':owning_store}
result={'functions':16,'same_tier_fallback_candidates':witnesses,'rich_layout_code_growth_bytes':sorted(growth),'rows':rows}
(S/'comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))

assert len(witnesses)==14 and growth=={752},(witnesses,growth)
assert all(rows[n]['before_bytes']+752>8192 and rows[n]['before_bytes']<=8192 for n in witnesses)
result['verified']=True
(S/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print('VERIFIED 14 same-tier fallbacks; all 16 refined functions execute natively')
