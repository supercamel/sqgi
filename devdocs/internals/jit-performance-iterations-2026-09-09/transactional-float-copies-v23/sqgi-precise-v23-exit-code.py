from pathlib import Path
import json,struct
R=Path('/home/sam/Programming/sqgi')
P=R/'devdocs/internals/jit-performance-iterations-2026-09-09/local-slot-forwarding-v22/profiles'
D=Path('/tmp/sqgi-transactional-float-copies-study/profiles');result={}
for name in ['recycle','transfer','publish','table_apply','apply']:
 raw=(D/(name+'-frame.bin')).read_bytes();words=list(struct.unpack('<'+'I'*(len(raw)//4),raw))
 oldraw=(P/(name+'-frame.bin')).read_bytes();old=list(struct.unpack('<'+'I'*(len(oldraw)//4),oldraw))
 end=max(i+1 for i,w in enumerate(words) if w);oldend=max(i+1 for i,w in enumerate(old) if w)
 code=json.loads((D/(name+'-bytecode.json')).read_text())['instructions']
 expected=[i for i,c in enumerate(code) if c['op'] not in [0,0x17,0x1c]]
 tags=[i for i,w in enumerate(words) if w==0xb900028a];assert len(tags)==1,(name,tags)
 tag=tags[0];common=tag-2
 assert words[common]&0xffe0001f==0x5280000a and words[common+1]&0xffe0001f==0x72a0000a
 assert words[tag+1]==0xf9000689 and words[tag+7]==0xd65f03c0
 assert (words[tag+6]&0xffe0001f)==0xd2800000 and (words[tag+6]>>5)&0xffff==2
 stubs=tag+8;assert end-stubs==2*len(expected),(name,end,stubs,len(expected))
 found=[]
 for pos in range(stubs,end,2):
  mov,branch=words[pos:pos+2];assert mov&0xffe0001f==0xd2800009
  ip=(mov>>5)&0xffff;found.append(ip);assert branch&0xfc000000==0x14000000
  displacement=branch&0x3ffffff
  if displacement&(1<<25):displacement-=1<<26
  assert pos+1+displacement==common,(name,ip)
  # Each helper's failure branch reaches exactly this stub.
  incoming=[]
  for k,w in enumerate(words[:common]):
   if w&0xff00001f!=0x54000000:continue
   offset=(w>>5)&0x7ffff
   if offset&(1<<18):offset-=1<<19
   if k+offset==pos:incoming.append(k)
  assert len(incoming)==1,(name,ip,incoming)
 assert found==expected,(name,found,expected)
 assert sum(w==0xb900028a for w in old)==1,(name,'previous common tag publication')
 result[name]={'guard_count':len(expected),'exact_resume_ips':found,'common_publications_before':1,'common_publications_after':1,'mapped_bytes_before':len(oldraw),'mapped_bytes_after':len(raw),'decoded_code_bytes_before':oldend*4,'decoded_code_bytes_after':end*4,'code_growth_bytes':(end-oldend)*4,'native_heap_stores':sum(w==0xf900056c for w in words)}
 assert result[name]['native_heap_stores']=={'recycle':4,'transfer':2,'publish':0,'table_apply':2,'apply':2}[name],(name,result[name])
 # Every JCMP in these small functions receives its signed native CSET.
 expected_cmp=[c for c in code if c['op']==29]
 native_cmp=[w for w in words if w & 0xffff0fff == 0x9a9f07ec]
 assert len(native_cmp)==len(expected_cmp),(name,len(native_cmp),len(expected_cmp))
 result[name]['native_integer_comparisons']=len(native_cmp)
(D/'exit-code-verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
print('PASS: all guard branches select their exact bytecode IP and converge on one SIDE_EXIT publication/restoration; loop/later stores remain native, while definitely cold publisher stores use the helper.')
