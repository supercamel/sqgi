from pathlib import Path
import json,struct
S=Path('/tmp/sqgi-v25-self-publication-study');out={}
paths=[]
for name in ['recycle','transfer','publish','table_apply','apply']:
 paths.append((name,S/'profiles'/(name+'-frame.bin'),json.loads((S/'profiles'/(name+'-bytecode.json')).read_text())['instructions']))
d=json.loads((S/'intrinsic-captures/candidate/metadata.json').read_text())
assert d['entries']['rotate_buffers']>0 and d['captures']['rotate_buffers']['requires_vm_frame']
paths.append(('rotate_buffers',S/'intrinsic-captures/candidate/rotate_buffers.bin',d['captures']['rotate_buffers']['instructions']))
for name,path,code in paths:
 raw=path.read_bytes();words=list(struct.unpack('<'+'I'*(len(raw)//4),raw));end=max(i+1 for i,w in enumerate(words) if w)
 expected=[i for i,c in enumerate(code) if c['op'] not in [0,0x17,0x1c]]
 tags=[i for i,w in enumerate(words) if w==0xb900028a];assert len(tags)==1,(name,tags)
 tag=tags[0];common=tag-2
 assert words[common]&0xffe0001f==0x5280000a and words[common+1]&0xffe0001f==0x72a0000a
 assert words[tag+1]==0xf9000689 and words[tag+7]==0xd65f03c0
 assert words[tag+6]&0xffe0001f==0xd2800000 and (words[tag+6]>>5)&0xffff==2
 found=[];pos=tag+8;incoming_map={}
 while pos+1<end:
  mov,branch=words[pos:pos+2]
  if mov&0xffe0001f!=0xd2800009 or branch&0xfc000000!=0x14000000:break
  displacement=branch&0x3ffffff
  if displacement&(1<<25):displacement-=1<<26
  if pos+1+displacement!=common:break
  ip=(mov>>5)&0xffff;found.append(ip);incoming=[]
  for k,w in enumerate(words[:common]):
   if w&0xff00001f!=0x54000000:continue
   offset=(w>>5)&0x7ffff
   if offset&(1<<18):offset-=1<<19
   if k+offset==pos:incoming.append(k*4)
  assert len(incoming)==1,(name,ip,incoming)
  incoming_map[ip]=incoming;pos+=2
 assert found==expected,(name,found,expected)
 tail=words[pos:end]
 if tail:assert tail[0]==0xa9bf7bfd and tail[-1]==0xd65f03c0 and tail[-2]==0xa8c17bfd and tail[-3]==0xd63f0200,(name,tail)
 out[name]={'mapped_bytes':len(raw),'code_bytes':end*4,'guard_count':len(found),'exact_resume_ips':found,'guard_offsets':incoming_map,'common_publication_offset':common*4,'compact_trampoline':bool(tail)}
(S/'profiles/exit-code-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print('Verified',len(out),'functions and',sum(row['guard_count'] for row in out.values()),'exact resume guards')
print(json.dumps({name:{k:v for k,v in row.items() if k not in ['exact_resume_ips','guard_offsets']} for name,row in out.items()},indent=2))
