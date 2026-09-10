#include "sqpcheader.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqfuncproto.h"
#include "sqbytecode.h"
#include "sqjit_backend_x64_memory.h"
#include "sqjit_backend_x64_helpers.h"
#include <stddef.h>

SQJitX64Memory::SQJitX64Memory(SQFunctionProto *proto, SQObjectPtr *entry,
    SQJitNativeCodeBuffer &buf, SQJitSlotState *slots,
    const SQBytecodeAnalysis &analysis, SQInteger last, bool loop,
    Ensure ensure_int, Guard guard, const SQJitVirtualArrayPlan *virtual_arrays,
    SQInteger virtual_base, Ensure ensure_float, const SQJitMemberPlan *members, SQInteger member_base)
    : _proto(proto), _entry(entry), _buf(buf), _slots(slots), _analysis(analysis),
      _last(last), _loop(loop), _ensure_int(ensure_int), _guard(guard), _observed_arrays{},
      _checked_array_types{}, _checked_array_lengths{}, _virtual_arrays(virtual_arrays),
      _virtual_base(virtual_base), _virtual_counts{}, _virtual_types{}, _ensure_float(ensure_float), _members(members), _member_base(member_base) {}

bool SQJitX64Memory::VirtualNew(SQInteger ip)
{
    SQInteger reg = _proto->_instructions[ip]._arg0;
    const SQJitVirtualArrayPlan::Array *a = _virtual_arrays ? _virtual_arrays->At(ip,reg) : NULL;
    if(!a || a->create != ip) return false;
    _virtual_counts[reg] = 0;
    _slots[reg].Reset();
    _slots[reg].kind = SQ_JIT_SLOT_VIRTUAL_ARRAY;
    _slots[reg].dirty = true;
    return true;
}

bool SQJitX64Memory::VirtualAppend(SQInteger ip)
{
    const SQInstruction &i = _proto->_instructions[ip];
    const SQJitVirtualArrayPlan::Array *a = _virtual_arrays ? _virtual_arrays->At(ip,i._arg0) : NULL;
    if(!a || _slots[i._arg0].kind != SQ_JIT_SLOT_VIRTUAL_ARRAY || _virtual_counts[i._arg0] >= a->elements) return false;
    SQInteger field = a->first_slot + _virtual_counts[i._arg0]++;
    SQInteger dst = _virtual_base + field;
    SQJitSlotKind kind = SQ_JIT_SLOT_INT;
    if(i._arg2 == AAT_STACK) {
        SQInteger src = i._arg1;
        kind = _slots[src].kind;
        if(kind == SQ_JIT_SLOT_STACK_OBJECT) {
            SQInteger reg = _slots[src].stack_object_reg;
            if(reg < 0) return false;
            kind = sq_type(_entry[reg]) == OT_FLOAT ? SQ_JIT_SLOT_FLOAT :
                sq_type(_entry[reg]) == OT_INTEGER ? SQ_JIT_SLOT_INT : SQ_JIT_SLOT_UNKNOWN;
        }
        if(kind == SQ_JIT_SLOT_FLOAT) {
            if(!_ensure_float(src) || !sqjit_native_emit_mov_xmm0_local_float(&_buf,src) ||
                !sqjit_native_emit_mov_local_float_xmm0(&_buf,dst)) return false;
        }
        else if((kind != SQ_JIT_SLOT_INT && kind != SQ_JIT_SLOT_BOOL) ||
            (kind == SQ_JIT_SLOT_INT && !_ensure_int(src)) ||
            !sqjit_native_emit_mov_rax_mem(&_buf,src) || !sqjit_native_emit_mov_mem_rax(&_buf,dst)) return false;
    }
    else if(i._arg2 == AAT_INT || i._arg2 == AAT_BOOL) {
        kind = i._arg2 == AAT_BOOL ? SQ_JIT_SLOT_BOOL : SQ_JIT_SLOT_INT;
        if(!sqjit_native_emit_mov_mem_imm32(&_buf,dst,i._arg1)) return false;
    }
    else if(i._arg2 == AAT_LITERAL && i._arg1 >= 0 && i._arg1 < _proto->_nliterals) {
        const SQObjectPtr &v = _proto->_literals[i._arg1];
        if(sq_type(v) == OT_FLOAT) {
            kind = SQ_JIT_SLOT_FLOAT;
            if(!sqjit_native_emit_mov_local_float_const(&_buf,dst,_float(v))) return false;
        }
        else if(sq_type(v) != OT_INTEGER || !sqjit_native_emit_mov_rax_imm64(&_buf,_integer(v)) ||
            !sqjit_native_emit_mov_mem_rax(&_buf,dst)) return false;
    }
    else return false;
    _virtual_types[field] = kind;
    return true;
}

