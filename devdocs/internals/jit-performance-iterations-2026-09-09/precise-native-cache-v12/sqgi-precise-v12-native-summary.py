from pathlib import Path
import re,json,hashlib
r=Path('/tmp/sqgi-precise-native-cache-study/profiles');out={}
assert 'JIT_CAPTURE_VERIFIED five canonical-frame functions' in (r/'dump.log').read_text()
for name in ['recycle','transfer','publish','table_apply','apply']:
 s=(r/(name+'-frame.asm')).read_text();frame=re.search(r'sub\s+sp, sp, #0x([0-9a-f]+)',s);raw=(r/(name+'-frame.bin')).read_bytes()
 out[name]={'local_frame_bytes':int(frame.group(1),16),'mapped_bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'bytecode_count':len(json.loads((r/(name+'-bytecode.json')).read_text())['instructions']),'fadd_instructions':len(re.findall(r'\tfadd\s',s)),'unsigned_bounds_branches':len(re.findall(r'\t(?:b.cs|b.hs)\s',s)),'nonfinal_count_branches':len(re.findall(r'\tb.ls\s',s)),'cache_slot_loads':len(re.findall(r'\tldr\s+x11, \[sp,',s))}
assert out['recycle']['cache_slot_loads']>0 and out['recycle']['fadd_instructions']==5
(r/'native-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
