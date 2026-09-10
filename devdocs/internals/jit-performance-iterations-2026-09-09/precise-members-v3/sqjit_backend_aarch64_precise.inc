// Experimental canonical-slot tier. Each helper either completes one bytecode
// or exits before its effects. No borrowed value survives between instructions,
// so completed stores need no undo journal and every exit has an identity map.
// Keep this separate from the private-spill compiler until its effect contract
// and performance are established. SQGI_JIT_PRECISE_EXITS enables the experiment.
#include <limits>

static SQObjectPtr *sqjit_a64_precise_member(const SQObjectPtr &base, const SQObjectPtr &key)
{
    if(sq_type(base) == OT_ARRAY && sq_type(key) == OT_INTEGER) {
        SQInteger index = _integer(key);
        return (SQUnsignedInteger)index < (SQUnsignedInteger)_array(base)->Size() ?
            &_array(base)->_values[index] : NULL;
    }
    return sq_member_raw_slot(base, key);
}

static bool sqjit_a64_precise_arith(SQVM *vm, unsigned op, const SQObjectPtr &a,
    const SQObjectPtr &b, SQObjectPtr &result)
{
    if(!sq_isnumeric(a) || !sq_isnumeric(b)) return false;
    if(sq_type(a) == OT_INTEGER && sq_type(b) == OT_INTEGER) {
        SQInteger x = _integer(a), y = _integer(b);
        // Match the machine-word integer arithmetic used by the native tier
        // without invoking signed-overflow undefined behavior in these helpers.
        switch(op) {
        case '+': result = (SQInteger)((SQUnsignedInteger)x + (SQUnsignedInteger)y); return true;
        case '-': result = (SQInteger)((SQUnsignedInteger)x - (SQUnsignedInteger)y); return true;
        case '*': result = (SQInteger)((SQUnsignedInteger)x * (SQUnsignedInteger)y); return true;
        case '/':
            if(y == 0 || (y == -1 && x == std::numeric_limits<SQInteger>::min())) return false;
            result = x / y; return true;
        case '%':
            if(y == 0) return false;
            result = y == -1 ? SQInteger(0) : x % y; return true;
        }
        return false;
    }
    // Numeric inputs select only the VM's floating arithmetic, with no strings,
    // allocation, metamethods or release callbacks (result is a fresh scalar).
    return vm->ARITH_OP(op, result, a, b);
}

