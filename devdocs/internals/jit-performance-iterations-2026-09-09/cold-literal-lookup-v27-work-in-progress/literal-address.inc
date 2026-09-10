// Resolve a cold immutable key against the current receiver. The first hash
// bucket is only a hint: a collision or equal-but-distinct string falls back to
// the ordinary lookup. Instance fields are resolved through the current class,
// never a retained class or object address. Only this activation's cache changes.
static bool sqjit_a64_precise_literal_address(SQJitA64Buffer *buf,
    SQFunctionProto *proto, SQInteger literal, SQInteger base, SQInteger cache_offset,
    SQJitA64Reloc *guards, SQInteger &nguards)
{
    const SQObjectPtr &key=proto->_literals[literal];
    const SQInteger type=offsetof(SQObject,_type), value=offsetof(SQObject,_unVal);
    const SQInteger klass=(SQInteger)(size_t)&(((SQInstance *)0)->_class);
    const SQInteger members=(SQInteger)(size_t)&(((SQClass *)0)->_members);
    const SQInteger defaults=(SQInteger)(size_t)&(((SQClass *)0)->_defaultvalues);
    const SQInteger values=(SQInteger)(size_t)&(((SQInstance *)0)->_values);
    SQInteger table, resolved_table, ready;
    auto guard=[&](unsigned cond)->bool {
        SQInteger patch;
        return sqjit_a64_emit_bcond_placeholder(buf,cond,&patch) &&
            sqjit_a64_record_reloc(guards,&nguards,12,patch,-1,true,cond);
    };
    // Keep the original receiver tag and bits in w13/x12 until the cache fill.
    if(!sqjit_a64_emit_ldr_w(buf,13,19,sqjit_a64_stack_type_disp(base)) ||
        !sqjit_a64_emit_ldr_x(buf,12,19,sqjit_a64_stack_value_disp(base)) ||
        !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_TABLE) ||
        !sqjit_a64_emit_cmp_reg(buf,13,10) ||
        !sqjit_a64_emit_bcond_placeholder(buf,SQ_JIT_A64_EQ,&table) ||
        !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_INSTANCE) ||
        !sqjit_a64_emit_cmp_reg(buf,13,10) || !guard(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_x(buf,11,12,klass) ||
        !sqjit_a64_emit_ldr_x(buf,11,11,members) ||
        !sqjit_a64_emit_b_placeholder(buf,&resolved_table) ||
        !sqjit_a64_patch_branch(buf,table,buf->size,true,SQ_JIT_A64_EQ) ||
        !sqjit_a64_emit_mov_reg(buf,11,12) ||
        !sqjit_a64_patch_branch(buf,resolved_table,buf->size,false,0) ||
        !sqjit_a64_emit_ldr_x(buf,9,11,SQTable::RawNodeCountOffset()) ||
        !sqjit_a64_emit_sub_imm(buf,9,9,1) ||
        !sqjit_a64_emit_mov_imm_x(buf,10,(SQInteger)HashObj(key)) ||
        !sqjit_a64_emit_and_reg(buf,10,10,9) ||
        !sqjit_a64_emit_ldr_x(buf,11,11,SQTable::RawNodesOffset()) ||
        !sqjit_a64_emit_mov_imm_x(buf,9,SQTable::RawNodeSize()) ||
        !sqjit_a64_emit_mul_reg(buf,10,10,9) ||
        !sqjit_a64_emit_add_reg(buf,11,11,10) ||
        !sqjit_a64_emit_ldr_w(buf,9,11,SQTable::RawNodeKeyOffset()+type) ||
        !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)sq_type(key)) ||
        !sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_x(buf,9,11,SQTable::RawNodeKeyOffset()+value) ||
        !sqjit_a64_emit_mov_imm_x(buf,10,(SQInteger)_rawval(key)) ||
        !sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_add_imm(buf,11,11,SQTable::RawNodeValueOffset()) ||
        !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_TABLE) ||
        !sqjit_a64_emit_cmp_reg(buf,13,10) ||
        !sqjit_a64_emit_bcond_placeholder(buf,SQ_JIT_A64_EQ,&ready)) return false;
    // Class member maps encode a field index, not the instance's value slot.
    // Methods keep their existing lookup semantics. Guard the field index before
    // forming an address in the current instance's flexible array.
    if(!sqjit_a64_emit_ldr_w(buf,9,11,type) ||
        !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_INTEGER) ||
        !sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_x(buf,9,11,value) ||
        !sqjit_a64_emit_mov_imm_x(buf,10,MEMBER_TYPE_FIELD) ||
        !sqjit_a64_emit_and_reg(buf,10,9,10) ||
        !sqjit_a64_emit_cmp_imm(buf,10,0) || !guard(SQ_JIT_A64_EQ) ||
        !sqjit_a64_emit_mov_imm_x(buf,10,MEMBER_MAX_COUNT) ||
        !sqjit_a64_emit_and_reg(buf,9,9,10) ||
        !sqjit_a64_emit_ldr_x(buf,10,12,klass) ||
        !sqjit_a64_emit_ldr_x(buf,10,10,defaults+SQClassMemberVec::RawSizeOffset()) ||
        !sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_HS) ||
        !sqjit_a64_emit_add_imm(buf,11,12,values) ||
        !sqjit_a64_emit_add_reg_lsl(buf,11,11,9,4) ||
        !sqjit_a64_patch_branch(buf,ready,buf->size,true,SQ_JIT_A64_EQ) ||
        !sqjit_a64_emit_str_w(buf,13,31,cache_offset+offsetof(SQJitA64PreciseMemberCache,owner_type)) ||
        !sqjit_a64_emit_str_x(buf,12,31,cache_offset+offsetof(SQJitA64PreciseMemberCache,owner_bits)) ||
        !sqjit_a64_emit_str_x(buf,11,31,cache_offset+offsetof(SQJitA64PreciseMemberCache,slot))) return false;
    return true;
}
