from pathlib import Path
import struct,json
D=Path('/tmp/sqgi-local-slot-forwarding-study/filter-stream-captures')
def words(p):
 b=p.read_bytes();w=list(struct.unpack('<'+'I'*(len(b)//4),b));return w[:max(i+1 for i,v in enumerate(w) if v)]
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
old=words(D/'control.bin');new=words(D/'candidate.bin');assert len(old)==len(new)
differences=[]
for i,(a,b) in enumerate(zip(old,new)):
 if norm(a)==norm(b):continue
 assert a&0xffc003ff in [0xf94003e9,0xf90003e9],(i,hex(a),hex(b))
 expected=(a&~0x0400001f)|0x04000000 # same slot/base, FP d0 instead of x9
 assert b==expected,(i,hex(a),hex(b),hex(expected))
 differences.append(dict(offset=i*4,control=f'{a:08x}',candidate=f'{b:08x}'))
assert differences
scratch=sum(w&0xfffffc00 in [0x9e660000,0x9e670000,0x1e604000] and ((w&31)>=16 or (w>>5)&31>=16) for w in new);assert scratch==0
result=dict(code_bytes=len(new)*4,forwarding_scratch_moves=0,typed_float_copy_instruction_changes=differences,remaining_code_matches_after_relocation_mask=True,causality='These captures isolate the generated-loop differences. They do not distinguish the cost of FP copies from changed native helper layout or other process effects; a controlled ablation remains needed.')
(D/'code-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
