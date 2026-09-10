#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
draft=/tmp/sqgi-v30-constant-division-draft
out=/tmp/sqgi-v30-lowlevel-preflight
engine=/home/sam/Programming/sqgi/build-jit-audit-20260909/shared-helper-tail-v29/native-validation
mkdir -p "$out"
cat > "$out/encoding.s" <<'ASM'
.text
smulh x11,x9,x10
asr x11,x9,#63
lsr x11,x11,#58
asr x11,x11,#6
add x11,x11,x11,lsr #63
ASM
as "$out/encoding.s" -o "$out/encoding.o"
objcopy -O binary --only-section=.text "$out/encoding.o" "$out/encoding.bin"
objdump -d "$out/encoding.o" > "$out/encoding.log"
python3 - <<'PY'
from pathlib import Path
import struct
words=list(struct.unpack('<5I',Path('/tmp/sqgi-v30-lowlevel-preflight/encoding.bin').read_bytes()))
expected=[0x9b407c00|(10<<16)|(9<<5)|11,
          0x9340fc00|(63<<16)|(9<<5)|11,
          0xd340fc00|(58<<16)|(11<<5)|11,
          0x9340fc00|(6<<16)|(11<<5)|11,
          0x8b400000|(11<<16)|(63<<10)|(11<<5)|11]
assert words==expected,(words,expected)
print('Local assembler confirms all five new instruction forms')
PY
for mode in release sanitizer; do
 flags=(-O3 -g)
 if [ "$mode" = sanitizer ]; then flags=(-O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all -fno-omit-frame-pointer); fi
 c++ -std=gnu++11 -DSQ_ENABLE_JIT -pthread "${flags[@]}" \
  -I"$draft/Squirrel3/squirrel" -ISquirrel3/include -ISquirrel3/squirrel \
  "$draft/Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp" \
  "$draft/test/cpp/test_sqjit_arithmetic.cpp" \
  -L"$engine" -Wl,-rpath,"$engine" -l:libsqgi.so.1 -o "$out/arithmetic-$mode"
 ASAN_OPTIONS=detect_leaks=1:halt_on_error=1 UBSAN_OPTIONS=halt_on_error=1 \
  "$out/arithmetic-$mode" > "$out/$mode.log" 2>&1
done
python3 - <<'PY'
from pathlib import Path
import hashlib,json
p=Path('/tmp/sqgi-v30-lowlevel-preflight');d=Path('/tmp/sqgi-v30-constant-division-draft')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for mode in ['release','sanitizer']:
    s=(p/(mode+'.log')).read_text()
    assert '[OK] emitted int64 division/remainder: boundaries, multiples and random inputs' in s
    assert not any(x in s for x in ['FAIL','ERROR:','runtime error:'])
result={'verified':True,'scope':'isolated native emitter/property corpus; compiler integration and full gates still pending',
 'inputs':{str(x.relative_to(d)):h(x) for x in [d/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp',d/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.h',d/'test/cpp/test_sqjit_arithmetic.cpp']},
 'engine_sha256':h(Path('/home/sam/Programming/sqgi/build-jit-audit-20260909/shared-helper-tail-v29/native-validation/libsqgi.so.1')),
 'artifacts':{x.name:h(x) for x in p.iterdir() if x.is_file() and x.name!='verification.json'}}
(p/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print('Isolated AArch64 constant division native corpus passes release and strict ASAN/UBSAN')
PY