static SQInteger check_numeric_array(SQObjectPtr *stack, SQInteger slot,
    SQInteger length, SQInteger type)
{
    if(sq_type(stack[slot]) != OT_ARRAY) return 0;
    SQArray *array = _array(stack[slot]);
    if(array->Size() != length) return 0;
    for(SQInteger n=0; n<length; ++n) if(sq_type(array->_values[n]) != type) return 0;
    return 1;
}

bool SQJitX64Memory::HoistArrayGuards(SQInteger first)
{
    SQSlotSet written;
    bool has_loop = false;
    for(SQInteger ip=first; ip<=_last; ++ip) {
        const SQBytecodeFacts &f = _analysis.facts[ip];
        // No path can resize, replace, mutate or expose the guarded arrays.
        // Also exclude callbacks/metamethods; supported arithmetic is guarded
        // scalar arithmetic and never invokes them inside native code.
        SQOpcode op = (SQOpcode)_proto->_instructions[ip].op;
        if(!sqjit_native_scalar_opcode(op) && op != _OP_GET && op != _OP_GETK &&
            op != _OP_JMP && op != _OP_JZ && op != _OP_JCMP && op != _OP_RETURN) return true;
        has_loop |= f.target >= first && f.target <= ip;
        written |= f.writes;
    }
    if(!has_loop) return true; // Amortize the complete entry scan across a loop.
    for(SQInteger ip=first; ip<=_last; ++ip) {
        const SQInstruction &i = _proto->_instructions[ip];
        if(i.op != _OP_GET || written.test(i._arg1) || _checked_array_types[i._arg1] ||
            sq_type(_entry[i._arg1]) != OT_ARRAY) continue;
        SQArray *array = _array(_entry[i._arg1]);
        SQInteger length = array->Size();
        if(length <= 0 || length > 16) continue; // Bound entry cost and code specialization.
        SQObjectType type = sq_type(array->_values[0]);
        if(type != OT_INTEGER && type != OT_FLOAT) continue;
        bool homogeneous = true;
        for(SQInteger n=1; n<length; ++n) homogeneous &= sq_type(array->_values[n]) == type;
        if(!homogeneous) continue;
        if(!sqjit_native_emit_mov_rdi_r13(&_buf) ||
            !sqjit_native_emit_mov_rsi_i64(&_buf, i._arg1) ||
            !sqjit_native_emit_mov_rdx_i64(&_buf, length) ||
            !sqjit_native_emit_mov_rcx_imm64(&_buf, type) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)check_numeric_array) ||
            !sqjit_native_emit_call_rax(&_buf) || !sqjit_native_emit_test_rax_rax(&_buf) ||
            !_guard(SQ_JIT_JCC_E)) return false;
        _checked_array_types[i._arg1] = type;
        _checked_array_lengths[i._arg1] = length;
    }
    return true;
}

bool SQJitX64Memory::TemporaryStringKey(SQInteger ip, SQInteger slot) const
{
    // A borrowed string stays inside one basic block and is used only as a
    // table key. Loop writes retain overwritten owners in the rollback log.
    // Calls, allocations, live-outs and general object copies need ownership
    // machinery of their own and are deliberately outside this path.
    if(!_loop) return false;
    bool used = false;
    for(SQInteger n = ip + 1; n <= _last; ++n) {
        const SQInstruction &i = _proto->_instructions[n];
        const SQBytecodeFacts &f = _analysis.facts[n];
        if(_analysis.leaders[n] || f.target >= 0 || !f.fallthrough ||
            (f.effects & SQ_BC_OUTER) || i.op == _OP_NEWOBJ || i.op == _OP_APPENDARRAY ||
            i.op == _OP_CALL || i.op == _OP_TAILCALL)
            return used && !_analysis.live_in[n].test(slot);
        if(f.reads.test(slot)) {
            if((i.op != _OP_GET && i.op != _OP_SET) || i._arg2 != slot ||
                i._arg1 == slot || (i.op == _OP_SET && i._arg3 == slot)) return false;
            used = true;
        }
        if(f.kills.test(slot)) return used;
    }
    return used && !_analysis.live_in[_last + 1].test(slot);
}

