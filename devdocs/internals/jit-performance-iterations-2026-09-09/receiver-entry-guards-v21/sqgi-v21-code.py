from pathlib import Path
import json,struct
S=Path('/tmp/sqgi-receiver-entry-guard-study')
def words(p):
 raw=p.read_bytes();w=list(struct.unpack('<'+'I'*(len(raw)//4),raw));return w[:max(i+1 for i,x in enumerate(w) if x)]
def target(i,w,conditional=False):
 bits=19 if conditional else 26;v=(w>>5)&((1<<bits)-1) if conditional else w&((1<<bits)-1)
 if v&(1<<(bits-1)):v-=1<<bits
 return i+v
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
def same(a,b):return list(map(norm,a))==list(map(norm,b))
all_results={}
for folder in ['call-regression-captures','call-regression-captures/extra']:
 D=S/folder;meta={k:json.loads((D/k/'metadata.json').read_text()) for k in ['control','candidate']};result={}
 assert meta['control'].keys()==meta['candidate'].keys()
 for key in meta['candidate']:
  old=words(D/'control'/(key+'.bin'));new=words(D/'candidate'/(key+'.bin'))
  last_ret=max(i for i,w in enumerate(new) if w==0xd65f03c0);tail=last_ret+1
  if tail==len(new):
   assert same(old,new),(key,'unexpected non-hoisted change')
   result[key]=dict(hoisted=False,bypassed_sites=0,unique_entry_checks=0,old_code_bytes=len(old)*4,new_code_bytes=len(new)*4,normalized_core_matches=True)
   continue
  assert new[-1]&0xfc000000==0x14000000
  jumps=[i for i,w in enumerate(new[:tail]) if w&0xfc000000==0x14000000 and target(i,w)==tail]
  assert len(jumps)==1,(key,jumps);entry=jumps[0]
  assert target(len(new)-1,new[-1])==entry+1,(key,'return-to-loop')
  core=new[:tail];assert len(core)==len(old)+1,(key,len(core),len(old))
  bypass=[]
  for i,w in enumerate(core):
   if i==entry or w&0xfc000000!=0x14000000:continue
   j=i-(i>entry)
   if old[j]!=0xaa1303e0:continue # original MOV x0,x19 guard argument
   end=target(i,w)
   assert i<end<tail and core[end-2]==0xf100001f and core[end-1]&0xff00001f==0x54000000,(key,i,end)
   block=core[i:end].copy();block[0]=old[j]
   bypass.append((i,end,block));core[i]=old[j]
  del core[entry]
  assert same(old,core),(key,'remaining core differs')
  entries=[];start=tail
  while start<len(new)-1:
   assert new[start]==0xaa1303e0,(key,start)
   end=start+1
   while end<len(new)-1 and not (new[end-1]==0xf100001f and new[end]&0xff00001f==0x54000000):end+=1
   assert end<len(new)-1,(key,'unterminated entry check')
   end+=1;block=new[start:end]
   matches=[b for b in bypass if same(block,b[2])]
   assert matches,(key,'entry check not copied from guarded call')
   # Comparing normalized constants alone cannot prove identity: every copied
   # word must match exactly except the guard failure's relative displacement.
   matches=[b for b in matches if block[:-1]==b[2][:-1]]
   assert matches,(key,'copied argument constants differ')
   old_failure=target(matches[0][1]-1,new[matches[0][1]-1],True)
   assert target(end-1,new[end-1],True)==old_failure,(key,'wrong failure continuation')
   entries.append((start,end,block));start=end
  assert start==len(new)-1
  for i,end,block in bypass:
   assert any(block[:-1]==e[2][:-1] for e in entries),(key,'bypass lacks equal entry guard')
  result[key]=dict(hoisted=True,bypassed_sites=len(bypass),unique_entry_checks=len(entries),old_code_bytes=len(old)*4,new_code_bytes=len(new)*4,entry_transfer_offset=entry*4,entry_checks_offset=tail*4,return_to_loop_offset=(entry+1)*4,normalized_core_matches=True)
 (D/'code-comparison.json').write_text(json.dumps(result,indent=2)+'\n');all_results.update(result)
assert len(all_results)==8
assert all(v['hoisted']==(k!='array_append_kernel-entry') for k,v in all_results.items()),all_results
assert all_results['pressure-loop']['bypassed_sites']==8 and all_results['pressure-loop']['unique_entry_checks']==1
(S/'entry-code-summary.json').write_text(json.dumps(all_results,indent=2)+'\n')
print(json.dumps(all_results,indent=2));print('VERIFIED eight paired captures: entry transfer, deduplicated exact guard copies, failure continuations, call-site bypasses, unchanged remaining core and array artifact')
