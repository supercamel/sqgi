from pathlib import Path
p=Path('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc');s=p.read_text()
s=s.replace('''    const bool extended = tier != 0;
    SQJitA64Buffer buf;''','''    const bool compact = tier == 7;
    const bool extended = !compact && tier != 0;
    SQJitA64Buffer buf;''')
s=s.replace('''    SQInteger nbranches = 0, nguards = 0;
    for(SQInteger ip''','''    SQInteger nbranches = 0, nguards = 0;
    SQInteger compact_calls[SQ_JIT_A64_MAX_INSTRUCTIONS], ncompact_calls=0;
    for(SQInteger ip''')
s=s.replace('''        if(!sqjit_a64_precise_fast(&buf,proto,i,extended,constant_key[ip],''','''        if(!compact && !sqjit_a64_precise_fast(&buf,proto,i,extended,constant_key[ip],''')
needle='''        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(context_slot)) ||'''
assert s.count(needle)==1
s=s.replace(needle,'''        if(compact) {
            // A compact cold tier retains native control flow and checked
            // opcode helpers while sharing their unchanged argument setup.
            if(!sqjit_a64_emit_mov_imm_x(&buf,3,ip) ||
                !sqjit_a64_emit_mov_imm_x(&buf,16,(SQInteger)(intptr_t)step)) return false;
            compact_calls[ncompact_calls++]=buf.size;
            if(!sqjit_a64_emit_u32(&buf,0x94000000u)) return false; // BL trampoline
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(context_slot)) ||''')
needle='''    if(!native->_code.Install(buf.bytes, buf.size))'''
assert s.count(needle)==1
trampoline='''    if(compact) {
        const SQInteger trampoline=buf.size;
        // Preserve the local BL return address across the C++ opcode helper.
        // Its temporary 16-byte frame leaves every canonical/cache address
        // unchanged. x0 carries the helper status back to the original guard.
        if(!sqjit_a64_emit_u32(&buf,0xA9BF7BFDu) ||
            !sqjit_a64_emit_u32(&buf,0x910003FDu) ||
            !sqjit_a64_emit_ldr_x(&buf,0,31,16+sqjit_a64_local_disp(context_slot)) ||
            !sqjit_a64_emit_mov_reg(&buf,1,19) || !sqjit_a64_emit_mov_reg(&buf,2,21) ||
            !sqjit_a64_emit_mov_reg(&buf,4,20) || !sqjit_a64_emit_mov_reg(&buf,5,22) ||
            !sqjit_a64_emit_blr_x16(&buf) || !sqjit_a64_emit_u32(&buf,0xA8C17BFDu) ||
            !sqjit_a64_emit_u32(&buf,0xD65F03C0u)) return false;
        for(SQInteger n=0;n<ncompact_calls;++n) {
            const SQInteger offset=compact_calls[n];
            const uint32_t branch=0x94000000u | ((uint32_t)((trampoline-offset)/4)&0x03ffffffu);
            memcpy(buf.bytes+offset,&branch,sizeof(branch));
        }
    }
'''
s=s.replace(needle,trampoline+needle)
s=s.replace('''    if(emit(1)) return true;
    return exhausted && emit(0);''','''    if(emit(1)) return true;
    if(!exhausted) return false;
    if(emit(0)) return true;
    return exhausted && emit(7);''')
p.write_text(s)