static SQInteger sqjit_a64_precise_step(SQJitWriteLog *log, SQObjectPtr *stack,
    SQClosure *closure, SQInteger ip, SQObjectPtr *out, SQVM *vm)
{
    const SQInstruction &i = closure->_function->_instructions[ip];
    SQObjectPtr value;
    SQInteger dst = i._arg0;
    switch(i.op) {
    case _OP_LOADINT: value = sqjit_loadint_value(i); break;
    case _OP_LOADFLOAT: {
        SQFloat number;
        if(!sqjit_loadfloat_value(i, &number)) return 0;
        value = number; break;
    }
    case _OP_LOADBOOL: value = (i._arg1 != 0); break;
    case _OP_LOAD:
        // Literal pins belong to the prototype and cannot be the last owner.
        value = closure->_function->_literals[i._arg1]; break;
    case _OP_MOVE:
        // Check before making a helper-local pin: such pins are not real owners.
        if(!log->CanRelease(stack[dst])) return 0;
        stack[dst] = stack[i._arg1]; return 1;
    case _OP_LOADNULLS:
        // Multiple drops can remove aliases of one another. Initially keep all
        // owning multi-destination writes on their ordinary interpreter path.
        for(SQInteger n=0; n<i._arg1; ++n)
            if(ISREFCOUNTED(sq_type(stack[dst+n]))) return 0;
        for(SQInteger n=0; n<i._arg1; ++n) stack[dst+n].Null();
        return 1;
    case _OP_DLOAD: {
        SQUnsignedInteger drops = dst != i._arg2 && ISREFCOUNTED(sq_type(stack[dst])) &&
            sq_type(stack[dst]) == sq_type(stack[i._arg2]) &&
            _rawval(stack[dst]) == _rawval(stack[i._arg2]) ? 2 : 1;
        if(!log->CanRelease(stack[dst]) || !log->CanRelease(stack[i._arg2], drops)) return 0;
        stack[dst] = closure->_function->_literals[i._arg1];
        stack[i._arg2] = closure->_function->_literals[i._arg3]; return 1;
    }
    case _OP_GET: case _OP_GETK: {
        const SQObjectPtr &base = stack[i.op == _OP_GET ? i._arg1 : i._arg2];
        const SQObjectPtr &key = i.op == _OP_GET ? stack[i._arg2] :
            closure->_function->_literals[i._arg1];
        SQObjectPtr *raw = sqjit_a64_precise_member(base, key);
        const SQObjectPtr *root = closure->_root ? (const SQObjectPtr *)&closure->_root->_obj : NULL;
        // Table/array/field reads dereference weak values; class methods do not.
        const SQObject *source = raw ? (sq_type(*raw) == OT_WEAKREF ? &_weakref(*raw)->_obj : raw) :
            sqjit_a64_borrow_member_value_with_root(stack, i.op == _OP_GET ? i._arg1 : i._arg2, &key, root);
        if(!source || !log->CanRelease(vm->temp_reg)) return 0;
        // Read before the temporary drop, including raw weakref dereference.
        // No checked release below can run a callback or destroy an observed
        // graph. Destination/base/key aliases therefore remain valid here.
        value = *source;
        vm->temp_reg = value;
        _Swap(stack[dst], vm->temp_reg);
        return 1;
    }
    case _OP_SET: {
        SQObjectPtr *target = sqjit_a64_precise_member(stack[i._arg1], stack[i._arg2]);
        if(!target && i._arg1 == 0 && sq_type(vm->_roottable) == OT_TABLE) {
            // Only the original implicit receiver may fall back to the active
            // VM's root. A borrowed lookup adds no apparent program owner.
            const SQObjectPtr &receiver = stack[0];
            bool plain = sq_type(receiver) == OT_TABLE ? !_table(receiver)->_delegate :
                sq_type(receiver) == OT_INSTANCE &&
                sq_type(_instance(receiver)->_class->_metamethods[MT_SET]) == OT_NULL;
            if(plain) target = _table(vm->_roottable)->GetRawSlot(stack[i._arg2]);
        }
        if(!target || !log->CanRelease(*target)) return 0;
        const bool result_write = dst != SQ_JIT_A64_NO_RESULT_SLOT && dst != i._arg3;
        if(result_write) {
            // The first write may discard another alias of the result's old
            // owner. Check the combined drop before either write, without pins.
            SQUnsignedInteger drops = ISREFCOUNTED(sq_type(*target)) &&
                sq_type(*target) == sq_type(stack[dst]) &&
                _rawval(*target) == _rawval(stack[dst]) ? 2 : 1;
            if(!log->CanRelease(stack[dst], drops)) return 0;
        }
        *target = stack[i._arg3];
        if(result_write) stack[dst] = stack[i._arg3];
        return 1;
    }
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
        unsigned op = i.op == _OP_ADD ? '+' : i.op == _OP_SUB ? '-' :
            i.op == _OP_MUL ? '*' : i.op == _OP_DIV ? '/' : '%';
        if(!sqjit_a64_precise_arith(vm, op, stack[i._arg2], stack[i._arg1], value)) return 0;
        break;
    }
    case _OP_NEG:
        if(sq_type(stack[i._arg1]) == OT_INTEGER)
            value = (SQInteger)(SQUnsignedInteger(0) - (SQUnsignedInteger)_integer(stack[i._arg1]));
        else if(sq_type(stack[i._arg1]) == OT_FLOAT) value = -_float(stack[i._arg1]);
        else return 0;
        break;
    case _OP_NOT: value = vm->IsFalse(stack[i._arg1]); break;
    case _OP_PINCL: {
        SQObjectPtr increment((SQInteger)(signed char)i._arg3);
        if(!sqjit_a64_precise_arith(vm, '+', stack[i._arg1], increment, value) ||
            !log->CanRelease(stack[dst])) return 0;
        stack[dst] = stack[i._arg1];
        stack[i._arg1] = value;
        return 1;
    }
    case _OP_INCL: {
        dst = i._arg1;
        SQObjectPtr increment((SQInteger)(signed char)i._arg3);
        if(!sqjit_a64_precise_arith(vm, '+', stack[dst], increment, value)) return 0;
        break;
    }
    case _OP_CMP: case _OP_JCMP: {
        const SQObjectPtr &left = stack[i._arg2];
        const SQObjectPtr &right = stack[i.op == _OP_JCMP ? i._arg0 : i._arg1];
        if(!sq_isnumeric(left) || !sq_isnumeric(right)) return 0;
        if(!vm->CMP_OP((CmpOP)i._arg3, left, right, value)) return 0;
        if(i.op != _OP_JCMP) break;
        if(!log->CanRelease(vm->temp_reg)) return 0;
        vm->temp_reg = value;
        return vm->IsFalse(value) ? 1 : 2;
    }
    case _OP_JZ: return vm->IsFalse(stack[i._arg0]) ? 1 : 2;
    case _OP_RETURN:
        if(i._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) out->Null();
        else *out = stack[i._arg1];
        return 1;
    default: return 0;
    }
    if(!log->CanRelease(stack[dst])) return 0;
    stack[dst] = value;
    return 1;
}

