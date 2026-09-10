from pathlib import Path
import json,struct
s=Path('/tmp/sqgi-v25-self-publication-study/append-regression')
a=json.loads((s/'control.json').read_text());b=json.loads((s/'candidate.json').read_text())
assert a['pid']!=b['pid'] and a['entries']==b['entries']
count=sum(a['entries']);calls=len(a['entries']);helper='sqjit_a64_helper_publish_stack_write'
old=[x for x in a['sites'] if x['helper']==helper and x['count']==count];assert len(old)==1
ret=old[0]['return_offset']+24
new=[x for x in b['sites'] if x['helper']==helper and x['return_offset']==ret];assert len(new)==1 and new[0]['count']==calls
assert a['counts']['sqjit_a64_helper_array_ptr_append_integer']==count==b['counts']['sqjit_a64_helper_array_ptr_append_integer']
code=(s/'candidate.bin').read_bytes();words=struct.unpack('<'+'I'*(len(code)//4),code)
start=ret-52
word=lambda off:words[off//4]
def target(off,cond):
 w=word(off);assert w&0xff00001f==0x54000000|cond,hex(w)
 imm=(w>>5)&0x7ffff;imm=imm-(1<<19) if imm&(1<<18) else imm
 return off+imm*4
assert word(start)==0xb9405269 # ldr w9, [x19, receiver slot 5 tag]
assert word(start+4)==0xeb04013f # compare complete runtime tag with prepared type
assert target(start+8,1)==start+24 # mismatched type takes publication
assert word(start+12)==0xf9402e69 # receiver slot 5 pointer
assert word(start+16)==0xeb03013f # compare exact pointer
assert target(start+20,0)==ret+8 # equality skips helper and its status guard only
assert word(ret-4)==0xd63f0200 and word(ret)==0xf100001f
sizes={}
for label in ['control','candidate']:
 data=(s/(label+'.bin')).read_bytes();w=list(struct.unpack('<'+'I'*(len(data)//4),data))
 while w and not w[-1]:w.pop()
 sizes[label]=len(w)*4
assert sizes['candidate']-sizes['control']==24
result={'verified':True,'native_appends':count,'native_invocations':calls,'receiver_publications_before':count,'receiver_publications_after':calls,'added_instructions':6,'code_bytes':sizes,'checks':['complete tag and pointer comparison','different type still publishes','identical object skips only publication and its guard','native append count unchanged','no cross-process address join']}
(s/'identity-verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
