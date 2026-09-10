from pathlib import Path
import json,struct
D=Path('/tmp/sqgi-precise-integer-compare-study/route/compact');result={}
for name in ['exit_sites','cached_many']:
 raw=(D/(name+'-frame.bin')).read_bytes();words=list(struct.unpack('<'+'I'*(len(raw)//4),raw));end=max(i+1 for i,w in enumerate(words) if w)
 code=json.loads((D/(name+'-bytecode.json')).read_text())['instructions'];expected=[i for i,c in enumerate(code) if c['op'] not in [0,0x17,0x1c]]
 tag,= [i for i,w in enumerate(words) if w==0xb900028a];common=tag-2;stubs=tag+8;trampoline=stubs+2*len(expected)
 assert end==trampoline+10,(name,end,trampoline)
 assert words[trampoline:trampoline+3]==[0xA9BF7BFD,0x910003FD,0xf9400be0]
 assert words[end-3:end]==[0xd63f0200,0xA8C17BFD,0xD65F03C0]
 assert words[tag+1]==0xf9000689 and words[tag+7]==0xd65f03c0
 assert (words[tag+6]>>5)&0xffff==2
 ips=[]
 for pos in range(stubs,trampoline,2):
  mov,branch=words[pos:pos+2];assert mov&0xffe0001f==0xd2800009
  ips.append((mov>>5)&0xffff);assert branch&0xfc000000==0x14000000
  offset=branch&0x3ffffff
  if offset&(1<<25):offset-=1<<26
  assert pos+1+offset==common
  incoming=[]
  for k,w in enumerate(words[:common]):
   if w&0xff00001f!=0x54000000:continue
   offset=(w>>5)&0x7ffff
   if offset&(1<<18):offset-=1<<19
   if k+offset==pos:incoming.append(k)
  assert len(incoming)==1,(name,pos,incoming)
 assert ips==expected
 calls=[]
 for k,w in enumerate(words[:common]):
  if w&0xfc000000!=0x94000000:continue
  offset=w&0x3ffffff
  if offset&(1<<25):offset-=1<<26
  assert k+offset==trampoline,(name,k,k+offset,trampoline)
  calls.append(k)
 assert len(calls)==sum(c['op'] not in [0,0x1c] for c in code)
 assert end*4<=8192 and len(raw)==8192
 result[name]=dict(bytecodes=len(code),code_bytes=end*4,mapped_bytes=len(raw),helper_calls=len(calls),exact_guard_ips=ips,trampoline_bytes=40)
(D/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2));print('PASS: compact native calls preserve one exact-IP guard each and converge on the aligned, return-address-preserving trampoline within 8 KiB.')
