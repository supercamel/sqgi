from pathlib import Path
import struct,json
S=Path('/tmp/sqgi-shared-helper-tail-study');P=Path('/home/sam/Programming/sqgi/devdocs/internals/jit-performance-iterations-2026-09-09/shared-helper-v28/study')
def words(path):
 raw=path.read_bytes();w=list(struct.unpack('<'+'I'*(len(raw)//4),raw));return w[:max(i+1 for i,v in enumerate(w) if v)]
def normalized(w):
 out=w[:];n=0
 while n<len(w):
  if w[n]&0xff800000!=0xd2800000:n+=1;continue
  reg=w[n]&31;value=((w[n]>>5)&65535) << (((w[n]>>21)&3)*16);end=n+1
  while end<len(w) and w[end]&0xff800000==0xf2800000 and w[end]&31==reg:
   shift=((w[end]>>21)&3)*16;value=(value&~(65535<<shift))|(((w[end]>>5)&65535)<<shift);end+=1
  if (1<<32)<=value<(1<<48):
   for i in range(n,end):out[i]&=~(65535<<5)
  n=end
 return out
result={}
for name in ['recycle','transfer','publish','table_apply','apply']:
 old=words(P/'profiles'/(name+'-frame.bin'));new=words(S/'profiles'/(name+'-frame.bin'))
 assert normalized(old)==normalized(new),(name,'unrelated canonical code changed')
 result[name]={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':True}
root=S/'intrinsic-captures'
old=words(root/'control/rotate_buffers.bin');new=words(root/'candidate/rotate_buffers.bin')
assert len(old)*4==7408 and len(new)*4==7392 and normalized(old)!=normalized(new),'expected 24-byte shared tail layout'
assert normalized(old[:-10])==normalized(new[:-6]),'unrelated buffer body changed'
result['rotate_buffers']={'before_bytes':len(old)*4,'after_bytes':len(new)*4,'normalized_equal':False,'shared_helper_layout':True}
for relative in ['call-regression-captures','call-regression-captures/extra']:
 root=S/relative;a=json.loads((root/'control/metadata.json').read_text());b=json.loads((root/'candidate/metadata.json').read_text())
 for name in sorted(a.keys()|b.keys()):
  old=words(root/'control'/(name+'.bin')) if name in a else None;new=words(root/'candidate'/(name+'.bin')) if name in b else None
  result[name]={'before_bytes':len(old)*4 if old else None,'after_bytes':len(new)*4 if new else None,'normalized_equal':normalized(old)==normalized(new) if old and new else False,'new_native_route':not old and bool(new)}
(S/'native-code-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