// Fast scalar writes never release an owner and never call a helper. Every
// slow branch precedes the first VM write, so it can retry the same bytecode.
static bool sqjit_a64_precise_fast(SQJitA64Buffer *buf, SQFunctionProto *proto,
    const SQInstruction &i, SQInteger &done)
{
    done = -1;
    SQObjectType literal_type = OT_INTEGER;
    SQInteger literal_bits = 0;
    switch(i.op) {
    case _OP_LOAD:
        if(ISREFCOUNTED(sq_type(proto->_literals[i._arg1]))) return true;
        literal_type = sq_type(proto->_literals[i._arg1]);
        literal_bits = (SQInteger)_rawval(proto->_literals[i._arg1]); break;
    case _OP_LOADINT: literal_bits = sqjit_loadint_value(i); break;
    case _OP_LOADBOOL: literal_type = OT_BOOL; literal_bits = i._arg1 != 0; break;
    case _OP_LOADFLOAT: {
        SQFloat value;
        if(!sqjit_loadfloat_value(i,&value)) return false;
        if(sizeof(value) > sizeof(literal_bits)) return true;
        literal_type = OT_FLOAT; memcpy(&literal_bits,&value,sizeof(value)); break;
    }
    case _OP_MOVE: case _OP_ADD: case _OP_SUB: case _OP_MUL:
    case _OP_DIV: case _OP_MOD: case _OP_INCL: case _OP_PINCL: break;
    default: return true;
    }
    SQInteger dst = i.op == _OP_INCL ? i._arg1 : i._arg0;
    SQInteger owning = -1, source_owning = -1;
    SQJitA64Reloc guards[8]; SQInteger nguards = 0;
    auto guard = [&](unsigned cond) {
        SQInteger patch;
        return sqjit_a64_emit_bcond_placeholder(buf,cond,&patch) &&
            sqjit_a64_record_reloc(guards,&nguards,8,patch,-1,true,cond);
    };
    if(!sqjit_a64_emit_ldr_w(buf,9,19,sqjit_a64_stack_type_disp(dst)) ||
        !sqjit_a64_emit_test_branch(buf,9,SQ_JIT_A64_REF_COUNTED_BIT,true,&owning)) return false;
    switch(i.op) {
    case _OP_LOAD: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
        if(!sqjit_a64_emit_mov_imm_x(buf,9,literal_bits) ||
            !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)literal_type)) return false;
        break;
    case _OP_MOVE:
        if(!sqjit_a64_emit_ldr_w(buf,10,19,sqjit_a64_stack_type_disp(i._arg1)) ||
            !sqjit_a64_emit_test_branch(buf,10,SQ_JIT_A64_REF_COUNTED_BIT,true,&source_owning) ||
            !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg1))) return false;
        break;
    case _OP_INCL: case _OP_PINCL:
        if(!sqjit_a64_emit_type_guard(buf,i._arg1,OT_INTEGER,guards,&nguards) ||
            !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg1)) ||
            !sqjit_a64_emit_mov_imm_x(buf,10,(SQInteger)(signed char)i._arg3) ||
            !sqjit_a64_emit_add_reg(buf,11,9,10)) return false;
        if(i.op == _OP_PINCL &&
            (!sqjit_a64_emit_str_x(buf,9,19,sqjit_a64_stack_value_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_INTEGER) ||
            !sqjit_a64_emit_str_w(buf,10,19,sqjit_a64_stack_type_disp(dst)))) return false;
        dst = i._arg1;
        if(!sqjit_a64_emit_mov_reg(buf,9,11) ||
            !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_INTEGER)) return false;
        break;
    default:
        if(!sqjit_a64_emit_type_guard(buf,i._arg2,OT_INTEGER,guards,&nguards) ||
            !sqjit_a64_emit_type_guard(buf,i._arg1,OT_INTEGER,guards,&nguards) ||
            !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg2)) ||
            !sqjit_a64_emit_ldr_x(buf,10,19,sqjit_a64_stack_value_disp(i._arg1))) return false;
        switch(i.op) {
        case _OP_ADD: if(!sqjit_a64_emit_add_reg(buf,9,9,10)) return false; break;
        case _OP_SUB: if(!sqjit_a64_emit_sub_reg(buf,9,9,10)) return false; break;
        case _OP_MUL: if(!sqjit_a64_emit_mul_reg(buf,9,9,10)) return false; break;
        case _OP_DIV: case _OP_MOD:
            if(!sqjit_a64_emit_cmp_imm(buf,10,0) || !guard(SQ_JIT_A64_EQ) ||
                !sqjit_a64_emit_mov_imm_x(buf,11,-1) || !sqjit_a64_emit_cmp_reg(buf,10,11) ||
                !guard(SQ_JIT_A64_EQ)) return false;
            if(i.op == _OP_DIV) { if(!sqjit_a64_emit_sdiv_reg(buf,9,9,10)) return false; }
            else if(!sqjit_a64_emit_sdiv_reg(buf,11,9,10) ||
                !sqjit_a64_emit_msub_reg(buf,9,11,10,9)) return false;
            break;
        default: return false;
        }
        if(!sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_INTEGER)) return false;
    }
    if(!sqjit_a64_emit_str_x(buf,9,19,sqjit_a64_stack_value_disp(dst)) ||
        !sqjit_a64_emit_str_w(buf,10,19,sqjit_a64_stack_type_disp(dst)) ||
        !sqjit_a64_emit_b_placeholder(buf,&done) ||
        !sqjit_a64_patch_test_branch(buf,owning,buf->size)) return false;
    if(source_owning >= 0 && !sqjit_a64_patch_test_branch(buf,source_owning,buf->size)) return false;
    for(SQInteger n=0;n<nguards;++n)
        if(!sqjit_a64_patch_branch(buf,guards[n].patch_offset,buf->size,true,guards[n].cond)) return false;
    return true;
}

