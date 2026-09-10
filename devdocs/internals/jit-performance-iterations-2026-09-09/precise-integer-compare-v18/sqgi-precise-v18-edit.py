from pathlib import Path
import shutil
r=Path('/home/sam/Programming/sqgi');b=Path('/tmp/sqgi-precise-before-v18');b.mkdir(exist_ok=False)
for n in ['Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc','test/cpp/test_sqjit_side_exit.cpp']:
 p=b/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(r/n,p)
p=r/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc';s=p.read_text();anchor='// Fast scalar writes never release an owner and never call a helper.'
new='''// JCMP also writes the canonical VM temporary. Guard both integer operands
// before the release proof; sensitive old temporaries still use the helper.
// x0 survives precise_assign and supplies its existing false/true branch ABI.
static bool sqjit_a64_precise_compare(SQJitA64Buffer *buf,
    const SQInstruction &i, SQInteger &done)
{
    unsigned cond;
    switch(i._arg3) {
    case CMP_G: cond=SQ_JIT_A64_GT; break;
    case CMP_GE: cond=SQ_JIT_A64_GE; break;
    case CMP_L: cond=SQ_JIT_A64_LT; break;
    case CMP_LE: cond=SQ_JIT_A64_LE; break;
    default: return false;
    }
    SQJitA64Reloc guards[2];SQInteger nguards=0;
    const SQInteger temp=(SQInteger)(size_t)&(((SQVM *)0)->temp_reg);
    if(!sqjit_a64_emit_type_guard(buf,i._arg2,OT_INTEGER,guards,&nguards) ||
        !sqjit_a64_emit_type_guard(buf,i._arg0,OT_INTEGER,guards,&nguards) ||
        !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg2)) ||
        !sqjit_a64_emit_ldr_x(buf,10,19,sqjit_a64_stack_value_disp(i._arg0)) ||
        !sqjit_a64_emit_cmp_reg(buf,9,10) || !sqjit_a64_emit_cset(buf,12,cond) ||
        !sqjit_a64_emit_mov_imm_w(buf,13,(uint32_t)OT_BOOL) ||
        !sqjit_a64_emit_add_imm(buf,0,12,1) ||
        !sqjit_a64_precise_assign(buf,false,false,22,
            temp+(SQInteger)offsetof(SQObject,_type),
            temp+(SQInteger)offsetof(SQObject,_unVal),done)) return false;
    for(SQInteger n=0;n<nguards;++n)
        if(!sqjit_a64_patch_branch(buf,guards[n].patch_offset,buf->size,true,guards[n].cond)) return false;
    return true;
}

'''
assert s.count(anchor)==1;s=s.replace(anchor,new+anchor)
s=s.replace('guard and pin/drop sequence (x11 or x19);','guard and pin/drop sequence (x11, x19 or x22);')
s=s.replace('bool owning_stores, SQInteger &done)','bool owning_stores, bool comparisons, SQInteger &done)')
s=s.replace('    done = -1;\n    if(extended &&', '    done = -1;\n    if(comparisons && i.op == _OP_JCMP)\n        return sqjit_a64_precise_compare(buf,i,done);\n    if(extended &&')
s=s.replace('tier >= 3,tier >= 4,tier >= 5,fast_done)','tier >= 3,tier >= 4,tier >= 5,tier >= 6,fast_done)')
s=s.replace('    if(emit(5)) return true;', '    if(emit(6)) return true;\n    if(!exhausted) return false;\n    if(emit(5)) return true;')
p.write_text(s)
