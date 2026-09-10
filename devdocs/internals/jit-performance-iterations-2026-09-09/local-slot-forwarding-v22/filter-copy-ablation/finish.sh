#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
for mode in fp gp; do
 gdb -q -batch -x /tmp/sqgi-v22-filter-ablation/$mode.gdb build-jit-audit-20260909/local-slot-forwarding-v22/sqgi > /tmp/sqgi-v22-filter-ablation/$mode.log 2>&1
done
python3 - <<'PY'
from pathlib import Path
import json,struct
D=Path('/tmp/sqgi-v22-filter-ablation');spec=json.loads((D/'spec.json').read_text())
def words(p):
 b=p.read_bytes()[:spec['code_bytes']];return struct.unpack('<'+'I'*(len(b)//4),b)
def norm(w):
 if w&0x1f800000==0x12800000:return w&~(0xffff<<5)
 if w&0x7c000000==0x14000000:return w&~0x3ffffff
 if w&0xff000010==0x54000000 or w&0x7e000000==0x34000000:return w&~(0x7ffff<<5)
 if w&0x7e000000==0x36000000:return w&~(0x3fff<<5)
 return w
fp,gp=words(D/'fp.bin'),words(D/'gp.bin');expected={r['offset']:r for r in spec['typed_float_copy_instruction_changes']};actual=[]
for i,(a,b) in enumerate(zip(fp,gp)):
 if norm(a)==norm(b):continue
 r=expected[i*4];assert a==int(r['candidate'],16) and b==int(r['control'],16);actual.append(i*4)
assert sorted(actual)==sorted(expected)
for mode in ['fp','gp']:
 log=(D/f'{mode}.log').read_text();assert log.count('[copy-ablation] exact code matched;')==1 and 'FILTER_STREAM_CAPTURED' in log
(D/'installed-code-verification.json').write_text(json.dumps(dict(code_bytes=spec['code_bytes'],changed_offsets=actual,exact_ten_instruction_ablation=True,remaining_normalized_code_equal=True),indent=2)+'\n')
s=json.loads((D/'summary.json').read_text());assert len(s)==4
rows='\n'.join(f"| {k} | {v['medians_ns']['fp']:.3f} | {v['medians_ns']['gp']:.3f} | {v['medians_ns']['fp_repeat']:.3f} | {v['medians_ns']['gp_repeat']:.3f} | {v['gp_over_fp']:.6f} |" for k,v in s.items())
(D/'README.md').write_text(f'''# Isolated float-copy ablation

Both modes use the exact frozen V22 executable and same diagnostic preload.
The preload matches all 298 normalized instructions in the captured filter_stream
loop; only GP mode restores ten original V21 copy instructions. Both modes perform
the same permission transitions, cache synchronization, matching and logging.
Separate installed-code GDB captures verify those exact ten replacements and no
other normalized code differences. Runtime source and frozen binary are unchanged.

Five rotating rounds run the full eight-application script with two copies of
each mode, both seeds/counts and warmup histories. All interpreter checksums match,
and exactly one generated mapping matches in every measured process. This is a
benchmark-specific diagnostic experiment, not a production specialization or a
replacement for the accepted uninstrumented full56 results.

| Seed/warmups | FP ns | Restored GP ns | FP repeat ns | GP repeat ns | GP/FP |
|---|---:|---:|---:|---:|---:|
{rows}

This isolates the copy-instruction contribution within V22; it does not establish
the cause of the remaining difference from the original audit. ASLR, scheduling
and preload overhead remain possible sources of residual variation. The next
production change should preserve GP copies when forwarding does not apply or
fails, then validate the full unchanged workload mix without this instrumentation.

`prepare.py` regenerates the exact instruction specification from paired captures.
Build with `cc -O2 -fPIC -shared -Wall -Wextra -Werror -o patch.so patch.c`.
`run.py` performs controls; `finish.sh` captures/validates the installed variants.
The preload is Linux/AArch64 diagnostic code, not a concurrent JIT patching API.
''')
print('VERIFIED installed ten-instruction ablation and all four rotating controls')
PY
