from pathlib import Path
import hashlib,ast
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-shared-helper-tail-study');old=Path('/tmp/sqgi-shared-helper-study');sha=hashlib.sha256(Path('/tmp/sqgi-scalar-leaf-20260909/sqgi').read_bytes()).hexdigest()
def convert(s):
 return s.replace('v28','v29').replace('V28','V29').replace('v27','v28').replace('V27','V28').replace('shared-helper-v29','shared-helper-tail-v29').replace('cold-literal-lookup-v28','shared-helper-v28').replace('/tmp/sqgi-shared-helper-study',str(S)).replace('ef6bbeab6b37097be7e2314d6f71067f797ce34bdb40a9c0ddc8454bbd608330',sha)
for name in ['measure-initial.sh','captures.sh','controls.sh','kernel-control.py','application-control.py','application-seed17-control.py','summarize-controls.py','verify-exit-code.py','compare-code.py','profile-followup.py']:
 s=convert(Path('/tmp/sqgi-v28-'+name).read_text())
 if name in ['kernel-control.py','application-control.py','application-seed17-control.py']:
  marker="'v29_repeat':R/'build-jit-audit-20260909/shared-helper-tail-v29/sqgi'"
  assert marker in s
  s=s.replace(marker,"'v28_repeat':R/'build-jit-audit-20260909/shared-helper-v28/sqgi',"+marker)
  s=s.replace('names[rnd%4:]+names[:rnd%4]','names[rnd%len(names):]+names[:rnd%len(names)]')
  s=s.replace('an identical V29 repeat','identical V28 and V29 repeats')
 if name=='controls.sh':s=s.replace('--sqgi "v29_repeat=$candidate"','--sqgi v28_repeat=build-jit-audit-20260909/shared-helper-v28/sqgi --sqgi "v29_repeat=$candidate"')
 if name=='summarize-controls.py':
  s=s.replace("labels={'v28','v29','v29_repeat'}", "labels={'v28','v28_repeat','v29','v29_repeat'}")
  s=s.replace("   if 'audit' in m:", "   row['baseline_repeat_over_v28']=m['v28_repeat']/m['v28']\n   row['paired_copies_ratio']=statistics.geometric_mean([m['v29'],m['v29_repeat']])/statistics.geometric_mean([m['v28'],m['v28_repeat']])\n   if 'audit' in m:")
 if name=='verify-exit-code.py':
  a=s.index(' if tail:assert');b=s.index('\n out[name]',a)
  s=s[:a]+" if tail:assert len(tail)==6 and tail[0]&0xffc003ff==0xf94003e0 and tail[1:]==[0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200],(name,tail)"+s[b:]
  s=s.replace("'compact_trampoline':bool(tail)","'shared_helper_tail_branch':bool(tail)")
 if name=='compare-code.py':
  s=s.replace('len(old)*4==7884 and len(new)*4==7408','len(old)*4==7408 and len(new)*4==7392').replace('expected shared tier3 buffer layout','expected 24-byte shared tail layout')
  marker="result['rotate_buffers']=";a=s.index(marker)
  s=s[:a]+"assert normalized(old[:-10])==normalized(new[:-6]),'unrelated buffer body changed'\n"+s[a:]
 if name=='profile-followup.py':
  a=s.index("lines += ['## Follow-up checks'");b=s.index("(S/'profile-followup.md')",a)
  s=s[:a]+"lines += ['## Follow-up checks','','The buffer helper count remains 1244 across four successful native calls;','the body is unchanged under pointer normalization and the shared tail is now','24 bytes. Inspect actual runtime changes and remaining helper/VM costs.','Parent-loop/call coverage remains a larger structural gap. No addresses from','different processes are joined, and PC fractions are not speedup estimates.','']\n"+s[b:]
 Path('/tmp/sqgi-v29-'+name).write_text(s)
for relative in ['intrinsic-captures','call-regression-captures','call-regression-captures/extra']:
 for label in ['control','candidate']:
  dest=S/relative;dest.mkdir(parents=True,exist_ok=True);(dest/label).mkdir(exist_ok=True)
  (dest/(label+'.gdb')).write_text(convert((old/relative/(label+'.gdb')).read_text()))
(S/'profiles').mkdir(exist_ok=True);(S/'profiles/dump.gdb').write_text(convert((old/'profiles/dump.gdb').read_text()))
s=convert(Path('/tmp/sqgi-freeze-v28.py').read_text());s=s.replace("assert fault['verified'] and", "assert fault['verified'] and fault['cases']==13 and")
s=s.replace('shared-helper-delta.patch','shared-helper-tail-delta.patch');Path('/tmp/sqgi-freeze-v29.py').write_text(s)
s=convert(Path('/tmp/sqgi-v28-verify-study-initial-controls.py').read_text())
s=s.replace("code['rotate_buffers']['before_bytes']==7884 and code['rotate_buffers']['after_bytes']==7408", "code['rotate_buffers']['before_bytes']==7408 and code['rotate_buffers']['after_bytes']==7392")
assert 'records-replication/analysis.json' not in s
Path('/tmp/sqgi-v29-verify-study.py').write_text(s)
for p in Path('/tmp').glob('sqgi-v29-*.py'):ast.parse(p.read_text(),filename=str(p))
ast.parse(Path('/tmp/sqgi-freeze-v29.py').read_text())
print('V29 full-study tools prepared with repeated baseline controls; no inherited regression exception')
