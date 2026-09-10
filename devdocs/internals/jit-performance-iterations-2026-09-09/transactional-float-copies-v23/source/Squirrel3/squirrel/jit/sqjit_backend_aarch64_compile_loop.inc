static bool sqjit_a64_loop_instruction_reads_slot(const SQInstruction &inst, SQInteger slot)
{
    return slot >= 0 && slot < MAX_FUNC_STACKSIZE && sq_bytecode_facts(inst, 0, MAX_FUNC_STACKSIZE).reads.test(slot);
}

static bool sqjit_a64_loop_instruction_reads_int_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_MOVE:
            return inst._arg1 == slot;
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_NEG:
            return inst._arg1 == slot;
        case _OP_PINCL:
        case _OP_INCL:
            return inst._arg1 == slot;
        case _OP_JCMP:
        case _OP_CMP:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_JZ:
            return inst._arg0 == slot;
        case _OP_EQ:
        case _OP_NE:
            return inst._arg2 == slot || (inst._arg3 == 0 && inst._arg1 == slot);
        case _OP_GET:
            return inst._arg2 == slot;
        case _OP_SET:
            return inst._arg2 == slot;
        case _OP_COMPARITH: {
            SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 & 0x0000FFFFu);
            return inst._arg2 == slot || value == slot;
        }
        case _OP_RETURN:
            return inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT && inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_a64_loop_instruction_writes_slot(const SQInstruction &inst, SQInteger slot)
{
    return slot >= 0 && slot < MAX_FUNC_STACKSIZE && sq_bytecode_facts(inst, 0, MAX_FUNC_STACKSIZE).writes.test(slot);
}


struct SQJitA64LoopLenHoist {
    bool valid;
    SQInteger prepcall_ip;
    SQInteger call_ip;
    SQInteger base_slot;
    SQInteger len_slot;
    SQInteger local_slot;
};

static bool sqjit_a64_literal_is_string(SQFunctionProto *proto, SQInteger index,
    const SQChar *value)
{
    return proto && index >= 0 && index < proto->_nliterals &&
        sq_type(proto->_literals[index]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[index]), value) == 0;
}

static bool sqjit_a64_loop_len_hoist_is_safe(SQFunctionProto *proto,
    SQInteger start_ip, SQInteger header_ip, SQInteger end_ip,
    const SQJitA64LoopLenHoist &hoist)
{
    if(!proto || !hoist.valid || start_ip < 0 || header_ip <= start_ip ||
        end_ip <= header_ip || end_ip >= proto->_ninstructions) {
        return false;
    }

    for(SQInteger ip = start_ip; ip < hoist.prepcall_ip; ip++) {
        if(sqjit_a64_loop_instruction_writes_slot(proto->_instructions[ip],
            hoist.base_slot)) {
            return false;
        }
    }

    for(SQInteger ip = hoist.call_ip + 1; ip < header_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op != _OP_LINE && sqjit_a64_loop_instruction_reads_slot(inst,
            hoist.len_slot)) {
            return false;
        }
    }

    for(SQInteger ip = header_ip + 1; ip < end_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(sqjit_a64_loop_instruction_writes_slot(inst, hoist.base_slot)) {
            return false;
        }
        switch(inst.op) {
            case _OP_TAILCALL:
            case _OP_CALL:
            case _OP_PREPCALL:
            case _OP_PREPCALLK:
            case _OP_NEWSLOT:
            case _OP_NEWSLOTA:
            case _OP_DELETE:
            case _OP_NEWOBJ:
            case _OP_APPENDARRAY:
            case _OP_CLOSURE:
            case _OP_YIELD:
            case _OP_RESUME:
            case _OP_FOREACH:
            case _OP_POSTFOREACH:
            case _OP_CLONE:
            case _OP_PUSHTRAP:
            case _OP_POPTRAP:
            case _OP_THROW:
                return false;
            default:
                break;
        }
    }

    return true;
}

static SQJitA64LoopLenHoist sqjit_a64_loop_find_len_hoist(SQFunctionProto *proto,
    SQObjectPtr *entry_stack, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip)
{
    SQJitA64LoopLenHoist hoist;
    hoist.valid = false;
    hoist.prepcall_ip = -1;
    hoist.call_ip = -1;
    hoist.base_slot = -1;
    hoist.len_slot = -1;
    hoist.local_slot = -1;

    if(!proto || !entry_stack || start_ip < 0 || header_ip <= start_ip ||
        header_ip >= proto->_ninstructions || end_ip <= header_ip ||
        end_ip >= proto->_ninstructions ||
        proto->_instructions[header_ip].op != _OP_JCMP) {
        return hoist;
    }

    const SQInstruction &header = proto->_instructions[header_ip];
    for(SQInteger ip = start_ip; ip + 1 < header_ip; ip++) {
        const SQInstruction &prep = proto->_instructions[ip];
        if(prep.op != _OP_PREPCALLK ||
            !sqjit_a64_literal_is_string(proto, prep._arg1, _SC("len"))) {
            continue;
        }

        const SQInstruction &call = proto->_instructions[ip + 1];
        if(call.op != _OP_CALL || call._arg1 != prep._arg0 ||
            call._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || call._arg3 != 1 ||
            (call._arg0 != header._arg0 && call._arg0 != header._arg2) ||
            prep._arg2 < 0 || prep._arg2 >= proto->_stacksize ||
            sq_type(entry_stack[prep._arg2]) != OT_ARRAY) {
            continue;
        }

        hoist.valid = true;
        hoist.prepcall_ip = ip;
        hoist.call_ip = ip + 1;
        hoist.base_slot = prep._arg2;
        hoist.len_slot = call._arg0;
        if(sqjit_a64_loop_len_hoist_is_safe(proto, start_ip, header_ip,
            end_ip, hoist)) {
            return hoist;
        }
        hoist.valid = false;
    }

    return hoist;
}

bool sqjit_backend_loop_find_region(SQFunctionProto *proto, SQInteger header_ip,
    SQInteger *start_ip, SQInteger *end_ip, SQInteger *exit_ip)
{
    if(!proto || header_ip < 0 || header_ip >= proto->_ninstructions) {
        return false;
    }

    const SQInstruction &header = proto->_instructions[header_ip];
    if(header.op != _OP_JCMP && header.op != _OP_JZ) {
        return false;
    }

    SQInteger candidate_exit = header_ip + 1 + sqjit_signed_arg1(header);
    if(candidate_exit <= header_ip || candidate_exit > proto->_ninstructions ||
        candidate_exit - header_ip > SQ_JIT_A64_MAX_INSTRUCTIONS) {
        return false;
    }

    for(SQInteger ip = header_ip + 1; ip < candidate_exit; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
        if(inst.op == _OP_JMP && target_ip >= 0 && target_ip <= header_ip) {
            *start_ip = target_ip;
            *end_ip = ip;
            *exit_ip = candidate_exit;
            return true;
        }
    }

    return false;
}