static bool sqjit_a64_compile_precise(SQFunctionProto *proto, SQObjectPtr *entry_stack, SQJitNative *native)
{
    if(!proto || !entry_stack || !native || proto->_varparams || proto->_ndefaultparams ||
        proto->_bgenerator || proto->_nparameters < 1 || proto->_nparameters > proto->_stacksize || proto->_stacksize <= 0 ||
        proto->_stacksize > MAX_FUNC_STACKSIZE || proto->_ninstructions <= 0 ||
        proto->_ninstructions > SQ_JIT_A64_MAX_INSTRUCTIONS) return false;
    if(proto->_instructions[proto->_ninstructions-1].op != _OP_RETURN) return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(proto->_instructions, proto->_ninstructions, proto->_stacksize)) return false;
    bool has_store = false;
    for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        switch(i.op) {
        case _OP_LINE: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
        case _OP_LOAD: case _OP_DLOAD: case _OP_LOADNULLS: case _OP_MOVE:
        case _OP_GET: case _OP_GETK: case _OP_ADD: case _OP_SUB: case _OP_MUL:
        case _OP_DIV: case _OP_MOD: case _OP_NEG: case _OP_NOT: case _OP_INCL: case _OP_PINCL:
        case _OP_JZ: case _OP_JMP: case _OP_RETURN: break;
        case _OP_SET: has_store = true; break;
        case _OP_CMP: case _OP_JCMP:
            if(i._arg3 != CMP_G && i._arg3 != CMP_GE && i._arg3 != CMP_L &&
                i._arg3 != CMP_LE && (i.op == _OP_JCMP || i._arg3 != CMP_3W)) return false;
            break;
        default: return false;
        }
        if(i.op == _OP_PINCL && i._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) return false;
        if((i.op == _OP_LOAD || i.op == _OP_GETK || i.op == _OP_DLOAD) &&
            (i._arg1 < 0 || i._arg1 >= proto->_nliterals)) return false;
        if(i.op == _OP_DLOAD && i._arg3 >= proto->_nliterals) return false;
    }
    // This experiment addresses effectful functions. Pure scalar functions
    // continue using the existing private-register compiler.
    if(!has_store) return false;
    SQJitA64Buffer buf; buf.size = 0;
    const SQInteger log_slot = 0, log_storage = 1;
    SQInteger frame_size = (sizeof(SQJitWriteLog) + sizeof(SQInteger) + 15) & ~SQInteger(15);
    if(frame_size > 4095 || !sqjit_a64_emit_prologue(&buf, frame_size) ||
        !sqjit_a64_emit_init_write_log(&buf, log_slot, log_storage, &sqjit_context(proto->_sharedstate))) return false;
    // No helper in this tier can reenter the VM or relocate its stack. Keep
    // the active VM in a callee-saved register instead of looking it up per op.
    if(!sqjit_a64_emit_mov_imm_x(&buf,22,(SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate).active_vm) ||
        !sqjit_a64_emit_ldr_x(&buf,22,22,0)) return false;
    SQInteger offsets[SQ_JIT_A64_IP_TABLE_SIZE];
    SQJitA64Reloc branches[SQ_JIT_A64_MAX_RELOCS], guards[SQ_JIT_A64_MAX_GUARD_RELOCS];
    SQInteger nbranches = 0, nguards = 0;
    auto release = [&]() {
        return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(log_slot)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)sqjit_a64_helper_write_log_commit) &&
            sqjit_a64_emit_blr_x16(&buf);
    };
    for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) {
        offsets[ip] = buf.size;
        const SQInstruction &i = proto->_instructions[ip];
        if(i.op == _OP_LINE) continue;
        SQInteger patch = -1;
        if(i.op == _OP_JMP) {
            if(!sqjit_a64_emit_b_placeholder(&buf, &patch) ||
                !sqjit_a64_record_reloc(branches, &nbranches, SQ_JIT_A64_MAX_RELOCS,
                    patch, ip+1+sqjit_signed_arg1(i), false, 0)) return false;
            continue;
        }
        SQInteger fast_done = -1;
        if(!sqjit_a64_precise_fast(&buf,proto,i,fast_done)) return false;
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(log_slot)) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 19) || !sqjit_a64_emit_mov_reg(&buf, 2, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, ip) || !sqjit_a64_emit_mov_reg(&buf, 4, 20) ||
            !sqjit_a64_emit_mov_reg(&buf, 5, 22) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)sqjit_a64_precise_step) ||
            !sqjit_a64_emit_blr_x16(&buf)) return false;
        if(i.op == _OP_RETURN) {
            if(!release() || !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) return false;
            continue;
        }
        if(!sqjit_a64_emit_cmp_imm(&buf, 0, 0) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch) ||
            !sqjit_a64_record_reloc(guards, &nguards, SQ_JIT_A64_MAX_GUARD_RELOCS,
                patch, ip, true, SQ_JIT_A64_EQ)) return false;
        if(fast_done >= 0 && !sqjit_a64_patch_branch(&buf,fast_done,buf.size,false,0)) return false;
        if(i.op == _OP_JZ || i.op == _OP_JCMP) {
            if(!sqjit_a64_emit_cmp_imm(&buf, 0, 1) ||
                !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch) ||
                !sqjit_a64_record_reloc(branches, &nbranches, SQ_JIT_A64_MAX_RELOCS,
                    patch, ip+1+sqjit_signed_arg1(i), true, SQ_JIT_A64_EQ)) return false;
        }
    }
    for(SQInteger n=0; n<nguards; ++n) {
        const SQJitA64Reloc &g = guards[n];
        if(!sqjit_a64_patch_branch(&buf, g.patch_offset, buf.size, true, g.cond) || !release() ||
            !sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)OT_INTEGER) ||
            !sqjit_a64_emit_str_w(&buf, 9, 20, (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 9, g.target_ip) ||
            !sqjit_a64_emit_str_x(&buf, 9, 20, (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_SIDE_EXIT)) return false;
    }
    for(SQInteger n=0; n<nbranches; ++n) {
        const SQJitA64Reloc &b = branches[n];
        if(b.target_ip < 0 || b.target_ip >= proto->_ninstructions ||
            !sqjit_a64_patch_branch(&buf, b.patch_offset, offsets[b.target_ip], b.conditional, b.cond)) return false;
    }
    if(!native->_code.Install(buf.bytes, buf.size)) return false;
    native->_requires_vm_frame = true;
    native->_stack_live_slots = proto->_stacksize;
    native->_stack_storage_slots = proto->_stacksize;
    return true;
}
