from pathlib import Path
import json,struct
D=Path('/tmp/sqgi-v22-filter-ablation');C=Path('/tmp/sqgi-local-slot-forwarding-study/filter-stream-captures')
j=json.loads((C/'code-comparison.json').read_text());b=(C/'candidate.bin').read_bytes()[:j['code_bytes']];words=struct.unpack('<'+'I'*(len(b)//4),b)
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
changes=j['typed_float_copy_instruction_changes'];assert len(changes)%2==0
for a,c in zip(changes[::2],changes[1::2]):
 assert c['offset']==a['offset']+4
 assert int(a['candidate'],16)&0xffc003ff==0xfd4003e0 and int(c['candidate'],16)&0xffc003ff==0xfd0003e0
(D/'spec.h').write_text('static const uint32_t expected[]={'+','.join(hex(norm(w)) for w in words)+'};\nstatic const unsigned positions[]={'+','.join(str(r['offset']//4) for r in changes)+'};\nstatic const uint32_t replacements[]={'+','.join('0x'+r['control'] for r in changes)+'};\n')
(D/'spec.json').write_text(json.dumps(j,indent=2)+'\n')
print(len(words),'words',len(changes),'instruction replacements')
