from pathlib import Path
import json,hashlib,collections,re,struct
R=Path('/home/sam/Programming/sqgi');p=Path('/tmp/sqgi-v28-buffer-pc-profile');m=json.loads((p/'metadata.json').read_text());h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert m['entries']==4 and m['return_statuses']==[1]*4 and m['perf_exit_code']==0
assert '# Total Lost Samples: 0' in (p/'flat.log').read_text()
assert f"perf-{m['inferior_pid']}.map" in m['perf_map']
assert Path(m['perf_map']).read_bytes()==(p/'perf.map').read_bytes()
raw=(p/'rotate_buffers.bin').read_bytes();assert len(raw)==m['mapped_bytes'];start=m['address'];end=start+m['code_bytes'];tail=start+m['trampoline_offset']
ips=[]
for line in (p/'sample-ips.txt').read_text().splitlines():
 token=line.strip()
 if not token or token.startswith('#'):continue
 assert re.fullmatch(r'(0x)?[0-9a-fA-F]+',token),line
 ips.append(int(token,16))
assert len(ips)>500,'Insufficient samples; retain as inconclusive'
native=collections.Counter(ip-start for ip in ips if start<=ip<end)
assert sum(native.values())>100
tramp=sum(v for off,v in native.items() if off>=m['trampoline_offset'])
rows=[{'offset':off,'samples':n,'word':hex(struct.unpack_from('<I',raw,off)[0]),'in_shared_helper':off>=m['trampoline_offset']} for off,n in native.most_common()]
result={'verified':True,'diagnostic_only':True,'same_inferior_pid':m['inferior_pid'],'no_cross_process_address_join':True,'all_samples':len(ips),'native_buffer_samples':sum(native.values()),'shared_trampoline_samples':tramp,'trampoline_fraction_of_native_samples':tramp/sum(native.values()),'trampoline_fraction_of_all_samples':tramp/len(ips),'native_offsets':rows,'binary_sha256':h(R/'build-jit-audit-20260909/shared-helper-v28/sqgi'),'artifact_hashes':{f:h(p/f) for f in ['metadata.json','rotate_buffers.bin','perf.map','cycles.data','flat.log','sample-ips.txt']},'interpretation':'PC samples are statistical and can skid. Fractions locate sampled cycles, not causal speedup. This diagnostic has boundary debugger stops and warmups0; accepted five-round timings remain separate.'}
(p/'analysis.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['native_offsets','artifact_hashes']},indent=2))
