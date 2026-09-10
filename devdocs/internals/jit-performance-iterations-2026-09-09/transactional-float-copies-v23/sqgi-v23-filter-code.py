from pathlib import Path
import struct,json
D=Path('/tmp/sqgi-transactional-float-copies-study/filter-stream-captures')
def words(p):
 b=p.read_bytes();w=list(struct.unpack('<'+'I'*(len(b)//4),b));return w[:max(i+1 for i,v in enumerate(w) if v)]
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
v21,old,new=[words(D/(name+'.bin')) for name in ['v21','control','candidate']];assert len(v21)==len(old)==len(new)==298
assert list(map(norm,v21))==list(map(norm,new));changes=[]
for i,(a,b) in enumerate(zip(old,new)):
 if norm(a)==norm(b):continue
 assert a&0xffc003ff in [0xfd4003e0,0xfd0003e0] and b==(a&~0x0400001f)|9
 changes.append(dict(offset=i*4,v22=f'{a:08x}',v23=f'{b:08x}'))
assert len(changes)==10
(D/'code-comparison.json').write_text(json.dumps(dict(code_bytes=len(new)*4,restored_gp_copy_instructions=changes,normalized_code_matches_v21=True,remaining_normalized_code_matches_v22=True),indent=2)+'\n')
print('VERIFIED filter_stream: ten GP instructions restored; complete normalized loop matches V21')
