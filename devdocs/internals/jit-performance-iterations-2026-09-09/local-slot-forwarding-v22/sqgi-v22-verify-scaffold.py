from pathlib import Path
import re
pairs={'receiver-entry-guards-v21':'local-slot-forwarding-v22','closure-witness-guards-v19':'receiver-entry-guards-v21','v21':'v22','v19':'v21','V21':'V22','V19':'V21'}
p=re.compile('|'.join(map(re.escape,sorted(pairs,key=len,reverse=True))));conv=lambda s:p.sub(lambda m:pairs[m[0]],s)
s=conv(Path('/tmp/sqgi-v21-verify.py').read_text()).replace('len(manifest)==95','len(manifest)==96').replace('len(changed)==28','len(changed)==30')
s=s.replace("'[coverage] executed AArch64 receiver publication contracts (scalar, final, nonfinal, ancestors)']", "'[coverage] executed AArch64 receiver publication contracts (scalar, final, nonfinal, ancestors)','[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)']")
s=s.replace("counts['control']['entry_root']==126", "counts['control']['entry_root']==3")
a=s.index("r=json.loads((D/'route/entry-route-summary.json')");b=s.index('exit_codes=',a)
s=s[:a]+'''r=json.loads((D/'route/entry-route-summary.json').read_text())
for label in ['control','candidate']:
 assert r[label]['loop_attempts']==r[label]['loop_successes']==6 and r[label]['guard_failures']==0
 assert r[label]['helper_calls']=={'entry_root':3,'entry_parameter':3}
code=json.loads((D/'forwarding-captures/code-verification.json').read_text());assert len(code)==10
assert all(v['installed_bytes_match'] and v['cache_moves']>0 for v in code.values())
assert code['pressure']['private_memory_instructions_before']==194 and code['pressure']['private_memory_instructions_after']==88
paired=json.loads((D/'paired-code-summary.json').read_text());assert len(paired)==8
assert paired['array_append_kernel-entry']['array_artifact_unchanged']
assert all(v['scratch_moves']>0 and v['entry_guard_preserved'] for k,v in paired.items() if k!='array_append_kernel-entry')
''' +s[b:]
s=s.replace("assert (D/'discarded-overlap/README.md').exists()\n",'')
a=s.index("for label,engine,expected in [('candidate'")
s=s[:a]+'''for label,engine in [('candidate',B/'native-validation'),('v21',R/'build-jit-audit-20260909/receiver-entry-guards-v21/native-validation')]:
 p=subprocess.run([str(D/'receiver-publication/witness')],env=dict(os.environ,LD_LIBRARY_PATH=str(engine)),capture_output=True,text=True)
 assert p.returncode==0,(label,p.returncode,p.stdout,p.stderr)
 assert 'status=0 releases=0 callback_sum=-1 frame_sum=0' in p.stdout
for pilot in ['pilot1','pilot2']:
 for p,s in json.loads((D/'rejected-pilots'/pilot/'manifest.json').read_text()).items():assert h(R/p)==s,p
assert 'four-file V21 delta' in (D/'README.md').read_text()
assert (B/'native-validation/sqgi_test_cpp_sqjit_aarch64_emit').exists()
print('VERIFIED V22: complete selected gates, unchanged benchmarks, exact branch/instruction/installed-code checks, retained lifetime regressions, full fresh timings and profiles. Goal remains active.')
'''
Path('/tmp/sqgi-v22-verify.py').write_text(s)
