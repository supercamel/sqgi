from pathlib import Path
import struct,json
S=Path('/tmp/sqgi-local-slot-forwarding-study');result={}
def words(p):
 b=p.read_bytes();w=list(struct.unpack('<'+'I'*(len(b)//4),b));return w[:max(i+1 for i,v in enumerate(w) if v)]
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
for folder in ['call-regression-captures','call-regression-captures/extra']:
 D=S/folder;meta={k:json.loads((D/k/'metadata.json').read_text()) for k in ['control','candidate']};assert meta['control'].keys()==meta['candidate'].keys()
 for name in meta['control']:
  old=words(D/'control'/(name+'.bin'));new=words(D/'candidate'/(name+'.bin'))
  scratch=sum(w&0xfffffc00 in [0x9e660000,0x9e670000,0x1e604000] and ((w&31)>=16 or (w>>5)&31>=16) for w in new)
  if name=='array_append_kernel-entry':assert list(map(norm,old))==list(map(norm,new)) and scratch==0
  else:
   assert scratch>0
   tails=[x[max(i for i,w in enumerate(x) if w==0xd65f03c0)+1:] for x in [old,new]]
   assert tails[0] and list(map(norm,tails[0]))==list(map(norm,tails[1])),(name,'entry lifetime guard changed')
   assert sorted(w['type'] for w in meta['control'][name]['weak_witnesses'])==sorted(w['type'] for w in meta['candidate'][name]['weak_witnesses'])
  result[name]=dict(control_code_bytes=len(old)*4,candidate_code_bytes=len(new)*4,scratch_moves=scratch,entry_guard_preserved=name!='array_append_kernel-entry',array_artifact_unchanged=name=='array_append_kernel-entry')
assert len(result)==8
(S/'paired-code-summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
