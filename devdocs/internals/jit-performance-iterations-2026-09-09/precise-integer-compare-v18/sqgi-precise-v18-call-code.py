from pathlib import Path
import json,struct
D=Path('/tmp/sqgi-precise-integer-compare-study/call-regression-captures')
meta={k:json.loads((D/k/'metadata.json').read_text()) for k in ['control','candidate']};result={}
def words(label,key):
 raw=(D/label/(key+'.bin')).read_bytes();w=list(struct.unpack('<'+'I'*(len(raw)//4),raw));return w[:max(i+1 for i,v in enumerate(w) if v)]
def mov(w,pos,rd,width):
 z=0xd2800000 if width==64 else 0x52800000;k=0xf2800000 if width==64 else 0x72800000
 if pos>=len(w) or w[pos]&0xff80001f!=z|rd:return None
 value=((w[pos]>>5)&0xffff)<<(((w[pos]>>21)&3)*16);pos+=1
 while pos<len(w) and w[pos]&0xff80001f==k|rd:
  shift=((w[pos]>>21)&3)*16;value=(value&~(0xffff<<shift))|(((w[pos]>>5)&0xffff)<<shift);pos+=1
 return value,pos
def normalized(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5) # wide constants, including relocated addresses
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
for key,entry in meta['candidate'].items():
 old=words('control',key);new=words('candidate',key);weak={v['address']:v for v in entry['weak_witnesses'] if v['type'] in ['OT_CLOSURE','OT_NATIVECLOSURE']};removed=[];kept=[];pos=0
 while pos<len(new):
  decoded=mov(new,pos,9,64)
  if decoded and decoded[0] in weak:
   address,p=decoded;v=weak[address]
   assert new[p]&0xffc003ff==0xb9400129 and ((new[p]>>10)&0xfff)*4==v['tag_offset'],(key,p)
   tag=mov(new,p+1,10,32);assert tag and tag[0]==v['type_bits'],(key,p,tag,v)
   end=tag[1];assert new[end]==0xeb0a013f and new[end+1]&0xff00001f==0x54000001
   removed.append(dict(byte_offset=pos*4,instructions=end+2-pos,type=v['type']));pos=end+2
  else:kept.append(new[pos]);pos+=1
 same=list(map(normalized,old))==list(map(normalized,kept))
 result[key]=dict(weak_guard_sites=removed,added_instructions=sum(v['instructions'] for v in removed),normalized_rest_matches=same,old_instructions=len(old),new_instructions=len(new))
 assert removed and same,(key,result[key])
(D/'code-comparison.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2));print('PASS: added weak-witness address loads, type loads/comparisons and failure branches account for all added instructions; remaining instruction streams match after masking wide immediates and branch displacements. This is relocation-insensitive structural evidence, not a proof that arbitrary immediates are interchangeable.')
