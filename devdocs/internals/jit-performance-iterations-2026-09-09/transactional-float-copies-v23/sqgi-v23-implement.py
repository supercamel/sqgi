from pathlib import Path
R=Path('/home/sam/Programming/sqgi');base=R/'Squirrel3/squirrel/jit'
p=base/'sqjit_backend_aarch64_emit.h';s=p.read_text();s=s.replace('bool sqjit_a64_forward_local_slots(SQJitA64Buffer *buf, SQInteger slots);','''// Recorded float-copy pairs use X9 in the input; their caller guarantees X9/D0
// are scratch at these sites. Convert them only in a successful transaction.
bool sqjit_a64_forward_local_slots(SQJitA64Buffer *buf, SQInteger slots,
    const SQInteger *float_copies = nullptr, SQInteger nfloat_copies = 0);''');p.write_text(s)
p=base/'sqjit_backend_aarch64_emit.cpp';s=p.read_text().replace('bool sqjit_a64_forward_local_slots(SQJitA64Buffer *buf, SQInteger slots)\n','bool sqjit_a64_forward_local_slots(SQJitA64Buffer *buf, SQInteger slots,\n    const SQInteger *float_copies, SQInteger nfloat_copies)\n',1)
s=s.replace('const SQInteger count=buf->size/4;','''const SQInteger count=buf->size/4;
    if(nfloat_copies<0 || nfloat_copies>count/2 || (nfloat_copies && !float_copies)) return false;''',1)
s=s.replace('    SQJitA64Buffer output={};','''    // The emitter retains GP copies on every unoptimized/fallback path. Only
    // this private transaction uses FP copies to avoid cross-bank transfers.
    // Refusal at any later step preserves the complete original GP artifact.
    for(SQInteger n=0;n<nfloat_copies;++n) {
        const SQInteger offset=float_copies[n];
        if(offset<0 || offset%4 || offset/4>=count-1) return false;
        const SQInteger i=offset/4;
        if(leaders[i+1] || (input[i]&0xffc003ffu)!=0xf94003e9u ||
            (input[i+1]&0xffc003ffu)!=0xf90003e9u ||
            SQInteger((input[i]>>10)&4095)>=slots ||
            SQInteger((input[i+1]>>10)&4095)>=slots) return false;
        input[i]=(input[i]&~0x0400001fu)|0x04000000u;
        input[i+1]=(input[i+1]&~0x0400001fu)|0x04000000u;
    }
    SQJitA64Buffer output={};''',1);p.write_text(s)
p=base/'sqjit_backend_aarch64_compile_loop.inc';s=p.read_text();s=s.replace('    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {','''    std::vector<SQInteger> float_copy_offsets;
    auto emit_float_copy = [&](SQInteger dst, SQInteger src) -> bool {
        const SQInteger offset=buf.size;
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) return false;
        if(scalar_guard_region) float_copy_offsets.push_back(offset);
        return true;
    };
    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {''',1)
s=s.replace('''!sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||''','''!emit_float_copy(dst, src) ||''',1)
s=s.replace('''!sqjit_a64_emit_ldr_float(&buf, 0, 31,
                        sqjit_a64_local_disp(src)) ||
                        !sqjit_a64_emit_str_float(&buf, 0, 31,
                        sqjit_a64_local_disp(dst)) ||''','''!emit_float_copy(dst, src) ||''',1)
s=s.replace('if(scalar_guard_region) sqjit_a64_forward_local_slots(&buf,MAX_FUNC_STACKSIZE);','''if(scalar_guard_region) sqjit_a64_forward_local_slots(&buf,MAX_FUNC_STACKSIZE,
        float_copy_offsets.data(),(SQInteger)float_copy_offsets.size());''',1);p.write_text(s)
p=R/'test/cpp/test_sqjit_aarch64_emit.cpp';s=p.read_text();marker='''    return rc;
}

#if defined(__aarch64__)''';assert s.count(marker)==1
s=s.replace(marker,'''    // Recorded GP copies must survive refusal, including a late output overflow.
    bad={};sqjit_a64_emit_ldr_x(&bad,9,31,0);sqjit_a64_emit_str_x(&bad,9,31,8);
    sqjit_a64_emit_u32(&bad,0xd65f03c0u);old=bad;SQInteger copy=0;
    CHECK(!sqjit_a64_forward_local_slots(&bad,2,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "no forwarding benefit leaves recorded GP copies intact");
    copy=2;
    CHECK(!sqjit_a64_forward_local_slots(&bad,2,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "misaligned typed-copy metadata refuses without changes");
    copy=4;
    CHECK(!sqjit_a64_forward_local_slots(&bad,2,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "non-copy typed metadata refuses without changes");
    copy=0;
    CHECK(!sqjit_a64_forward_local_slots(&bad,1,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "typed-copy metadata cannot name slots outside the private region");
    bad={};sqjit_a64_emit_ldr_x(&bad,9,31,0);sqjit_a64_emit_str_x(&bad,9,31,8);
    sqjit_a64_emit_ldr_x(&bad,10,31,8);
    while(bad.size<(SQInteger)sizeof(bad.bytes)) sqjit_a64_emit_u32(&bad,0xd503201fu);
    old=bad;
    CHECK(!sqjit_a64_forward_local_slots(&bad,2,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "late typed-forwarding overflow restores complete GP artifact");
    bad={};sqjit_a64_emit_u32(&bad,0x14000002u);
    sqjit_a64_emit_ldr_x(&bad,9,31,0);sqjit_a64_emit_str_x(&bad,9,31,8);
    sqjit_a64_emit_ldr_x(&bad,10,31,8);sqjit_a64_emit_u32(&bad,0xd65f03c0u);old=bad;copy=4;
    CHECK(!sqjit_a64_forward_local_slots(&bad,2,&copy,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "a branch into the second copy instruction refuses typed conversion");
    return rc;
}

#if defined(__aarch64__)''',1)
s=s.replace('for(int mode=0;mode<9;++mode)','for(int mode=0;mode<10;++mode)',1).replace('SQInteger target=-1;','SQInteger target=-1,copy_offset=-1;',1)
s=s.replace('''        else {
            sqjit_a64_emit_mov_imm_x(&original,9,42);''','''        else if(mode==9) {
            sqjit_a64_emit_ldr_x(&original,9,19,8);sqjit_a64_emit_str_x(&original,9,31,0);
            copy_offset=original.size;
            sqjit_a64_emit_ldr_x(&original,9,31,0);sqjit_a64_emit_str_x(&original,9,31,8);
            sqjit_a64_emit_ldr_x(&original,9,31,8);
        }
        else {
            sqjit_a64_emit_mov_imm_x(&original,9,42);''',1)
s=s.replace('sqjit_a64_forward_local_slots(&forwarded,32),"synthetic','sqjit_a64_forward_local_slots(&forwarded,32,mode==9 ? &copy_offset : nullptr,mode==9 ? 1 : 0),"synthetic',1)
s=s.replace('if(mode==0) CHECK(output[0]==input','if(mode==0 || mode==9) CHECK(output[0]==input',1)
s=s.replace('''    printf("[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)\\n");''','''    printf("[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction, aliases)\\n");
    printf("[coverage] executed AArch64 typed-copy forwarding and fallback contracts\\n");''',1)
p.write_text(s)
print('Implemented transactional typed copies and expanded native/fallback contracts')