bool SQJitX64Memory::BorrowedReadsSafe() const
{
    if(_loop) return true; // Displaced owners are retained by the loop undo log.
    // Whole-function native locals borrow from unchanged VM stack owners.
    // Array creation/append currently writes VM slots directly, so exclude
    // those paths until their owners are tracked by the native frame as well.
    for(SQInteger ip=0; ip<=_last; ++ip) {
        SQOpcode op=(SQOpcode)_proto->_instructions[ip].op;
        if(op==_OP_NEWOBJ || op==_OP_APPENDARRAY) return false;
    }
    return true;
}

bool SQJitX64Memory::ArrayGet(SQInteger ip, SQInteger dst, SQInteger base,
    SQInteger key, bool constant, SQInteger index)
{
    if(dst < 0 || dst >= _proto->_stacksize || base < 0 || base >= _proto->_stacksize)
        return false;
    const SQJitSlotState source = _slots[base];
    if(source.kind == SQ_JIT_SLOT_VIRTUAL_ARRAY) {
        const SQJitVirtualArrayPlan::Array *a = _virtual_arrays->At(ip,base);
        SQInteger index;
        if(!a || !SQJitVirtualArrayPlan::Index(_proto,_analysis,ip,base,index) ||
            index < 0 || index >= _virtual_counts[base]) return false;
        SQInteger field = a->first_slot + index, src = _virtual_base + field;
        SQJitSlotKind kind = _virtual_types[field];
        if(kind == SQ_JIT_SLOT_FLOAT) {
            if(!sqjit_native_emit_mov_xmm0_local_float(&_buf,src) ||
                !sqjit_native_emit_mov_local_float_xmm0(&_buf,dst)) return false;
        }
        else if(!sqjit_native_emit_mov_rax_mem(&_buf,src) || !sqjit_native_emit_mov_mem_rax(&_buf,dst)) return false;
        _slots[dst].MarkScalar(kind,_loop);
        _slots[dst].entry_loaded = _loop;
        return true;
    }
    if(source.kind != SQ_JIT_SLOT_STACK_OBJECT && source.kind != SQ_JIT_SLOT_ARRAY_PTR)
        return false;
    if(source.kind == SQ_JIT_SLOT_STACK_OBJECT && source.stack_object_reg < 0) return false;

    SQObjectType type = OT_INTEGER;
    SQArray *array = source.kind == SQ_JIT_SLOT_ARRAY_PTR ? _observed_arrays[base] : NULL;
    if(source.kind == SQ_JIT_SLOT_STACK_OBJECT &&
        sq_type(_entry[source.stack_object_reg]) == OT_ARRAY) {
        array = _array(_entry[source.stack_object_reg]);
    }
    SQInteger sample = constant ? index : 0;
    SQArray *nested = NULL;
    if(array) {
        // Sampling chooses a representation, never establishes a fact: each
        // execution checks the receiver, bounds and the actual element tag.
        if(sample >= 0 && sample < array->Size()) {
            type = sq_type(array->_values[sample]);
            if(type == OT_ARRAY) nested = _array(array->_values[sample]);
        }
    }
    if(type != OT_INTEGER && type != OT_FLOAT && !(type == OT_ARRAY && BorrowedReadsSafe()) &&
        !(type == OT_STRING && TemporaryStringKey(ip, dst))) return false;
    const bool checked = source.kind == SQ_JIT_SLOT_STACK_OBJECT &&
        _checked_array_types[source.stack_object_reg] == type;

    if(constant) {
        if(!sqjit_native_emit_mov_rcx_imm64(&_buf, index)) return false;
    }
    else if(!_ensure_int(key) || !sqjit_native_emit_mov_rcx_mem(&_buf, key)) return false;

    if(source.kind == SQ_JIT_SLOT_STACK_OBJECT) {
        if(!checked && (!sqjit_native_emit_cmp_stack_type_i32(&_buf, source.stack_object_reg, OT_ARRAY) ||
            !_guard(SQ_JIT_JCC_NE))) return false;
        if(!sqjit_native_emit_mov_rax_stack_value(&_buf, source.stack_object_reg)) return false;
    }
    else if(!sqjit_native_emit_mov_rax_mem(&_buf, base)) return false;

    auto byte = [&](unsigned char b) { return sqjit_native_emit_u8(&_buf, b); };
    auto disp = [&](SQInteger d) { return sqjit_native_emit_i32(&_buf, d); };
    // Unsigned >= rejects negative indices as well. A constant in a guarded
    // array's range needs no per-access bounds check.
    SQInteger length = checked ? _checked_array_lengths[source.stack_object_reg] : 0;
    if(!(checked && constant && index >= 0 && index < length)) {
        if(checked) {
            if(!sqjit_native_emit_cmp_rcx_i32(&_buf, length)) return false;
        }
        else if(!byte(0x48) || !byte(0x3b) || !byte(0x88) || !disp(SQArray::RawSizeOffset())) return false;
        if(!_guard(SQ_JIT_JCC_AE)) return false;
    }
    if(
        // mov rax,[rax+values]; imul rcx,rcx,sizeof(SQObjectPtr); add rax,rcx
        !byte(0x48) || !byte(0x8b) || !byte(0x80) || !disp(SQArray::RawValuesOffset()) ||
        !byte(0x48) || !byte(0x69) || !byte(0xc9) || !disp(sizeof(SQObjectPtr)) ||
        !byte(0x48) || !byte(0x01) || !byte(0xc8)) return false;
    // Weak references and mixed arrays keep the per-element check.
    if(!checked && (!byte(0x81) || !byte(0xb8) || !disp(offsetof(SQObject, _type)) ||
        !disp(type) || !_guard(SQ_JIT_JCC_NE))) return false;
    if(type == OT_FLOAT) {
        if(!byte(sizeof(SQFloat) == 8 ? 0xf2 : 0xf3) || !byte(0x0f) || !byte(0x10) ||
            !byte(0x80) || !disp(offsetof(SQObject, _unVal)) ||
            !sqjit_native_emit_mov_local_float_xmm0(&_buf, dst)) return false;
        _slots[dst].MarkScalar(SQ_JIT_SLOT_FLOAT, _loop);
    }
    else {
        if(!byte(0x48) || !byte(0x8b) || !byte(0x80) || !disp(offsetof(SQObject, _unVal)) ||
            !sqjit_native_emit_mov_mem_rax(&_buf, dst)) return false;
        _slots[dst].MarkScalar(SQ_JIT_SLOT_INT, _loop);
        if(type == OT_ARRAY) _slots[dst].kind = SQ_JIT_SLOT_ARRAY_PTR;
        if(type == OT_STRING) _slots[dst].kind = SQ_JIT_SLOT_STRING_PTR;
    }
    _slots[dst].entry_loaded = _loop;
    _observed_arrays[dst] = nested;
    return true;
}