static bool compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitCode *code, SQJitCompileAttempt &attempt,
    bool allow_scalar_entry = true)
{
    if(!proto || !entry_stack || !code || start_ip < 0 || header_ip < start_ip ||
        end_ip < header_ip || end_ip >= proto->_ninstructions || exit_ip <= header_ip || exit_ip > proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_nparameters > proto->_stacksize || proto->_ninstructions > SQ_JIT_A64_MAX_INSTRUCTIONS ||
        end_ip - start_ip > SQ_JIT_A64_MAX_INSTRUCTIONS) {
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid loop compilation input or bounds");
    }

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        if(!sqjit_a64_instruction_slots_valid(inst)) {
            return attempt.Reject(ip, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid loop stack slot operand");
        }
        if(ip == header_ip && (inst.op == _OP_JCMP || inst.op == _OP_JZ)) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip == exit_ip) {
                continue;
            }
        }
        if(ip == end_ip && inst.op == _OP_JMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= start_ip && target_ip <= header_ip) {
                continue;
            }
        }
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop branch shape");
        }
    }
    SQJitA64LoopLenHoist len_hoist = sqjit_a64_loop_find_len_hoist(proto,
        entry_stack, start_ip, header_ip, end_ip);
    if(sqjit_diag_trace_enabled(proto) && len_hoist.valid) {
        scprintf(_SC("[sqjit:a64] hoisting array len in native loop proto '%s' at ip %d base=%d\n"),
            sqjit_a64_proto_name(proto), (SQInt32)header_ip,
            (SQInt32)len_hoist.base_slot);
    }

    SQBytecodeAnalysis analysis;
    if(!analysis.Build(proto->_instructions, proto->_ninstructions, proto->_stacksize))
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid bytecode operands or control flow");
    // Only scalar loops can reuse an entry-time callee identity. Native state
    // stays private until writeback; unknown operations and heap reads/stores
    // are excluded. Every inlined callee must also pass the scalar leaf proof.
    // Audited math/conversion/length lowerings below cannot reenter the VM.
    bool scalar_guard_region = allow_scalar_entry;
    bool copied_unused_receiver = false;
    SQSlotSet unused_receiver_destinations;
    auto scalar_literal = [&](SQInteger index) -> bool {
        if(index < 0 || index >= proto->_nliterals) return false;
        SQObjectType type = sq_type(proto->_literals[index]);
        return type == OT_INTEGER || type == OT_FLOAT || type == OT_BOOL || type == OT_NULL;
    };
    for(SQInteger ip = start_ip; ip <= end_ip; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        switch(i.op) {
        case _OP_LINE: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
        case _OP_LOADNULLS: case _OP_MOVE: case _OP_DMOVE:
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
        case _OP_NEG: case _OP_NOT: case _OP_INCL: case _OP_PINCL:
        case _OP_EQ: case _OP_NE: case _OP_CMP: case _OP_JCMP:
        case _OP_JZ: case _OP_JMP: case _OP_PREPCALLK: case _OP_CALL:
            break;
        case _OP_LOAD: scalar_guard_region &= scalar_literal(i._arg1); break;
        case _OP_DLOAD:
            scalar_guard_region &= scalar_literal(i._arg1) && scalar_literal(i._arg3); break;
        default: scalar_guard_region = false; break;
        }
    }
    struct EntryClosureGuard {
        SQInteger begin, end, failure, reg, literal;
        SQWeakRef *witness;
        SQObjectType type;
    };
    std::vector<EntryClosureGuard> entry_closure_guards;
    SQJitKeyFlow compound_keys;
    bool compound_keys_built = false;

    std::vector<SQInteger> ip_to_offset(proto->_ninstructions + 1, -1);
    SQJitA64Reloc relocs[SQ_JIT_A64_MAX_RELOCS];
    SQJitA64Reloc exit_relocs[SQ_JIT_A64_MAX_EXIT_RELOCS];
    SQJitA64Reloc guard_relocs[SQ_JIT_A64_MAX_GUARD_RELOCS];
    SQInteger nrelocs = 0;
    SQInteger nexit_relocs = 0;
    SQInteger nguard_relocs = 0;
    SQJitTypeFlow typeflow(analysis, start_ip, end_ip, proto->_stacksize);
    SQJitA64SlotState slots[MAX_FUNC_STACKSIZE];
    SQJitA64CommonPreparedCallState prepared_call;
    SQInteger (&prepared_array_len_base)[MAX_FUNC_STACKSIZE] =
        prepared_call.array_len_base;
    SQClosure *(&prepared_direct_closure)[MAX_FUNC_STACKSIZE] =
        prepared_call.direct_closure;
    SQNativeMathKind (&prepared_math_intrinsic)[MAX_FUNC_STACKSIZE] =
        prepared_call.math_intrinsic;
    SQInteger (&prepared_math_nargs)[MAX_FUNC_STACKSIZE] =
        prepared_call.math_nargs;
    SQJitA64NumberConversion (&prepared_number_conversion)[MAX_FUNC_STACKSIZE] =
        prepared_call.number_conversion;
    SQInteger (&prepared_number_conversion_base)[MAX_FUNC_STACKSIZE] =
        prepared_call.number_conversion_base;
    static const SQInteger member_shape_capacity = 32;
    bool member_shape_valid[member_shape_capacity];
    SQInteger member_shape_base[member_shape_capacity];
    SQInteger member_shape_literal[member_shape_capacity];
    SQObjectType member_shape_type[member_shape_capacity];
    SQArray *member_shape_array[member_shape_capacity];
    SQInteger member_shape_object_ptr[member_shape_capacity];

    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slots[n].Reset();
        if(n < proto->_stacksize) {
            slots[n].MarkStackObject(n);
        }
        SQObjectType observed_type =
            n < proto->_stacksize &&
            sqjit_a64_type_is_object_ptr(sq_type(entry_stack[n])) ?
            sq_type(entry_stack[n]) : OT_NULL;
        SQInteger observed_ptr = 0;
        if(observed_type != OT_NULL) {
            sqjit_a64_value_to_object_ptr(entry_stack[n],
                observed_type, &observed_ptr);
        }
        slots[n].SetStackObjectObservation(observed_type, observed_ptr);
        prepared_call.Clear(n);
    }
    for(SQInteger n = 0; n < member_shape_capacity; n++) {
        member_shape_valid[n] = false;
        member_shape_base[n] = -1;
        member_shape_literal[n] = -1;
        member_shape_type[n] = OT_NULL;
        member_shape_array[n] = NULL;
        member_shape_object_ptr[n] = 0;
    }

    const SQObjectPtr *root_object = NULL;
    if(closure && closure->_root && sq_type(closure->_root->_obj) != OT_NULL) {
        root_object = (const SQObjectPtr *)&closure->_root->_obj;
    }

    SQSlotSet saved_inputs = sqjit_a64_overwritten_inputs(proto, analysis, start_ip, end_ip);
    bool uses_write_log = saved_inputs.any();
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(len_hoist.valid &&
            (ip == len_hoist.prepcall_ip || ip == len_hoist.call_ip)) {
            continue;
        }
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_SET || inst.op == _OP_COMPARITH || inst.op == _OP_CALL) {
            uses_write_log = true;
            break;
        }
    }
    SQInteger inline_scratch_base = proto->_stacksize;
    SQInteger write_log_slot = MAX_FUNC_STACKSIZE;
    SQInteger body_entered_slot = MAX_FUNC_STACKSIZE + (uses_write_log ? 1 : 0);
    if(len_hoist.valid) {
        len_hoist.local_slot = body_entered_slot + 1;
    }
    SQInteger local_slots = body_entered_slot + 1 + (len_hoist.valid ? 1 : 0);
    const SQInteger math_scratch = local_slots;
    local_slots += 2;
    const SQInteger log_storage = local_slots;
    if(uses_write_log)
        local_slots += (sizeof(SQJitWriteLog) + sizeof(SQInteger) - 1) / sizeof(SQInteger);
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
    if(uses_write_log && !sqjit_a64_emit_init_write_log(&buf, write_log_slot, log_storage,
        &sqjit_context(proto->_sharedstate))) {
        return false;
    }
    if(!sqjit_a64_emit_mov_imm_x(&buf, 9, 0) ||
        !sqjit_a64_emit_str_x(&buf, 9, 31,
        sqjit_a64_local_disp(body_entered_slot))) {
        return false;
    }

    auto emit_guard_fail_branch = [&](unsigned cond) -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_bcond_placeholder(&buf, cond, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                SQ_JIT_A64_MAX_GUARD_RELOCS, patch_offset, -1,
                true, cond);
    };

    auto emit_stack_type_guard = [&](SQInteger stack_reg,
        SQObjectType expected) -> bool {
        return sqjit_a64_emit_ldr_w(&buf, 9, 19,
            sqjit_a64_stack_type_disp(stack_reg)) &&
            sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)expected) &&
            sqjit_a64_emit_cmp_reg(&buf, 9, 10) &&
            emit_guard_fail_branch(SQ_JIT_A64_NE);
    };

    // Keep embedded root pointers valid across setroot() and shared prototypes.
    if(root_object &&
        (!sqjit_a64_emit_ldr_x(&buf, 9, 21, (SQInteger)((char *)&closure->_root - (char *)closure)) ||
        !sqjit_a64_emit_mov_imm_x(&buf, 10, (SQInteger)(intptr_t)closure->_root) ||
        !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
        !emit_guard_fail_branch(SQ_JIT_A64_NE))) {
        return false;
    }

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)(rollback ?
                (const void *)sqjit_a64_helper_write_log_rollback :
                (const void *)sqjit_a64_helper_write_log_commit)) &&
            sqjit_a64_emit_blr_x16(&buf);
    };

    auto emit_mark_body_entered = [&]() -> bool {
        return sqjit_a64_emit_mov_imm_x(&buf, 9, 1) &&
            sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(body_entered_slot));
    };

    auto clear_loop_slot_observations = [&](SQInteger slot) -> void {
        slots[slot].ClearDerived();
        slots[slot].ClearStackObjectObservation();
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_INT) {
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!emit_stack_type_guard(slots[slot].stack_object_reg, OT_INTEGER) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(slots[slot].stack_object_reg)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        clear_loop_slot_observations(slot);
        if(!sqjit_a64_slot_state_mark_int(slots, slot, false)) {
            return false;
        }
        slots[slot].entry_loaded = true;
        return true;
    };

    auto ensure_word_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) return false;
        if(slots[slot].kind == SQ_JIT_SLOT_BOOL) return true;
        if(slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0 && entry_stack &&
            sq_type(entry_stack[slots[slot].stack_object_reg]) == OT_BOOL) {
            SQInteger reg = slots[slot].stack_object_reg;
            if(!emit_stack_type_guard(reg, OT_BOOL) ||
                !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(reg)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) return false;
            slots[slot].MarkBool();
            slots[slot].entry_loaded = true;
            return true;
        }
        return ensure_int_slot(slot);
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!emit_stack_type_guard(slots[slot].stack_object_reg, OT_FLOAT) ||
            !sqjit_a64_emit_ldr_float(&buf, 0, 19, sqjit_a64_stack_value_disp(slots[slot].stack_object_reg)) ||
            !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        clear_loop_slot_observations(slot);
        if(!sqjit_a64_slot_state_mark_float(slots, slot, false)) {
            return false;
        }
        slots[slot].entry_loaded = true;
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        slots[slot].MarkInt();
        slots[slot].dirty = true;
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        slots[slot].MarkBool();
        slots[slot].dirty = true;
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        slots[slot].MarkFloat();
        slots[slot].dirty = true;
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot, SQArray *observed_array) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        if(!sqjit_a64_slot_state_mark_array_ptr(slots, slot, observed_array,
            false, false)) {
            return false;
        }
        slots[slot].dirty = true;
        return true;
    };

    auto mark_object_ptr_slot = [&](SQInteger slot, SQObjectType observed_type,
        SQInteger observed_ptr) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        if(!sqjit_a64_slot_state_mark_object_ptr(slots, slot, observed_type,
            observed_ptr, false, false)) {
            return false;
        }
        slots[slot].dirty = true;
        return true;
    };

    auto mark_stack_object_slot_with_sample = [&](SQInteger slot,
        SQInteger stack_reg, SQObjectType observed_type,
        SQInteger observed_ptr) -> bool {
        if(!sqjit_a64_slot_state_accept_result(slot, true)) {
            return false;
        }
        if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        clear_loop_slot_observations(slot);
        if(!sqjit_a64_slot_state_mark_stack_object(slots, slot, stack_reg,
            false)) {
            return false;
        }
        slots[slot].SetStackObjectObservation(observed_type, observed_ptr);
        slots[slot].entry_loaded = true;
        slots[slot].dirty = false;
        return true;
    };

    auto mark_stack_object_slot = [&](SQInteger slot, SQInteger stack_reg) -> bool {
        SQObjectType observed_type = OT_NULL;
        SQInteger observed_ptr = 0;
        if(entry_stack && stack_reg >= 0 && stack_reg < MAX_FUNC_STACKSIZE &&
            sqjit_a64_type_is_object_ptr(sq_type(entry_stack[stack_reg]))) {
            observed_type = sq_type(entry_stack[stack_reg]);
            sqjit_a64_value_to_object_ptr(entry_stack[stack_reg],
                observed_type, &observed_ptr);
        }
        return mark_stack_object_slot_with_sample(slot, stack_reg,
            observed_type, observed_ptr);
    };

    auto observed_shape_for_slot = [&](SQInteger slot, SQObjectType *type_out,
        SQArray **array_out, SQInteger *object_ptr_out) -> bool {
        if(type_out) {
            *type_out = OT_NULL;
        }
        if(array_out) {
            *array_out = NULL;
        }
        if(object_ptr_out) {
            *object_ptr_out = 0;
        }
        if(!type_out || slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        switch(slots[slot].kind) {
        case SQ_JIT_SLOT_INT:
            *type_out = OT_INTEGER;
            return true;
        case SQ_JIT_SLOT_FLOAT:
            *type_out = OT_FLOAT;
            return true;
        case SQ_JIT_SLOT_BOOL:
            *type_out = OT_BOOL;
            return true;
        case SQ_JIT_SLOT_ARRAY_PTR:
            *type_out = OT_ARRAY;
            if(array_out) {
                *array_out = slots[slot].array_ptr_observed;
            }
            return true;
        case SQ_JIT_SLOT_OBJECT_PTR:
            if(slots[slot].object_ptr_observed_type == OT_NULL) {
                return false;
            }
            *type_out = slots[slot].object_ptr_observed_type;
            if(object_ptr_out) {
                *object_ptr_out = slots[slot].object_ptr_observed;
            }
            return true;
        case SQ_JIT_SLOT_STACK_OBJECT:
            if(slots[slot].stack_object_observed_type == OT_NULL) {
                return false;
            }
            *type_out = slots[slot].stack_object_observed_type;
            if(object_ptr_out) {
                *object_ptr_out = slots[slot].stack_object_observed_ptr;
            }
            return true;
        default:
            return false;
        }
    };

    auto remember_member_shape = [&](SQInteger base, SQInteger literal,
        SQInteger value) -> void {
        SQObjectType observed = OT_NULL;
        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        if(base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal < 0 || literal >= proto->_nliterals ||
            !observed_shape_for_slot(value, &observed, &observed_array,
            &observed_object_ptr)) {
            return;
        }
        SQInteger target = -1;
        for(SQInteger n = 0; n < member_shape_capacity; n++) {
            if(member_shape_valid[n] && member_shape_base[n] == base &&
                member_shape_literal[n] == literal) {
                target = n;
                break;
            }
            if(target < 0 && !member_shape_valid[n]) {
                target = n;
            }
        }
        if(target < 0) {
            target = 0;
        }
        member_shape_valid[target] = true;
        member_shape_base[target] = base;
        member_shape_literal[target] = literal;
        member_shape_type[target] = observed;
        member_shape_array[target] = observed_array;
        member_shape_object_ptr[target] = observed_object_ptr;
    };

    auto lookup_member_shape = [&](SQInteger base, SQInteger literal,
        SQObjectType *type_out, SQArray **array_out,
        SQInteger *object_ptr_out) -> bool {
        for(SQInteger n = 0; n < member_shape_capacity; n++) {
            if(member_shape_valid[n] && member_shape_base[n] == base &&
                member_shape_literal[n] == literal) {
                if(type_out) {
                    *type_out = member_shape_type[n];
                }
                if(array_out) {
                    *array_out = member_shape_array[n];
                }
                if(object_ptr_out) {
                    *object_ptr_out = member_shape_object_ptr[n];
                }
                return true;
            }
        }
        return false;
    };

    auto emit_load_int = [&](SQInteger dst, SQInteger value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !sqjit_a64_emit_mov_imm_x(&buf, 9, value) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        slots[dst].SetConst(value);
        slots[dst].entry_loaded = false;
        return true;
    };

    auto emit_load_float = [&](SQInteger dst, SQFloat value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger bits = 0;
        static_assert(sizeof(bits) == sizeof(value), "float literal storage width");
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_a64_emit_mov_imm_x(&buf, 9, bits) &&
            sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst) &&
            (slots[dst].entry_loaded = false, true);
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
            if(!sqjit_a64_emit_mov_imm_x(&buf, 9,
                (SQInteger)(intptr_t)_array(literal)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !mark_array_ptr_slot(dst, _array(literal))) {
                return false;
            }
            slots[dst].entry_loaded = false;
            return true;
        }
        if(sqjit_a64_type_is_object_ptr(sq_type(literal))) {
            SQInteger object_ptr = 0;
            if(!sqjit_a64_value_to_object_ptr(literal, sq_type(literal),
                &object_ptr) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 9, object_ptr) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !mark_object_ptr_slot(dst, sq_type(literal), object_ptr)) {
                return false;
            }
            slots[dst].entry_loaded = false;
            return true;
        }
        return false;
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return load_literal_value_slot(dst, proto->_literals[literal_index]);
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_word_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(slots[src].kind == SQ_JIT_SLOT_BOOL) {
            if(!mark_bool_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[src].entry_loaded;
        slots[dst].CopyConstFrom(slots[src]);
        return true;
    };

    std::vector<SQInteger> float_copy_offsets;
    auto emit_float_copy = [&](SQInteger dst, SQInteger src) -> bool {
        const SQInteger offset=buf.size;
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) return false;
        if(scalar_guard_region) float_copy_offsets.push_back(offset);
        return true;
    };
    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !emit_float_copy(dst, src) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[src].entry_loaded;
        return true;
    };

    auto copy_array_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_SLOT_ARRAY_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_array_ptr_slot(dst, slots[src].array_ptr_observed)) {
            return false;
        }
        slots[dst].entry_loaded = slots[src].entry_loaded;
        return true;
    };

    auto copy_stack_object_alias = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_SLOT_STACK_OBJECT ||
            slots[src].stack_object_reg < 0) {
            return false;
        }
        slots[dst].MarkStackObject(slots[src].stack_object_reg);
        slots[dst].CopyStackObjectObservationFrom(slots[src]);
        slots[dst].entry_loaded = slots[src].entry_loaded;
        slots[dst].dirty = false;
        return true;
    };

    auto copy_object_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_SLOT_OBJECT_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_object_ptr_slot(dst, slots[src].object_ptr_observed_type,
            slots[src].object_ptr_observed)) {
            return false;
        }
        slots[dst].entry_loaded = slots[src].entry_loaded;
        return true;
    };

    auto copy_any_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[src].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            return copy_array_ptr_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_SLOT_FLOAT) {
            return copy_float_slot(dst, src);
        }
        if(slots[src].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            SQInteger reg = slots[src].stack_object_reg;
            if(reg < 0) {
                return false;
            }
            if(sq_type(entry_stack[reg]) == OT_FLOAT) {
                return copy_float_slot(dst, src);
            }
            if(sq_type(entry_stack[reg]) == OT_INTEGER) {
                return copy_int_slot(dst, src);
            }
            if(sq_type(entry_stack[reg]) == OT_BOOL) {
                return false;
            }
            return copy_stack_object_alias(dst, src);
        }
        if(slots[src].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            return copy_object_ptr_slot(dst, src);
        }
        return copy_int_slot(dst, src);
    };

    // A direct scalar leaf may ignore its `this` argument. MOVE/DMOVE used
    // to demand an integer even when merely preparing an unused table receiver.
    // Keep that receiver as a private alias only when the very next CALL
    // overwrites it with a proven scalar result. No live reference writeback is
    // omitted, and the callee identity/type guards still precede execution.
    auto copy_unused_leaf_receiver = [&](SQInteger dst, SQInteger src, SQInteger ip) -> bool {
        if(!scalar_guard_region || src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[src].stack_object_reg < 0)
            return false;
        // The omitted receiver copy can only acquire/release an owner that
        // survives the entire region through this unchanged canonical parameter.
        SQInteger source_reg = slots[src].stack_object_reg;
        if(source_reg >= proto->_nparameters) return false;
        for(SQInteger at = start_ip; at <= end_ip; ++at)
            if(analysis.facts[at].writes.test(source_reg)) return false;
        SQInteger next = ip + 1;
        while(next <= end_ip && proto->_instructions[next].op == _OP_LINE) ++next;
        if(next > end_ip) return false;
        const SQInstruction &call = proto->_instructions[next];
        if(call.op != _OP_CALL || call._arg2 != dst || call._arg0 != dst ||
            call._arg1 < 0 || call._arg1 >= MAX_FUNC_STACKSIZE ||
            slots[call._arg1].kind != SQ_JIT_SLOT_STACK_OBJECT) return false;
        SQInteger reg = slots[call._arg1].stack_object_reg;
        if(reg < 0 || sq_type(entry_stack[reg]) != OT_CLOSURE) return false;
        SQFunctionProto *callee = _closure(entry_stack[reg])->_function;
        if(!SQJitLeafPlan::Eligible(callee) || callee->_nparameters != call._arg3) return false;
        std::vector<SQJitSlotKind> kinds(callee->_nparameters, SQ_JIT_SLOT_UNKNOWN);
        const SQInstruction &move = proto->_instructions[ip];
        for(SQInteger n = 1; n < callee->_nparameters; ++n) {
            SQInteger from = call._arg2 + n;
            if(move.op == _OP_DMOVE && move._arg2 == from) {
                from = move._arg3;
                // The second move sees the first assignment, not its old slot.
                if(from == move._arg0) from = move._arg1;
            }
            if(from < 0 || from >= MAX_FUNC_STACKSIZE) return false;
            SQJitSlotKind kind = slots[from].kind;
            if(kind == SQ_JIT_SLOT_STACK_OBJECT) {
                SQInteger r = slots[from].stack_object_reg;
                if(r < 0) return false;
                SQObjectType type = sq_type(entry_stack[r]);
                kind = type == OT_INTEGER ? SQ_JIT_SLOT_INT : type == OT_FLOAT ?
                    SQ_JIT_SLOT_FLOAT : type == OT_BOOL ? SQ_JIT_SLOT_BOOL : SQ_JIT_SLOT_UNKNOWN;
            }
            if(kind != SQ_JIT_SLOT_INT && kind != SQ_JIT_SLOT_FLOAT && kind != SQ_JIT_SLOT_BOOL)
                return false;
            kinds[n] = kind;
        }
        SQJitLeafPlan plan;
        if(!plan.Build(callee, kinds) || (plan.return_kind != SQ_JIT_SLOT_INT &&
            plan.return_kind != SQ_JIT_SLOT_FLOAT && plan.return_kind != SQ_JIT_SLOT_BOOL)) return false;
        if(!copy_stack_object_alias(dst, src)) return false;
        copied_unused_receiver = true;
        unused_receiver_destinations.set(dst);
        return true;
    };

    auto emit_guard_on_x0_zero = [&]() -> bool {
        return sqjit_a64_emit_cmp_imm(&buf, 0, 0) &&
            emit_guard_fail_branch(SQ_JIT_A64_EQ);
    };

    auto emit_materialize_slot_to_stack = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0) {
            return true;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            return ensure_float_slot(slot) &&
                sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_float) &&
                sqjit_a64_emit_blr_x16(&buf);
        }
        if(slots[slot].kind == SQ_JIT_SLOT_INT ||
            slots[slot].kind == SQ_JIT_SLOT_BOOL) {
            const void *helper = slots[slot].kind == SQ_JIT_SLOT_BOOL ?
                (const void *)sqjit_a64_helper_store_stack_bool :
                (const void *)sqjit_a64_helper_store_stack_integer;
            return ensure_int_slot(slot) &&
                sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) &&
                sqjit_a64_emit_blr_x16(&buf);
        }
        if(slots[slot].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_array_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slots[slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            return slots[slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)slots[slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_object_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto stack_reg_for_materialized_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return -1;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            return slots[slot].stack_object_reg;
        }
        return slot;
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slots[slot].kind == SQ_JIT_SLOT_FLOAT;
    };

    auto slot_observed_is_float = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            return true;
        }
        return entry_stack && slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[slot].stack_object_reg >= 0 &&
            sq_type(entry_stack[slots[slot].stack_object_reg]) == OT_FLOAT;
    };

    auto emit_load_slot_as_float = [&](SQInteger slot, unsigned fp_reg,
        unsigned int_reg) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            return ensure_float_slot(slot) &&
                sqjit_a64_emit_ldr_float(&buf, fp_reg, 31,
                    sqjit_a64_local_disp(slot));
        }
        if(slots[slot].kind == SQ_JIT_SLOT_INT) {
            return ensure_int_slot(slot) &&
                sqjit_a64_emit_ldr_x(&buf, int_reg, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_scvtf_float_x(&buf, fp_reg, int_reg);
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT ||
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
                sqjit_a64_emit_ldr_float(&buf, fp_reg, 19,
                    sqjit_a64_stack_value_disp(stack_reg));
        }
        return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_INTEGER,
                guard_relocs, &nguard_relocs) &&
            sqjit_a64_emit_ldr_x(&buf, int_reg, 19,
                sqjit_a64_stack_value_disp(stack_reg)) &&
            sqjit_a64_emit_scvtf_float_x(&buf, fp_reg, int_reg);
    };

    auto emit_conditional_select = [&](CmpOP op, SQInteger dst, SQInteger cmp_left,
        SQInteger cmp_right, SQInteger true_src, SQInteger false_src) -> bool {
        unsigned false_cond = 0;
        if(!sqjit_a64_cmp_false_cond(op, &false_cond) ||
            cmp_left < 0 || cmp_right < 0 ||
            cmp_left >= MAX_FUNC_STACKSIZE || cmp_right >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        bool use_float = slot_observed_is_float(cmp_left) ||
            slot_observed_is_float(cmp_right) ||
            slot_observed_is_float(true_src) ||
            slot_observed_is_float(false_src);
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            return use_float ?
                (ensure_float_slot(cmp_left) && ensure_float_slot(cmp_right)) :
                (ensure_int_slot(cmp_left) && ensure_int_slot(cmp_right));
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            true_src < 0 || true_src >= MAX_FUNC_STACKSIZE ||
            false_src < 0 || false_src >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        SQInteger false_patch = 0;
        SQInteger end_patch = 0;
        if(use_float) {
            if(!ensure_float_slot(cmp_left) || !ensure_float_slot(cmp_right) ||
                !ensure_float_slot(true_src) || !ensure_float_slot(false_src) ||
                !sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(cmp_left)) ||
                !sqjit_a64_emit_ldr_float(&buf, 1, 31, sqjit_a64_local_disp(cmp_right)) ||
                !sqjit_a64_emit_fcmp_float(&buf, 0, 1) ||
                !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &false_patch) ||
                !sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(true_src)) ||
                !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_b_placeholder(&buf, &end_patch)) {
                return false;
            }
            SQInteger false_offset = buf.size;
            if(!sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(false_src)) ||
                !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
            SQInteger end_offset = buf.size;
            if(!sqjit_a64_patch_branch(&buf, false_patch, false_offset, true,
                false_cond) ||
                !sqjit_a64_patch_branch(&buf, end_patch, end_offset, false, 0) ||
                !mark_float_slot(dst)) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(cmp_left) || !ensure_int_slot(cmp_right) ||
                !ensure_int_slot(true_src) || !ensure_int_slot(false_src) ||
                !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(cmp_left)) ||
                !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(cmp_right)) ||
                !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &false_patch) ||
                !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(true_src)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_b_placeholder(&buf, &end_patch)) {
                return false;
            }
            SQInteger false_offset = buf.size;
            if(!sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(false_src)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
            SQInteger end_offset = buf.size;
            if(!sqjit_a64_patch_branch(&buf, false_patch, false_offset, true,
                false_cond) ||
                !sqjit_a64_patch_branch(&buf, end_patch, end_offset, false, 0) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        slots[dst].entry_loaded = slots[true_src].entry_loaded || slots[false_src].entry_loaded;
        return true;
    };

    auto emit_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        SQInteger guard_patch = 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) || !ensure_int_slot(right) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(left))) {
            return false;
        }
        // Preserve hardware division, but omit a guard only when lowering has
        // proved the divisor nonzero. Never infer this from sampled arguments.
        const bool divisor_nonzero = slots[right].known_const && slots[right].const_value != 0;
        if(slots[right].known_const && slots[right].const_value >= 0 &&
            slots[right].const_value <= 65535) {
            if(!sqjit_a64_emit_mov_imm_x(&buf, 10, slots[right].const_value)) return false;
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(right))) return false;
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
                if((!divisor_nonzero && (!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                        SQ_JIT_A64_MAX_GUARD_RELOCS, guard_patch, -1, true, SQ_JIT_A64_EQ))) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MOD:
                if((!divisor_nonzero && (!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                        SQ_JIT_A64_MAX_GUARD_RELOCS, guard_patch, -1, true, SQ_JIT_A64_EQ))) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 11, 9, 10) ||
                    !sqjit_a64_emit_msub_reg(&buf, 9, 11, 10, 9)) {
                    return false;
                }
                break;
            default:
                return false;
        }
        if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[left].entry_loaded || slots[right].entry_loaded;
        return true;
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
            SQInteger slot = start + n;
            clear_loop_slot_observations(slot);
            slots[slot].MarkStackObject(slot);
            prepared_call.Clear(slot);
            slots[slot].entry_loaded = true;
            slots[slot].dirty = false;
        }
        return true;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left,
        SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || op == _OP_MOD ||
            !emit_load_slot_as_float(left, 0, 9) ||
            !emit_load_slot_as_float(right, 1, 10) ||
            !sqjit_a64_emit_fop_float(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[left].entry_loaded || slots[right].entry_loaded;
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
        slots[dst].entry_loaded = slots[src].entry_loaded;
        return true;
    };

    auto emit_float_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_fneg_float(&buf, 0, 0) ||
            !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[src].entry_loaded;
        return true;
    };

    auto emit_math_call = [&](SQInteger dst, SQNativeMathKind intrinsic,
        SQInteger nargs, SQInteger first_arg) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || first_arg < 0 ||
            nargs < 1 || nargs > 2 || first_arg + nargs > MAX_FUNC_STACKSIZE ||
            intrinsic == SQ_NATIVE_MATH_NONE) return false;
        const SQNativeMathSpec *spec = sq_native_math_spec(intrinsic);
        if(!spec || spec->nargs != nargs ||
            (nargs == 1 ? !spec->unary : !spec->binary)) return false;
        // Standard math accepts both integer and float arguments. Convert to
        // private scratch slots so later uses retain the original value/tag.
        for(SQInteger n = 0; n < nargs; ++n) {
            SQInteger src = first_arg + n;
            if(slot_observed_is_float(src)) {
                if(!ensure_float_slot(src) || !sqjit_a64_emit_ldr_float(&buf, 0, 31,
                    sqjit_a64_local_disp(src))) return false;
            }
            else if(!ensure_int_slot(src) || !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                sqjit_a64_local_disp(src)) || !sqjit_a64_emit_scvtf_float_x(&buf, 0, 9)) return false;
            if(!sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(math_scratch + n))) return false;
        }
        // PREPCALL already guards the native closure's identity. The immutable
        // audited spec fixes the evaluator and arity at compile time, so use
        // the scalar FP ABI directly instead of a shared runtime dispatcher.
        // Keep both converted arguments in private slots until all preparation
        // is done: preparing the second argument may itself call a helper.
        const void *evaluator = nargs == 1 ? (const void *)spec->unary :
            (const void *)spec->binary;
        if(!sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(math_scratch)) ||
            (nargs == 2 && !sqjit_a64_emit_ldr_float(&buf, 1, 31,
                sqjit_a64_local_disp(math_scratch + 1))) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)evaluator) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) return false;
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_conversion_guard = [&](const SQObjectPtr *key) -> bool {
        return sqjit_a64_emit_mov_reg(&buf, 0, 21) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, (SQInteger)(intptr_t)key) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)(const void *)sqjit_number_conversion_guard) &&
            sqjit_a64_emit_blr_x16(&buf) && emit_guard_on_x0_zero();
    };

    auto emit_number_conversion = [&](SQInteger dst,
        SQJitA64NumberConversion conversion, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE ||
            conversion == SQ_JIT_A64_NUMBER_CONVERSION_NONE) {
            return false;
        }
        if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
            if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT) {
                return slot_observed_is_float(src) ? ensure_float_slot(src) :
                    ensure_int_slot(src);
            }
            if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
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
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_integer_to_float) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_float_slot(dst)) {
                return false;
            }
            slots[dst].entry_loaded = slots[src].entry_loaded;
            return true;
        }
        if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
            if(!slot_observed_is_float(src)) {
                return copy_int_slot(dst, src);
            }
            if(!ensure_float_slot(src) ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_float_to_integer) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_int_slot(dst)) {
                return false;
            }
            slots[dst].entry_loaded = slots[src].entry_loaded;
            return true;
        }
        return false;
    };

    // A removed closure can be reallocated at the same address. Retain its
    // weak identity, not the closure: death permanently clears this witness.
    // Temporary owners cover failed compilation; the installed code takes its
    // own weak references only after executable installation succeeds.
    std::vector<SQObjectPtr> closure_witnesses;
    auto retain_closure_witness = [&](SQRefCounted *expected, SQObjectType type) -> SQWeakRef * {
        if(!expected) return NULL;
        SQWeakRef *weak = expected->GetWeakRef(type);
        if(weak) closure_witnesses.push_back(SQObjectPtr(weak));
        return weak;
    };

    auto remember_entry_guard = [&](SQInteger begin, SQInteger first_reloc,
        SQInteger reg, SQInteger literal, SQWeakRef *witness, SQObjectType type) -> bool {
        if(!scalar_guard_region || reg < 0 || reg >= proto->_nparameters) return true;
        for(SQInteger ip = start_ip; ip <= end_ip; ++ip)
            if(analysis.facts[ip].writes.test(reg)) return true;
        // These blocks contain absolute helper addresses and exactly one
        // conditional failure branch; copying them requires only that relocation.
        if(nguard_relocs != first_reloc + 1) return false;
        entry_closure_guards.push_back({begin, buf.size,
            guard_relocs[first_reloc].patch_offset, reg, literal, witness, type});
        return true;
    };

    auto emit_closure_slot_guard = [&](SQInteger closure_slot, SQClosure *expected) -> bool {
        if(closure_slot < 0 || closure_slot >= MAX_FUNC_STACKSIZE ||
            slots[closure_slot].kind != SQ_JIT_SLOT_STACK_OBJECT ||
            slots[closure_slot].stack_object_reg < 0 || !expected) {
            return false;
        }
        SQWeakRef *witness = retain_closure_witness(expected, OT_CLOSURE);
        if(!witness) return false;
        const SQInteger guard_begin = buf.size, first_reloc = nguard_relocs;
        bool emitted = sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[closure_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)witness) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_closure_slot_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
        return emitted && remember_entry_guard(guard_begin, first_reloc,
            slots[closure_slot].stack_object_reg, -1, witness, OT_CLOSURE);
    };

    auto emit_member_closure_guard = [&](SQInteger base_slot, SQInteger literal_index,
        SQClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slots[base_slot].kind != SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_SLOT_OBJECT_PTR) || !expected) {
            return false;
        }
        SQWeakRef *witness = retain_closure_witness(expected, OT_CLOSURE);
        if(!witness) return false;
        if(slots[base_slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)witness) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_object_ptr_member_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        const SQInteger guard_begin = buf.size, first_reloc = nguard_relocs;
        bool emitted = slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)witness) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_member_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
        return emitted && remember_entry_guard(guard_begin, first_reloc,
            slots[base_slot].stack_object_reg, literal_index, witness, OT_CLOSURE);
    };

    auto observed_member_closure = [&](SQInteger base_slot, SQInteger literal_index,
        SQClosure **out) -> bool {
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
        if(slots[base_slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(slots[base_slot].object_ptr_observed,
                slots[base_slot].object_ptr_observed_type, &proto->_literals[literal_index],
                value);
        }
        else if(slots[base_slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base_slot].stack_object_reg >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base_slot].stack_object_reg, &proto->_literals[literal_index],
                slots[base_slot].stack_object_reg == 0 ? root_object : NULL, value);
            if(!ok && slots[base_slot].stack_object_observed_type != OT_NULL) {
                ok = sqjit_a64_get_member_ptr_value(
                    slots[base_slot].stack_object_observed_ptr,
                    slots[base_slot].stack_object_observed_type,
                    &proto->_literals[literal_index], value);
            }
        }
        if(!ok || sq_type(value) != OT_CLOSURE) {
            return false;
        }
        *out = _closure(value);
        return true;
    };

    auto emit_member_native_closure_guard = [&](SQInteger base_slot, SQInteger literal_index,
        SQNativeClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slots[base_slot].kind != SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base_slot].kind != SQ_JIT_SLOT_OBJECT_PTR) || !expected) {
            return false;
        }
        SQWeakRef *witness = retain_closure_witness(expected, OT_NATIVECLOSURE);
        if(!witness) return false;
        if(slots[base_slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            return slots[base_slot].object_ptr_observed_type != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)slots[base_slot].object_ptr_observed_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)witness) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_object_ptr_member_native_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        const SQInteger guard_begin = buf.size, first_reloc = nguard_relocs;
        bool emitted = slots[base_slot].stack_object_reg >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base_slot].stack_object_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)witness) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                slots[base_slot].stack_object_reg == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_member_native_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
        return emitted && remember_entry_guard(guard_begin, first_reloc,
            slots[base_slot].stack_object_reg, literal_index, witness, OT_NATIVECLOSURE);
    };

    auto observed_member_native_closure = [&](SQInteger base_slot,
        SQInteger literal_index, SQNativeClosure **out) -> bool {
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
        if(slots[base_slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(slots[base_slot].object_ptr_observed,
                slots[base_slot].object_ptr_observed_type, &proto->_literals[literal_index],
                value);
        }
        else if(slots[base_slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base_slot].stack_object_reg >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                slots[base_slot].stack_object_reg, &proto->_literals[literal_index],
                slots[base_slot].stack_object_reg == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_NATIVECLOSURE) {
            return false;
        }
        *out = _nativeclosure(value);
        return true;
    };

    auto map_inline_slot = [&](SQFunctionProto *callee, const SQInstruction &call_inst,
        SQInteger slot) -> SQInteger {
        if(!callee || slot < 0 || slot >= callee->_stacksize) {
            return -1;
        }
        if(slot < callee->_nparameters) {
            SQInteger mapped = call_inst._arg2 + slot;
            return mapped >= 0 && mapped < MAX_FUNC_STACKSIZE ? mapped : -1;
        }
        SQInteger mapped = inline_scratch_base + (slot - callee->_nparameters);
        return mapped >= 0 && mapped < MAX_FUNC_STACKSIZE ? mapped : -1;
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

        unsigned stride_shift = 0;
        SQInteger stride = (SQInteger)sizeof(SQObjectPtr);
        while(((SQInteger)1 << stride_shift) < stride && stride_shift < 63) {
            stride_shift++;
        }
        if(((SQInteger)1 << stride_shift) != stride) {
            return false;
        }

        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
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
            (SQInteger)offsetof(SQObject, _type))) {
            return false;
        }

        if(observed == OT_FLOAT) {
            if(!sqjit_a64_emit_mov_imm_w(&buf, 15,
                (uint32_t)observed) ||
                !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
                !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
                !sqjit_a64_emit_ldr_float(&buf, 0, 13,
                (SQInteger)offsetof(SQObject, _unVal))) {
                return false;
            }
            return sqjit_a64_emit_str_float(&buf, 0, 31,
                sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst) && (slots[dst].entry_loaded = true, true);
        }
        if(!sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array) &&
                (slots[dst].entry_loaded = true, true);
        }
        return mark_int_slot(dst) && (slots[dst].entry_loaded = true, true);
    };

    auto emit_array_element_get_number_float_direct = [&](SQInteger dst,
        SQInteger base, bool const_index, SQInteger index, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE) {
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

        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
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
        else if(key < 0 || key >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(key)) ||
            !sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
            !emit_guard_fail_branch(SQ_JIT_A64_LT)) {
            return false;
        }

        SQInteger float_patch = 0;
        SQInteger done_patch = 0;
        SQInteger float_offset = 0;
        SQInteger done_offset = 0;
        if(!sqjit_a64_emit_ldr_x(&buf, 12, 11, SQArray::RawSizeOffset()) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_GE) ||
            !sqjit_a64_emit_ldr_x(&buf, 13, 11, SQArray::RawValuesOffset()) ||
            !sqjit_a64_emit_add_reg_lsl(&buf, 13, 13, 10, stride_shift) ||
            !sqjit_a64_emit_ldr_w(&buf, 14, 13,
            (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)OT_FLOAT) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ,
            &float_patch) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)OT_INTEGER) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_scvtf_float_x(&buf, 0, 9) ||
            !sqjit_a64_emit_b_placeholder(&buf, &done_patch)) {
            return false;
        }

        float_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, float_patch, float_offset, true,
            SQ_JIT_A64_EQ) ||
            !sqjit_a64_emit_ldr_float(&buf, 0, 13,
            (SQInteger)offsetof(SQObject, _unVal))) {
            return false;
        }

        done_offset = buf.size;
        return sqjit_a64_patch_branch(&buf, done_patch, done_offset, false, 0) &&
            sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst) && (slots[dst].entry_loaded = true, true);
    };

    auto emit_array_get_const = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_float_raw :
                (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_integer_raw :
                (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw :
                (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_object_raw :
                (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
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
        }
        else {
            if(slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
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
        }
        if(object_result) {
            if(!mark_stack_object_slot(dst, dst)) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(observed == OT_ARRAY) {
            if(!mark_array_ptr_slot(dst, observed_array)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_array_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed, SQArray *observed_array,
        SQInteger observed_object_ptr) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array, observed_object_ptr)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_float_raw :
                (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_integer_raw :
                (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw :
                (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_object_raw :
                (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
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
        }
        else {
            if(slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
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
        }
        if(object_result) {
            bool marked = sqjit_a64_type_is_object_ptr(observed) ?
                mark_stack_object_slot_with_sample(dst, dst, observed,
                    observed_object_ptr) :
                mark_stack_object_slot(dst, dst);
            if(!marked) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(observed == OT_ARRAY) {
            if(!mark_array_ptr_slot(dst, observed_array)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_instance_field_get_direct = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key, SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(observed != OT_FLOAT && observed != OT_INTEGER && observed != OT_BOOL &&
            observed != OT_ARRAY && !sqjit_a64_type_is_object_ptr(observed)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT) {
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

        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            if(!sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg,
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
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
            if(!sqjit_a64_emit_ldr_float(&buf, 0, 11, value_disp) ||
                !sqjit_a64_emit_str_float(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
                !mark_float_slot(dst)) {
                return false;
            }
            slots[dst].entry_loaded = true;
            return true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        bool marked = false;
        if(observed == OT_ARRAY) {
            marked = mark_array_ptr_slot(dst, field.array_value);
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            marked = mark_object_ptr_slot(dst, observed, field.object_ptr_value);
        }
        else if(observed == OT_BOOL) {
            marked = mark_bool_slot(dst);
        }
        else {
            marked = mark_int_slot(dst);
        }
        slots[dst].entry_loaded = marked;
        return marked;
    };

    auto emit_parameter_array_field_get_with_fallback = [&](SQInteger dst,
        SQInteger base, const SQObjectPtr *key, SQArray *observed_array) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE || !key ||
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT ||
            slots[base].stack_object_reg <= 0 ||
            slots[base].stack_object_reg >= proto->_nparameters ||
            sq_type(entry_stack[slots[base].stack_object_reg]) != OT_INSTANCE) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!sqjit_a64_observed_stack_instance_field(entry_stack,
            slots[base].stack_object_reg, key, &field) ||
            field.value_type != OT_ARRAY) {
            return false;
        }

        SQInteger slow_type_patch = 0;
        SQInteger slow_class_patch = 0;
        SQInteger slow_value_patch = 0;
        SQInteger done_patch = 0;
        if(!sqjit_a64_emit_ldr_w(&buf, 9, 19,
            sqjit_a64_stack_type_disp(slots[base].stack_object_reg)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_INSTANCE) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_type_patch) ||
            !sqjit_a64_emit_ldr_x(&buf, 11, 19,
            sqjit_a64_stack_value_disp(slots[base].stack_object_reg)) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_class_patch) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11,
            field.value_disp + (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_ARRAY) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_value_patch) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 11,
            field.value_disp + (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_b_placeholder(&buf, &done_patch)) {
            return false;
        }

        SQInteger slow_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, slow_type_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_patch_branch(&buf, slow_class_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_patch_branch(&buf, slow_value_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_table_get_array_ptr) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }

        SQInteger done_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, done_patch, done_offset, false, 0) ||
            !mark_array_ptr_slot(dst, observed_array)) {
            return false;
        }
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_member_get_key = [&](SQInteger dst, SQInteger base, const SQObjectPtr *key,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_SLOT_OBJECT_PTR)) {
            return false;
        }
        bool use_root_fallback = slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg == 0 && root_object != NULL;
        // A receiver loaded earlier in this region may not exist in the VM's
        // entry stack yet. Its slot observation is newer than that snapshot;
        // use it to choose a guarded result kind, never to omit runtime checks.
        if(observed == OT_NULL && slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_observed_type != OT_NULL) {
            observed = sqjit_a64_observed_object_ptr_value_type(
                slots[base].stack_object_observed_ptr,
                slots[base].stack_object_observed_type, key,
                &observed_array, &observed_object_ptr);
        }
        if(observed == OT_ARRAY &&
            emit_parameter_array_field_get_with_fallback(dst, base, key,
            observed_array)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, key, observed)) {
            return true;
        }
        if(observed == OT_NULL) {
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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
                if(!sqjit_a64_emit_mov_imm_x(&buf, 16,
                        (SQInteger)(intptr_t)
                        sqjit_a64_helper_object_ptr_get_object_key) ||
                    !sqjit_a64_emit_blr_x16(&buf) ||
                    !emit_guard_on_x0_zero() ||
                    !mark_stack_object_slot(dst, dst)) {
                    return false;
                }
                slots[dst].entry_loaded = true;
                return true;
            }
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                use_root_fallback ? (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 4, dst) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_get_object_key) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_stack_object_slot(dst, dst)) {
                return false;
            }
            slots[dst].entry_loaded = true;
            return true;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_float;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_float_root :
                    (const void *)sqjit_a64_helper_table_get_float;
            }
        }
        else if(observed == OT_INTEGER) {
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_integer;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_integer_root :
                    (const void *)sqjit_a64_helper_table_get_integer;
            }
        }
        else if(observed == OT_ARRAY) {
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_array_ptr;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_array_ptr_root :
                    (const void *)sqjit_a64_helper_table_get_array_ptr;
            }
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_object_ptr;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_member_get_object_ptr_root :
                    (const void *)sqjit_a64_helper_member_get_object_ptr;
            }
        }
        else {
            return false;
        }

        SQInteger table_hint_done = -1;
        if(!sqjit_a64_emit_table_read_hint(&buf, slots, entry_stack,
            dst, base, key, observed, &table_hint_done)) return false;

        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
        }
        else {
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
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
        if(table_hint_done >= 0 &&
            !sqjit_a64_patch_branch(&buf, table_hint_done, buf.size, false, 0)) return false;
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst) && (slots[dst].entry_loaded = true, true);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array) && (slots[dst].entry_loaded = true, true);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr) &&
                (slots[dst].entry_loaded = true, true);
        }
        return mark_int_slot(dst) && (slots[dst].entry_loaded = true, true);
    };

    auto emit_member_get_dynamic_key = [&](SQInteger dst, SQInteger base,
        SQInteger key_slot, bool prefer_integer = false) -> bool {
        bool key_is_object_ptr = key_slot >= 0 &&
            key_slot < MAX_FUNC_STACKSIZE &&
            slots[key_slot].kind == SQ_JIT_SLOT_OBJECT_PTR &&
            slots[key_slot].object_ptr_observed != 0 &&
            slots[key_slot].object_ptr_observed_type != OT_NULL;
        bool key_is_stack_object = key_slot >= 0 &&
            key_slot < MAX_FUNC_STACKSIZE &&
            slots[key_slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[key_slot].stack_object_reg >= 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            base < 0 || base >= MAX_FUNC_STACKSIZE ||
            (!key_is_object_ptr && !key_is_stack_object) ||
            (slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].kind != SQ_JIT_SLOT_OBJECT_PTR)) {
            return false;
        }

        if(key_is_stack_object) {
            bool use_root_fallback = slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                slots[base].stack_object_reg == 0 && root_object != NULL;
            SQObjectType observed = OT_NULL;
            if(entry_stack && slots[key_slot].stack_object_reg >= 0 &&
                slots[key_slot].stack_object_reg < MAX_FUNC_STACKSIZE &&
                sq_type(entry_stack[slots[key_slot].stack_object_reg]) != OT_NULL) {
                const SQObjectPtr *key = &entry_stack[slots[key_slot].stack_object_reg];
                if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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
                if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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
                return mark_int_slot(dst) && (slots[dst].entry_loaded = true, true);
            }
            const void *helper = NULL;
            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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
            if(!sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_stack_object_slot(dst, dst)) {
                return false;
            }
            slots[dst].entry_loaded = true;
            return true;
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
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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

        if(sqjit_diag_trace_enabled(proto)) {
            scprintf(_SC("[sqjit:a64] loop dynamic member GET base=%d kind=%d keyslot=%d keykind=%d observed=%d out=%d\n"),
                (SQInt32)base,
                (SQInt32)((base >= 0 && base < MAX_FUNC_STACKSIZE) ?
                slots[base].kind : SQ_JIT_SLOT_UNKNOWN),
                (SQInt32)key_slot,
                (SQInt32)((key_slot >= 0 && key_slot < MAX_FUNC_STACKSIZE) ?
                slots[key_slot].kind : SQ_JIT_SLOT_UNKNOWN),
                (SQInt32)observed, (SQInt32)dst);
        }

        if(observed == OT_ARRAY &&
            emit_parameter_array_field_get_with_fallback(dst, base, &key,
            observed_array)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, &key, observed)) {
            return true;
        }

        const void *helper = NULL;
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_stack_object_slot(dst, dst)) {
            return false;
        }
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_table_get = [&](SQInteger dst, SQInteger base, SQInteger literal_index,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return emit_member_get_key(dst, base, &proto->_literals[literal_index], observed,
            observed_array, observed_object_ptr);
    };

    auto literal_index_for_object_ptr_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            slots[slot].kind != SQ_JIT_SLOT_OBJECT_PTR ||
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

    auto emit_inline_array_set_integer = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
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

    auto emit_inline_array_set_bool = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
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

    auto emit_inline_array_set_float = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
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

    auto observed_instance_field_for_base = [&](SQInteger base,
        const SQObjectPtr *key, SQJitA64InstanceFieldObservation *field) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key || !field) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            return slots[base].stack_object_reg >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    slots[base].stack_object_reg, key, field);
        }
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            return sqjit_a64_observed_object_ptr_instance_field(
                slots[base].object_ptr_observed, slots[base].object_ptr_observed_type,
                key, field);
        }
        return false;
    };

    auto emit_instance_field_set_base = [&](SQInteger base,
        const SQJitA64InstanceFieldObservation &field) -> bool {
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            if(slots[base].stack_object_reg < 0 ||
                !sqjit_a64_emit_type_guard(&buf, slots[base].stack_object_reg,
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 19,
                sqjit_a64_stack_value_disp(slots[base].stack_object_reg))) {
                return false;
            }
        }
        else if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
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
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
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

    auto emit_instance_field_set_float_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
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

    auto emit_member_set_reference_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value, bool root_store) -> bool {
        if(!uses_write_log ||
            !sqjit_a64_emit_reference_member_store(&buf, slots, write_log_slot,
                base, key, value, root_store ? &sqjit_context(proto->_sharedstate) : NULL,
                target != SQ_JIT_A64_NO_RESULT_SLOT) ||
            !emit_guard_on_x0_zero()) return false;
        if(target == SQ_JIT_A64_NO_RESULT_SLOT) return true;
        if(slots[value].kind == SQ_JIT_SLOT_STACK_OBJECT) {
            SQInteger reg = slots[value].stack_object_reg;
            SQObjectType type = sq_type(entry_stack[reg]);
            // Capture bits now, not an alias of a VM register a later getter
            // can overwrite. The store helper pins reference-valued results.
            if(type == OT_ARRAY || sqjit_a64_type_is_object_ptr(type) || type == OT_BOOL) {
                if(!sqjit_a64_emit_type_guard(&buf, reg, type, guard_relocs, &nguard_relocs) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(reg)) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(target))) return false;
                bool marked = type == OT_BOOL ? mark_bool_slot(target) : type == OT_ARRAY ?
                    mark_array_ptr_slot(target, _array(entry_stack[reg])) :
                    mark_object_ptr_slot(target, type, (SQInteger)_rawval(entry_stack[reg]));
                return marked && (slots[target].entry_loaded = true, true);
            }
            // Other boxed tags retain VM fallback until owned boxed captures
            // are supported; never leave a deferred VM-slot alias as a result.
            if(type != OT_INTEGER && type != OT_FLOAT) return false;
        }
        return copy_any_slot(target, value);
    };

    auto emit_member_set_integer_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value, bool root_store) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_integer_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_float_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value, bool root_store) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_float_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        return false;
    };

    auto emit_instance_field_set_bool_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_word_slot(value)) {
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

    auto emit_member_set_bool_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value, bool root_store) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_word_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_bool_key(target, base, key, value)) {
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            if(slots[base].object_ptr_observed_type == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)slots[base].object_ptr_observed_type) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT &&
            slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                root_store ? (SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate) : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_inline_leaf_call = [&](SQClosure *callee_closure,
        const SQInstruction &call_inst) -> bool {
        if(!callee_closure) {
            return false;
        }
        SQFunctionProto *callee = callee_closure->_function;
        if(!SQJitLeafPlan::Eligible(callee)) scalar_guard_region = false;
        if(!callee || callee->_bgenerator || callee->_varparams ||
            callee->_ndefaultparams != 0 || callee->_noutervalues != 0 ||
            callee->_nparameters != call_inst._arg3 ||
            call_inst._arg2 < 0 ||
            call_inst._arg2 + call_inst._arg3 > MAX_FUNC_STACKSIZE) {
            return false;
        }

        // Scalar callees with forward control flow use the shared bounded leaf
        // analysis. Keep every callee slot private: Squirrel arguments are
        // passed by value, so assigning a parameter must not overwrite the
        // caller's local. This also gives branch joins one stable spill slot
        // per callee local across all branch paths.
        bool scalar_control_flow = false;
        if(SQJitLeafPlan::Eligible(callee)) {
            for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
                SQOpcode op = (SQOpcode)callee->_instructions[ip].op;
                scalar_control_flow = scalar_control_flow ||
                    op == _OP_JZ || op == _OP_JCMP || op == _OP_JMP;
            }
        }
        auto observed_scalar_kind = [&](SQInteger slot) -> SQJitSlotKind {
            if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
                return SQ_JIT_SLOT_UNKNOWN;
            }
            if(slots[slot].kind == SQ_JIT_SLOT_INT ||
                slots[slot].kind == SQ_JIT_SLOT_FLOAT ||
                slots[slot].kind == SQ_JIT_SLOT_BOOL) {
                return slots[slot].kind;
            }
            if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT ||
                slots[slot].stack_object_reg < 0 || !entry_stack) {
                return SQ_JIT_SLOT_UNKNOWN;
            }
            switch(sq_type(entry_stack[slots[slot].stack_object_reg])) {
            case OT_INTEGER: return SQ_JIT_SLOT_INT;
            case OT_FLOAT: return SQ_JIT_SLOT_FLOAT;
            case OT_BOOL: return SQ_JIT_SLOT_BOOL;
            default: return SQ_JIT_SLOT_UNKNOWN;
            }
        };

        std::vector<SQJitSlotKind> leaf_arguments(callee->_nparameters,
            SQ_JIT_SLOT_UNKNOWN);
        bool scalar_arguments = true;
        for(SQInteger n = 1; n < callee->_nparameters; n++) {
            leaf_arguments[n] = observed_scalar_kind(call_inst._arg2 + n);
            scalar_arguments = scalar_arguments &&
                leaf_arguments[n] != SQ_JIT_SLOT_UNKNOWN;
        }
        SQJitLeafPlan leaf_plan;
        const SQInteger leaf_scratch = inline_scratch_base;
        const SQInteger leaf_temporary = leaf_scratch + callee->_stacksize;
        if(scalar_control_flow && scalar_arguments &&
            leaf_temporary + 2 <= MAX_FUNC_STACKSIZE &&
            leaf_plan.Build(callee, leaf_arguments)) {
            auto leaf_local = [&](SQInteger slot) -> SQInteger {
                return slot >= 0 && slot < callee->_stacksize ?
                    leaf_scratch + slot : -1;
            };
            auto mark_leaf_kind = [&](SQInteger slot, SQJitSlotKind kind,
                const SQJitLeafValue *value) -> bool {
                if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
                    return false;
                }
                switch(kind) {
                case SQ_JIT_SLOT_INT: slots[slot].MarkInt(); break;
                case SQ_JIT_SLOT_FLOAT: slots[slot].MarkFloat(); break;
                case SQ_JIT_SLOT_BOOL: slots[slot].MarkBool(); break;
                default: slots[slot].MarkUnknown(); return true;
                }
                slots[slot].dirty = true;
                slots[slot].entry_loaded = true;
                if(value && value->constant && kind != SQ_JIT_SLOT_FLOAT) {
                    slots[slot].SetConst(value->integer);
                }
                return true;
            };
            auto copy_leaf_scalar = [&](SQInteger dst, SQInteger src,
                SQJitSlotKind kind) -> bool {
                if(dst == SQ_JIT_A64_NO_RESULT_SLOT) {
                    return true;
                }
                if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || src < 0 ||
                    src >= MAX_FUNC_STACKSIZE) {
                    return false;
                }
                if(kind == SQ_JIT_SLOT_FLOAT) {
                    if(!ensure_float_slot(src) ||
                        !emit_float_copy(dst, src) ||
                        !mark_float_slot(dst)) {
                        return false;
                    }
                }
                else if(kind == SQ_JIT_SLOT_BOOL) {
                    if(slots[src].kind == SQ_JIT_SLOT_STACK_OBJECT) {
                        if(slots[src].stack_object_reg < 0 ||
                            !emit_stack_type_guard(slots[src].stack_object_reg,
                            OT_BOOL) ||
                            !sqjit_a64_emit_ldr_x(&buf, 9, 19,
                            sqjit_a64_stack_value_disp(
                            slots[src].stack_object_reg))) {
                            return false;
                        }
                    }
                    else if(slots[src].kind != SQ_JIT_SLOT_BOOL ||
                        !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                        sqjit_a64_local_disp(src))) {
                        return false;
                    }
                    if(!sqjit_a64_emit_str_x(&buf, 9, 31,
                        sqjit_a64_local_disp(dst)) || !mark_bool_slot(dst)) {
                        return false;
                    }
                }
                else if(kind == SQ_JIT_SLOT_INT) {
                    if(!ensure_int_slot(src) ||
                        !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                        sqjit_a64_local_disp(src)) ||
                        !sqjit_a64_emit_str_x(&buf, 9, 31,
                        sqjit_a64_local_disp(dst)) || !mark_int_slot(dst)) {
                        return false;
                    }
                }
                else {
                    return false;
                }
                slots[dst].entry_loaded = true;
                if(kind != SQ_JIT_SLOT_FLOAT) {
                    slots[dst].CopyConstFrom(slots[src]);
                }
                return true;
            };

            for(SQInteger n = 1; n < callee->_nparameters; n++) {
                if(!copy_leaf_scalar(leaf_local(n), call_inst._arg2 + n,
                    leaf_arguments[n])) {
                    return false;
                }
            }

            std::vector<SQInteger> leaf_offsets(callee->_ninstructions + 1,
                -1);
            std::vector<SQJitA64Reloc> leaf_branches;
            auto record_leaf_branch = [&](SQInteger patch, SQInteger target,
                bool conditional, unsigned cond) -> bool {
                if(target < 0 || target > callee->_ninstructions) {
                    return false;
                }
                SQJitA64Reloc reloc;
                reloc.patch_offset = patch;
                reloc.target_ip = target;
                reloc.cond = (unsigned char)cond;
                reloc.conditional = conditional;
                leaf_branches.push_back(reloc);
                return true;
            };
            auto load_leaf_literal = [&](SQInteger dst,
                SQInteger literal_index) -> bool {
                return literal_index >= 0 &&
                    literal_index < callee->_nliterals &&
                    load_literal_value_slot(dst,
                    callee->_literals[literal_index]);
            };

            for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
                leaf_offsets[ip] = buf.size;
                const SQJitLeafPlan::Instruction &node =
                    leaf_plan.instructions[ip];
                if(!node.reachable) {
                    continue;
                }
                for(SQInteger n = 0; n < callee->_stacksize; n++) {
                    if(!mark_leaf_kind(leaf_local(n), node.incoming[n].kind,
                        &node.incoming[n])) {
                        return false;
                    }
                }

                const SQInstruction &leaf_inst = callee->_instructions[ip];
                SQInteger dst = leaf_local(leaf_inst._arg0);
                SQInteger left = leaf_local(leaf_inst._arg2);
                SQInteger right = leaf_local(leaf_inst._arg1);
                switch(leaf_inst.op) {
                case _OP_LINE:
                    break;
                case _OP_LOADINT:
                    if(!emit_load_int(dst, sqjit_loadint_value(leaf_inst))) {
                        return false;
                    }
                    break;
                case _OP_LOADBOOL:
                    if(!emit_load_int(dst, leaf_inst._arg1 ? 1 : 0) ||
                        !mark_bool_slot(dst)) {
                        return false;
                    }
                    slots[dst].SetConst(leaf_inst._arg1 ? 1 : 0);
                    break;
                case _OP_LOADFLOAT: {
                    SQFloat value;
                    if(!sqjit_loadfloat_value(leaf_inst, &value) ||
                        !emit_load_float(dst, value)) {
                        return false;
                    }
                    break;
                }
                case _OP_LOAD:
                    if(!load_leaf_literal(dst, leaf_inst._arg1)) {
                        return false;
                    }
                    break;
                case _OP_DLOAD:
                    if(!load_leaf_literal(dst, leaf_inst._arg1) ||
                        !load_leaf_literal(leaf_local(leaf_inst._arg2),
                        leaf_inst._arg3)) {
                        return false;
                    }
                    break;
                case _OP_MOVE:
                case _OP_DMOVE:
                    if(!copy_leaf_scalar(dst, right,
                        node.incoming[leaf_inst._arg1].kind)) {
                        return false;
                    }
                    if(leaf_inst.op == _OP_DMOVE &&
                        !copy_leaf_scalar(leaf_local(leaf_inst._arg2),
                        leaf_local(leaf_inst._arg3),
                        leaf_inst._arg3 == leaf_inst._arg0 ?
                        node.incoming[leaf_inst._arg1].kind :
                        node.incoming[leaf_inst._arg3].kind)) {
                        return false;
                    }
                    break;
                case _OP_ADD:
                case _OP_SUB:
                case _OP_MUL:
                case _OP_DIV:
                case _OP_MOD:
                    if(node.result == SQ_JIT_SLOT_FLOAT ?
                        !emit_float_binary((SQOpcode)leaf_inst.op, dst, left,
                        right) :
                        !emit_binary((SQOpcode)leaf_inst.op, dst, left,
                        right)) {
                        return false;
                    }
                    break;
                case _OP_NEG:
                    if(!emit_integer_neg(dst, right)) {
                        return false;
                    }
                    break;
                case _OP_EQ:
                case _OP_NE: {
                    if(leaf_inst._arg3) {
                        right = leaf_temporary;
                        if(!load_leaf_literal(right, leaf_inst._arg1)) {
                            return false;
                        }
                    }
                    if(!ensure_word_slot(left) || !ensure_word_slot(right) ||
                        !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                        sqjit_a64_local_disp(left)) ||
                        !sqjit_a64_emit_ldr_x(&buf, 10, 31,
                        sqjit_a64_local_disp(right)) ||
                        !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                        !sqjit_a64_emit_cset(&buf, 9,
                        leaf_inst.op == _OP_NE ? SQ_JIT_A64_NE :
                        SQ_JIT_A64_EQ) ||
                        !sqjit_a64_emit_str_x(&buf, 9, 31,
                        sqjit_a64_local_disp(dst)) || !mark_bool_slot(dst)) {
                        return false;
                    }
                    break;
                }
                case _OP_CMP:
                case _OP_JCMP: {
                    unsigned false_cond = 0;
                    SQInteger cmp_right = leaf_inst.op == _OP_CMP ? right : dst;
                    if(!sqjit_a64_cmp_false_cond((CmpOP)leaf_inst._arg3,
                        &false_cond) || !ensure_int_slot(left) ||
                        !ensure_int_slot(cmp_right) ||
                        !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                        sqjit_a64_local_disp(left)) ||
                        !sqjit_a64_emit_ldr_x(&buf, 10, 31,
                        sqjit_a64_local_disp(cmp_right)) ||
                        !sqjit_a64_emit_cmp_reg(&buf, 9, 10)) {
                        return false;
                    }
                    if(leaf_inst.op == _OP_CMP) {
                        if(!sqjit_a64_emit_cset(&buf, 9,
                            false_cond ^ 1) ||
                            !sqjit_a64_emit_str_x(&buf, 9, 31,
                            sqjit_a64_local_disp(dst)) ||
                            !mark_bool_slot(dst)) {
                            return false;
                        }
                    }
                    else {
                        SQInteger patch = 0;
                        if(!sqjit_a64_emit_bcond_placeholder(&buf, false_cond,
                            &patch) || !record_leaf_branch(patch,
                            ip + 1 + sqjit_signed_arg1(leaf_inst), true,
                            false_cond)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_JZ: {
                    SQInteger patch = 0;
                    if(!ensure_word_slot(dst) ||
                        !sqjit_a64_emit_ldr_x(&buf, 9, 31,
                        sqjit_a64_local_disp(dst)) ||
                        !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf,
                        SQ_JIT_A64_EQ, &patch) ||
                        !record_leaf_branch(patch,
                        ip + 1 + sqjit_signed_arg1(leaf_inst), true,
                        SQ_JIT_A64_EQ)) {
                        return false;
                    }
                    break;
                }
                case _OP_JMP: {
                    SQInteger patch = 0;
                    if(!sqjit_a64_emit_b_placeholder(&buf, &patch) ||
                        !record_leaf_branch(patch,
                        ip + 1 + sqjit_signed_arg1(leaf_inst), false, 0)) {
                        return false;
                    }
                    break;
                }
                case _OP_RETURN: {
                    if(leaf_inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT &&
                        !copy_leaf_scalar(call_inst._arg0,
                        leaf_local(leaf_inst._arg1), leaf_plan.return_kind)) {
                        return false;
                    }
                    bool later_reachable = false;
                    for(SQInteger n = ip + 1; n < callee->_ninstructions; n++) {
                        later_reachable = later_reachable ||
                            leaf_plan.instructions[n].reachable;
                    }
                    if(later_reachable) {
                        SQInteger patch = 0;
                        if(!sqjit_a64_emit_b_placeholder(&buf, &patch) ||
                            !record_leaf_branch(patch,
                            callee->_ninstructions, false, 0)) {
                            return false;
                        }
                    }
                    break;
                }
                default:
                    return false;
                }
            }

            leaf_offsets[callee->_ninstructions] = buf.size;
            for(size_t n = 0; n < leaf_branches.size(); n++) {
                const SQJitA64Reloc &reloc = leaf_branches[n];
                if(reloc.target_ip < 0 ||
                    reloc.target_ip > callee->_ninstructions ||
                    leaf_offsets[reloc.target_ip] < 0 ||
                    !sqjit_a64_patch_branch(&buf, reloc.patch_offset,
                    leaf_offsets[reloc.target_ip], reloc.conditional,
                    reloc.cond)) {
                    return false;
                }
            }
            // All returns join here. A constant from one return path is not
            // necessarily valid on the others.
            if(call_inst._arg0 != SQ_JIT_A64_NO_RESULT_SLOT &&
                !mark_leaf_kind(call_inst._arg0, leaf_plan.return_kind, NULL)) {
                return false;
            }
            return true;
        }

        if(inline_scratch_base +
            (callee->_stacksize - callee->_nparameters) >
            MAX_FUNC_STACKSIZE) {
            return false;
        }

        const SQObjectPtr *inline_known_literal[MAX_FUNC_STACKSIZE];
        for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
            inline_known_literal[n] = NULL;
        }

        auto clear_inline_slot = [&](SQInteger slot) -> void {
            if(slot >= 0 && slot < MAX_FUNC_STACKSIZE) {
                inline_known_literal[slot] = NULL;
            }
        };

        auto load_inline_literal_value = [&](SQInteger dst,
            const SQObjectPtr &literal) -> bool {
            if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
                return false;
            }
            if(sq_type(literal) == OT_STRING) {
                inline_known_literal[dst] = &literal;
                slots[dst].ClearConst();
                return true;
            }
            inline_known_literal[dst] = NULL;
            return load_literal_value_slot(dst, literal);
        };

        auto next_inline_ip = [&](SQInteger ip) -> SQInteger {
            while(ip >= 0 && ip < callee->_ninstructions &&
                callee->_instructions[ip].op == _OP_LINE) {
                ip++;
            }
            return ip;
        };

        auto inline_branch_target = [&](SQInteger ip) -> SQInteger {
            if(ip < 0 || ip >= callee->_ninstructions) {
                return -1;
            }
            return ip + 1 + sqjit_signed_arg1(callee->_instructions[ip]);
        };

        SQInteger first_ip = next_inline_ip(0);
        if(first_ip >= 0 && first_ip < callee->_ninstructions &&
            callee->_instructions[first_ip].op == _OP_JCMP) {
            const SQInstruction &cmp_inst = callee->_instructions[first_ip];
            SQInteger true_move_ip = next_inline_ip(first_ip + 1);
            SQInteger false_move_ip = next_inline_ip(inline_branch_target(first_ip));
            if(true_move_ip >= 0 && true_move_ip < callee->_ninstructions &&
                false_move_ip >= 0 && false_move_ip < callee->_ninstructions &&
                callee->_instructions[true_move_ip].op == _OP_MOVE &&
                callee->_instructions[false_move_ip].op == _OP_MOVE) {
                const SQInstruction &true_move = callee->_instructions[true_move_ip];
                const SQInstruction &false_move = callee->_instructions[false_move_ip];
                SQInteger jump_ip = next_inline_ip(true_move_ip + 1);
                if(jump_ip >= 0 && jump_ip < callee->_ninstructions &&
                    callee->_instructions[jump_ip].op == _OP_JMP) {
                    SQInteger return_ip = next_inline_ip(inline_branch_target(jump_ip));
                    SQInteger false_return_ip = next_inline_ip(false_move_ip + 1);
                    if(return_ip == false_return_ip && return_ip >= 0 &&
                        return_ip < callee->_ninstructions &&
                        callee->_instructions[return_ip].op == _OP_RETURN &&
                        true_move._arg0 == false_move._arg0 &&
                        callee->_instructions[return_ip]._arg0 != SQ_JIT_A64_NO_RESULT_SLOT &&
                        callee->_instructions[return_ip]._arg1 == true_move._arg0) {
                        SQInteger cmp_left = map_inline_slot(callee, call_inst,
                            cmp_inst._arg2);
                        SQInteger cmp_right = map_inline_slot(callee, call_inst,
                            cmp_inst._arg0);
                        SQInteger true_src = map_inline_slot(callee, call_inst,
                            true_move._arg1);
                        SQInteger false_src = map_inline_slot(callee, call_inst,
                            false_move._arg1);
                        if(emit_conditional_select((CmpOP)cmp_inst._arg3,
                            call_inst._arg0, cmp_left, cmp_right, true_src,
                            false_src)) {
                            return true;
                        }
                    }
                }
            }
        }

        for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
            const SQInstruction &inst = callee->_instructions[ip];
            switch(inst.op) {
                case _OP_LINE:
                    break;
                case _OP_LOADINT: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    clear_inline_slot(dst);
                    if(dst < 0 || !emit_load_int(dst, sqjit_loadint_value(inst))) {
                        return false;
                    }
                    break;
                }
                case _OP_LOADFLOAT: {
                    SQFloat value;
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    clear_inline_slot(dst);
                    if(dst < 0 || !sqjit_loadfloat_value(inst, &value) ||
                        !emit_load_float(dst, value)) {
                        return false;
                    }
                    break;
                }
                case _OP_LOAD:
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg0),
                        callee->_literals[inst._arg1])) {
                        return false;
                    }
                    break;
                case _OP_DLOAD:
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        inst._arg3 < 0 || inst._arg3 >= callee->_nliterals ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg0),
                        callee->_literals[inst._arg1]) ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg2),
                        callee->_literals[inst._arg3])) {
                        return false;
                    }
                    break;
                case _OP_LOADBOOL: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    clear_inline_slot(dst);
                    if(dst < 0 || !emit_load_int(dst, inst._arg1 ? 1 : 0) ||
                        !mark_bool_slot(dst)) {
                        return false;
                    }
                    break;
                }
                case _OP_MOVE: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src = map_inline_slot(callee, call_inst, inst._arg1);
                    if(dst < 0 || src < 0) {
                        return false;
                    }
                    if(inline_known_literal[src]) {
                        inline_known_literal[dst] = inline_known_literal[src];
                    }
                    else {
                        inline_known_literal[dst] = NULL;
                        if(!copy_any_slot(dst, src)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_DMOVE: {
                    SQInteger dst0 = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src0 = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger dst1 = map_inline_slot(callee, call_inst, inst._arg2);
                    SQInteger src1 = map_inline_slot(callee, call_inst, inst._arg3);
                    if(dst0 < 0 || src0 < 0 || dst1 < 0 || src1 < 0) {
                        return false;
                    }
                    if(inline_known_literal[src0]) {
                        inline_known_literal[dst0] = inline_known_literal[src0];
                    }
                    else {
                        inline_known_literal[dst0] = NULL;
                        if(!copy_any_slot(dst0, src0)) {
                            return false;
                        }
                    }
                    if(inline_known_literal[src1]) {
                        inline_known_literal[dst1] = inline_known_literal[src1];
                    }
                    else {
                        inline_known_literal[dst1] = NULL;
                        if(!copy_any_slot(dst1, src1)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_GETK: {
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals) {
                        return false;
                    }
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || base < 0) {
                        return false;
                    }
                    clear_inline_slot(dst);
                    const SQObjectPtr &key = callee->_literals[inst._arg1];
                    if(sq_type(key) == OT_INTEGER) {
                        SQInteger index = _integer(key);
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                slots[base].array_ptr_observed, index, &observed_array);
                        }
                        else {
                            SQInteger observed_reg = slots[base].stack_object_reg;
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, index);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(index,
                                    observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_const(dst, base, index, observed,
                            observed_array)) {
                            return false;
                        }
                    }
                    else {
                        SQArray *observed_array = NULL;
                        SQInteger observed_object_ptr = 0;
                        SQObjectType observed = OT_NULL;
                        if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                            observed = sqjit_a64_observed_object_ptr_value_type(
                                slots[base].object_ptr_observed,
                                slots[base].object_ptr_observed_type, &key,
                                &observed_array, &observed_object_ptr);
                        }
                        else {
                            observed = sqjit_a64_observed_table_value_type(entry_stack,
                                slots[base].stack_object_reg, &key, &observed_array,
                                &observed_object_ptr);
                            if(observed == OT_NULL && slots[base].stack_object_reg == 0) {
                                observed = sqjit_a64_observed_root_value_type(root_object,
                                    &key, &observed_array, &observed_object_ptr);
                            }
                        }
                        if(!emit_member_get_key(dst, base, &key, observed,
                            observed_array, observed_object_ptr)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_GET: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger key = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || base < 0 || key < 0) {
                        return false;
                    }
                    const SQObjectPtr *inline_key = inline_known_literal[key];
                    bool key_known_const = slots[key].known_const;
                    SQInteger key_const = slots[key].const_value;
                    clear_inline_slot(dst);
                    if(key_known_const) {
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                slots[base].array_ptr_observed, key_const,
                                &observed_array);
                        }
                        else {
                            SQInteger observed_reg = slots[base].stack_object_reg;
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, key_const);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(
                                    key_const, observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_const(dst, base, key_const,
                            observed, observed_array)) {
                            return false;
                        }
                    }
                    else {
                        if(inline_key && sq_type(*inline_key) != OT_INTEGER) {
                            SQArray *observed_array = NULL;
                            SQInteger observed_object_ptr = 0;
                            SQObjectType observed = OT_NULL;
                            if(slots[base].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                                observed = sqjit_a64_observed_object_ptr_value_type(
                                    slots[base].object_ptr_observed,
                                    slots[base].object_ptr_observed_type,
                                    inline_key, &observed_array,
                                    &observed_object_ptr);
                            }
                            else {
                                observed = sqjit_a64_observed_table_value_type(
                                    entry_stack, slots[base].stack_object_reg,
                                    inline_key, &observed_array,
                                    &observed_object_ptr);
                                if(observed == OT_NULL &&
                                    slots[base].stack_object_reg == 0) {
                                    observed = sqjit_a64_observed_root_value_type(
                                        root_object, inline_key,
                                        &observed_array, &observed_object_ptr);
                                }
                            }
                            if(!emit_member_get_key(dst, base,
                                inline_key, observed,
                                observed_array, observed_object_ptr)) {
                                return false;
                            }
                            break;
                        }
                        if(slots[key].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                            if(!emit_member_get_dynamic_key(dst, base, key)) {
                                return false;
                            }
                            break;
                        }
                        SQInteger observed_index = 0;
                        if(key >= 0 && key < MAX_FUNC_STACKSIZE &&
                            sq_type(entry_stack[key]) == OT_INTEGER) {
                            observed_index = _integer(entry_stack[key]);
                        }
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        SQInteger observed_object_ptr = 0;
                        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                slots[base].array_ptr_observed, observed_index,
                                &observed_array, &observed_object_ptr);
                        }
                        else {
                            SQInteger observed_reg = slots[base].stack_object_reg;
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, observed_index, &observed_array,
                                &observed_object_ptr);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(
                                    observed_index, observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_dynamic(dst, base, key, observed,
                            observed_array, observed_object_ptr)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_ADD:
                case _OP_SUB:
                case _OP_MUL:
                case _OP_DIV:
                case _OP_MOD: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger right = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger left = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || right < 0 || left < 0) {
                        return false;
                    }
                    clear_inline_slot(dst);
                    if(slot_observed_is_float(left) ||
                        slot_observed_is_float(right)) {
                        if(!emit_float_binary((SQOpcode)inst.op, dst, left, right)) {
                            return false;
                        }
                    }
                    else if(!emit_binary((SQOpcode)inst.op, dst, left, right)) {
                        return false;
                    }
                    break;
                }
                case _OP_NEG: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src = map_inline_slot(callee, call_inst, inst._arg1);
                    if(dst < 0 || src < 0) {
                        return false;
                    }
                    clear_inline_slot(dst);
                    if(slot_is_float(src)) {
                        if(!emit_float_neg(dst, src)) {
                            return false;
                        }
                    }
                    else if(!emit_integer_neg(dst, src)) {
                        return false;
                    }
                    break;
                }
                case _OP_SET: {
                    SQInteger target = inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT ? SQ_JIT_A64_NO_RESULT_SLOT :
                        map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger key = map_inline_slot(callee, call_inst, inst._arg2);
                    SQInteger value = map_inline_slot(callee, call_inst, inst._arg3);
                    if((target != SQ_JIT_A64_NO_RESULT_SLOT && target < 0) || base < 0 ||
                        key < 0 || value < 0) {
                        return false;
                    }
                    if(target >= 0 && target < MAX_FUNC_STACKSIZE) {
                        clear_inline_slot(target);
                    }
                    if(inline_known_literal[key] &&
                        sq_type(*inline_known_literal[key]) != OT_INTEGER) {
                        if(value >= 0 && value < MAX_FUNC_STACKSIZE &&
                            slots[value].kind == SQ_JIT_SLOT_BOOL) {
                            if(!emit_member_set_bool_key(target, base,
                                inline_known_literal[key], value, inst._arg1 == 0)) {
                                return false;
                            }
                        }
                        else if(slot_observed_is_float(value)) {
                            if(!emit_member_set_float_key(target, base,
                                inline_known_literal[key], value, inst._arg1 == 0)) {
                                return false;
                            }
                        }
                        else {
                            SQObjectType value_type = OT_NULL;
                            SQArray *value_array = NULL;
                            SQInteger value_object_ptr = 0;
                            bool value_can_be_object =
                                value >= 0 && value < MAX_FUNC_STACKSIZE &&
                                slots[value].kind == SQ_JIT_SLOT_STACK_OBJECT;
                            if(!value_can_be_object &&
                                observed_shape_for_slot(value, &value_type,
                                &value_array, &value_object_ptr)) {
                                value_can_be_object = value_type == OT_ARRAY ||
                                    sqjit_a64_type_is_object_ptr(value_type);
                            }
                            if(value_can_be_object) {
                                if(!emit_member_set_reference_key(target, base,
                                    inline_known_literal[key], value, inst._arg1 == 0)) return false;
                            }
                            else if(!emit_member_set_integer_key(target, base,
                                inline_known_literal[key], value, inst._arg1 == 0)) {
                                return false;
                            }
                        }
                    }
                    else {
                        if(value >= 0 && value < MAX_FUNC_STACKSIZE &&
                            slots[value].kind == SQ_JIT_SLOT_BOOL) {
                            if(!emit_inline_array_set_bool(target, base, key,
                                value)) {
                                return false;
                            }
                        }
                        else if(slot_observed_is_float(value)) {
                            if(!emit_inline_array_set_float(target, base, key,
                                value)) {
                                return false;
                            }
                        }
                        else if(!emit_inline_array_set_integer(target, base, key,
                            value)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_RETURN:
                    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) {
                        return call_inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT;
                    }
                    if(call_inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) {
                        return true;
                    }
                    return copy_any_slot(call_inst._arg0,
                        map_inline_slot(callee, call_inst, inst._arg1));
                default:
                    return false;
            }
        }
        return false;
    };

    auto emit_array_len_raw = [&](SQInteger dst_local, SQInteger base) -> bool {
        if(dst_local < 0 || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 11, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_cmp_imm(&buf, 11, 0) &&
                emit_guard_fail_branch(SQ_JIT_A64_EQ) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[base].stack_object_reg >= 0) {
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
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_array_set_bool = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        if(slots[base].kind == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_float_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slots[base].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[base].stack_object_reg >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, slots[base].stack_object_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_float_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto record_branch = [&](SQInteger patch_offset, SQInteger target_ip, bool conditional,
        unsigned cond) -> bool {
        if(target_ip == exit_ip) {
            return sqjit_a64_record_reloc(exit_relocs, &nexit_relocs, SQ_JIT_A64_MAX_EXIT_RELOCS,
                patch_offset, target_ip, conditional, cond);
        }
        if(target_ip < start_ip || target_ip > end_ip) {
            return false;
        }
        return sqjit_a64_record_reloc(relocs, &nrelocs, SQ_JIT_A64_MAX_RELOCS,
            patch_offset, target_ip, conditional, cond);
    };

    auto comparith_opcode = [&](SQInteger op, SQOpcode *out) -> bool {
        if(!out) {
            return false;
        }
        switch(op) {
            case '+': *out = _OP_ADD; return true;
            case '-': *out = _OP_SUB; return true;
            case '*': *out = _OP_MUL; return true;
            case '/': *out = _OP_DIV; return true;
            case '%': *out = _OP_MOD; return true;
            default: return false;
        }
    };

    auto slot_next_used_by_float_binary = [&](SQInteger from_ip,
        SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        for(SQInteger look_ip = from_ip + 1; look_ip <= end_ip; look_ip++) {
            const SQInstruction &look = proto->_instructions[look_ip];
            if(look.op == _OP_LINE) {
                continue;
            }
            if((look.op == _OP_ADD || look.op == _OP_SUB ||
                look.op == _OP_MUL || look.op == _OP_DIV) &&
                (look._arg1 == slot || look._arg2 == slot)) {
                SQInteger other = look._arg1 == slot ? look._arg2 : look._arg1;
                return slot_observed_is_float(other);
            }
            if(sqjit_a64_loop_instruction_reads_slot(look, slot) ||
                sqjit_a64_loop_instruction_writes_slot(look, slot)) {
                return false;
            }
        }
        return false;
    };

    auto slot_next_used_by_integer_binary = [&](SQInteger from_ip,
        SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        for(SQInteger look_ip = from_ip + 1; look_ip <= end_ip; look_ip++) {
            const SQInstruction &look = proto->_instructions[look_ip];
            if(look.op == _OP_LINE) {
                continue;
            }
            if((look.op == _OP_ADD || look.op == _OP_SUB ||
                look.op == _OP_MUL || look.op == _OP_DIV ||
                look.op == _OP_MOD) &&
                (look._arg1 == slot || look._arg2 == slot)) {
                SQInteger other = look._arg1 == slot ? look._arg2 : look._arg1;
                return !slot_observed_is_float(other);
            }
            if(sqjit_a64_loop_instruction_reads_slot(look, slot) ||
                sqjit_a64_loop_instruction_writes_slot(look, slot)) {
                return false;
            }
        }
        return false;
    };

    if(!sqjit_a64_emit_capture_stack_inputs(&buf, saved_inputs, write_log_slot,
        guard_relocs, &nguard_relocs)) return false;

    bool defined_in_loop[MAX_FUNC_STACKSIZE];
    bool preload_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        defined_in_loop[n] = false;
        preload_slot[n] = false;
    }
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_a64_loop_instruction_reads_int_slot(inst, slot) && !defined_in_loop[slot]) {
                preload_slot[slot] = true;
            }
        }
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_a64_loop_instruction_writes_slot(inst, slot)) {
                defined_in_loop[slot] = true;
            }
        }
    }
    for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
        // Any scalar live at the header may be loop-carried, including values
        // first consumed by DMOVE or a call. Load it before the backedge target:
        // loading lazily inside the body would restore the stale VM entry value
        // on every iteration while native updates remain in local spill slots.
        SQObjectType entry_type = sq_type(entry_stack[slot]);
        if(analysis.live_in[start_ip].test(slot) &&
            (entry_type == OT_INTEGER || entry_type == OT_FLOAT || entry_type == OT_BOOL)) {
            preload_slot[slot] = true;
        }
        if(!preload_slot[slot]) {
            continue;
        }
        if(sq_type(entry_stack[slot]) == OT_FLOAT) {
            if(!ensure_float_slot(slot)) {
                return attempt.Reject(header_ip, SQ_JIT_REJECT_LOOP, "unsupported loop float preload");
            }
        }
        else if(entry_type == OT_INTEGER || entry_type == OT_BOOL) {
            if(!ensure_word_slot(slot)) {
                return attempt.Reject(header_ip, SQ_JIT_REJECT_LOOP, "unsupported loop scalar preload");
            }
        }
        else {
            return attempt.Reject(header_ip, SQ_JIT_REJECT_LOOP, "unsupported loop object preload");
        }
    }
    if(len_hoist.valid && !emit_array_len_raw(len_hoist.local_slot,
        len_hoist.base_slot)) {
        return attempt.Reject(len_hoist.prepcall_ip, SQ_JIT_REJECT_LOOP, "unsupported loop len hoist");
    }

    auto hoist_supplies_slot = [&](SQInteger slot) -> bool {
        return len_hoist.valid && slot == len_hoist.len_slot;
    };

    auto emit_loop_int_operand = [&](unsigned reg, SQInteger slot) -> bool {
        if(hoist_supplies_slot(slot)) {
            return sqjit_a64_emit_ldr_x(&buf, reg, 31,
                sqjit_a64_local_disp(len_hoist.local_slot));
        }
        return ensure_int_slot(slot) &&
            sqjit_a64_emit_ldr_x(&buf, reg, 31, sqjit_a64_local_disp(slot));
    };

    SQInteger entry_guard_jump = -1;
    if(scalar_guard_region && !sqjit_a64_emit_b_placeholder(&buf, &entry_guard_jump)) return false;
    const SQInteger loop_entry_offset = buf.size;

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(analysis.leaders[ip]) for(SQInteger n = 0; n < proto->_stacksize; ++n) {
            slots[n].known_const = false; slots[n].const_value = 0;
        }
        ip_to_offset[ip] = buf.size;
        if(len_hoist.valid &&
            (ip == len_hoist.prepcall_ip || ip == len_hoist.call_ip)) {
            continue;
        }
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
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
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop LOADFLOAT");
                }
                break;
            }
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop LOAD");
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1) ||
                    !load_literal_slot(inst._arg2, inst._arg3)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop DLOAD");
                }
                break;
            case _OP_LOADBOOL:
                if(!emit_load_int(inst._arg0, inst._arg1 ? 1 : 0) || !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                slots[inst._arg0].entry_loaded = false;
                break;
            case _OP_LOADNULLS:
                if(!emit_load_nulls(inst._arg0, inst._arg1)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop LOADNULLS");
                }
                break;
            case _OP_MOVE:
                if(copy_unused_leaf_receiver(inst._arg0, inst._arg1, ip)) {
                    // Unused call receiver remains private until its scalar overwrite.
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg1].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_DMOVE:
                if(copy_unused_leaf_receiver(inst._arg0, inst._arg1, ip)) {
                    // Unused call receiver remains private until its scalar overwrite.
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg1].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                if(copy_unused_leaf_receiver(inst._arg2, inst._arg3, ip)) {
                    // Unused call receiver remains private until its scalar overwrite.
                }
                else if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg3].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg3].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg3)) {
                    if(!copy_float_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop GETK key");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg2].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg2].array_ptr_observed, index, &observed_array);
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
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg2, true, index, -1)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop numeric GETK array read");
                        }
                    }
                    else if(!emit_array_get_const(inst._arg0, inst._arg2, index, observed,
                        observed_array)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop GETK array read");
                    }
                }
                else {
                    SQArray *observed_array = NULL;
                    SQInteger observed_object_ptr = 0;
                    SQObjectType observed = OT_NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg2].kind == SQ_JIT_SLOT_OBJECT_PTR) {
                        observed = sqjit_a64_observed_object_ptr_value_type(
                            slots[inst._arg2].object_ptr_observed,
                            slots[inst._arg2].object_ptr_observed_type,
                            &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg2].stack_object_reg : -1;
                        observed = sqjit_a64_observed_table_value_type(entry_stack,
                            observed_reg, &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                        if(observed == OT_NULL && observed_reg == 0) {
                            observed = sqjit_a64_observed_root_value_type(root_object,
                                &proto->_literals[inst._arg1], &observed_array,
                                &observed_object_ptr);
                        }
                    }
                    lookup_member_shape(inst._arg2, inst._arg1, &observed,
                        &observed_array, &observed_object_ptr);
                    if(!emit_table_get(inst._arg0, inst._arg2, inst._arg1, observed,
                        observed_array, observed_object_ptr)) {
                        if(sqjit_diag_trace_enabled(proto)) {
                            SQInteger observed_reg =
                                (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                slots[inst._arg2].stack_object_reg : -1;
                            SQObjectType stack_type =
                                (observed_reg >= 0) ? sq_type(entry_stack[observed_reg]) : OT_NULL;
                            scprintf(_SC("[sqjit:a64] loop GETK miss detail proto '%s' ip %d base=%d kind=%d stackreg=%d stacktype=%d keytype=%d observed=%d\n"),
                                sqjit_a64_proto_name(proto), (SQInt32)ip,
                                (SQInt32)inst._arg2,
                                (SQInt32)((inst._arg2 >= 0 &&
                                inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                slots[inst._arg2].kind : SQ_JIT_SLOT_UNKNOWN),
                                (SQInt32)observed_reg, (SQInt32)stack_type,
                                (SQInt32)sq_type(proto->_literals[inst._arg1]),
                                (SQInt32)observed);
                            if(sq_type(proto->_literals[inst._arg1]) == OT_STRING) {
                                scprintf(_SC("[sqjit:a64] loop GETK miss key '%s'\n"),
                                    _stringval(proto->_literals[inst._arg1]));
                            }
                        }
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop GETK table read");
                    }
                }
                break;
            }
            case _OP_GET: {
                // The compiler can encode a literal member read as LOAD/GET
                // as well as GETK. Use bytecode provenance, never a sampled
                // string pointer, to give both forms the same guarded lowering.
                if(!compound_keys_built) {
                    compound_keys.Build(proto, analysis, start_ip, end_ip);
                    compound_keys_built = true;
                }
                SQInteger literal = compound_keys.Literal(ip, inst._arg2);
                if(literal >= 0 && sq_type(proto->_literals[literal]) != OT_INTEGER) {
                    const SQObjectPtr *key = &proto->_literals[literal];
                    SQArray *array = NULL; SQInteger object = 0;
                    const SQJitA64SlotState &base = slots[inst._arg1];
                    SQObjectType observed = base.kind == SQ_JIT_SLOT_OBJECT_PTR ?
                        sqjit_a64_observed_object_ptr_value_type(base.object_ptr_observed,
                            base.object_ptr_observed_type, key, &array, &object) :
                        sqjit_a64_observed_table_value_type(entry_stack,
                            base.stack_object_reg, key, &array, &object);
                    if(observed == OT_NULL && base.kind == SQ_JIT_SLOT_STACK_OBJECT &&
                        base.stack_object_reg == 0)
                        observed = sqjit_a64_observed_root_value_type(root_object, key, &array, &object);
                    lookup_member_shape(inst._arg1, literal, &observed, &array, &object);
                    if(!emit_member_get_key(inst._arg0, inst._arg1, key, observed, array, object))
                        return attempt.Reject(ip, SQ_JIT_REJECT_MEMBER, "unsupported proven-key GET member read");
                    break;
                }
                if(slots[inst._arg2].known_const) {
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg1].array_ptr_observed, slots[inst._arg2].const_value,
                            &observed_array);
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
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg1, true, slots[inst._arg2].const_value, -1)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop numeric const GET array read");
                        }
                    }
                    else if(!emit_array_get_const(inst._arg0, inst._arg1,
                        slots[inst._arg2].const_value, observed, observed_array)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop const GET array read");
                    }
                }
                else {
                    bool key_can_be_dynamic_member = inst._arg2 >= 0 &&
                        inst._arg2 < MAX_FUNC_STACKSIZE &&
                        (slots[inst._arg2].kind == SQ_JIT_SLOT_OBJECT_PTR ||
                        (slots[inst._arg2].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                        slots[inst._arg2].stack_object_reg >= 0));
                    bool base_can_be_dynamic_member = inst._arg1 >= 0 &&
                        inst._arg1 < MAX_FUNC_STACKSIZE &&
                        (slots[inst._arg1].kind == SQ_JIT_SLOT_STACK_OBJECT ||
                        slots[inst._arg1].kind == SQ_JIT_SLOT_OBJECT_PTR);
                    if(key_can_be_dynamic_member && base_can_be_dynamic_member) {
                        if(!emit_member_get_dynamic_key(inst._arg0, inst._arg1,
                            inst._arg2,
                            slot_next_used_by_integer_binary(ip, inst._arg0))) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop dynamic GET member read");
                        }
                        break;
                    }
                    SQInteger observed_index = 0;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        sq_type(entry_stack[inst._arg2]) == OT_INTEGER) {
                        observed_index = _integer(entry_stack[inst._arg2]);
                    }
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    SQInteger observed_object_ptr = 0;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[inst._arg1].array_ptr_observed, observed_index,
                            &observed_array, &observed_object_ptr);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            slots[inst._arg1].stack_object_reg : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, observed_index, &observed_array,
                            &observed_object_ptr);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(observed_index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg1, false, 0, inst._arg2)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop numeric dynamic GET array read");
                        }
                    }
                    else if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2,
                        observed, observed_array, observed_object_ptr)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop dynamic GET array read");
                    }
                }
                break;
            }
            case _OP_PREPCALLK:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    (slots[inst._arg2].kind != SQ_JIT_SLOT_ARRAY_PTR &&
                    slots[inst._arg2].kind != SQ_JIT_SLOT_OBJECT_PTR &&
                    slots[inst._arg2].kind != SQ_JIT_SLOT_INT &&
                    slots[inst._arg2].kind != SQ_JIT_SLOT_FLOAT &&
                    slots[inst._arg2].kind != SQ_JIT_SLOT_BOOL &&
                    (slots[inst._arg2].kind != SQ_JIT_SLOT_STACK_OBJECT ||
                    slots[inst._arg2].stack_object_reg < 0))) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop PREPCALLK");
                }
                {
                    SQInteger receiver_slot = inst._arg2;
                    if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                        if(inst._arg3 == inst._arg0) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop PREPCALLK");
                        }
                        if(slots[inst._arg2].kind == SQ_JIT_SLOT_STACK_OBJECT) {
                            if(!copy_stack_object_alias(inst._arg3, inst._arg2)) {
                                return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop PREPCALLK");
                            }
                        }
                        else if(!copy_any_slot(inst._arg3, inst._arg2)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop PREPCALLK");
                        }
                        receiver_slot = inst._arg3;
                    }
                    const SQChar *member_name = _stringval(proto->_literals[inst._arg1]);
                    bool base_is_number = slots[receiver_slot].kind == SQ_JIT_SLOT_INT ||
                        slots[receiver_slot].kind == SQ_JIT_SLOT_FLOAT ||
                        slots[receiver_slot].kind == SQ_JIT_SLOT_BOOL;
                    if(slots[receiver_slot].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                        slots[receiver_slot].stack_object_reg >= 0) {
                        SQObjectType base_type =
                            sq_type(entry_stack[slots[receiver_slot].stack_object_reg]);
                        base_is_number = base_type == OT_INTEGER || base_type == OT_FLOAT ||
                            base_type == OT_BOOL;
                    }
                    if(base_is_number && scstrcmp(member_name, _SC("tofloat")) == 0) {
                        if(!emit_conversion_guard(&proto->_literals[inst._arg1])) return false;
                        prepared_number_conversion[inst._arg0] =
                            SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT;
                        prepared_number_conversion_base[inst._arg0] = receiver_slot;
                    }
                    else if(base_is_number && scstrcmp(member_name, _SC("tointeger")) == 0) {
                        prepared_number_conversion[inst._arg0] =
                            SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER;
                        prepared_number_conversion_base[inst._arg0] = receiver_slot;
                    }
                    else if(scstrcmp(member_name, _SC("len")) == 0) {
                        prepared_array_len_base[inst._arg0] = receiver_slot;
                    }
                    else if(scstrcmp(member_name, _SC("append")) == 0 ||
                        scstrcmp(member_name, _SC("push")) == 0) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_ARRAY_APPEND, "unsupported loop array append PREPCALLK");
                    }
                    else {
                        SQNativeClosure *native_callee = NULL;
                        SQNativeMathKind intrinsic = SQ_NATIVE_MATH_NONE;
                        SQInteger math_nargs = 0;
                        if(observed_member_native_closure(receiver_slot, inst._arg1,
                            &native_callee) &&
                            sqjit_a64_math_intrinsic_from_native(native_callee,
                            &intrinsic, &math_nargs) &&
                            emit_member_native_closure_guard(receiver_slot, inst._arg1,
                            native_callee)) {
                            prepared_math_intrinsic[inst._arg0] = intrinsic;
                            prepared_math_nargs[inst._arg0] = math_nargs;
                            break;
                        }

                        SQClosure *callee = NULL;
                        if(!observed_member_closure(receiver_slot, inst._arg1, &callee) ||
                            !emit_member_closure_guard(receiver_slot, inst._arg1, callee)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop PREPCALLK");
                        }
                        prepared_direct_closure[inst._arg0] = callee;
                    }
                }
                break;
            case _OP_CALL:
                if(inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop CALL");
                }
                if(prepared_array_len_base[inst._arg1] >= 0) {
                    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || inst._arg3 != 1 ||
                        !emit_array_len(inst._arg0, prepared_array_len_base[inst._arg1])) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop CALL");
                    }
                    prepared_array_len_base[inst._arg1] = -1;
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
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop number conversion CALL");
                    }
                    prepared_number_conversion[inst._arg1] =
                        SQ_JIT_A64_NUMBER_CONVERSION_NONE;
                    prepared_number_conversion_base[inst._arg1] = -1;
                }
                else if(prepared_math_intrinsic[inst._arg1] != SQ_NATIVE_MATH_NONE) {
                    SQNativeMathKind intrinsic = prepared_math_intrinsic[inst._arg1];
                    SQInteger math_nargs = prepared_math_nargs[inst._arg1];
                    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || math_nargs <= 0 ||
                        inst._arg3 != math_nargs + 1 ||
                        !emit_math_call(inst._arg0, intrinsic, math_nargs,
                        inst._arg2 + 1)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop math CALL");
                    }
                    prepared_math_intrinsic[inst._arg1] = SQ_NATIVE_MATH_NONE;
                    prepared_math_nargs[inst._arg1] = 0;
                }
                else if(prepared_direct_closure[inst._arg1]) {
                    SQClosure *callee = prepared_direct_closure[inst._arg1];
                    if(!emit_inline_leaf_call(callee, inst)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop direct CALL");
                    }
                    prepared_direct_closure[inst._arg1] = NULL;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                    slots[inst._arg1].stack_object_reg >= 0 &&
                    sq_type(entry_stack[slots[inst._arg1].stack_object_reg]) == OT_CLOSURE) {
                    SQClosure *callee = _closure(entry_stack[slots[inst._arg1].stack_object_reg]);
                    if(!emit_closure_slot_guard(inst._arg1, callee) ||
                        !emit_inline_leaf_call(callee, inst)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop direct CALL");
                    }
                }
                else {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop CALL");
                }
                break;
            case _OP_COMPARITH: {
                SQInteger source = (SQInteger)(((SQUnsignedInteger)inst._arg1 &
                    0xFFFF0000u) >> 16);
                SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 &
                    0x0000FFFFu);
                SQInteger key = inst._arg2;
                SQInteger scratch = inline_scratch_base;
                SQOpcode op = _OP_ADD;
                if(source < 0 || source >= MAX_FUNC_STACKSIZE ||
                    value < 0 || value >= MAX_FUNC_STACKSIZE ||
                    key < 0 || key >= MAX_FUNC_STACKSIZE ||
                    scratch < 0 || scratch >= MAX_FUNC_STACKSIZE ||
                    !comparith_opcode(inst._arg3, &op)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop COMPARITH");
                }

                SQObjectType observed = OT_NULL;
                SQArray *observed_array = NULL;
                // Only bytecode-proven keys can become embedded constants.
                // A sampled string pointer is not proof: it may change on the
                // next iteration or invocation even when it matches a literal.
                if(!compound_keys_built) {
                    compound_keys.Build(proto, analysis, start_ip, end_ip);
                    compound_keys_built = true;
                }
                SQInteger literal = compound_keys.Literal(ip, key);
                if(literal >= 0 && sq_type(proto->_literals[literal]) != OT_INTEGER) {
                    const SQObjectPtr *member_key = &proto->_literals[literal];
                    SQInteger observed_object_ptr = 0;
                    SQObjectType receiver_type = OT_NULL;
                    SQInteger receiver_ptr = 0;
                    if(observed_shape_for_slot(source, &receiver_type, NULL,
                        &receiver_ptr) && receiver_ptr != 0) {
                        observed = sqjit_a64_observed_object_ptr_value_type(
                            receiver_ptr, receiver_type, member_key,
                            &observed_array, &observed_object_ptr);
                    }
                    else {
                        SQInteger reg = slots[source].stack_object_reg;
                        observed = sqjit_a64_observed_table_value_type(entry_stack,
                            reg, member_key, &observed_array, &observed_object_ptr);
                        if(observed == OT_NULL && reg == 0) {
                            observed = sqjit_a64_observed_root_value_type(root_object,
                                member_key, &observed_array, &observed_object_ptr);
                        }
                    }
                    lookup_member_shape(source, literal, &observed,
                        &observed_array, &observed_object_ptr);
                    // Overloaded arithmetic and callbacks retain VM semantics.
                    // Compute privately before publishing the result, preserving
                    // aliased receiver/key/RHS slots until the logged store.
                    if((observed != OT_INTEGER && observed != OT_FLOAT) ||
                        !emit_member_get_key(scratch, source, member_key, observed,
                            NULL, 0)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP,
                            "unsupported loop COMPARITH member get");
                    }
                    if(slot_is_float(scratch) || slot_observed_is_float(value)) {
                        if(!emit_float_binary(op, scratch, scratch, value) ||
                            !emit_member_set_float_key(inst._arg0, source,
                                member_key, scratch, source == 0)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP,
                                "unsupported loop COMPARITH float member");
                        }
                    }
                    else if(!emit_binary(op, scratch, scratch, value) ||
                        !emit_member_set_integer_key(inst._arg0, source,
                            member_key, scratch, source == 0)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP,
                            "unsupported loop COMPARITH integer member");
                    }
                    if(inst._arg0 != source) remember_member_shape(source, literal, scratch);
                    break;
                }
                if(slots[key].known_const) {
                    if(slots[source].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            slots[source].array_ptr_observed, slots[key].const_value,
                            &observed_array);
                    }
                    else {
                        SQInteger observed_reg = slots[source].stack_object_reg;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, slots[key].const_value);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                slots[key].const_value, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    if(!emit_array_get_const(scratch, source, slots[key].const_value,
                        observed, observed_array)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop COMPARITH get");
                    }
                }
                    else {
                        SQInteger observed_index = 0;
                        if(sq_type(entry_stack[key]) == OT_INTEGER) {
                            observed_index = _integer(entry_stack[key]);
                        }
                        SQInteger observed_object_ptr = 0;
                        if(slots[source].kind == SQ_JIT_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                slots[source].array_ptr_observed, observed_index,
                                &observed_array, &observed_object_ptr);
                        }
                        else {
                            SQInteger observed_reg = slots[source].stack_object_reg;
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, observed_index, &observed_array,
                                &observed_object_ptr);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                observed_index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    if(!emit_array_get_dynamic(scratch, source, key, observed,
                        observed_array, observed_object_ptr)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop COMPARITH get");
                    }
                }

                if(slot_is_float(scratch) || slot_observed_is_float(value)) {
                    if(!emit_float_binary(op, scratch, scratch, value) ||
                        !emit_array_set_float(inst._arg0, source, key, scratch)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop COMPARITH float");
                    }
                }
                else if(!emit_binary(op, scratch, scratch, value) ||
                    !emit_array_set_integer(inst._arg0, source, key, scratch)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop COMPARITH integer");
                }
                break;
            }
            case _OP_SET:
                {
                SQInteger key_literal = literal_index_for_object_ptr_slot(inst._arg2);
                if(key_literal >= 0 &&
                    sq_type(proto->_literals[key_literal]) != OT_INTEGER) {
                    if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                        slots[inst._arg3].kind == SQ_JIT_SLOT_BOOL) {
                        if(!emit_member_set_bool_key(inst._arg0, inst._arg1,
                            &proto->_literals[key_literal], inst._arg3, inst._arg1 == 0)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop bool member SET");
                        }
                    }
                    else if(slot_is_float(inst._arg3)) {
                        if(!emit_member_set_float_key(inst._arg0, inst._arg1,
                            &proto->_literals[key_literal], inst._arg3, inst._arg1 == 0)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop float member SET");
                        }
                    }
                    else {
                        SQObjectType value_type = OT_NULL;
                        SQArray *value_array = NULL;
                        SQInteger value_object_ptr = 0;
                        bool value_can_be_object =
                            inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                            slots[inst._arg3].kind == SQ_JIT_SLOT_STACK_OBJECT;
                        if(!value_can_be_object &&
                            observed_shape_for_slot(inst._arg3, &value_type,
                            &value_array, &value_object_ptr)) {
                            value_can_be_object = value_type == OT_ARRAY ||
                                sqjit_a64_type_is_object_ptr(value_type);
                        }
                        if(value_can_be_object) {
                            if(!emit_member_set_reference_key(inst._arg0, inst._arg1,
                                &proto->_literals[key_literal], inst._arg3, inst._arg1 == 0))
                                return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop object member SET");
                        }
                        else if(!emit_member_set_integer_key(inst._arg0,
                            inst._arg1, &proto->_literals[key_literal],
                            inst._arg3, inst._arg1 == 0)) {
                            return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop integer member SET");
                        }
                    }
                    remember_member_shape(inst._arg1, key_literal, inst._arg3);
                    break;
                }
                bool dynamic_member_key = inst._arg2 >= 0 &&
                    inst._arg2 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg2].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                    slots[inst._arg2].stack_object_reg >= 0;
                bool dynamic_member_base = inst._arg1 >= 0 &&
                    inst._arg1 < MAX_FUNC_STACKSIZE &&
                    (slots[inst._arg1].kind == SQ_JIT_SLOT_STACK_OBJECT ||
                    slots[inst._arg1].kind == SQ_JIT_SLOT_OBJECT_PTR);
                if(dynamic_member_key && dynamic_member_base &&
                    !(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg3].kind == SQ_JIT_SLOT_BOOL) &&
                    !slot_is_float(inst._arg3)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop dynamic member SET");
                }
                else if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slots[inst._arg3].kind == SQ_JIT_SLOT_BOOL) {
                    if(!emit_array_set_bool(inst._arg0, inst._arg1, inst._arg2,
                        inst._arg3)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop SET");
                    }
                }
                else if(slot_is_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2,
                        inst._arg3)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop SET");
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2,
                    inst._arg3)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop SET");
                }
                }
                break;
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_observed_is_float(inst._arg1) ||
                    slot_observed_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop float arithmetic operands");
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop integer arithmetic operands");
                }
                break;
            case _OP_NEG:
                if(slot_is_float(inst._arg1)) {
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
                slots[inst._arg1].entry_loaded = true;
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
                    slots[inst._arg0].entry_loaded = slots[inst._arg1].entry_loaded;
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
                slots[inst._arg1].entry_loaded = true;
                break;
            }
            case _OP_EQ:
            case _OP_NE: {
                if(!ensure_int_slot(inst._arg2) ||
                    (inst._arg3 == 0 && !ensure_int_slot(inst._arg1)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2))) {
                    return false;
                }
                bool rhs_entry_loaded = false;
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else {
                    if(!sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg1))) {
                        return false;
                    }
                    rhs_entry_loaded = slots[inst._arg1].entry_loaded;
                }
                if(!sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_cset(&buf, 9, inst.op == _OP_NE ? SQ_JIT_A64_NE : SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                slots[inst._arg0].entry_loaded = slots[inst._arg2].entry_loaded || rhs_entry_loaded;
                break;
            }
            case _OP_JZ: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(!ensure_word_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, true, SQ_JIT_A64_EQ)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop JZ");
                }
                if(ip == header_ip && !emit_mark_body_entered()) {
                    return false;
                }
                break;
            }
            case _OP_JCMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                unsigned false_cond = 0;
                if(!sqjit_a64_cmp_false_cond((CmpOP)inst._arg3, &false_cond)) {
                    return false;
                }
                if(!hoist_supplies_slot(inst._arg0) &&
                    !hoist_supplies_slot(inst._arg2) &&
                    (slot_is_float(inst._arg0) || slot_is_float(inst._arg2))) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_a64_emit_ldr_float(&buf, 0, 31, sqjit_a64_local_disp(inst._arg2)) ||
                        !sqjit_a64_emit_ldr_float(&buf, 1, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !sqjit_a64_emit_fcmp_float(&buf, 0, 1) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                        !record_branch(patch_offset, target_ip, true, false_cond)) {
                        return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop float JCMP");
                    }
                }
                else if(!emit_loop_int_operand(9, inst._arg2) ||
                    !emit_loop_int_operand(10, inst._arg0) ||
                    !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, true, false_cond)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop JCMP");
                }
                if(ip == header_ip && !emit_mark_body_entered()) {
                    return false;
                }
                break;
            }
            case _OP_JMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(!sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, false, 0)) {
                    return attempt.Reject(ip, SQ_JIT_REJECT_LOOP, "unsupported loop JMP");
                }
                break;
            }
            default:
                return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, sqjit_a64_unsupported_loop_opcode_reason(inst.op));
        }
        typeflow.Record(ip, slots);
    }
    if(!typeflow.Validate(proto, entry_stack))
        return attempt.Reject(-1, SQ_JIT_REJECT_OTHER, "incompatible scalar types at branch join");

    auto emit_refcounted_stack_store_scalar = [&](SQInteger stack_slot) -> bool {
        if(stack_slot < 0 || stack_slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        const void *helper = NULL;
        if(slots[stack_slot].kind == SQ_JIT_SLOT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_store_stack_float;
        }
        else if(slots[stack_slot].kind == SQ_JIT_SLOT_BOOL) {
            helper = (const void *)sqjit_a64_helper_store_stack_bool;
        }
        else if(slots[stack_slot].kind == SQ_JIT_SLOT_INT) {
            helper = (const void *)sqjit_a64_helper_store_stack_integer;
        }
        else {
            return false;
        }

        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_slot)) {
            return false;
        }
        if(slots[stack_slot].kind == SQ_JIT_SLOT_FLOAT) {
            if(!sqjit_a64_emit_add_imm(&buf, 2, 31,
                sqjit_a64_local_disp(stack_slot))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 2, 31,
            sqjit_a64_local_disp(stack_slot))) {
            return false;
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)helper) &&
            sqjit_a64_emit_blr_x16(&buf);
    };

    SQInteger exit_offset = buf.size;
    SQInteger skip_writeback_patch = 0;
    if(!sqjit_a64_emit_ldr_x(&buf, 9, 31,
        sqjit_a64_local_disp(body_entered_slot)) ||
        !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
        !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ,
        &skip_writeback_patch)) {
        return false;
    }
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!slots[n].dirty) {
            continue;
        }
        if(slots[n].kind == SQ_JIT_SLOT_ARRAY_PTR ||
            slots[n].kind == SQ_JIT_SLOT_OBJECT_PTR) {
            if(analysis.live_in[exit_ip].test(n)) {
                return false;
            }
            continue;
        }
        if(!slots[n].entry_loaded) {
            if(analysis.live_in[exit_ip].test(n)) {
                return false;
            }
            continue;
        }
        // A temporary's entry tag can change between native invocations even
        // when all live scalar inputs satisfy their guards. Assign through
        // SQObjectPtr so an overwritten reference is released using its
        // current tag, not the value sampled during compilation.
        if(!emit_refcounted_stack_store_scalar(n)) {
            return false;
        }
    }
    SQInteger writeback_done_offset = buf.size;
    if(!sqjit_a64_patch_branch(&buf, skip_writeback_patch,
        writeback_done_offset, true, SQ_JIT_A64_EQ)) {
        return false;
    }
    if(!sqjit_a64_emit_mov_imm_x(&buf, 9, exit_ip) ||
        !sqjit_a64_emit_str_x(&buf, 9, 20, 0) ||
        !emit_write_log_release(false) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
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
    for(SQInteger n = 0; n < nexit_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, exit_relocs[n].patch_offset, exit_offset,
            exit_relocs[n].conditional, exit_relocs[n].cond)) {
            return false;
        }
    }
    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size,
        SQ_JIT_NATIVE_GUARD_FAILED)) {
        return false;
    }
    for(SQInteger n = 0; n < nguard_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, guard_relocs[n].patch_offset,
            guard_fail_offset, true, guard_relocs[n].cond)) {
            return false;
        }
    }

    // A later inlined callee may defeat the whole-region proof after an
    // unused receiver was lowered. Re-emit once without either optimization;
    // no executable mapping has been installed and no VM effect has occurred.
    if(copied_unused_receiver && !scalar_guard_region)
        return compile_loop(proto, entry_stack, closure, start_ip, header_ip,
            end_ip, exit_ip, code, attempt, false);

    if(entry_guard_jump >= 0) {
        // Keep original sites available if a later callee defeats the proof or
        // optional entry guards would exhaust the emission buffer. Deduplicate
        // equal fixed receiver/key/lifetime guards across repeated call sites.
        std::vector<SQInteger> unique;
        SQInteger extra = 4 + (SQInteger)unused_receiver_destinations.count() * 8;
        if(scalar_guard_region) for(SQInteger n = 0; n < (SQInteger)entry_closure_guards.size(); ++n) {
            const EntryClosureGuard &g = entry_closure_guards[n];
            bool found = false;
            for(SQInteger u : unique) {
                const EntryClosureGuard &p = entry_closure_guards[u];
                if(g.reg == p.reg && g.literal == p.literal &&
                    g.witness == p.witness && g.type == p.type) { found = true; break; }
            }
            if(!found) { unique.push_back(n); extra += g.end - g.begin; }
        }
        if((!unique.empty() || copied_unused_receiver) && extra <= (SQInteger)sizeof(buf.bytes) - buf.size) {
            const SQInteger entry_checks = buf.size;
            // Eliding an unused receiver must not defer a final release until
            // scalar writeback. Reject every owning old destination before any
            // loop effect, including physical owners supplied by ancestor logs.
            for(SQInteger slot = 0; slot < proto->_stacksize; ++slot) {
                if(!unused_receiver_destinations.test(slot)) continue;
                SQInteger owning;
                if(!sqjit_a64_emit_ldr_w(&buf, 9, 19, sqjit_a64_stack_type_disp(slot)) ||
                    !sqjit_a64_emit_test_branch(&buf, 9, SQ_JIT_A64_REF_COUNTED_BIT, true, &owning) ||
                    !sqjit_a64_patch_test_branch(&buf, owning, guard_fail_offset)) return false;
            }
            for(SQInteger u : unique) {
                const EntryClosureGuard &g = entry_closure_guards[u];
                SQInteger copy = buf.size;
                memcpy(buf.bytes + copy, buf.bytes + g.begin, (size_t)(g.end - g.begin));
                buf.size += g.end - g.begin;
                if(!sqjit_a64_patch_branch(&buf, copy + g.failure - g.begin,
                    guard_fail_offset, true, SQ_JIT_A64_EQ)) return false;
            }
            SQInteger back;
            if(!sqjit_a64_emit_b_placeholder(&buf, &back) ||
                !sqjit_a64_patch_branch(&buf, back, loop_entry_offset, false, 0) ||
                !sqjit_a64_patch_branch(&buf, entry_guard_jump, entry_checks, false, 0)) return false;
            for(const EntryClosureGuard &g : entry_closure_guards)
                if(!sqjit_a64_patch_branch(&buf, g.begin, g.end, false, 0)) return false;
            if(sqjit_diag_trace_enabled(proto))
                scprintf(_SC("[sqjit:a64] loop entry closure guards proto '%s' sites=%d unique=%d\n"),
                    sqjit_a64_proto_name(proto), (SQInt32)entry_closure_guards.size(), (SQInt32)unique.size());
        }
        else if(copied_unused_receiver) {
            // Unlike optional identity hoisting, destination-release guards are
            // mandatory for this lowering. No space means the prior fallback.
            return compile_loop(proto, entry_stack, closure, start_ip, header_ip,
                end_ip, exit_ip, code, attempt, false);
        }
        else if(!sqjit_a64_patch_branch(&buf, entry_guard_jump, loop_entry_offset, false, 0)) return false;
    }

    if(scalar_guard_region) sqjit_a64_forward_local_slots(&buf,MAX_FUNC_STACKSIZE,
        float_copy_offsets.data(),(SQInteger)float_copy_offsets.size());

    if(!code->Install(buf.bytes, buf.size))
        return attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "executable memory installation failed");
    if(root_object) code->RetainWeakReference(closure->_root);
    for(const SQObjectPtr &witness : closure_witnesses) code->RetainWeakReference(_weakref(witness));
    return true;
}

SQJitCompileResult sqjit_backend_compile_loop(SQFunctionProto *proto,
    SQObjectPtr *stack, SQClosure *closure, SQInteger start, SQInteger header,
    SQInteger end, SQInteger exit, SQJitProto *jit, SQJitCode *destination)
{
    SQJitCompileAttempt attempt(proto, SQ_JIT_BACKEND_AARCH64);
    if(destination && destination->Entry())
        return attempt.Finish(attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "loop destination must be empty"));
    return attempt.Finish(compile_loop(proto, stack, closure, start, header,
        end, exit, jit ? (destination ? destination : &jit->_loop_code) : NULL, attempt));
}
