from pathlib import Path
import struct,json
S=Path('/tmp/sqgi-receiver-entry-guard-study');P=Path('/tmp/sqgi-scalar-entry-guard-study');out={}
def words(p):
 b=p.read_bytes();w=list(struct.unpack('<'+'I'*(len(b)//4),b));return w[:max(i+1 for i,v in enumerate(w) if v)]
def target(i,w,bits=26,shift=0):
 v=(w>>shift)&((1<<bits)-1)
 if v&(1<<(bits-1)):v-=1<<bits
 return i+v
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
for name in ['entry_root','entry_parameter']:
 old=words(P/'route'/f'candidate-entry-{name}.bin');new=words(S/'route'/f'candidate-entry-{name}.bin')
 tail=max(i for i,w in enumerate(new) if w==0xd65f03c0)+1
 if name=='entry_parameter':
  assert len(new)==len(old)+2
  assert new[tail]==0xb9405269 # LDR w9,[x19,#80]: receiver/result slot5 tag
  w=new[tail+1];assert w&0xfff8001f==0x37d80009 # TBNZ w9,#27
  failure=target(tail+1,w,14,5)
  returns=[i for i,w in enumerate(new[:tail]) if w==0xd65f03c0]
  assert failure==returns[-2]+1
  jumps=[i for i,w in enumerate(new[:tail]) if w&0xfc000000==0x14000000 and target(i,w)==tail]
  assert len(jumps)==1
  assert new[tail+2]==0xaa1303e0 and new[-1]&0xfc000000==0x14000000
  assert target(len(new)-1,new[-1])==jumps[0]+1
  trimmed=new[:tail]+new[tail+2:]
  assert list(map(norm,old))==list(map(norm,trimmed))
  out[name]=dict(old_bytes=len(old)*4,new_bytes=len(new)*4,entry_check_offset=tail*4,receiver_type_displacement=80,owning_bit=27,guard_failure_offset=failure*4,guard_before_lookup=True,remaining_code_matches=True)
 else:
  assert list(map(norm,old))==list(map(norm,new))
  out[name]=dict(old_bytes=len(old)*4,new_bytes=len(new)*4,unchanged=True)
(S/'route/receiver-code-summary.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