bool SQJitX64Memory::HelperResult(SQInteger dst)
{
    if(!sqjit_native_emit_call_rax(&_buf) || !sqjit_native_emit_test_rax_rax(&_buf) ||
        !_guard(SQ_JIT_JCC_E)) return false;
    if(dst != 0xff) {
        if(!sqjit_native_sync_pinned_slot_from_local(&_buf, dst)) return false;
        _slots[dst].MarkScalar(SQ_JIT_SLOT_INT, _loop);
        _slots[dst].entry_loaded = _loop;
    }
    return true;
}

bool SQJitX64Memory::ArraySet(SQInteger dst, SQInteger base, SQInteger key, SQInteger value,
    SQInteger log, bool floating, bool constant, SQInteger index)
{
    if(base<0 || base>=_proto->_stacksize || value<0 || value>=_proto->_stacksize ||
        (!constant && !_ensure_int(key)) ||
        (floating ? !_ensure_float(value) : !_ensure_int(value))) return false;
    if(!sqjit_native_emit_lea_rdi_mem(&_buf,log)) return false;
    const SQJitSlotState &source=_slots[base];
    if(source.kind==SQ_JIT_SLOT_STACK_OBJECT && source.stack_object_reg>=0) {
        if(!sqjit_native_emit_mov_rsi_r13(&_buf) ||
            !sqjit_native_emit_mov_rdx_i64(&_buf,source.stack_object_reg) ||
            !(constant ? sqjit_native_emit_mov_rcx_imm64(&_buf,index) : sqjit_native_emit_mov_rcx_mem(&_buf,key)) ||
            !(floating ? sqjit_native_emit_lea_r8_mem(&_buf,value) : sqjit_native_emit_mov_r8_mem(&_buf,value)) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf,floating ?
                (const void *)sqjit_helper_array_set_float_logged : (const void *)sqjit_helper_array_set_integer_logged)) return false;
    }
    else if(source.kind==SQ_JIT_SLOT_ARRAY_PTR) {
        if(!sqjit_native_emit_mov_rsi_mem(&_buf,base) ||
            !(constant ? sqjit_native_emit_mov_rdx_i64(&_buf,index) : sqjit_native_emit_mov_rdx_mem(&_buf,key)) ||
            !(floating ? sqjit_native_emit_lea_rcx_mem(&_buf,value) : sqjit_native_emit_mov_rcx_mem(&_buf,value)) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf,floating ?
                (const void *)sqjit_helper_array_ptr_set_float_logged : (const void *)sqjit_helper_array_ptr_set_integer_logged)) return false;
    }
    else return false;
    if(!HelperResult(0xff)) return false;
    if(dst==0xff) return true;
    if(floating) {
        if(!sqjit_native_emit_mov_xmm0_local_float(&_buf,value) ||
            !sqjit_native_emit_mov_local_float_xmm0(&_buf,dst)) return false;
    }
    else if(!sqjit_native_emit_mov_rax_mem(&_buf,value) || !sqjit_native_emit_mov_mem_rax(&_buf,dst)) return false;
    _slots[dst].MarkScalar(floating ? SQ_JIT_SLOT_FLOAT : SQ_JIT_SLOT_INT,_loop);
    _slots[dst].entry_loaded=_loop;
    return true;
}

