from pathlib import Path
p=Path('/home/sam/Programming/sqgi/test/cpp/test_sqjit_aarch64_emit.cpp');s=p.read_text().replace('for(int mode=0;mode<5;++mode)','for(int mode=0;mode<9;++mode)')
s=s.replace('''        else {
            for(int n=0;n<20;++n)''','''        else if(mode==4) {
            for(int n=0;n<20;++n)''')
k='''        if(mode!=4) sqjit_a64_emit_str_x(&original,9,19,0);'''
s=s.replace(k,'''        else if(mode==5 || mode==6) {
            sqjit_a64_emit_mov_imm_x(&original,9,-1);sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,11,31,0);
            sqjit_a64_emit_mov_imm_x(&original,9,77);
            if(mode==5) {
                sqjit_a64_emit_add_imm(&original,0,31,0);
                sqjit_a64_emit_str_x(&original,9,0,0);
            }
            else sqjit_a64_emit_str_w(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,9,31,0);
        }
        else if(mode==7) {
            sqjit_a64_emit_ldr_x(&original,10,19,8);
            sqjit_a64_emit_mov_imm_x(&original,9,3);sqjit_a64_emit_and_reg(&original,10,10,9);
            sqjit_a64_emit_str_x(&original,9,31,8);sqjit_a64_emit_ldr_x(&original,11,31,8);
            sqjit_a64_emit_mov_imm_x(&original,9,0);sqjit_a64_emit_str_x(&original,9,31,0);
            SQInteger header=original.size;
            sqjit_a64_emit_ldr_x(&original,9,31,0);sqjit_a64_emit_add_imm(&original,9,9,1);
            sqjit_a64_emit_str_x(&original,9,31,0);sqjit_a64_emit_sub_imm(&original,10,10,1);
            sqjit_a64_emit_cmp_imm(&original,10,0);sqjit_a64_emit_bcond_placeholder(&original,SQ_JIT_A64_GT,&target);
            sqjit_a64_patch_branch(&original,target,header,true,SQ_JIT_A64_GT);
        }
        else {
            sqjit_a64_emit_mov_imm_x(&original,9,42);sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,11,31,0);sqjit_a64_emit_b_placeholder(&original,&target);
            sqjit_a64_emit_mov_imm_x(&original,9,99);sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,11,31,0);
            sqjit_a64_patch_branch(&original,target,original.size,false,0);
            sqjit_a64_emit_ldr_x(&original,9,31,0);
        }
''' +k)
s=s.replace('SQUnsignedInteger(0x7ff8000000001234ULL)}','SQUnsignedInteger(0x7ff8000000001234ULL),SQUnsignedInteger(0x7ff0000000000001ULL),SQUnsignedInteger(0xffffffffffffffffULL)}')
s=s.replace('''                if(mode==4) for(int n=0;n<20;++n) CHECK''','''                if(mode==5) CHECK(output[0]==77,"derived private-frame alias invalidates forwarded values");
                if(mode==6) CHECK(output[0]==SQUnsignedInteger(0xffffffff0000004dULL),"partial-width alias materializes and invalidates a complete slot");
                if(mode==7) CHECK(output[0]==((input&3) ? (input&3) : 1),"relocated backedge preserves repeated slot updates");
                if(mode==8) CHECK(output[0]==42,"forward branch skips unreachable block spills at a join");
                if(mode==4) for(int n=0;n<20;++n) CHECK''')
s=s.replace('contracts (bits, calls, branches, eviction)','contracts (bits, calls, branches, eviction, aliases)')
p.write_text(s)
