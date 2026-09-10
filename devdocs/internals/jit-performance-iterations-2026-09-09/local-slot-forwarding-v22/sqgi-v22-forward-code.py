from pathlib import Path
import json,struct,collections
D=Path('/tmp/sqgi-local-slot-forwarding-study/forwarding-captures')
events=json.loads((D/'events.json').read_text());installed=json.loads((D/'installed.json').read_text());byid={e['id']:e for e in events};result={}
def words(p):
 b=p.read_bytes();return list(struct.unpack('<'+'I'*(len(b)//4),b))
def branch(w):
 if w&0x7c000000==0x14000000:return 26,0
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return 19,5
 if w&0x7e000000==0x36000000:return 14,5
 return None
def target(i,w,b):
 bits,shift=b;v=(w>>shift)&((1<<bits)-1)
 if v&(1<<(bits-1)):v-=1<<bits
 return i+v
for name,ids in installed.items():
 e=byid[ids[-1]];assert e['changed'];old=words(D/(e['id']+'-before.bin'));new=words(D/(e['id']+'-after.bin'));mapping=e['offsets'];assert len(mapping)==len(old)+1
 assert all(0<=o<=len(new)*4 and o%4==0 for o in mapping) and mapping==sorted(mapping)
 assert (D/(name+'-installed.bin')).read_bytes().startswith((D/(e['id']+'-after.bin')).read_bytes())
 local=lambda w: w&0xffc00000 in [0xf9000000,0xf9400000,0xfd000000,0xfd400000] and (w>>5)&31==31 and (w>>10)&4095<e['slots'] and (w&0x04000000 or w&31!=31)
 branches=0;copied=0
 for i,w in enumerate(old):
  b=branch(w);at=mapping[i]//4
  if b:
   bits,shift=b;mask=((1<<bits)-1)<<shift;assert (new[at]&~mask)==(w&~mask),(name,i,'branch condition changed')
   assert target(at,new[at],b)*4==mapping[target(i,w,b)],(name,i,'branch target changed');branches+=1
  elif not local(w):
   assert w in new[at:mapping[i+1]//4],(name,i,hex(w),'non-slot instruction changed');copied+=1
 assert sum(w==0xd63f0200 for w in old)==sum(w==0xd63f0200 for w in new)
 assert sum(w==0xd65f03c0 for w in old)==sum(w==0xd65f03c0 for w in new)
 cache_moves=sum(w&0xfffffc00 in [0x9e660000,0x9e670000,0x1e604000] and ((w&31)>=16 or (w>>5)&31>=16) for w in new)
 assert cache_moves>0
 result[name]=dict(before_bytes=len(old)*4,after_bytes=len(new)*4,branches_verified=branches,non_slot_instructions_preserved=copied,cache_moves=cache_moves,private_memory_instructions_before=sum(bool(local(w)) for w in old),private_memory_instructions_after=sum(bool(local(w)) for w in new),installed_bytes_match=True)
assert len(result)==10
(D/'code-verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2));print('VERIFIED ten transformations: all non-slot instructions, branch conditions and destinations, calls/returns, and exact installed bytes')
