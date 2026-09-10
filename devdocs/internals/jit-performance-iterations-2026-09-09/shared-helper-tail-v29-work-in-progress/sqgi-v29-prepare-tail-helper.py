from pathlib import Path
import json,difflib,hashlib
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v29-tail-helper-draft');D.mkdir(exist_ok=True)
h=lambda b:hashlib.sha256(b).hexdigest()
p=R/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc';old=p.read_text()
a=old.index('        // Preserve the local BL return address');b=old.index('        for(SQInteger n=0;n<ncompact_calls;',a)
new=old[:a]+'''        // The local BL already supplies the status-guard continuation in LR.
        // Prepare the unchanged helper arguments at the original SP, then tail
        // branch: the checked helper returns directly to that continuation.
        // No activation/cache address changes and no extra frame is required.
        if(!sqjit_a64_emit_ldr_x(&buf,0,31,sqjit_a64_local_disp(context_slot)) ||
            !sqjit_a64_emit_mov_reg(&buf,1,19) || !sqjit_a64_emit_mov_reg(&buf,2,21) ||
            !sqjit_a64_emit_mov_reg(&buf,4,20) || !sqjit_a64_emit_mov_reg(&buf,5,22) ||
            !sqjit_a64_emit_u32(&buf,0xD61F0200u)) return false; // BR x16
'''+old[b:]
new=new.replace('// its extra call/return cost must be measured on actual helper misses.','// shared helper costs must be measured on actual helper misses.')
changes={str(p.relative_to(R)):(old,new)}
p=R/'test/cpp/test_sqjit_side_exit.cpp';old=p.read_text();a=old.index('static int generated_shared_helpers()');b=old.index('\nint main()',a);part=old[a:b]
part=part.replace('    {\n    const SQInteger repeats=24;','    for(SQInteger repeats:{SQInteger(24),SQInteger(56)}) {')
part=part.replace('    bool shared_call=false,integer_add=false;','    bool shared_call=false,integer_add=false,tail_helper=false;')
needle='            integer_add=integer_add || word==0x8b0a0129u; // ADD x9,x9,x10\n'
assert needle in part
part=part.replace(needle,needle+'''            if((word&0xfc000000u)==0x94000000u) {
                int32_t delta=(int32_t)(word&0x03ffffffu);
                if(delta&0x02000000) delta-=0x04000000;
                SQInteger target=offset+(SQInteger)delta*4;
                bool valid=target>=0 && target+24<=code.MappedSize();
                uint32_t tail[6]={};
                if(valid) memcpy(tail,(const unsigned char *)code.Entry()+target,sizeof(tail));
                valid=valid && (tail[0]&0xffc003ffu)==0xf94003e0u &&
                    tail[1]==0xaa1303e1u && tail[2]==0xaa1503e2u &&
                    tail[3]==0xaa1403e4u && tail[4]==0xaa1603e5u && tail[5]==0xd61f0200u;
                CHECK(valid,"each shared call tail-branches with canonical arguments and its original continuation");
                tail_helper=tail_helper || valid;
            }
''')
part=part.replace('CHECK(shared_call && integer_add,"the executed artifact combines shared calls with native arithmetic, not the helper-only tier");','''CHECK(shared_call && tail_helper,"the executed artifact uses the shared helper tail-call ABI");
    CHECK(repeats==24 ? integer_add : !integer_add,
        "both rich native arithmetic and compact helper-only artifacts execute the tail-call ABI");''')
# Every pass owns a different prototype and independently checks branch outcomes,
# exact resume IP, committed stores and actual native returns.
new=old[:a]+part+old[b:];changes[str(p.relative_to(R))]=(old,new)
for name,(old,new) in changes.items():
 dest=D/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(new)
(D/'tail-helper-draft.patch').write_text(''.join(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),'a/'+name,'b/'+name)) for name,(old,new) in changes.items()))
(D/'manifest.json').write_text(json.dumps({'applied':False,'compiled':False,'measured':False,'base':'frozen V28; full acceptance pending','source_inputs':{name:h(old.encode()) for name,(old,new) in changes.items()},'source_outputs':{name:h(new.encode()) for name,(old,new) in changes.items()},'required_before_apply':'V28 pipeline terminal and results reviewed; preserve all current source and evidence; no concurrent timings/builds/GDB'},indent=2)+'\n')
print('Prepared isolated V29 draft; production V28 untouched')