SQInteger SQJitX64Memory::MemberCell(SQInteger base, SQInteger literal) const
{
    if(!_members || base < 0 || base >= _proto->_stacksize ||
        _slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT) return -1;
    SQInteger index = _members->Find(_slots[base].stack_object_reg, literal);
    // Logical frame slots grow downwards. A C++ cell starts at its last word.
    return index < 0 ? -1 : _member_base + (index + 1) * SQJitMemberPlan::CELL_WORDS - 1;
}

bool SQJitX64Memory::HasMember(SQInteger base, SQInteger literal) const
{
    return MemberCell(base, literal) >= 0;
}

bool SQJitX64Memory::HoistMembers()
{
    if(!_members) return true;
    for(SQUnsignedInteger n = 0; n < _members->fields.size(); ++n) {
        const SQJitMemberPlan::Field &field = _members->fields[n];
        SQInteger cell = _member_base + (n + 1) * SQJitMemberPlan::CELL_WORDS - 1;
        if(!sqjit_native_emit_mov_rdi_r13(&_buf) ||
            !sqjit_native_emit_mov_rsi_i64(&_buf, field.base) ||
            !sqjit_native_emit_mov_rdx_i64(&_buf, (SQInteger)(intptr_t)&_proto->_literals[field.literal]) ||
            !sqjit_native_emit_lea_rcx_mem(&_buf, cell) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_member_cell_init) ||
            !HelperResult(0xff)) return false;
    }
    return true;
}

