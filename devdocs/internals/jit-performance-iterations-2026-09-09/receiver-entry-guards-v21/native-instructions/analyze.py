from pathlib import Path
import json,struct,hashlib,re,collections,subprocess
D=Path('/tmp/sqgi-v21-native-profile');S=Path('/tmp/sqgi-receiver-entry-guard-study')
def trim(b):
 w=list(struct.unpack('<'+'I'*(len(b)//4),b));return w[:max(i+1 for i,v in enumerate(w) if v)]
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
def key(b):return tuple(map(norm,trim(b)))
def events(folder):
 e=[json.loads(s) for s in (folder/'events.jsonl').read_text().splitlines()];assert e and all(x['ok']==1 for x in e)
 for x in e:
  if x['event']=='load':
   b=(folder/x['file']).read_bytes();assert len(b)==x['size'];x['code']=trim(b);assert x['code'][:4]==[0xa9bf7bfd,0x910003fd,0xa9bf53f3,0xa9bf5bf5],('unexpected RX mapping',x['file']);x['sha256']=hashlib.sha256(b).hexdigest()
 return sorted(e,key=lambda x:x['ns'])
route=events(D/'route');matches={}
for name in ['entry_root','entry_parameter']:
 expected=key((S/'route'/f'candidate-entry-{name}.bin').read_bytes())
 matches[name]=[x['file'] for x in route if x['event']=='load' and tuple(map(norm,x['code']))==expected]
 assert matches[name],name
(D/'route/verification.json').write_text(json.dumps(matches,indent=2)+'\n')
known=collections.defaultdict(list)
for folder in ['call-regression-captures/candidate','call-regression-captures/extra/candidate']:
 for p in (S/folder).glob('*.bin'):known[key(p.read_bytes())].append(p.stem)
for p in (D/'gdb-floats').glob('*.bin'):
 labels=known[key(p.read_bytes())]
 if p.stem not in labels:labels.append(p.stem)
e=events(D/'floats');loads=[x for x in e if x['event']=='load'];active=[];cursor=0;native=collections.Counter();all_samples=0;hits=collections.Counter()
# perf script prints fields in its fixed order: pid, tid, time, event, IP.
pattern=re.compile(r'^\s*(\d+)/(\d+)\s+(\d+)\.(\d+):\s+cycles:u:\s+([0-9a-fA-F]+)\s*$')
for line in (D/'floats/samples.txt').read_text().splitlines():
 if not line.strip():continue
 m=pattern.match(line);assert m,line
 pid,tid,sec,frac,ip=m.groups();pid=int(pid);ns=int(sec)*10**9+int(frac.ljust(9,'0'));ip=int(ip,16);all_samples+=1
 while cursor<len(e) and e[cursor]['ns']<=ns:
  x=e[cursor];cursor+=1
  active=[a for a in active if a['pid']!=x['pid'] or a['address']+a['size']<=x['address'] or x['address']+x['size']<=a['address']]
  if x['event']=='load':active.append(x)
 candidates=[a for a in active if a['pid']==pid and a['address']<=ip<a['address']+a['size']]
 assert len(candidates)<=1
 if candidates:
  a=candidates[0];offset=ip-a['address'];assert offset%4==0 and offset//4<len(a['code']) and a['code'][offset//4]!=0,(a,ip)
  native[a['file']]+=1;hits[(a['file'],offset)]+=1
assert all_samples>100 and sum(native.values())>100,(all_samples,native)
assert 'Total Lost Samples: 0' in (D/'floats/report.log').read_text()
byfile={x['file']:x for x in loads};details={};instructions={}
for file,count in native.most_common():
 x=byfile[file];p=D/'floats'/file
 command=['objdump','-D','-b','binary','-m','aarch64',f"--adjust-vma={x['address']}",f"--stop-address={x['address']+len(x['code'])*4}",str(p)]
 asm=subprocess.check_output(command,text=True);(p.with_suffix('.asm')).write_text(asm)
 for l in asm.splitlines():
  m=re.match(r'\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+(.+)',l)
  if m:instructions[(file,int(m[1],16)-x['address'])]=m[3]
 details[file]=dict(samples=count,address=x['address'],mapped_bytes=x['size'],code_bytes=len(x['code'])*4,sha256=x['sha256'],structurally_matching_gdb_functions=known[tuple(map(norm,x['code']))])
top=[];categories=collections.Counter()
for (file,offset),count in hits.most_common():
 inst=instructions[(file,offset)];mnemonic=inst.split()[0]
 category='load' if mnemonic.startswith(('ldr','ldp','ldur')) else 'store' if mnemonic.startswith(('str','stp','stur')) else 'branch' if mnemonic.startswith(('b.','cb','tb')) or mnemonic in ['b','br','blr','ret'] else 'floating' if mnemonic.startswith('f') or mnemonic=='scvtf' else 'other'
 categories[category]+=count
 top.append(dict(mapping=file,offset=offset,samples=count,instruction=inst,matching_gdb_functions=details[file]['structurally_matching_gdb_functions']))
stack_memory_samples=sum(r['samples'] for r in top if '[sp' in r['instruction'] and r['instruction'].split()[0].startswith(('ldr','ldp','ldur','str','stp','stur')))
result=dict(stack_load_store_samples=stack_memory_samples,total_samples=all_samples,native_samples=sum(native.values()),native_sample_fraction=sum(native.values())/all_samples,lost_samples=0,loads=len(loads),unloads=sum(x['event']=='unload' for x in e),reused_load_addresses=len(loads)-len({(x['pid'],x['address']) for x in loads}),mappings=details,instruction_sample_categories=dict(categories),top_sampled_instructions=top[:80],limitations=['Diagnostic preload adds snapshot I/O; this is not accepted timing.','Instruction categories count sampled IPs, not instruction latency; PMU skid applies.','Function labels are structural matches to separately captured code, not an address join; missing matches remain unnamed.','Mapping bytes, PID, address and lifetime for sample attribution come from the sampled process itself.'])
(D/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['mappings','top_sampled_instructions']},indent=2));print(json.dumps(top[:20],indent=2))
