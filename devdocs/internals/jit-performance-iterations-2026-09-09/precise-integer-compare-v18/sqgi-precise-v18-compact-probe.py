from pathlib import Path
import shutil
s=Path('/tmp/sqgi-precise-integer-compare-study');d=s/'route/compact';d.mkdir(exist_ok=True)
g=(s/'profiles/dump.gdb').read_text().replace("out = pathlib.Path('/tmp/sqgi-precise-integer-compare-study/profiles')",f"out = pathlib.Path('{d}')")
g=g.replace("['recycle','transfer','publish','table_apply','apply']","['exit_sites','cached_many']").replace("{'recycle','transfer','publish','table_apply','apply'}","{'exit_sites','cached_many'}").replace('five canonical-frame functions','two compact canonical-frame functions')
g=g.replace('python\nimport gdb','start\npython\nimport gdb',1)
a=g.index('run test/bench_member_owners.nut');b=g.index('python\nassert {name',a);g=g[:a]+'continue\n'+g[b:]
(d/'dump.gdb').write_text(g)
for ext in ['gdb','log','hits.json']:
 p=s/'route'/('candidate.'+ext if ext!='hits.json' else 'candidate-hits.json')
 if p.exists():shutil.copy2(p,s/'route'/('initial-integer-only-'+p.name))
p=Path('/tmp/sqgi-precise-v18-measure.sh');t=p.read_text();needle='gdb -q -batch -x "$study/profiles/dump.gdb"'
a=t.index(needle)
t=t[:a]+'''gdb -q -batch -x "$study/route/candidate.gdb" "$candidate" > "$study/route/candidate.log" 2>&1
gdb -q -batch -x "$study/route/compact/dump.gdb" /tmp/sqgi-scalar-leaf-20260909/sqgi_test_cpp_sqjit_side_exit > "$study/route/compact/dump.log" 2>&1
'''+t[a:];p.write_text(t)