bool SQJitX64Memory::MemberSetLiteral(SQInteger dst, SQInteger base, SQInteger literal,
    SQInteger value, SQInteger log)
{
    SQInteger cell = MemberCell(base, literal);
    if(cell < 0 || value < 0 || value >= _proto->_stacksize) return false;
    SQJitSlotKind kind = _slots[value].kind;
    if(kind == SQ_JIT_SLOT_STACK_OBJECT && _slots[value].stack_object_reg >= 0) {
        SQInteger source = _slots[value].stack_object_reg;
        SQObjectType observed = sq_type(_entry[source]);
        if(observed == OT_ARRAY || observed == OT_STRING) {
            if(!BorrowedReadsSafe() || !sqjit_native_emit_cmp_stack_type_i32(&_buf, source, observed) ||
                !_guard(SQ_JIT_JCC_NE) || !sqjit_native_emit_mov_rax_stack_value(&_buf, source) ||
                !sqjit_native_emit_mov_mem_rax(&_buf, value)) return false;
            kind = observed == OT_ARRAY ? SQ_JIT_SLOT_ARRAY_PTR : SQ_JIT_SLOT_STRING_PTR;
            _slots[value].MarkScalar(SQ_JIT_SLOT_INT, _loop);
            _slots[value].kind = kind;
            _slots[value].entry_loaded = _loop;
            if(observed == OT_ARRAY) _observed_arrays[value] = _array(_entry[source]);
        }
    }
    if(kind == SQ_JIT_SLOT_STACK_OBJECT && _slots[value].stack_object_reg >= 0)
        kind = sq_type(_entry[_slots[value].stack_object_reg]) == OT_FLOAT ? SQ_JIT_SLOT_FLOAT : SQ_JIT_SLOT_INT;
    SQObjectType type = kind == SQ_JIT_SLOT_ARRAY_PTR ? OT_ARRAY : kind == SQ_JIT_SLOT_STRING_PTR ? OT_STRING :
        kind == SQ_JIT_SLOT_INT ? OT_INTEGER : kind == SQ_JIT_SLOT_FLOAT ? OT_FLOAT : OT_NULL;
    bool owner = type == OT_ARRAY || type == OT_STRING;
    if(type == OT_NULL || (owner && !BorrowedReadsSafe()) ||
        (type == OT_INTEGER && !_ensure_int(value)) || (type == OT_FLOAT && !_ensure_float(value)) ||
        !sqjit_native_flush_float_cache(&_buf)) return false;
    auto byte = [&](unsigned char b) { return sqjit_native_emit_u8(&_buf, b); };
    auto disp = [&](SQInteger d) { return sqjit_native_emit_i32(&_buf, d); };
    auto local = [&](size_t offset) { return cell - (SQInteger)(offset / sizeof(SQInteger)); };
    if(owner) {
        // A cached undo owner proves physical liveness, not another program
        // owner. Reference writes still need the shared release-effect check.
        if(!sqjit_native_emit_lea_rdi_mem(&_buf, log) || !sqjit_native_emit_lea_rsi_mem(&_buf, cell) ||
            !sqjit_native_emit_mov_rdx_mem(&_buf, value) ||
            !sqjit_native_emit_mov_rcx_imm64(&_buf, type) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_member_cell_store) ||
            !HelperResult(0xff)) return false;
        return dst == 0xff || CopyObject(dst, value);
    }
    std::vector<SQInteger> slow;
    auto miss = [&](SQJitNativeJcc condition) {
        SQInteger patch;
        if(!sqjit_native_emit_jcc_placeholder(&_buf, condition, &patch)) return false;
        slow.push_back(patch); return true;
    };
    // RDX is the heap slot. Fast stores preserve its tag; changing types use
    // normal SQObjectPtr assignment in the helper. All aliases see each write.
    if(!sqjit_native_emit_mov_rdx_mem(&_buf, cell) ||
        !byte(0x81) || !byte(0xba) || !disp(offsetof(SQObject, _type)) || !disp(type) ||
        !miss(SQ_JIT_JCC_NE)) return false;
    if(!byte(0x83) || !byte(0xbd) ||
        !sqjit_native_emit_rbp_disp32(&_buf, local(offsetof(SQJitMemberCell, logged))) ||
        !byte(0x00) || !miss(SQ_JIT_JCC_E)) return false;
    // Floating payloads live in the flushed frame, even when this bytecode
    // register has an integer pin from another use.
    if(!(type == OT_FLOAT ? sqjit_native_emit_mov_rax_local_mem(&_buf, value) :
        sqjit_native_emit_mov_rax_mem(&_buf, value))) return false;
    if(!byte(0x48) || !byte(0x89) || !byte(0x82) || !disp(offsetof(SQObject, _unVal))) return false;
    SQInteger done;
    if(!sqjit_native_emit_jmp_placeholder(&_buf, &done)) return false;
    for(SQInteger patch : slow)
        if(!sqjit_native_patch_i32(&_buf, patch, _buf.size - patch - 4)) return false;
    if(!sqjit_native_emit_lea_rdi_mem(&_buf, log) || !sqjit_native_emit_lea_rsi_mem(&_buf, cell) ||
        !(type == OT_FLOAT ? (byte(0x48) && byte(0x8b) && byte(0x95) &&
            sqjit_native_emit_rbp_disp32(&_buf, value)) : sqjit_native_emit_mov_rdx_mem(&_buf, value)) ||
        !sqjit_native_emit_mov_rcx_imm64(&_buf, type) ||
        !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_member_cell_store) || !HelperResult(0xff) ||
        !sqjit_native_patch_i32(&_buf, done, _buf.size - done - 4)) return false;
    if(dst == 0xff) return true;
    if(type == OT_FLOAT) {
        if(!sqjit_native_emit_mov_xmm0_local_float(&_buf, value) ||
            !sqjit_native_emit_mov_local_float_xmm0(&_buf, dst)) return false;
    }
    else if(!sqjit_native_emit_mov_rax_mem(&_buf, value) || !sqjit_native_emit_mov_mem_rax(&_buf, dst)) return false;
    _slots[dst].MarkScalar(kind, _loop); _slots[dst].entry_loaded = _loop;
    return true;
}

