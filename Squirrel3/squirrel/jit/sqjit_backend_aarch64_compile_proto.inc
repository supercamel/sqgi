static bool sqjit_a64_compile_integer_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native)
{
    if(!proto || !entry_stack || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_stacksize <= 0 ||
        proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_nparameters > proto->_stacksize || proto->_ninstructions <= 0 ||
        proto->_ninstructions > SQ_JIT_A64_MAX_INSTRUCTIONS || proto->_bgenerator) {
        return false;
    }

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(!sqjit_a64_instruction_slots_valid(proto->_instructions[ip])) {
            return sqjit_a64_reject(proto, ip, "invalid stack slot operand");
        }
    }

    bool has_backward_branch = false;
    bool in_backward_loop[SQ_JIT_A64_IP_TABLE_SIZE];
    bool branch_target[SQ_JIT_A64_IP_TABLE_SIZE];
    for(SQInteger ip = 0; ip < SQ_JIT_A64_IP_TABLE_SIZE; ip++) {
        in_backward_loop[ip] = false;
        branch_target[ip] = false;
    }
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= 0 && target_ip < SQ_JIT_A64_IP_TABLE_SIZE) {
                branch_target[target_ip] = true;
            }
            if(target_ip <= ip) {
                has_backward_branch = true;
                if(target_ip < 0) {
                    target_ip = 0;
                }
                for(SQInteger loop_ip = target_ip; loop_ip <= ip &&
                    loop_ip < SQ_JIT_A64_IP_TABLE_SIZE; loop_ip++) {
                    in_backward_loop[loop_ip] = true;
                }
            }
        }
    }

    const SQObjectPtr *root_object = NULL;
    if(closure && closure->_root && sq_type(closure->_root->_obj) != OT_NULL) {
        root_object = (const SQObjectPtr *)&closure->_root->_obj;
    }

    SQInteger ip_to_offset[SQ_JIT_A64_IP_TABLE_SIZE];
    SQJitA64Reloc relocs[SQ_JIT_A64_MAX_RELOCS];
    SQJitA64Reloc guard_relocs[SQ_JIT_A64_MAX_GUARD_RELOCS];
    SQInteger nrelocs = 0;
    SQInteger nguard_relocs = 0;
    SQJitA64SlotState slots[MAX_FUNC_STACKSIZE];
    SQClass *constructed_array_field_class[MAX_FUNC_STACKSIZE];
    SQInteger constructed_array_field_index[MAX_FUNC_STACKSIZE];
    SQJitA64ProtoPreparedCallState prepared_call;
    SQInteger (&prepared_array_len_base)[MAX_FUNC_STACKSIZE] =
        prepared_call.array_len_base;
    SQInteger (&prepared_array_append_base)[MAX_FUNC_STACKSIZE] =
        prepared_call.array_append_base;
    SQClosure *(&prepared_direct_closure)[MAX_FUNC_STACKSIZE] =
        prepared_call.direct_closure;
    SQClass *(&prepared_class)[MAX_FUNC_STACKSIZE] = prepared_call.klass;
    SQJitA64MathIntrinsic (&prepared_math_intrinsic)[MAX_FUNC_STACKSIZE] =
        prepared_call.math_intrinsic;
    SQInteger (&prepared_math_nargs)[MAX_FUNC_STACKSIZE] =
        prepared_call.math_nargs;
    SQJitA64NumberConversion (&prepared_number_conversion)[MAX_FUNC_STACKSIZE] =
        prepared_call.number_conversion;
    SQInteger (&prepared_number_conversion_base)[MAX_FUNC_STACKSIZE] =
        prepared_call.number_conversion_base;
    SQClass *return_shape_class = NULL;
    SQInteger return_shape_field_index = -1;
    bool return_shape_seen = false;
    bool return_shape_conflict = false;

    for(SQInteger n = 0; n < SQ_JIT_A64_IP_TABLE_SIZE; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slots[n].Reset();
        constructed_array_field_class[n] = NULL;
        constructed_array_field_index[n] = -1;
        prepared_call.Clear(n);
    }
    for(SQInteger n = 0; n < proto->_nparameters; n++) {
        slots[n].MarkStackObject(n);
    }

    bool uses_write_log = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }
    SQInteger write_log_slot = MAX_FUNC_STACKSIZE;
    SQInteger local_slots = MAX_FUNC_STACKSIZE + (uses_write_log ? 1 : 0);

    auto clear_prepared_call_slot = [&](SQInteger slot) -> void {
        prepared_call.Clear(slot);
    };

    auto clear_constructed_array_field_slot = [&](SQInteger slot) -> void {
        if(slot >= 0 && slot < MAX_FUNC_STACKSIZE) {
            constructed_array_field_class[slot] = NULL;
            constructed_array_field_index[slot] = -1;
        }
    };

    auto clear_slot_observations = [&](SQInteger slot) -> void {
        slots[slot].ClearDerived();
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
    };

    auto mark_unknown_slot = [&](SQInteger slot) -> bool {
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(!sqjit_a64_slot_state_mark_unknown(slots, slot, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_stack_object_slot = [&](SQInteger slot, SQInteger stack_reg) -> bool {
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(!sqjit_a64_slot_state_mark_stack_object(slots, slot, stack_reg, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    SQInteger frame_size = local_slots * (SQInteger)sizeof(SQInteger);
    frame_size = (frame_size + 15) & ~(SQInteger)15;
    if(frame_size <= 0 || frame_size > 4095) {
        return false;
    }

    SQJitA64Buffer buf;
    buf.size = 0;
    if(!sqjit_a64_emit_prologue(&buf, frame_size)) {
        return false;
    }
    if(uses_write_log &&
        (!sqjit_a64_emit_mov_imm_x(&buf, 9, 0) ||
        !sqjit_a64_emit_str_x(&buf, 9, 31,
        sqjit_a64_local_disp(write_log_slot)))) {
        return false;
    }

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(rollback ?
                (const void *)sqjit_a64_helper_write_log_rollback :
                (const void *)sqjit_a64_helper_write_log_commit)) &&
            sqjit_a64_emit_blr_x16(&buf);
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_INT || slots[slot].kind == SQ_JIT_A64_SLOT_BOOL) {
            return true;
        }
        if(slots[slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, slots[slot].stack_object_reg,
            OT_INTEGER, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(slots[slot].stack_object_reg)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        if(!sqjit_a64_slot_state_mark_int(slots, slot, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_FLOAT) {
            return true;
        }
        if(slots[slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, slots[slot].stack_object_reg,
            OT_FLOAT, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 19, sqjit_a64_stack_value_disp(slots[slot].stack_object_reg)) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        if(!sqjit_a64_slot_state_mark_float(slots, slot, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_mark_int(slots, slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_mark_bool(slots, slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_mark_float(slots, slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot, SQArray *observed_array) -> bool {
        if(!sqjit_a64_slot_state_mark_array_ptr(slots, slot,
            observed_array, false, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_object_ptr_slot = [&](SQInteger slot, SQObjectType observed_type,
        SQInteger observed_ptr) -> bool {
        if(!sqjit_a64_slot_state_mark_object_ptr(slots, slot, observed_type,
            observed_ptr, false, false)) {
            return false;
        }
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        return true;
    };

    auto mark_constructed_array_field_slot = [&](SQInteger slot,
        SQInteger stack_reg, SQClass *klass, SQInteger field_index) -> bool {
        if(!klass || field_index < 0 ||
            !mark_stack_object_slot(slot, stack_reg)) {
            return false;
        }
        constructed_array_field_class[slot] = klass;
        constructed_array_field_index[slot] = field_index;
        return true;
    };

    auto record_return_shape = [&](SQInteger slot) -> void {
        return_shape_seen = true;
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            !constructed_array_field_class[slot]) {
            return_shape_conflict = true;
            return;
        }
        if(!return_shape_class) {
            return_shape_class = constructed_array_field_class[slot];
            return_shape_field_index = constructed_array_field_index[slot];
            return;
        }
        if(return_shape_class != constructed_array_field_class[slot] ||
            return_shape_field_index != constructed_array_field_index[slot]) {
            return_shape_conflict = true;
        }
    };

    auto record_unknown_return_shape = [&]() -> void {
        return_shape_seen = true;
        return_shape_conflict = true;
    };

    auto emit_load_int = [&](SQInteger dst, SQInteger value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 9, value) &&
            sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_int_slot(dst) &&
            (slots[dst].SetConst(value), true);
    };

    auto emit_load_float = [&](SQInteger dst, SQFloat value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInt32 bits = 0;
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)bits) &&
            sqjit_a64_emit_str_w(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst);
    };

    auto load_literal_value_slot = [&](SQInteger dst, const SQObjectPtr &literal) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(sq_type(literal) == OT_INTEGER) {
            return emit_load_int(dst, _integer(literal));
        }
        if(sq_type(literal) == OT_FLOAT) {
            return emit_load_float(dst, _float(literal));
        }
        if(sq_type(literal) == OT_ARRAY) {
            return sqjit_a64_emit_mov_imm_x(&buf, 9,
                (SQInteger)(intptr_t)_array(literal)) &&
                sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
                mark_array_ptr_slot(dst, _array(literal));
        }
        if(sqjit_a64_type_is_object_ptr(sq_type(literal))) {
            SQInteger object_ptr = 0;
            return sqjit_a64_value_to_object_ptr(literal, sq_type(literal),
                &object_ptr) &&
                sqjit_a64_emit_mov_imm_x(&buf, 9, object_ptr) &&
                sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
                mark_object_ptr_slot(dst, sq_type(literal), object_ptr);
        }
        return false;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        bool src_bool = slots[src].kind == SQ_JIT_A64_SLOT_BOOL;
        if(!ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(src_bool) {
            if(!mark_bool_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        slots[dst].CopyConstFrom(slots[src]);
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto copy_array_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_A64_SLOT_ARRAY_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        slots[dst].CopyArrayPtrFrom(slots[src]);
        clear_constructed_array_field_slot(dst);
        clear_prepared_call_slot(dst);
        return true;
    };

    auto copy_object_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            slots[src].object_ptr_observed_type == OT_NULL ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        slots[dst].CopyObjectPtrFrom(slots[src]);
        clear_constructed_array_field_slot(dst);
        clear_prepared_call_slot(dst);
        return true;
    };

    auto copy_stack_object_alias = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            slots[src].stack_object_reg < 0) {
            return false;
        }
        slots[dst].MarkStackObject(slots[src].stack_object_reg);
        constructed_array_field_class[dst] = constructed_array_field_class[src];
        constructed_array_field_index[dst] = constructed_array_field_index[src];
        clear_prepared_call_slot(dst);
        return true;
    };

    auto copy_any_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[src].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return copy_array_ptr_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return copy_object_ptr_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_A64_SLOT_FLOAT) {
            return copy_float_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_A64_SLOT_INT ||
            slots[src].kind == SQ_JIT_A64_SLOT_BOOL) {
            return copy_int_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            SQInteger reg = slots[src].stack_object_reg;
            if(reg < 0) {
                return false;
            }
            if(entry_stack && sq_type(entry_stack[reg]) == OT_INTEGER) {
                return copy_int_slot(dst, src);
            }
            if(entry_stack && sq_type(entry_stack[reg]) == OT_FLOAT) {
                return copy_float_slot(dst, src);
            }
            return copy_stack_object_alias(dst, src);
        }
        return false;
    };

    auto emit_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        SQInteger guard_patch = 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) || !ensure_int_slot(right) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(left)) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(right))) {
            return false;
        }
        switch(op) {
            case _OP_ADD:
                if(!sqjit_a64_emit_add_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_SUB:
                if(!sqjit_a64_emit_sub_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MUL:
                if(!sqjit_a64_emit_mul_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_DIV:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, SQ_JIT_A64_MAX_GUARD_RELOCS,
                        guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MOD:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, SQ_JIT_A64_MAX_GUARD_RELOCS,
                        guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 11, 9, 10) ||
                    !sqjit_a64_emit_msub_reg(&buf, 9, 11, 10, 9)) {
                    return false;
                }
                break;
            default:
                return false;
        }
        return sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) && mark_int_slot(dst);
    };

    auto slot_observed_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            (slots[slot].kind == SQ_JIT_A64_SLOT_FLOAT ||
            (slots[slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0 &&
            sq_type(entry_stack[slots[slot].stack_object_reg]) == OT_FLOAT));
    };

    auto emit_load_slot_as_float = [&](SQInteger slot, unsigned fp_reg,
        unsigned int_reg) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_FLOAT) {
            return ensure_float_slot(slot) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 31,
                    sqjit_a64_local_disp(slot));
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_INT ||
            slots[slot].kind == SQ_JIT_A64_SLOT_BOOL) {
            return ensure_int_slot(slot) &&
                sqjit_a64_emit_ldr_x(&buf, int_reg, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
        }
        if(slots[slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            slots[slot].stack_object_reg < 0 || !entry_stack) {
            return false;
        }

        SQInteger stack_reg = slots[slot].stack_object_reg;
        SQObjectType observed = sq_type(entry_stack[stack_reg]);
        if(observed != OT_FLOAT && observed != OT_INTEGER) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_FLOAT,
                    guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 19,
                    sqjit_a64_stack_value_disp(stack_reg));
        }
        return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_INTEGER,
                guard_relocs, &nguard_relocs) &&
            sqjit_a64_emit_ldr_x(&buf, int_reg, 19,
                sqjit_a64_stack_value_disp(stack_reg)) &&
            sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left,
        SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || op == _OP_MOD ||
            !emit_load_slot_as_float(left, 0, 9) ||
            !emit_load_slot_as_float(right, 1, 10) ||
            !sqjit_a64_emit_fop_s(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_integer_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_sub_reg(&buf, 9, 31, 9) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_float_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_fneg_s(&buf, 0, 0) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_guard_on_x0_zero = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_cmp_imm(&buf, 0, 0) &&
            sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, SQ_JIT_A64_MAX_GUARD_RELOCS,
                patch_offset, -1, true, SQ_JIT_A64_EQ);
    };

    auto emit_guard_fail_branch = [&](unsigned cond) -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_bcond_placeholder(&buf, cond, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                SQ_JIT_A64_MAX_GUARD_RELOCS, patch_offset, -1, true, cond);
    };

    auto emit_load_nulls = [&](SQInteger start, SQInteger count) -> bool {
        if(!sqjit_a64_slot_range_valid(start, count) ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, start) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, count) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)sqjit_a64_helper_load_nulls) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        for(SQInteger n = 0; n < count; n++) {
            if(!mark_stack_object_slot(start + n, start + n)) {
                return false;
            }
        }
        return true;
    };

    auto emit_instance_field_get_direct = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key, SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(observed != OT_FLOAT && observed != OT_INTEGER && observed != OT_BOOL &&
            observed != OT_ARRAY && !sqjit_a64_type_is_object_ptr(observed)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            have_field = slots[base].stack_object_reg >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    slots[base].stack_object_reg, key, &field);
        }
        else {
            have_field = sqjit_a64_observed_object_ptr_instance_field(
                slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                key, &field);
        }
        if(!have_field || field.value_type != observed) {
            return false;
        }

        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(!sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg, OT_INSTANCE,
                guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(slots[base].stack_object_reg))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
            sqjit_a64_local_disp(base))) {
            return false;
        }

        SQInteger type_disp = field.value_disp + (SQInteger)offsetof(SQObject, _type);
        SQInteger value_disp = field.value_disp + (SQInteger)offsetof(SQObject, _unVal);
        if(!sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11, type_disp) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }

        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_ldr_s(&buf, 0, 11, value_disp) &&
                sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst);
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, field.array_value);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, field.object_ptr_value);
        }
        return observed == OT_BOOL ? mark_bool_slot(dst) : mark_int_slot(dst);
    };

    auto emit_constructed_array_field_get = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE || !key ||
            slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            slots[base].stack_object_reg < 0 ||
            !constructed_array_field_class[base]) {
            return false;
        }

        SQClass *klass = constructed_array_field_class[base];
        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(entry_stack) {
            SQInteger param_limit = proto->_nparameters < MAX_FUNC_STACKSIZE ?
                proto->_nparameters : MAX_FUNC_STACKSIZE;
            for(SQInteger n = 0; n < param_limit && !have_field; n++) {
                if(sq_type(entry_stack[n]) == OT_INSTANCE &&
                    _instance(entry_stack[n])->_class == klass) {
                    have_field = sqjit_a64_observed_instance_field(
                        _instance(entry_stack[n]), key, &field);
                }
            }
        }
        if(!have_field) {
            return false;
        }
        if(field.field_index != constructed_array_field_index[base] ||
            field.value_type != OT_ARRAY) {
            return false;
        }

        SQInteger type_disp = field.value_disp + (SQInteger)offsetof(SQObject, _type);
        SQInteger value_disp = field.value_disp + (SQInteger)offsetof(SQObject, _unVal);

        if(!sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg, OT_INSTANCE,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 11, 19,
            sqjit_a64_stack_value_disp(slots[base].stack_object_reg)) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11, type_disp) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_ARRAY) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_array_ptr_slot(dst, NULL)) {
            return false;
        }
        slots[dst].MarkFreshArrayPtr(NULL);
        return true;
    };

    auto emit_outer_get = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }

        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType observed = sqjit_a64_observed_outer_value_type(closure,
            outer_index, &observed_array, &observed_object_ptr);
        const void *helper = NULL;
        if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_outer_get_integer;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_outer_get_float;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(observed == OT_ARRAY && observed_array) {
            helper = (const void *)sqjit_a64_helper_outer_get_array_ptr;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)observed_array) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(sqjit_a64_type_is_object_ptr(observed) && observed_object_ptr) {
            helper = (const void *)sqjit_a64_helper_outer_get_object_ptr;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)observed) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, observed_object_ptr) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr);
        }
        return mark_int_slot(dst);
    };

    auto emit_new_array = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, dst) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, reserve) ||
            !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_new_array) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_array_ptr_slot(dst, NULL)) {
            return false;
        }
        slots[dst].MarkFreshArrayPtr(NULL);
        return true;
    };

    auto emit_new_table = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, dst) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, reserve) ||
            !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_new_table) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_object_ptr_slot(dst, OT_TABLE, 0)) {
            return false;
        }
        slots[dst].MarkFreshObjectPtr(OT_TABLE, 0);
        return true;
    };

    auto emit_materialize_slot_to_stack = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0) {
            return true;
        }

        const void *helper = NULL;
        if(slots[slot].kind == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(slot)) {
                return false;
            }
            helper = (const void *)sqjit_a64_helper_store_stack_float;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf)) {
                return false;
            }
            return true;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_INT ||
            slots[slot].kind == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(slot)) {
                return false;
            }
            helper = slots[slot].kind == SQ_JIT_A64_SLOT_BOOL ?
                (const void *)sqjit_a64_helper_store_stack_bool :
                (const void *)sqjit_a64_helper_store_stack_integer;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf)) {
                return false;
            }
            return true;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_array_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(slots[slot].object_ptr_observed_type == OT_NULL) {
                return false;
            }
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)slots[slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_object_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto emit_materialize_call_slot_to_stack = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0 &&
            slots[slot].stack_object_reg != slot) {
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[slot].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_copy_stack_object) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            slots[slot].SetStackObjectReg(slot);
            return true;
        }
        return emit_materialize_slot_to_stack(slot);
    };

    auto stack_reg_for_materialized_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return -1;
        }
        if(slots[slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            return slots[slot].stack_object_reg;
        }
        return slot;
    };

    auto emit_table_newslot = [&](SQInteger table_slot, SQInteger key_slot,
        SQInteger value_slot) -> bool {
        if(table_slot < 0 || table_slot >= MAX_FUNC_STACKSIZE ||
            key_slot < 0 || key_slot >= MAX_FUNC_STACKSIZE ||
            value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
            slots[table_slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            slots[table_slot].object_ptr_observed_type != OT_TABLE ||
            !slots[table_slot].object_ptr_fresh_table) {
            return false;
        }
        if(!emit_materialize_slot_to_stack(key_slot) ||
            !emit_materialize_slot_to_stack(value_slot)) {
            return false;
        }
        SQInteger key_reg = stack_reg_for_materialized_slot(key_slot);
        SQInteger value_reg = stack_reg_for_materialized_slot(value_slot);
        if(key_reg < 0 || value_reg < 0) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31,
                sqjit_a64_local_disp(table_slot)) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, key_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, value_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_table_ptr_new_slot_stack) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_stack = [&](SQInteger array_reg, SQInteger value_reg) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE ||
            slots[array_reg].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }

        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg))) {
            return false;
        }
        if(slots[value_reg].kind == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(value_reg) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float)) {
                return false;
            }
        }
        else if(slots[value_reg].kind == SQ_JIT_A64_SLOT_INT) {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer)) {
                return false;
            }
        }
        else if(slots[value_reg].kind == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool)) {
                return false;
            }
        }
        else if(slots[value_reg].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[value_reg].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[value_reg].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_stack)) {
                return false;
            }
        }
        else if(slots[value_reg].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_array_ptr)) {
                return false;
            }
        }
        else if(slots[value_reg].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(slots[value_reg].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)slots[value_reg].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_object_ptr)) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_blr_x16(&buf) && emit_guard_on_x0_zero();
    };

    auto emit_append_array_integer = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            slots[array_reg].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, value) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_bool = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            slots[array_reg].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, value ? 1 : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_float_bits = [&](SQInteger array_reg, SQInteger bits) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            sizeof(SQFloat) != sizeof(SQInt32) ||
            slots[array_reg].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, bits) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float_bits) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_literal = [&](SQInteger array_reg, SQInteger literal_index) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slots[array_reg].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_literal) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_array_len_raw = [&](SQInteger dst_local, SQInteger base) -> bool {
        if(dst_local < 0 || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 11, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_cmp_imm(&buf, 11, 0) &&
                emit_guard_fail_branch(SQ_JIT_A64_EQ) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            return sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg,
                    OT_ARRAY, guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_x(&buf, 11, 19,
                    sqjit_a64_stack_value_disp(slots[base].stack_object_reg)) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        return false;
    };

    auto emit_array_len = [&](SQInteger dst, SQInteger base) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !emit_array_len_raw(dst, base) ||
            !mark_int_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_array_append_value_unlogged = [&](SQInteger base,
        SQInteger value_slot) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
            slots[base].kind != SQ_JIT_A64_SLOT_ARRAY_PTR ||
            !slots[base].array_ptr_fresh ||
            !sqjit_a64_emit_ldr_x(&buf, 0, 31,
            sqjit_a64_local_disp(base))) {
            return false;
        }

        if(slots[value_slot].kind == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(value_slot) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float)) {
                return false;
            }
        }
        else if(slots[value_slot].kind == SQ_JIT_A64_SLOT_INT) {
            if(!ensure_int_slot(value_slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer)) {
                return false;
            }
        }
        else if(slots[value_slot].kind == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(value_slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool)) {
                return false;
            }
        }
        else if(slots[value_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[value_slot].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[value_slot].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_stack)) {
                return false;
            }
        }
        else if(slots[value_slot].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_array_ptr)) {
                return false;
            }
        }
        else if(slots[value_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(slots[value_slot].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)slots[value_slot].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_object_ptr)) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_blr_x16(&buf) && emit_guard_on_x0_zero();
    };

    auto emit_return_object_slot = [&](SQInteger reg) -> bool {
        if(reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[reg].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(reg)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_array_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slots[reg].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(slots[reg].object_ptr_observed_type == OT_NULL) {
                return false;
            }
            return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(reg)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[reg].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_reg(&buf, 2, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_object_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slots[reg].kind == SQ_JIT_A64_SLOT_STACK_OBJECT && slots[reg].stack_object_reg >= 0) {
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slots[reg].stack_object_reg) &&
                sqjit_a64_emit_mov_reg(&buf, 2, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_stack_object) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto emit_array_element_get_direct = [&](SQInteger dst, SQInteger base,
        bool const_index, SQInteger index, SQInteger key, SQObjectType observed,
        SQArray *observed_array, SQInteger observed_object_ptr = 0) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE ||
            (observed != OT_FLOAT && observed != OT_INTEGER &&
            observed != OT_ARRAY)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        unsigned stride_shift = 0;
        SQInteger stride = (SQInteger)sizeof(SQObjectPtr);
        while(((SQInteger)1 << stride_shift) < stride && stride_shift < 63) {
            stride_shift++;
        }
        if(((SQInteger)1 << stride_shift) != stride) {
            return false;
        }

        if(slots[base].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg,
                OT_ARRAY, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(slots[base].stack_object_reg))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(const_index) {
            if(index < 0 || !sqjit_a64_emit_mov_imm_x(&buf, 10, index)) {
                return false;
            }
        }
        else {
            if(key < 0 || key >= MAX_FUNC_STACKSIZE ||
                !ensure_int_slot(key) ||
                !sqjit_a64_emit_ldr_x(&buf, 10, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_LT)) {
                return false;
            }
        }

        if(!sqjit_a64_emit_ldr_x(&buf, 12, 11, SQArray::RawSizeOffset()) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_GE) ||
            !sqjit_a64_emit_ldr_x(&buf, 13, 11, SQArray::RawValuesOffset()) ||
            !sqjit_a64_emit_add_reg_lsl(&buf, 13, 13, 10, stride_shift) ||
            !sqjit_a64_emit_ldr_w(&buf, 14, 13,
            (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }

        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_ldr_s(&buf, 0, 13,
                    (SQInteger)offsetof(SQObject, _unVal)) &&
                sqjit_a64_emit_str_s(&buf, 0, 31,
                    sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst);
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_get = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array,
        SQInteger observed_object_ptr) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            slots[base].stack_object_reg < 0) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, index) ||
            !(object_result ?
                sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
            !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
            !(object_result ?
                sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_ptr_get = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slots[base].kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_float_raw;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_integer_raw;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_object_raw;
            object_result = true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, index) ||
            !(object_result ?
                sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
            !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_ptr_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slots[base].kind != SQ_JIT_A64_SLOT_ARRAY_PTR || !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_float_raw;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_integer_raw;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_object_raw;
            object_result = true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
            !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(key)) ||
            !(object_result ?
                sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
            !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_member_get_key = [&](SQInteger dst, SQInteger base, const SQObjectPtr *key,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        bool use_root_fallback = slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg == 0 && root_object != NULL;
        bool direct_instance_field_ok = true;
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg > 0 &&
            slots[base].stack_object_reg < proto->_nparameters &&
            sq_type(entry_stack[0]) == OT_INSTANCE &&
            sq_type(entry_stack[slots[base].stack_object_reg]) == OT_INSTANCE &&
            _instance(entry_stack[0])->_class !=
            _instance(entry_stack[slots[base].stack_object_reg])->_class) {
            direct_instance_field_ok = false;
        }
        if(emit_constructed_array_field_get(dst, base, key)) {
            return true;
        }
        if(direct_instance_field_ok &&
            emit_instance_field_get_direct(dst, base, key, observed)) {
            return true;
        }
        if(observed == OT_NULL) {
            if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                if(slots[base].object_ptr_observed_type == OT_NULL ||
                    !sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base)) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base].object_ptr_observed_type) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)key) ||
                    !sqjit_a64_emit_mov_reg(&buf, 3, 19) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                    return false;
                }
                return sqjit_a64_emit_mov_imm_x(&buf, 16,
                        (SQInteger)(intptr_t)
                        sqjit_a64_helper_object_ptr_get_object_key) &&
                    sqjit_a64_emit_blr_x16(&buf) &&
                    emit_guard_on_x0_zero() &&
                    mark_stack_object_slot(dst, dst);
            }
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                use_root_fallback ? (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                return false;
            }
            return sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_member_get_object_key) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_stack_object_slot(dst, dst);
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_float :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_float_root :
                (const void *)sqjit_a64_helper_table_get_float);
        }
        else if(observed == OT_INTEGER) {
            helper = slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_integer :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_integer_root :
                (const void *)sqjit_a64_helper_table_get_integer);
        }
        else if(observed == OT_ARRAY) {
            helper = slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_array_ptr :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_array_ptr_root :
                (const void *)sqjit_a64_helper_table_get_array_ptr);
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            helper = slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_object_ptr :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_member_get_object_ptr_root :
                (const void *)sqjit_a64_helper_member_get_object_ptr);
        }
        else {
            return false;
        }

        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
        }
        else if(slots[base].stack_object_reg < 0 ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
            return false;
        }

        if(sqjit_a64_type_is_object_ptr(observed)) {
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_add_imm(&buf, 5, 31,
                    sqjit_a64_local_disp(dst))) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(use_root_fallback) {
            if(!sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)root_object) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr);
        }
        return mark_int_slot(dst);
    };

    auto emit_member_get_dynamic_key = [&](SQInteger dst, SQInteger base,
        SQInteger key_slot, bool prefer_integer = false) -> bool {
        bool key_is_object_ptr = key_slot >= 0 &&
            key_slot < MAX_FUNC_STACKSIZE &&
            slots[key_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR &&
            slots[key_slot].object_ptr_observed != 0 &&
            slots[key_slot].object_ptr_observed_type != OT_NULL;
        bool key_is_stack_object = key_slot >= 0 &&
            key_slot < MAX_FUNC_STACKSIZE &&
            slots[key_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[key_slot].stack_object_reg >= 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            base < 0 || base >= MAX_FUNC_STACKSIZE ||
            (!key_is_object_ptr && !key_is_stack_object) ||
            (slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }

        if(key_is_stack_object) {
            bool use_root_fallback = slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                slots[base].stack_object_reg == 0 && root_object != NULL;
            SQObjectType observed = OT_NULL;
            if(entry_stack && slots[key_slot].stack_object_reg >= 0 &&
                slots[key_slot].stack_object_reg < MAX_FUNC_STACKSIZE &&
                sq_type(entry_stack[slots[key_slot].stack_object_reg]) != OT_NULL) {
                const SQObjectPtr *key = &entry_stack[slots[key_slot].stack_object_reg];
                if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                    observed = sqjit_a64_observed_object_ptr_value_type(
                        slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                        key);
                }
                else {
                    SQInteger observed_reg = slots[base].stack_object_reg;
                    observed = sqjit_a64_observed_table_value_type(entry_stack,
                        observed_reg, key);
                    if(observed == OT_NULL && observed_reg == 0 &&
                        root_object != NULL) {
                        observed = sqjit_a64_observed_root_value_type(root_object,
                            key);
                    }
                }
            }
            if(observed == OT_INTEGER || prefer_integer) {
                if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                    if(slots[base].object_ptr_observed_type == OT_NULL ||
                        !sqjit_a64_emit_ldr_x(&buf, 0, 31,
                        sqjit_a64_local_disp(base)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 1,
                        (SQInteger)slots[base].object_ptr_observed_type) ||
                        !sqjit_a64_emit_mov_reg(&buf, 2, 19) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 3,
                        slots[key_slot].stack_object_reg) ||
                        !sqjit_a64_emit_add_imm(&buf, 4, 31,
                        sqjit_a64_local_disp(dst)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 16,
                        (SQInteger)(intptr_t)
                        sqjit_a64_helper_object_ptr_get_integer_stack_key) ||
                        !sqjit_a64_emit_blr_x16(&buf) ||
                        !emit_guard_on_x0_zero()) {
                        return false;
                    }
                }
                else {
                    if(slots[base].stack_object_reg < 0 ||
                        !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 1,
                        slots[base].stack_object_reg) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 2,
                        slots[key_slot].stack_object_reg)) {
                        return false;
                    }
                    if(use_root_fallback) {
                        if(!sqjit_a64_emit_mov_imm_x(&buf, 3,
                            (SQInteger)(intptr_t)root_object) ||
                            !sqjit_a64_emit_add_imm(&buf, 4, 31,
                            sqjit_a64_local_disp(dst)) ||
                            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                            (SQInteger)(intptr_t)
                            sqjit_a64_helper_member_get_integer_stack_key_root)) {
                            return false;
                        }
                    }
                    else if(!sqjit_a64_emit_add_imm(&buf, 3, 31,
                        sqjit_a64_local_disp(dst)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 16,
                        (SQInteger)(intptr_t)
                        sqjit_a64_helper_member_get_integer_stack_key)) {
                        return false;
                    }
                    if(!sqjit_a64_emit_blr_x16(&buf) ||
                        !emit_guard_on_x0_zero()) {
                        return false;
                    }
                }
                return mark_int_slot(dst);
            }
            const void *helper = NULL;
            if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_object_stack_key;
                if(slots[base].object_ptr_observed_type == OT_NULL ||
                    !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base].object_ptr_observed_type) ||
                    !sqjit_a64_emit_mov_reg(&buf, 2, 19) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 3,
                    slots[key_slot].stack_object_reg) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                    return false;
                }
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_member_get_object_stack_key_root :
                    (const void *)sqjit_a64_helper_member_get_object_stack_key;
                if(slots[base].stack_object_reg < 0 ||
                    !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 1,
                    slots[base].stack_object_reg) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    slots[key_slot].stack_object_reg)) {
                    return false;
                }
                if(use_root_fallback) {
                    if(!sqjit_a64_emit_mov_imm_x(&buf, 3,
                        (SQInteger)(intptr_t)root_object) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_mov_imm_x(&buf, 3, dst)) {
                    return false;
                }
            }
            return sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_stack_object_slot(dst, dst);
        }

        SQObjectPtr key;
        if(!sqjit_a64_object_ptr_to_value(slots[key_slot].object_ptr_observed,
            slots[key_slot].object_ptr_observed_type, key)) {
            return false;
        }

        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType observed = OT_NULL;
        bool use_root_fallback = false;
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            observed = sqjit_a64_observed_object_ptr_value_type(
                slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                &key, &observed_array, &observed_object_ptr);
        }
        else {
            SQInteger observed_reg = slots[base].stack_object_reg;
            observed = sqjit_a64_observed_table_value_type(entry_stack,
                observed_reg, &key, &observed_array, &observed_object_ptr);
            use_root_fallback = observed == OT_NULL && observed_reg == 0 &&
                root_object != NULL;
            if(use_root_fallback) {
                observed = sqjit_a64_observed_root_value_type(root_object,
                    &key, &observed_array, &observed_object_ptr);
            }
        }

        if(emit_constructed_array_field_get(dst, base, &key)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, &key, observed)) {
            return true;
        }

        const void *helper = NULL;
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            helper = (const void *)sqjit_a64_helper_object_ptr_get_object_dynamic_key;
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)slots[key_slot].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_reg(&buf, 4, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                return false;
            }
        }
        else {
            helper = use_root_fallback ?
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key_root :
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key;
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)slots[key_slot].object_ptr_observed_type)) {
                return false;
            }
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_table_get = [&](SQInteger dst, SQInteger base, SQInteger literal_index,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return emit_member_get_key(dst, base, &proto->_literals[literal_index],
            observed, observed_array, observed_object_ptr);
    };

    auto emit_member_closure_guard = [&](SQInteger base_slot,
        SQInteger literal_index, SQClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slots[base_slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !expected) {
            return false;
        }
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_member_object_ptr_guard = [&](SQInteger base_slot,
        SQInteger literal_index, SQObjectType expected_type,
        SQInteger expected_ptr) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slots[base_slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !sqjit_a64_type_is_object_ptr(expected_type) || !expected_ptr) {
            return false;
        }
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)expected_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 4, expected_ptr) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_object_ptr_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)expected_type) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, expected_ptr) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_object_ptr_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_member_exists_guard_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, bool expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key ||
            (slots[base_slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, expected ? 1 : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_exists_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, expected ? 1 : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_exists_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_closure = [&](SQInteger base_slot,
        SQInteger literal_index, SQClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(slots[base_slot].object_ptr_observed,
                slots[base_slot].object_ptr_observed_type,
                &proto->_literals[literal_index], value);
        }
        else if(slots[base_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].stack_object_reg >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base_slot].stack_object_reg, &proto->_literals[literal_index],
                slots[base_slot].stack_object_reg == 0 ? root_object : NULL, value);
            if(!ok && constructed_array_field_class[base_slot]) {
                ok = constructed_array_field_class[base_slot]->Get(
                    proto->_literals[literal_index], value);
            }
        }
        if(!ok || sq_type(value) != OT_CLOSURE) {
            return false;
        }
        *out = _closure(value);
        return true;
    };

    auto observed_member_object_ptr = [&](SQInteger base_slot,
        SQInteger literal_index, SQObjectType *type_out,
        SQInteger *ptr_out) -> bool {
        if(!type_out || !ptr_out) {
            return false;
        }
        *type_out = OT_NULL;
        *ptr_out = 0;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(slots[base_slot].object_ptr_observed,
                slots[base_slot].object_ptr_observed_type,
                &proto->_literals[literal_index], value);
        }
        else if(slots[base_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].stack_object_reg >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base_slot].stack_object_reg, &proto->_literals[literal_index],
                slots[base_slot].stack_object_reg == 0 ? root_object : NULL, value);
        }
        if(!ok || !sqjit_a64_type_is_object_ptr(sq_type(value))) {
            return false;
        }

        SQInteger ptr = 0;
        if(!sqjit_a64_value_to_object_ptr(value, sq_type(value), &ptr)) {
            return false;
        }
        *type_out = sq_type(value);
        *ptr_out = ptr;
        return true;
    };

    auto class_call_supported = [&](SQClass *klass, SQInteger nargs) -> bool {
        if(!klass || nargs <= 0) {
            return false;
        }
        SQObjectPtr constructor;
        if(!klass->GetConstructor(constructor)) {
            return true;
        }
        if(sq_type(constructor) != OT_CLOSURE) {
            return false;
        }
        SQClosure *callee = _closure(constructor);
        SQFunctionProto *callee_proto = callee ? callee->_function : NULL;
        if(!callee_proto || callee_proto->_bgenerator || callee_proto->_varparams ||
            callee_proto->_ndefaultparams != 0 ||
            callee_proto->_nparameters != nargs || !callee_proto->_jit ||
            !callee_proto->_jit->_entry) {
            return false;
        }
        SQJitNative *callee_native = (SQJitNative *)callee_proto->_jit->_entry;
        return callee_native &&
            callee_native->_ninstructions == callee_proto->_ninstructions &&
            callee_native->_native_entry &&
            callee_native->_native_kind != SQ_JIT_NATIVE_SETTER;
    };

    auto observed_slot_type = [&](SQInteger slot, SQObjectType *type_out) -> bool {
        if(!type_out || slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        switch(slots[slot].kind) {
        case SQ_JIT_A64_SLOT_INT:
            *type_out = OT_INTEGER;
            return true;
        case SQ_JIT_A64_SLOT_FLOAT:
            *type_out = OT_FLOAT;
            return true;
        case SQ_JIT_A64_SLOT_BOOL:
            *type_out = OT_BOOL;
            return true;
        case SQ_JIT_A64_SLOT_ARRAY_PTR:
            *type_out = OT_ARRAY;
            return true;
        case SQ_JIT_A64_SLOT_OBJECT_PTR:
            if(slots[slot].object_ptr_observed_type == OT_NULL) {
                return false;
            }
            *type_out = slots[slot].object_ptr_observed_type;
            return true;
        case SQ_JIT_A64_SLOT_STACK_OBJECT:
            if(slots[slot].stack_object_reg < 0) {
                return false;
            }
            *type_out = sq_type(entry_stack[slots[slot].stack_object_reg]);
            return true;
        default:
            return false;
        }
    };

    auto array_field_constructor_mode = [&](SQClass *klass, SQInteger arg_base,
        SQInteger nargs, SQClosure **ctor_out, SQInteger *field_index_out,
        SQInteger *mode_out) -> bool {
        if(!klass || !ctor_out || !field_index_out || !mode_out ||
            !sqjit_a64_call_args_valid(arg_base, nargs) ||
            klass->_defaultvalues.size() != 1 ||
            sq_type(klass->_defaultvalues[0].val) != OT_NULL) {
            return false;
        }

        SQObjectPtr constructor;
        if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE) {
            return false;
        }
        SQClosure *ctor = _closure(constructor);

        SQInteger mode = 0;
        if(sqjit_a64_constructor_looks_like_array_field_pack(ctor)) {
            if(nargs == 1) {
                mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3;
            }
            else if(nargs == 2) {
                SQObjectType arg_type = OT_NULL;
                if(observed_slot_type(arg_base + 1, &arg_type) && arg_type == OT_ARRAY) {
                    mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY;
                }
                else {
                    mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1;
                }
            }
            else if(nargs >= 3 && nargs <= 5) {
                SQObjectType first_arg_type = OT_NULL;
                if(observed_slot_type(arg_base + 1, &first_arg_type) &&
                    first_arg_type == OT_ARRAY) {
                    return false;
                }
                mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1 + (nargs - 2);
            }
            else {
                return false;
            }

            *ctor_out = ctor;
            *field_index_out = 0;
            *mode_out = mode;
            return true;
        }

        SQInteger simple_field_index = -1;
        SQInteger simple_pack_count = 0;
        if(!sqjit_a64_constructor_looks_like_simple_array_field_pack(klass,
            ctor, &simple_field_index, &simple_pack_count) ||
            nargs != simple_pack_count + 1) {
            return false;
        }
        for(SQInteger n = 0; n < simple_pack_count; n++) {
            SQObjectType arg_type = OT_NULL;
            if(!observed_slot_type(arg_base + 1 + n, &arg_type) ||
                arg_type == OT_NULL) {
                return false;
            }
        }
        mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1 + (simple_pack_count - 1);

        *ctor_out = ctor;
        *field_index_out = simple_field_index;
        *mode_out = mode;
        return true;
    };

    auto emit_array_field_constructor_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            !sqjit_a64_call_args_valid(arg_base, nargs)) {
            return false;
        }

        SQClosure *ctor = NULL;
        SQInteger field_index = 0;
        SQInteger mode = 0;
        if(!array_field_constructor_mode(klass, arg_base, nargs, &ctor,
            &field_index, &mode)) {
            return false;
        }

        for(SQInteger n = 1; n < nargs; n++) {
            if(!emit_materialize_call_slot_to_stack(arg_base + n)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)ctor) &&
            sqjit_a64_emit_mov_reg(&buf, 2, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 6, field_index) &&
            sqjit_a64_emit_mov_imm_x(&buf, 7, mode) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_array_field_constructor) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_constructed_array_field_slot(arg_base, arg_base, klass,
                field_index) &&
            mark_constructed_array_field_slot(dst, dst, klass, field_index);
    };

    auto emit_scalar_field_constructor_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            !sqjit_a64_call_args_valid(arg_base, nargs) || nargs <= 1) {
            return false;
        }

        SQClosure *ctor = NULL;
        SQInteger field_count = 0;
        if(!sqjit_a64_constructor_tail_is_scalar_field_pack(klass, &ctor,
            nargs, &field_count)) {
            return false;
        }

        for(SQInteger n = 1; n < nargs; n++) {
            if(!emit_materialize_call_slot_to_stack(arg_base + n)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)ctor) &&
            sqjit_a64_emit_mov_reg(&buf, 2, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 6, field_count) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_call_scalar_field_constructor) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(arg_base, arg_base) &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_direct_native_closure_call = [&](SQInteger dst, SQClosure *callee,
        SQInteger arg_base, SQInteger nargs, SQInteger call_ip) -> bool {
        if(call_ip < 0 || call_ip >= proto->_ninstructions ||
            in_backward_loop[call_ip] || dst == SQ_JIT_A64_NO_RESULT_SLOT || !callee ||
            !sqjit_a64_call_args_valid(arg_base, nargs) ||
            dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQFunctionProto *callee_proto = callee->_function;
        if(!callee_proto || !callee_proto->_jit ||
            !callee_proto->_jit->_entry) {
            return false;
        }
        SQJitNative *callee_native = (SQJitNative *)callee_proto->_jit->_entry;
        if(!callee_native ||
            callee_native->_ninstructions != callee_proto->_ninstructions ||
            !callee_native->_native_entry ||
            callee_native->_native_kind == SQ_JIT_NATIVE_SETTER) {
            return false;
        }
        for(SQInteger n = 0; n < nargs; n++) {
            SQInteger slot = arg_base + n;
            if(!emit_materialize_call_slot_to_stack(slot)) {
                return false;
            }
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)callee) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_native_closure) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            (callee_native->_return_shape ==
                SQ_JIT_NATIVE_RETURN_ARRAY_FIELD_INSTANCE &&
                callee_native->_return_shape_class ?
                mark_constructed_array_field_slot(dst, dst,
                    callee_native->_return_shape_class,
                    callee_native->_return_shape_field_index) :
                mark_stack_object_slot(dst, dst));
    };

    auto emit_class_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(emit_array_field_constructor_call(dst, klass, arg_base, nargs)) {
            return true;
        }
        if(emit_scalar_field_constructor_call(dst, klass, arg_base, nargs)) {
            return true;
        }
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            !sqjit_a64_call_args_valid(arg_base, nargs) ||
            !class_call_supported(klass, nargs)) {
            return false;
        }
        for(SQInteger n = 0; n < nargs; n++) {
            if(!emit_materialize_call_slot_to_stack(arg_base + n)) {
                return false;
            }
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_class) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_inline_simple_accessor_call = [&](SQClosure *callee_closure,
        const SQInstruction &call_inst) -> bool {
        if(!callee_closure || call_inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT ||
            call_inst._arg2 < 0 ||
            call_inst._arg2 + call_inst._arg3 > MAX_FUNC_STACKSIZE ||
            proto->_stacksize >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQFunctionProto *callee = callee_closure->_function;
        if(!callee || callee->_bgenerator || callee->_varparams ||
            callee->_ndefaultparams != 0 || callee->_noutervalues != 0 ||
            callee->_nparameters != call_inst._arg3 || callee->_nparameters < 1) {
            return false;
        }

        auto next_inline_ip = [&](SQInteger ip) -> SQInteger {
            while(ip >= 0 && ip < callee->_ninstructions &&
                callee->_instructions[ip].op == _OP_LINE) {
                ip++;
            }
            return ip;
        };

        auto detect_has_keys_predicate = [&](SQInteger *key_literals,
            SQInteger *key_count, SQInteger *subject_param) -> bool {
            if(!key_literals || !key_count || !subject_param ||
                callee->_nparameters < 2) {
                return false;
            }
            SQInteger literal_for_slot[MAX_FUNC_STACKSIZE];
            for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
                literal_for_slot[n] = -1;
            }
            *key_count = 0;
            *subject_param = -1;
            bool has_trap = false;
            bool has_return = false;
            for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
                const SQInstruction &inst = callee->_instructions[ip];
                switch(inst.op) {
                case _OP_LINE:
                case _OP_POPTRAP:
                case _OP_JMP:
                case _OP_JZ:
                case _OP_AND:
                case _OP_OR:
                case _OP_LOADBOOL:
                    break;
                case _OP_PUSHTRAP:
                    has_trap = true;
                    break;
                case _OP_LOAD:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= callee->_nliterals) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = inst._arg1;
                    break;
                case _OP_DLOAD:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        inst._arg3 < 0 || inst._arg3 >= callee->_nliterals) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = inst._arg1;
                    literal_for_slot[inst._arg2] = inst._arg3;
                    break;
                case _OP_MOVE:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = literal_for_slot[inst._arg1];
                    break;
                case _OP_EXISTS: {
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nparameters ||
                        inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                        return false;
                    }
                    SQInteger literal_index = literal_for_slot[inst._arg2];
                    if(literal_index < 0 || literal_index >= callee->_nliterals ||
                        sq_type(callee->_literals[literal_index]) != OT_STRING) {
                        return false;
                    }
                    if(*subject_param < 0) {
                        *subject_param = inst._arg1;
                    }
                    else if(*subject_param != inst._arg1) {
                        return false;
                    }
                    bool duplicate = false;
                    for(SQInteger n = 0; n < *key_count; n++) {
                        if(key_literals[n] == literal_index) {
                            duplicate = true;
                            break;
                        }
                    }
                    if(!duplicate) {
                        if(*key_count >= 8) {
                            return false;
                        }
                        key_literals[(*key_count)++] = literal_index;
                    }
                    break;
                }
                case _OP_RETURN:
                    has_return = true;
                    break;
                default:
                    return false;
                }
            }
            return has_trap && has_return && *subject_param >= 0 &&
                *key_count > 0;
        };

        auto observed_member_exists_for_key = [&](SQInteger base,
            const SQObjectPtr *key, bool *exists_out) -> bool {
            if(!exists_out || base < 0 || base >= MAX_FUNC_STACKSIZE || !key) {
                return false;
            }
            SQObjectPtr value;
            if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                if(slots[base].object_ptr_observed_type == OT_NULL) {
                    return false;
                }
                *exists_out = sqjit_a64_get_member_ptr_value(
                    slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                    key, value);
                return true;
            }
            if(slots[base].kind == SQ_JIT_A64_SLOT_INT ||
                slots[base].kind == SQ_JIT_A64_SLOT_FLOAT ||
                slots[base].kind == SQ_JIT_A64_SLOT_BOOL) {
                *exists_out = false;
                return true;
            }
            if(slots[base].kind != SQ_JIT_A64_SLOT_STACK_OBJECT ||
                slots[base].stack_object_reg < 0 || !entry_stack) {
                return false;
            }
            *exists_out = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base].stack_object_reg, key,
                slots[base].stack_object_reg == 0 ? root_object : NULL, value);
            return true;
        };

        SQInteger predicate_key_literals[8];
        SQInteger predicate_key_count = 0;
        SQInteger predicate_subject = -1;
        if(detect_has_keys_predicate(predicate_key_literals,
            &predicate_key_count, &predicate_subject)) {
            SQInteger subject_slot = call_inst._arg2 + predicate_subject;
            if(subject_slot < 0 || subject_slot >= MAX_FUNC_STACKSIZE) {
                return false;
            }
            bool result = true;
            SQInteger guard_key = -1;
            for(SQInteger n = 0; n < predicate_key_count; n++) {
                bool exists = false;
                const SQObjectPtr *key =
                    &callee->_literals[predicate_key_literals[n]];
                if(!observed_member_exists_for_key(subject_slot, key, &exists)) {
                    return false;
                }
                if(!exists) {
                    result = false;
                    guard_key = predicate_key_literals[n];
                    break;
                }
            }
            if(result) {
                for(SQInteger n = 0; n < predicate_key_count; n++) {
                    if(!emit_member_exists_guard_key(subject_slot,
                        &callee->_literals[predicate_key_literals[n]], true)) {
                        return false;
                    }
                }
            }
            else if(guard_key < 0 ||
                ((slots[subject_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT ||
                slots[subject_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) &&
                !emit_member_exists_guard_key(subject_slot,
                &callee->_literals[guard_key], false))) {
                return false;
            }
            if(!emit_load_int(call_inst._arg0, result ? 1 : 0) ||
                !mark_bool_slot(call_inst._arg0)) {
                return false;
            }
            slots[call_inst._arg0].SetConst(result ? 1 : 0);
            return true;
        }

        SQInteger ip0 = next_inline_ip(0);
        if(ip0 < 0 || ip0 >= callee->_ninstructions ||
            callee->_instructions[ip0].op != _OP_GETK) {
            return false;
        }
        const SQInstruction &field_get = callee->_instructions[ip0];
        if(field_get._arg1 < 0 || field_get._arg1 >= callee->_nliterals ||
            field_get._arg2 < 0 || field_get._arg2 >= callee->_nparameters ||
            sq_type(callee->_literals[field_get._arg1]) != OT_STRING) {
            return false;
        }
        SQInteger self_slot = call_inst._arg2 + field_get._arg2;
        SQInteger scratch = proto->_stacksize;
        if(self_slot < 0 || self_slot >= MAX_FUNC_STACKSIZE ||
            scratch < 0 || scratch >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        auto observed_member_for_key = [&](SQInteger base,
            const SQObjectPtr *key, SQArray **array_out,
            SQInteger *object_ptr_out) -> SQObjectType {
            if(array_out) {
                *array_out = NULL;
            }
            if(object_ptr_out) {
                *object_ptr_out = 0;
            }
            if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key) {
                return OT_NULL;
            }
            if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                return sqjit_a64_observed_object_ptr_value_type(
                    slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                    key, array_out, object_ptr_out);
            }
            SQInteger observed_reg = slots[base].stack_object_reg;
            SQObjectType observed = sqjit_a64_observed_table_value_type(
                entry_stack, observed_reg, key, array_out, object_ptr_out);
            if(observed == OT_NULL && observed_reg == 0) {
                observed = sqjit_a64_observed_root_value_type(root_object, key,
                    array_out, object_ptr_out);
            }
            return observed;
        };

        const SQObjectPtr *field_key = &callee->_literals[field_get._arg1];
        SQInteger ip1 = next_inline_ip(ip0 + 1);
        if(ip1 >= 0 && ip1 < callee->_ninstructions &&
            callee->_instructions[ip1].op == _OP_RETURN &&
            callee->_instructions[ip1]._arg0 != SQ_JIT_A64_NO_RESULT_SLOT &&
            callee->_instructions[ip1]._arg1 == field_get._arg0) {
            SQArray *observed_array = NULL;
            SQInteger observed_object_ptr = 0;
            SQObjectType observed = observed_member_for_key(self_slot, field_key,
                &observed_array, &observed_object_ptr);
            return emit_member_get_key(call_inst._arg0, self_slot, field_key,
                observed, observed_array, observed_object_ptr);
        }

        if(ip1 >= 0 && ip1 < callee->_ninstructions &&
            callee->_instructions[ip1].op == _OP_LOADINT) {
            const SQInstruction &index_load = callee->_instructions[ip1];
            SQInteger ip2 = next_inline_ip(ip1 + 1);
            if(ip2 < 0 || ip2 >= callee->_ninstructions ||
                callee->_instructions[ip2].op != _OP_GET ||
                callee->_instructions[ip2]._arg1 != field_get._arg0 ||
                callee->_instructions[ip2]._arg2 != index_load._arg0) {
                return false;
            }
            const SQInstruction &array_get = callee->_instructions[ip2];
            SQInteger ip3 = next_inline_ip(ip2 + 1);
            if(ip3 < 0 || ip3 >= callee->_ninstructions ||
                callee->_instructions[ip3].op != _OP_RETURN ||
                callee->_instructions[ip3]._arg0 == SQ_JIT_A64_NO_RESULT_SLOT ||
                callee->_instructions[ip3]._arg1 != array_get._arg0) {
                return false;
            }

            SQArray *field_array = NULL;
            SQInteger observed_object_ptr = 0;
            SQObjectType field_observed = observed_member_for_key(self_slot,
                field_key, &field_array, &observed_object_ptr);
            if(field_observed != OT_ARRAY ||
                !emit_member_get_key(scratch, self_slot, field_key,
                field_observed, field_array, observed_object_ptr)) {
                return false;
            }

            SQInteger index = sqjit_loadint_value(index_load);
            SQArray *observed_array = NULL;
            SQObjectType observed = sqjit_a64_observed_array_ptr_value_type(
                slots[scratch].array_ptr_observed, index, &observed_array);
            return emit_array_ptr_get(call_inst._arg0, scratch, index, observed,
                observed_array);
        }

        if(ip1 < 0 || ip1 >= callee->_ninstructions ||
            callee->_instructions[ip1].op != _OP_GETK) {
            return false;
        }
        const SQInstruction &array_get = callee->_instructions[ip1];
        if(array_get._arg2 != field_get._arg0 ||
            array_get._arg1 < 0 || array_get._arg1 >= callee->_nliterals ||
            sq_type(callee->_literals[array_get._arg1]) != OT_INTEGER) {
            return false;
        }
        SQInteger ip2 = next_inline_ip(ip1 + 1);
        if(ip2 < 0 || ip2 >= callee->_ninstructions ||
            callee->_instructions[ip2].op != _OP_RETURN ||
            callee->_instructions[ip2]._arg0 == SQ_JIT_A64_NO_RESULT_SLOT ||
            callee->_instructions[ip2]._arg1 != array_get._arg0) {
            return false;
        }

        SQArray *field_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType field_observed = observed_member_for_key(self_slot,
            field_key, &field_array, &observed_object_ptr);
        if(field_observed != OT_ARRAY ||
            !emit_member_get_key(scratch, self_slot, field_key,
            field_observed, field_array, observed_object_ptr)) {
            return false;
        }

        SQInteger index = _integer(callee->_literals[array_get._arg1]);
        SQArray *observed_array = NULL;
        SQObjectType observed = sqjit_a64_observed_array_ptr_value_type(
            slots[scratch].array_ptr_observed, index, &observed_array);
        return emit_array_ptr_get(call_inst._arg0, scratch, index, observed,
            observed_array);
    };

    auto emit_math_call = [&](SQInteger dst, SQJitA64MathIntrinsic intrinsic,
        SQInteger nargs, SQInteger first_arg) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            first_arg < 0 || first_arg >= MAX_FUNC_STACKSIZE ||
            intrinsic == SQ_JIT_A64_MATH_NONE) {
            return false;
        }
        if(nargs == 1) {
            return ensure_float_slot(first_arg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) &&
                sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(first_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_math_unary) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_float_slot(dst);
        }
        if(nargs == 2) {
            SQInteger second_arg = first_arg + 1;
            return second_arg >= 0 && second_arg < MAX_FUNC_STACKSIZE &&
                ensure_float_slot(first_arg) &&
                ensure_float_slot(second_arg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) &&
                sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(first_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(second_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 3, 31,
                    sqjit_a64_local_disp(dst)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_math_binary) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_float_slot(dst);
        }
        return false;
    };

    auto emit_number_conversion = [&](SQInteger dst,
        SQJitA64NumberConversion conversion, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE ||
            conversion == SQ_JIT_A64_NUMBER_CONVERSION_NONE) {
            return false;
        }
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT ||
                conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
                return slot_observed_is_float(src) ? ensure_float_slot(src) :
                    ensure_int_slot(src);
            }
            return false;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT) {
            if(slot_observed_is_float(src)) {
                return copy_float_slot(dst, src);
            }
            if(!ensure_int_slot(src) ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_integer_to_float) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_float_slot(dst)) {
                return false;
            }
            return true;
        }
        if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
            if(!slot_observed_is_float(src)) {
                return copy_int_slot(dst, src);
            }
            if(!ensure_float_slot(src) ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_float_to_integer) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_int_slot(dst)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_member_native_closure_guard_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, SQNativeClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key ||
            (slots[base_slot].kind != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !expected) {
            return false;
        }
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_native_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_native_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_native_closure_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, SQNativeClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slots[base_slot].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(slots[base_slot].object_ptr_observed,
                slots[base_slot].object_ptr_observed_type, key, value);
        }
        else if(slots[base_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base_slot].stack_object_reg >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base_slot].stack_object_reg, key,
                slots[base_slot].stack_object_reg == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_NATIVECLOSURE) {
            return false;
        }
        *out = _nativeclosure(value);
        return true;
    };

    auto literal_index_for_object_ptr_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            slots[slot].kind != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            slots[slot].object_ptr_observed_type == OT_NULL) {
            return -1;
        }
        for(SQInteger i = 0; i < proto->_nliterals; i++) {
            SQInteger literal_ptr = 0;
            if(sq_type(proto->_literals[i]) == slots[slot].object_ptr_observed_type &&
                sqjit_a64_value_to_object_ptr(proto->_literals[i],
                sq_type(proto->_literals[i]), &literal_ptr) &&
                literal_ptr == slots[slot].object_ptr_observed) {
                return i;
            }
        }
        return -1;
    };

    auto observed_instance_field_for_base = [&](SQInteger base,
        const SQObjectPtr *key, SQJitA64InstanceFieldObservation *field) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key || !field) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            return slots[base].stack_object_reg >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    slots[base].stack_object_reg, key, field);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return sqjit_a64_observed_object_ptr_instance_field(
                slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                key, field);
        }
        return false;
    };

    auto emit_instance_field_set_base = [&](SQInteger base,
        const SQJitA64InstanceFieldObservation &field) -> bool {
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg,
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 19,
                sqjit_a64_stack_value_disp(slots[base].stack_object_reg))) {
                return false;
            }
        }
        else if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base))) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_ldr_x(&buf, 10, 1, field.class_disp) &&
            sqjit_a64_emit_mov_imm_x(&buf, 12,
                (SQInteger)(intptr_t)field.klass) &&
            sqjit_a64_emit_cmp_reg(&buf, 10, 12) &&
            emit_guard_fail_branch(SQ_JIT_A64_NE);
    };

    auto emit_instance_field_set_integer_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_integer_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_instance_field_set_bool_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_bool_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_instance_field_set_float_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_add_imm(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_float_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_float_slot(target, value);
    };

    auto emit_member_set_integer_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_integer_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)slots[base].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    slots[base].stack_object_reg == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_bool_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_bool_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)slots[base].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_bool_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    slots[base].stack_object_reg == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_bool_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_bool = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_float_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_float_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return slots[base].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)slots[base].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_float_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    slots[base].stack_object_reg == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_float_slot(target, value);
        }
        return false;
    };

    bool previous_effective_return = false;
    SQInteger dead_until_ip = -1;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        ip_to_offset[ip] = buf.size;
        if(dead_until_ip >= 0) {
            if(ip < dead_until_ip) {
                continue;
            }
            dead_until_ip = -1;
        }
        const SQInstruction &inst = proto->_instructions[ip];
        bool return_shape_reachable =
            !(previous_effective_return && !branch_target[ip]);
        if(inst.op != _OP_LINE && inst.op != _OP_RETURN) {
            previous_effective_return = false;
        }
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT:
                if(!emit_load_int(inst._arg0, sqjit_loadint_value(inst))) {
                    return false;
                }
                break;
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) || !emit_load_float(inst._arg0, value)) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOADFLOAT");
                }
                break;
            }
            case _OP_LOAD:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOAD literal");
                }
                if(!load_literal_value_slot(inst._arg0, proto->_literals[inst._arg1])) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOAD literal");
                }
                break;
            case _OP_DLOAD:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    inst._arg3 < 0 || inst._arg3 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(!load_literal_value_slot(inst._arg0, proto->_literals[inst._arg1])) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(!load_literal_value_slot(inst._arg2, proto->_literals[inst._arg3])) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                break;
            case _OP_LOADBOOL:
                if(!emit_load_int(inst._arg0, inst._arg1 ? 1 : 0) || !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_LOADNULLS:
                if(!emit_load_nulls(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOADNULLS");
                }
                break;
            case _OP_MOVE:
                if(!copy_any_slot(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported MOVE");
                }
                break;
            case _OP_DMOVE:
                if(!copy_any_slot(inst._arg0, inst._arg1) ||
                    !copy_any_slot(inst._arg2, inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported DMOVE");
                }
                break;
            case _OP_GETOUTER:
                if(!emit_outer_get(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported GETOUTER");
                }
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported GETK key");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg2].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg2].array_ptr_observed, index, &observed_array);
                        if(!emit_array_ptr_get(inst._arg0, inst._arg2, index, observed,
                            observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported GETK array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg2].stack_object_reg : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, index);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get(inst._arg0, inst._arg2, index, observed,
                            observed_array, 0)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK array read");
                        }
                    }
                }
                else {
                    SQArray *observed_array = NULL;
                    SQInteger observed_object_ptr = 0;
                    SQObjectType observed = OT_NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg2].kind == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                        observed = sqjit_a64_observed_object_ptr_value_type(
                            slots[inst._arg2].object_ptr_observed,
                            slots[inst._arg2].object_ptr_observed_type,
                            &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                    }
                    else {
                        SQInteger observed_reg =
                            (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg2].stack_object_reg : -1;
                        observed = sqjit_a64_observed_table_value_type(entry_stack,
                            observed_reg, &proto->_literals[inst._arg1],
                            &observed_array, &observed_object_ptr);
                        if(observed == OT_NULL && observed_reg == 0) {
                            observed = sqjit_a64_observed_root_value_type(root_object,
                                &proto->_literals[inst._arg1], &observed_array,
                                &observed_object_ptr);
                        }
                    }
                    if(!emit_table_get(inst._arg0, inst._arg2, inst._arg1, observed,
                        observed_array, observed_object_ptr)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK table read");
                    }
                }
                break;
            }
            case _OP_GET: {
                if(slots[inst._arg2].known_const && !has_backward_branch) {
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg1].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg1].array_ptr_observed, slots[inst._arg2].const_value,
                            &observed_array);
                        if(!emit_array_ptr_get(inst._arg0, inst._arg1,
                            slots[inst._arg2].const_value, observed, observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported const GET array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg1].stack_object_reg : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, slots[inst._arg2].const_value);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                    slots[inst._arg2].const_value, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get(inst._arg0, inst._arg1, slots[inst._arg2].const_value,
                            observed, observed_array, 0)) {
                        return sqjit_a64_reject(proto, ip, "unsupported const GET array read");
                        }
                    }
                }
                else {
                    bool key_can_be_dynamic_member = inst._arg2 >= 0 &&
                        inst._arg2 < MAX_FUNC_STACKSIZE &&
                        (slots[inst._arg2].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ||
                        (slots[inst._arg2].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                        slots[inst._arg2].stack_object_reg >= 0));
                    bool base_can_be_dynamic_member = inst._arg1 >= 0 &&
                        inst._arg1 < MAX_FUNC_STACKSIZE &&
                        (slots[inst._arg1].kind == SQ_JIT_A64_SLOT_STACK_OBJECT ||
                        slots[inst._arg1].kind == SQ_JIT_A64_SLOT_OBJECT_PTR);
                    if(key_can_be_dynamic_member && base_can_be_dynamic_member) {
                        if(!emit_member_get_dynamic_key(inst._arg0, inst._arg1,
                            inst._arg2)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported dynamic GET member read");
                        }
                        break;
                    }
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg1].kind == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        SQInteger observed_index = 0;
                        if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                            slots[inst._arg2].known_const) {
                            observed_index = slots[inst._arg2].const_value;
                        }
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg1].array_ptr_observed, observed_index, &observed_array);
                        if(!emit_array_ptr_get_dynamic(inst._arg0, inst._arg1, inst._arg2,
                            observed, observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported dynamic GET array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg1].stack_object_reg : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, 0);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(0, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2,
                            observed, observed_array)) {
                            if(sqjit_diag_trace_enabled()) {
                                SQInteger observed_reg =
                                    (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                                    slots[inst._arg1].stack_object_reg : -1;
                                SQObjectType stack_type =
                                    (observed_reg >= 0) ? sq_type(entry_stack[observed_reg]) : OT_NULL;
                                scprintf(_SC("[sqjit:a64] dynamic GET array miss proto '%s' ip %d base=%d kind=%d stackreg=%d stacktype=%d key=%d keykind=%d observed=%d\n"),
                                    sqjit_a64_proto_name(proto), (SQInt32)ip,
                                    (SQInt32)inst._arg1,
                                    (SQInt32)((inst._arg1 >= 0 &&
                                    inst._arg1 < MAX_FUNC_STACKSIZE) ?
                                    slots[inst._arg1].kind : SQ_JIT_A64_SLOT_UNKNOWN),
                                    (SQInt32)observed_reg, (SQInt32)stack_type,
                                    (SQInt32)inst._arg2,
                                    (SQInt32)((inst._arg2 >= 0 &&
                                    inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                    slots[inst._arg2].kind : SQ_JIT_A64_SLOT_UNKNOWN),
                                    (SQInt32)observed);
                            }
                            return sqjit_a64_reject(proto, ip, "unsupported dynamic GET array read");
                        }
                    }
                }
                break;
            }
            case _OP_PREPCALL: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALL");
                }
                SQInteger key_literal = literal_index_for_object_ptr_slot(inst._arg1);
                if(key_literal < 0 ||
                    sq_type(proto->_literals[key_literal]) != OT_STRING) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALL key");
                }

                SQInteger receiver_slot = inst._arg2;
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                    if(inst._arg3 == inst._arg0 ||
                        !copy_any_slot(inst._arg3, inst._arg2)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALL self copy");
                    }
                    receiver_slot = inst._arg3;
                }
                else if(inst._arg0 == inst._arg2) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALL self copy");
                }
                if(!mark_unknown_slot(inst._arg0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALL");
                }

                const SQObjectPtr *key = &proto->_literals[key_literal];
                const SQChar *member_name = _stringval(*key);
                bool base_is_number = slots[receiver_slot].kind == SQ_JIT_A64_SLOT_INT ||
                    slots[receiver_slot].kind == SQ_JIT_A64_SLOT_FLOAT ||
                    slots[receiver_slot].kind == SQ_JIT_A64_SLOT_BOOL;
                if(slots[receiver_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                    slots[receiver_slot].stack_object_reg >= 0) {
                    SQObjectType base_type =
                        sq_type(entry_stack[slots[receiver_slot].stack_object_reg]);
                    base_is_number = base_type == OT_INTEGER ||
                        base_type == OT_FLOAT || base_type == OT_BOOL;
                }
                if(base_is_number && scstrcmp(member_name, _SC("tofloat")) == 0) {
                    prepared_number_conversion[inst._arg0] =
                        SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT;
                    prepared_number_conversion_base[inst._arg0] = receiver_slot;
                }
                else if(base_is_number &&
                    scstrcmp(member_name, _SC("tointeger")) == 0) {
                    prepared_number_conversion[inst._arg0] =
                        SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER;
                    prepared_number_conversion_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("len")) == 0) {
                    prepared_array_len_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("append")) == 0 ||
                    scstrcmp(member_name, _SC("push")) == 0) {
                    if(slots[receiver_slot].kind != SQ_JIT_A64_SLOT_ARRAY_PTR ||
                        !slots[receiver_slot].array_ptr_fresh) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALL append base");
                    }
                    prepared_array_append_base[inst._arg0] = receiver_slot;
                }
                else {
                    SQNativeClosure *native_callee = NULL;
                    SQJitA64MathIntrinsic intrinsic = SQ_JIT_A64_MATH_NONE;
                    SQInteger math_nargs = 0;
                    if(observed_member_native_closure_key(receiver_slot, key,
                        &native_callee) &&
                        sqjit_a64_math_intrinsic_from_native(native_callee,
                        &intrinsic, &math_nargs) &&
                        emit_member_native_closure_guard_key(receiver_slot, key,
                        native_callee)) {
                        prepared_math_intrinsic[inst._arg0] = intrinsic;
                        prepared_math_nargs[inst._arg0] = math_nargs;
                    }
                    else {
                        SQClosure *callee = NULL;
                        if(observed_member_closure(receiver_slot, key_literal,
                            &callee) &&
                            emit_member_closure_guard(receiver_slot, key_literal,
                            callee)) {
                            prepared_direct_closure[inst._arg0] = callee;
                        }
                        else {
                            SQObjectType member_type = OT_NULL;
                            SQInteger member_ptr = 0;
                            if(!observed_member_object_ptr(receiver_slot,
                                key_literal, &member_type, &member_ptr) ||
                                member_type != OT_CLASS ||
                                !emit_member_object_ptr_guard(receiver_slot,
                                key_literal, member_type, member_ptr)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALL member");
                            }
                            prepared_class[inst._arg0] =
                                (SQClass *)(intptr_t)member_ptr;
                        }
                    }
                }
                break;
            }
            case _OP_PREPCALLK: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALLK");
                }

                SQInteger receiver_slot = inst._arg2;
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                    if(inst._arg3 == inst._arg0 ||
                        !copy_any_slot(inst._arg3, inst._arg2)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALLK self copy");
                    }
                    receiver_slot = inst._arg3;
                }
                else if(inst._arg0 == inst._arg2) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALLK self copy");
                }
                if(!mark_unknown_slot(inst._arg0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALLK");
                }

                const SQChar *member_name = _stringval(proto->_literals[inst._arg1]);
                bool base_is_number = slots[receiver_slot].kind == SQ_JIT_A64_SLOT_INT ||
                    slots[receiver_slot].kind == SQ_JIT_A64_SLOT_FLOAT ||
                    slots[receiver_slot].kind == SQ_JIT_A64_SLOT_BOOL;
                if(slots[receiver_slot].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                    slots[receiver_slot].stack_object_reg >= 0) {
                    SQObjectType base_type =
                        sq_type(entry_stack[slots[receiver_slot].stack_object_reg]);
                    base_is_number = base_type == OT_INTEGER ||
                        base_type == OT_FLOAT || base_type == OT_BOOL;
                }
                if(base_is_number && scstrcmp(member_name, _SC("tofloat")) == 0) {
                    prepared_number_conversion[inst._arg0] =
                        SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT;
                    prepared_number_conversion_base[inst._arg0] = receiver_slot;
                }
                else if(base_is_number &&
                    scstrcmp(member_name, _SC("tointeger")) == 0) {
                    prepared_number_conversion[inst._arg0] =
                        SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER;
                    prepared_number_conversion_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("len")) == 0) {
                    prepared_array_len_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("append")) == 0 ||
                    scstrcmp(member_name, _SC("push")) == 0) {
                    if(slots[receiver_slot].kind != SQ_JIT_A64_SLOT_ARRAY_PTR ||
                        !slots[receiver_slot].array_ptr_fresh) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALLK append base");
                    }
                    prepared_array_append_base[inst._arg0] = receiver_slot;
                }
                else {
                    SQNativeClosure *native_callee = NULL;
                    SQJitA64MathIntrinsic intrinsic = SQ_JIT_A64_MATH_NONE;
                    SQInteger math_nargs = 0;
                    if(observed_member_native_closure_key(receiver_slot,
                        &proto->_literals[inst._arg1], &native_callee) &&
                        sqjit_a64_math_intrinsic_from_native(native_callee,
                        &intrinsic, &math_nargs) &&
                        emit_member_native_closure_guard_key(receiver_slot,
                        &proto->_literals[inst._arg1], native_callee)) {
                        prepared_math_intrinsic[inst._arg0] = intrinsic;
                        prepared_math_nargs[inst._arg0] = math_nargs;
                    }
                    else {
                        SQClosure *callee = NULL;
                        if(observed_member_closure(receiver_slot, inst._arg1,
                            &callee)) {
                            if(!emit_member_closure_guard(receiver_slot,
                                inst._arg1, callee)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALLK member");
                            }
                            prepared_direct_closure[inst._arg0] = callee;
                        }
                        else {
                            SQObjectType member_type = OT_NULL;
                            SQInteger member_ptr = 0;
                            if(!observed_member_object_ptr(receiver_slot,
                                inst._arg1, &member_type, &member_ptr) ||
                                member_type != OT_CLASS ||
                                !emit_member_object_ptr_guard(receiver_slot,
                                inst._arg1, member_type, member_ptr)) {
                                if(sqjit_diag_trace_enabled()) {
                                    SQInteger observed_reg =
                                        (receiver_slot >= 0 &&
                                        receiver_slot < MAX_FUNC_STACKSIZE) ?
                                        slots[receiver_slot].stack_object_reg : -1;
                                    SQObjectType stack_type =
                                        (entry_stack && observed_reg >= 0) ?
                                        sq_type(entry_stack[observed_reg]) : OT_NULL;
                                    scprintf(_SC("[sqjit:a64] PREPCALLK miss detail proto '%s' ip %d key '%s' receiver=%d kind=%d stackreg=%d stacktype=%d constructed=%p\n"),
                                        sqjit_a64_proto_name(proto), (SQInt32)ip,
                                        member_name, (SQInt32)receiver_slot,
                                        (SQInt32)((receiver_slot >= 0 &&
                                        receiver_slot < MAX_FUNC_STACKSIZE) ?
                                        slots[receiver_slot].kind :
                                        SQ_JIT_A64_SLOT_UNKNOWN),
                                        (SQInt32)observed_reg,
                                        (SQInt32)stack_type,
                                        receiver_slot >= 0 &&
                                        receiver_slot < MAX_FUNC_STACKSIZE ?
                                        (void *)constructed_array_field_class[receiver_slot] :
                                        NULL);
                                }
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALLK member");
                            }
                            prepared_class[inst._arg0] =
                                (SQClass *)(intptr_t)member_ptr;
                        }
                    }
                }
                break;
            }
            case _OP_CALL:
            case _OP_TAILCALL:
                if(inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported CALL");
                }
                if(prepared_array_len_base[inst._arg1] >= 0) {
                    SQInteger base = prepared_array_len_base[inst._arg1];
                    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || inst._arg3 != 1 ||
                        !emit_array_len(inst._arg0, base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array len");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_array_append_base[inst._arg1] >= 0) {
                    SQInteger base = prepared_array_append_base[inst._arg1];
                    SQInteger value_slot = inst._arg2 + 1;
                    if(inst._arg3 != 2 || inst._arg2 < 0 ||
                        value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
                        !emit_array_append_value_unlogged(base, value_slot)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array append");
                    }
                    if(inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT && !copy_any_slot(inst._arg0, base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array append result");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_math_intrinsic[inst._arg1] !=
                    SQ_JIT_A64_MATH_NONE) {
                    SQJitA64MathIntrinsic intrinsic =
                        prepared_math_intrinsic[inst._arg1];
                    SQInteger math_nargs = prepared_math_nargs[inst._arg1];
                    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || math_nargs <= 0 ||
                        inst._arg3 != math_nargs + 1 ||
                        !emit_math_call(inst._arg0, intrinsic, math_nargs,
                        inst._arg2 + 1)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL math");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_number_conversion[inst._arg1] !=
                    SQ_JIT_A64_NUMBER_CONVERSION_NONE) {
                    SQJitA64NumberConversion conversion =
                        prepared_number_conversion[inst._arg1];
                    SQInteger conversion_base =
                        prepared_number_conversion_base[inst._arg1];
                    if(inst._arg3 != 1 ||
                        !emit_number_conversion(inst._arg0, conversion,
                        conversion_base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL number conversion");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_direct_closure[inst._arg1]) {
                    SQClosure *callee = prepared_direct_closure[inst._arg1];
                    if(!emit_direct_native_closure_call(inst._arg0, callee,
                        inst._arg2, inst._arg3, ip) &&
                        !emit_inline_simple_accessor_call(callee, inst)) {
                        SQFunctionProto *callee_proto = callee ? callee->_function : NULL;
                        bool callee_can_retry = callee_proto &&
                            (!callee_proto->_jit ||
                            callee_proto->_jit->_eligibility != SQ_JIT_NEVER) &&
                            (!callee_proto->_jit || !callee_proto->_jit->_entry);
                        if(sqjit_diag_trace_enabled() && callee) {
                            scprintf(_SC("[sqjit:a64] direct closure miss proto '%s' ip %d callee '%s'\n"),
                                sqjit_a64_proto_name(proto), (SQInt32)ip,
                                sqjit_a64_proto_name(callee_proto));
                            if(callee_proto) {
                                SQInteger limit = callee_proto->_ninstructions < 8 ?
                                    callee_proto->_ninstructions : 8;
                                for(SQInteger n = 0; n < limit; n++) {
                                    const SQInstruction &ci =
                                        callee_proto->_instructions[n];
                                    scprintf(_SC("[sqjit:a64]   callee ip %d op %d args=%d,%d,%d,%d\n"),
                                        (SQInt32)n, (SQInt32)ci.op,
                                        (SQInt32)ci._arg0, (SQInt32)ci._arg1,
                                        (SQInt32)ci._arg2, (SQInt32)ci._arg3);
                                }
                            }
                        }
                        if(callee_can_retry) {
                            sqjit_diag_mark_transient_reject();
                            return sqjit_a64_reject(proto, ip,
                                "deferred CALL direct closure");
                        }
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL direct closure");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_class[inst._arg1]) {
                    SQClass *klass = prepared_class[inst._arg1];
                    if(!emit_class_call(inst._arg0, klass, inst._arg2,
                        inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL class");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported CALL");
                }
                break;
            case _OP_SET: {
                SQInteger key_literal = literal_index_for_object_ptr_slot(inst._arg2);
                if(key_literal < 0) {
                    bool dynamic_member_key = inst._arg2 >= 0 &&
                        inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg2].kind == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                        slots[inst._arg2].stack_object_reg >= 0;
                    bool dynamic_member_base = inst._arg1 >= 0 &&
                        inst._arg1 < MAX_FUNC_STACKSIZE &&
                        (slots[inst._arg1].kind == SQ_JIT_A64_SLOT_STACK_OBJECT ||
                        slots[inst._arg1].kind == SQ_JIT_A64_SLOT_OBJECT_PTR);
                    if(dynamic_member_key && dynamic_member_base &&
                        !(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg3].kind == SQ_JIT_A64_SLOT_BOOL) &&
                        !slot_observed_is_float(inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET dynamic member");
                    }
                    else if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg3].kind == SQ_JIT_A64_SLOT_BOOL) {
                        if(!emit_array_set_bool(inst._arg0, inst._arg1,
                            inst._arg2, inst._arg3)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported SET bool array");
                        }
                    }
                    else if(slot_observed_is_float(inst._arg3)) {
                        if(!emit_array_set_float(inst._arg0, inst._arg1,
                            inst._arg2, inst._arg3)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported SET float array");
                        }
                    }
                    else if(!emit_array_set_integer(inst._arg0,
                        inst._arg1, inst._arg2, inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET integer array");
                    }
                    break;
                }
                if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    constructed_array_field_class[inst._arg1]) {
                    SQInteger field_index = -1;
                    if(sqjit_a64_class_field_index(
                        constructed_array_field_class[inst._arg1],
                        &proto->_literals[key_literal], &field_index) &&
                        field_index == constructed_array_field_index[inst._arg1]) {
                        clear_constructed_array_field_slot(inst._arg1);
                    }
                }
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg3].kind == SQ_JIT_A64_SLOT_BOOL) {
                    if(!emit_member_set_bool_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET bool member");
                    }
                }
                else if(slot_observed_is_float(inst._arg3)) {
                    if(!emit_member_set_float_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET float member");
                    }
                }
                else {
                    SQObjectType value_type = OT_NULL;
                    bool value_is_known_object =
                        observed_slot_type(inst._arg3, &value_type) &&
                        value_type != OT_INTEGER &&
                        value_type != OT_FLOAT &&
                        value_type != OT_BOOL;
                    if(value_is_known_object) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET object member");
                    }
                    else if(!emit_member_set_integer_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET member");
                    }
                }
                break;
            }
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_observed_is_float(inst._arg1) ||
                    slot_observed_is_float(inst._arg2)) {
                    if(inst.op == _OP_MOD ||
                        !emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_NEG:
                if(slot_observed_is_float(inst._arg1)) {
                    if(!emit_float_neg(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_integer_neg(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_INCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT) {
                    if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !mark_int_slot(inst._arg0)) {
                        return false;
                    }
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_NEWOBJ:
                if(inst._arg3 == NOT_ARRAY) {
                    if(!emit_new_array(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ array");
                    }
                }
                else if(inst._arg3 == NOT_TABLE) {
                    if(!emit_new_table(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ table");
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ");
                }
                break;
            case _OP_NEWSLOT:
                if(inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT ||
                    !emit_table_newslot(inst._arg1, inst._arg2, inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported NEWSLOT");
                }
                break;
            case _OP_APPENDARRAY:
                if(inst._arg2 == AAT_STACK) {
                    if(!emit_append_array_stack(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY stack");
                    }
                }
                else if(inst._arg2 == AAT_LITERAL) {
                    if(!emit_append_array_literal(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY literal");
                    }
                }
                else if(inst._arg2 == AAT_INT) {
                    if(!emit_append_array_integer(inst._arg0, sqjit_loadint_value(inst))) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY int");
                    }
                }
                else if(inst._arg2 == AAT_FLOAT) {
                    if(!emit_append_array_float_bits(inst._arg0, (SQInteger)inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY float");
                    }
                }
                else if(inst._arg2 == AAT_BOOL) {
                    if(!emit_append_array_bool(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY bool");
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY kind");
                }
                break;
            case _OP_EQ:
            case _OP_NE: {
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2))) {
                    return false;
                }
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(!sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_cset(&buf, 9, inst.op == _OP_NE ? SQ_JIT_A64_NE : SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_JMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(target_ip < 0 || target_ip >= proto->_ninstructions ||
                    !sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS, patch_offset,
                        target_ip, false, 0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported JMP target");
                }
                break;
            }
            case _OP_JZ: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(target_ip < 0 || target_ip >= proto->_ninstructions) {
                    return sqjit_a64_reject(proto, ip, "unsupported JZ target or operand");
                }
                if(slots[inst._arg0].known_const) {
                    if(slots[inst._arg0].const_value == 0) {
                        if(!sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                            !sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS,
                            patch_offset, target_ip, false, 0)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported JZ target or operand");
                        }
                        if(target_ip > ip) {
                            dead_until_ip = target_ip;
                        }
                    }
                    break;
                }
                if(!ensure_int_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS, patch_offset,
                        target_ip, true, SQ_JIT_A64_EQ)) {
                    return sqjit_a64_reject(proto, ip, "unsupported JZ target or operand");
                }
                break;
            }
            case _OP_JCMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                unsigned false_cond = 0;
                switch((CmpOP)inst._arg3) {
                    case CMP_G: false_cond = SQ_JIT_A64_LE; break;
                    case CMP_GE: false_cond = SQ_JIT_A64_LT; break;
                    case CMP_L: false_cond = SQ_JIT_A64_GE; break;
                    case CMP_LE: false_cond = SQ_JIT_A64_GT; break;
                    default: return false;
                }
                if(target_ip < 0 || target_ip >= proto->_ninstructions ||
                    false_cond == 0) {
                    return false;
                }
                if(slots[inst._arg2].kind == SQ_JIT_A64_SLOT_FLOAT ||
                    slots[inst._arg0].kind == SQ_JIT_A64_SLOT_FLOAT) {
                    if(!ensure_float_slot(inst._arg2) || !ensure_float_slot(inst._arg0) ||
                        !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(inst._arg2)) ||
                        !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !sqjit_a64_emit_fcmp_s(&buf, 0, 1) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                        !sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS, patch_offset,
                            target_ip, true, false_cond)) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg2) || !ensure_int_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS, patch_offset,
                        target_ip, true, false_cond)) {
                    return false;
                }
                break;
            }
            case _OP_RETURN:
                previous_effective_return = true;
                if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) {
                    if(return_shape_reachable) {
                        record_unknown_return_shape();
                    }
                    if(!sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)OT_NULL) ||
                        !sqjit_a64_emit_str_w(&buf, 9, 20, (SQInteger)offsetof(SQObject, _type)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, 0) ||
                        !sqjit_a64_emit_str_x(&buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal)) ||
                        !emit_write_log_release(false) ||
                        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                        return sqjit_a64_reject(proto, ip, "unsupported null RETURN");
                    }
                    break;
                }
                if(slots[inst._arg1].kind == SQ_JIT_A64_SLOT_ARRAY_PTR ||
                    slots[inst._arg1].kind == SQ_JIT_A64_SLOT_OBJECT_PTR ||
                    slots[inst._arg1].kind == SQ_JIT_A64_SLOT_STACK_OBJECT) {
                    if(return_shape_reachable) {
                        record_return_shape(inst._arg1);
                    }
                    if(!emit_return_object_slot(inst._arg1) ||
                        !emit_write_log_release(false) ||
                        !sqjit_a64_emit_epilogue(&buf, frame_size,
                            SQ_JIT_NATIVE_RETURNED)) {
                        return sqjit_a64_reject(proto, ip, "unsupported object RETURN value");
                    }
                    break;
                }
                if(return_shape_reachable) {
                    record_unknown_return_shape();
                }
                if((slots[inst._arg1].kind == SQ_JIT_A64_SLOT_FLOAT ?
                    !ensure_float_slot(inst._arg1) : !ensure_int_slot(inst._arg1)) ||
                    !sqjit_a64_emit_store_out_scalar(&buf,
                        slots[inst._arg1].kind == SQ_JIT_A64_SLOT_FLOAT ? OT_FLOAT : OT_INTEGER,
                        inst._arg1, slots[inst._arg1].kind) ||
                    !emit_write_log_release(false) ||
                    !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                    return sqjit_a64_reject(proto, ip, "unsupported RETURN value");
                }
                break;
            default:
                return sqjit_a64_reject(proto, ip,
                    sqjit_a64_unsupported_opcode_reason(inst.op));
        }
    }

    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_GUARD_FAILED)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0 ||
            !sqjit_a64_patch_branch(&buf, relocs[n].patch_offset, target_offset,
                relocs[n].conditional, relocs[n].cond)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, guard_relocs[n].patch_offset, guard_fail_offset,
            true, guard_relocs[n].cond)) {
            return false;
        }
    }

    if(!sqjit_a64_install_raw(&native->_native_entry, &native->_native_size, &buf)) {
        return false;
    }
    if(return_shape_seen && !return_shape_conflict && return_shape_class) {
        native->_return_shape = SQ_JIT_NATIVE_RETURN_ARRAY_FIELD_INSTANCE;
        native->_return_shape_class = return_shape_class;
        native->_return_shape_field_index = return_shape_field_index;
    }
    else {
        native->_return_shape = SQ_JIT_NATIVE_RETURN_UNKNOWN;
        native->_return_shape_class = NULL;
        native->_return_shape_field_index = -1;
    }
    return true;
}

void sqjit_backend_native_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
        munmap(entry, size);
    }
}

bool sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native)
{
    return sqjit_a64_compile_integer_proto(proto, entry_stack, closure, native);
}

static bool sqjit_a64_cmp_false_cond(CmpOP op, unsigned *cond)
{
    if(!cond) {
        return false;
    }
    switch(op) {
        case CMP_G: *cond = SQ_JIT_A64_LE; return true;
        case CMP_GE: *cond = SQ_JIT_A64_LT; return true;
        case CMP_L: *cond = SQ_JIT_A64_GE; return true;
        case CMP_LE: *cond = SQ_JIT_A64_GT; return true;
        default: return false;
    }
}
