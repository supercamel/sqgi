from pathlib import Path
import json,struct,ast
root=Path('/tmp/sqgi-v26-probes')
# Reuse only the previously audited pure bytecode-normalization functions.
tree=ast.parse(Path('/tmp/sqgi-v25-compare-code.py').read_text())
exec(compile(ast.Module(body=[x for x in tree.body if isinstance(x,ast.FunctionDef)],type_ignores=[]),'normalization','exec'))
def has_post(w):
 return any(w[n]==0x8b0a018b and w[n+1]&0xffc003ff==0xb9400271 and w[n+2]&~0x7ffe0==0x36d80011 for n in range(len(w)-2))
def owning_literal(w):
 return any(w[n]==0x5280020d and w[n+1]==0x72a1000d for n in range(len(w)-1))
old=json.loads((root/'owner/control/metadata.json').read_text());new=json.loads((root/'owner/candidate/metadata.json').read_text())
assert old['entries']==new['entries'] and old['helper_calls']==sum(old['entries']) and new['helper_calls']==0,(old,new)
a=words(root/'owner/control/recycle.bin');b=words(root/'owner/candidate/recycle.bin')
assert not has_post(a) and has_post(b)
owner={'native_invocations':len(new['entries']),'native_loop_iterations':sum(new['entries']),'helper_calls_before':old['helper_calls'],'helper_calls_after':new['helper_calls'],'code_bytes_before':4*len(a),'code_bytes_after':4*len(b)}
rows={};growth=[]
for family,count in [('budget',80),('budget-refined',32)]:
 old=json.loads((root/family/'control/metadata.json').read_text());new=json.loads((root/family/'candidate/metadata.json').read_text())
 assert set(old['captures'])==set(new['captures']) and len(old['captures'])==count
 for name in sorted(old['captures'],key=lambda x:int(x.split('_')[-1])):
  a=words(root/family/'control'/(name+'.bin'));b=words(root/family/'candidate'/(name+'.bin'))
  assert old['entries'][name]>0 and new['entries'][name]>0
  row={'before_bytes':len(a)*4,'after_bytes':len(b)*4,'normalized_equal':normalized(a)==normalized(b),'owning_literal_copy_before':owning_literal(a),'new_postincrement_selected':has_post(b)}
  assert not has_post(a)
  if row['new_postincrement_selected']:growth.append(row['after_bytes']-row['before_bytes'])
  rows[family+'/'+name]=row
assert growth and min(growth)>0,growth
preserved=[n for n,v in rows.items() if v['normalized_equal'] and v['owning_literal_copy_before'] and v['before_bytes']+min(growth)>8192]
assert preserved,('No demonstrated same-tier fallback yet',sorted(set(growth)))
result={'verified':True,'owner':owner,'budget_functions':len(rows),'postincrement_code_growth_bytes':sorted(set(growth)),'same_tier_fallback_witnesses':preserved,'budgets':rows,'limitations':['GDB and perf addresses are not joined across processes','only MOVZ/MOVK sequences materializing 32-to-48-bit pointers are normalized']}
(root/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='budgets'},indent=2))