bool SQJitX64Memory::MemberGet(SQInteger dst, SQInteger base, SQInteger literal)
{
    if(base < 0 || base >= _proto->_stacksize || literal < 0 || literal >= _proto->_nliterals ||
        _slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || _slots[base].stack_object_reg < 0) return false;
    SQInteger source = _slots[base].stack_object_reg;
    SQObjectPtr sample;
    if(!sqjit_member_raw(_entry[source], _proto->_literals[literal], sample)) return false;
    SQObjectType type = sq_type(sample);
    if((type==OT_ARRAY || type==OT_STRING) && !BorrowedReadsSafe()) return false;
    const void *helper = type == OT_INTEGER ? (const void *)sqjit_helper_table_get_integer :
        type == OT_FLOAT ? (const void *)sqjit_helper_table_get_float :
        type == OT_ARRAY ? (const void *)sqjit_helper_member_get_array :
        type == OT_STRING ? (const void *)sqjit_helper_member_get_string : NULL;
    if(!helper) return false;
    SQInteger cell = MemberCell(base, literal);
    if(cell >= 0) {
        auto byte = [&](unsigned char b) { return sqjit_native_emit_u8(&_buf, b); };
        auto disp = [&](SQInteger d) { return sqjit_native_emit_i32(&_buf, d); };
        if(!sqjit_native_emit_mov_rax_mem(&_buf, cell) ||
            !byte(0x81) || !byte(0xb8) || !disp(offsetof(SQObject, _type)) || !disp(type) ||
            !_guard(SQ_JIT_JCC_NE)) return false;
        if(type == OT_FLOAT) {
            if(!byte(0xf2) || !byte(0x0f) || !byte(0x10) || !byte(0x80) || !disp(offsetof(SQObject, _unVal)) ||
                !sqjit_native_emit_mov_local_float_xmm0(&_buf, dst)) return false;
        }
        else if(!byte(0x48) || !byte(0x8b) || !byte(0x80) || !disp(offsetof(SQObject, _unVal)) ||
            !sqjit_native_emit_mov_mem_rax(&_buf, dst)) return false;
    }
    else if(!sqjit_native_emit_mov_rdi_r13(&_buf) || !sqjit_native_emit_mov_rsi_i64(&_buf, source) ||
        !sqjit_native_emit_mov_rdx_i64(&_buf, (SQInteger)(intptr_t)&_proto->_literals[literal]) ||
        !sqjit_native_emit_lea_rcx_mem(&_buf, dst) ||
        !sqjit_native_emit_mov_rax_ptr(&_buf, helper) || !HelperResult(dst)) return false;
    _slots[dst].MarkScalar(type == OT_FLOAT ? SQ_JIT_SLOT_FLOAT : SQ_JIT_SLOT_INT, _loop);
    if(type == OT_ARRAY) {
        _slots[dst].kind = SQ_JIT_SLOT_ARRAY_PTR;
        _observed_arrays[dst] = _array(sample);
    }
    if(type == OT_STRING) _slots[dst].kind = SQ_JIT_SLOT_STRING_PTR;
    return true;
}

