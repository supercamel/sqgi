from pathlib import Path
S=Path('/tmp/sqgi-transactional-float-copies-study');(S/'profiles').mkdir(exist_ok=True)
p=Path('/tmp/sqgi-local-slot-forwarding-study/profiles/dump.gdb');(S/'profiles/dump.gdb').write_text(p.read_text().replace('/tmp/sqgi-local-slot-forwarding-study',str(S)))
F=S/'filter-stream-captures';F.mkdir(exist_ok=True)
s=Path('/tmp/sqgi-local-slot-forwarding-study/filter-stream-captures/candidate.gdb').read_text()
for label in ['v21','control','candidate']:
 (F/f'{label}.gdb').write_text(s.replace('/tmp/sqgi-local-slot-forwarding-study/filter-stream-captures/candidate',str(F/label)))
p=Path('/tmp/sqgi-v23-paired-code.py');s=p.read_text().replace("  scratch=sum", "  assert list(map(norm,old))==list(map(norm,new)),(name,'previous forwarded artifact changed')\n  scratch=sum",1).replace('scratch_moves=scratch,','scratch_moves=scratch,whole_artifact_unchanged=True,',1);p.write_text(s)
