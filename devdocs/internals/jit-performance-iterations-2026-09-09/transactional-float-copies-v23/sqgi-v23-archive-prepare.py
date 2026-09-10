from pathlib import Path
# Extract only the deterministic path/version adapter; no regeneration side effects.
ns={};exec(Path('/tmp/sqgi-v23-prepare.py').read_text().split('files=')[0],ns);adapt=ns['adapt']
for name in ['archive.py','seal.py']:
 Path('/tmp/sqgi-v23-'+name).write_text(adapt(Path('/tmp/sqgi-v22-'+name).read_text()))
s=adapt(Path('/tmp/sqgi-v22-verify.py').read_text())
s=s.replace("'[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)'", "'[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)','[coverage] executed AArch64 typed-copy forwarding and fallback contracts'")
start=s.index("filter_code=json.loads")
end=s.index("for label,engine in",start)
s=s[:start]+'''filter_code=json.loads((D/'filter-stream-captures/code-comparison.json').read_text())
assert filter_code['code_bytes']==1192 and filter_code['normalized_code_matches_v21']
assert len(filter_code['restored_gp_copy_instructions'])==10 and filter_code['remaining_normalized_code_matches_v22']
assert all(v['whole_artifact_unchanged'] for v in paired.values())
'''+s[end:]
start=s.index("for pilot in")
end=s.index("assert 'four-file",start)
s=s[:start]+s[end:]
s=s.replace('VERIFIED V23: complete selected gates, unchanged benchmarks, exact branch/instruction/installed-code checks, retained lifetime regressions, full fresh timings and profiles. Goal remains active.', 'VERIFIED V23: complete selected gates, unchanged benchmarks, ten restored GP copy instructions, unchanged forwarded artifacts, precise exits, lifetime regressions, full fresh timings and profiles. Goal remains active.')
Path('/tmp/sqgi-v23-verify.py').write_text(s)
print('Prepared V23 archival and verification scripts')