bool SQJitX64Memory::CopyObject(SQInteger dst, SQInteger src)
{
    if((_slots[src].kind != SQ_JIT_SLOT_ARRAY_PTR && _slots[src].kind != SQ_JIT_SLOT_STRING_PTR) ||
        !BorrowedReadsSafe()) return false;
    if(!sqjit_native_emit_mov_rax_mem(&_buf, src) || !sqjit_native_emit_mov_mem_rax(&_buf, dst)) return false;
    _slots[dst] = _slots[src];
    _slots[dst].dirty = _slots[dst].entry_loaded = true;
    _observed_arrays[dst] = _observed_arrays[src];
    return true;
}

bool SQJitX64Memory::MemberSet(SQInteger dst, SQInteger base, SQInteger key, SQInteger value, SQInteger log)
{
    if(!_loop || _slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || _slots[base].stack_object_reg < 0 ||
        _slots[key].kind != SQ_JIT_SLOT_STRING_PTR) return false;
    const void *helper = _slots[value].kind == SQ_JIT_SLOT_ARRAY_PTR ? (const void *)sqjit_helper_member_set_array :
        _slots[value].kind == SQ_JIT_SLOT_STRING_PTR ? (const void *)sqjit_helper_member_set_string : NULL;
    if(!helper || !sqjit_native_emit_lea_rdi_mem(&_buf, log) ||
        !sqjit_native_emit_mov_rsi_r13(&_buf) ||
        !sqjit_native_emit_mov_rdx_i64(&_buf, _slots[base].stack_object_reg) ||
        !sqjit_native_emit_mov_rcx_mem(&_buf, key) || !sqjit_native_emit_mov_r8_mem(&_buf, value) ||
        !sqjit_native_emit_mov_rax_ptr(&_buf, helper) || !HelperResult(0xff)) return false;
    return dst == 0xff || CopyObject(dst, value);
}

bool SQJitX64Memory::TableGet(SQInteger dst, SQInteger base, SQInteger key)
{
    if(_slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || _slots[base].stack_object_reg < 0 ||
        _slots[key].kind != SQ_JIT_SLOT_STRING_PTR) return false;
    return sqjit_native_emit_mov_rdi_r13(&_buf) &&
        sqjit_native_emit_mov_rsi_i64(&_buf, _slots[base].stack_object_reg) &&
        sqjit_native_emit_mov_rdx_mem(&_buf, key) &&
        sqjit_native_emit_lea_rcx_mem(&_buf, dst) &&
        sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_helper_table_get_integer_string) &&
        HelperResult(dst);
}

bool SQJitX64Memory::TableSet(SQInteger target, SQInteger base, SQInteger key,
    SQInteger value, SQInteger write_log_slot)
{
    if(_slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || _slots[base].stack_object_reg < 0 ||
        _slots[key].kind != SQ_JIT_SLOT_STRING_PTR || !_ensure_int(value)) return false;
    if(!sqjit_native_emit_lea_rdi_mem(&_buf, write_log_slot) ||
        !sqjit_native_emit_mov_rsi_r13(&_buf) ||
        !sqjit_native_emit_mov_rdx_i64(&_buf, _slots[base].stack_object_reg) ||
        !sqjit_native_emit_mov_rcx_mem(&_buf, key) ||
        !sqjit_native_emit_mov_r8_mem(&_buf, value) ||
        !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_helper_table_set_integer_string_logged) ||
        !HelperResult(0xff)) return false;
    if(target == 0xff) return true;
    if(!sqjit_native_emit_mov_rax_mem(&_buf, value) ||
        !sqjit_native_emit_mov_mem_rax(&_buf, target)) return false;
    _slots[target].MarkScalar(SQ_JIT_SLOT_INT, _loop);
    _slots[target].entry_loaded = _loop;
    return true;
}
