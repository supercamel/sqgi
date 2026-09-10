// Experimental canonical-slot tier. Each helper either completes one bytecode
// or exits before its effects. Values remain in canonical VM slots; optional
// address caches add no owners. Completed stores need no undo journal, and every
// exit has an identity map.
// Keep this separate from the private-spill compiler until its effect contract
// and performance are established. SQGI_JIT_PRECISE_EXITS enables the experiment.
#include <limits>

// Addresses, never owning SQObjectPtrs. Each activation starts empty. The
// accepted bytecodes cannot allocate JS objects, run callbacks or structurally
// mutate containers. A live matching owner therefore cannot reuse a freed
// owner's address, and its existing slots cannot move during this activation.
// Extending that instruction set requires invalidating or revisiting this proof.
struct SQJitA64PreciseMemberCache {
    SQObjectType owner_type, key_type;
    SQRawObjectVal owner_bits, key_bits;
    SQObjectPtr *slot;
};

static void sqjit_a64_precise_init_caches(void *storage, SQInteger count)
{
    SQJitA64PreciseMemberCache *cache = (SQJitA64PreciseMemberCache *)storage;
    for(SQInteger n=0; n<count; ++n) new (&cache[n]) SQJitA64PreciseMemberCache{};
}

template<bool Literal>
static SQObjectPtr *sqjit_a64_precise_member(const SQObjectPtr &base,
    const SQObjectPtr &key, SQJitA64PreciseMemberCache *cache)
{
    // Indexed arrays already need only a bounds check. Comparing a cache key
    // and receiver would cost more than resolving their backing-store address.
    if(sq_type(base) == OT_ARRAY && sq_type(key) == OT_INTEGER) {
        SQInteger index = _integer(key);
        return (SQUnsignedInteger)index < (SQUnsignedInteger)_array(base)->Size() ?
            &_array(base)->_values[index] : NULL;
    }
    // Literal groups belong to one immutable prototype literal. They never
    // share storage with dynamic-key sites, so only receiver identity can vary.
    if(cache && cache->slot && cache->owner_type == sq_type(base) &&
        cache->owner_bits == _rawval(base) && (Literal ||
        (cache->key_type == sq_type(key) && cache->key_bits == _rawval(key)))) return cache->slot;
    SQObjectPtr *slot = sq_member_raw_slot(base, key);
    if(cache) {
        cache->slot = slot;
        if(slot) {
            cache->owner_type = sq_type(base); cache->owner_bits = _rawval(base);
            if(!Literal) { cache->key_type = sq_type(key); cache->key_bits = _rawval(key); }
        }
    }
    // A cached address always reloads the current value. Root/delegate fallback
    // is not cached: it depends on original receiver provenance and precedence.
    return slot;
}

// Scalar values have no owner to release. Keep this check at the call site:
// the general journal predicate remains authoritative for every reference,
// including aliases, ancestor pins, weak observers and combined drops.
static inline bool sqjit_a64_precise_can_release(SQJitContext *context,
    const SQObjectPtr &value, SQUnsignedInteger drops = 1)
{
    return !ISREFCOUNTED(sq_type(value)) || SQJitWriteLog::CanReleaseInContext(*context, value, drops);
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

template<SQOpcode Op, bool ConstantKey = (Op == _OP_GETK)>
static SQInteger sqjit_a64_precise_step(SQJitContext *context, SQObjectPtr *stack,
    SQClosure *closure, SQInteger ip, SQObjectPtr *out, SQVM *vm, SQJitA64PreciseMemberCache *cache)
{
    const SQInstruction &i = closure->_function->_instructions[ip];
    SQObjectPtr value;
    SQInteger dst = i._arg0;
    switch(Op) {
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
        if(!sqjit_a64_precise_can_release(context, stack[dst])) return 0;
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
        if(!sqjit_a64_precise_can_release(context, stack[dst]) || !sqjit_a64_precise_can_release(context, stack[i._arg2], drops)) return 0;
        stack[dst] = closure->_function->_literals[i._arg1];
        stack[i._arg2] = closure->_function->_literals[i._arg3]; return 1;
    }
    case _OP_GET: case _OP_GETK: {
        const SQObjectPtr &base = stack[Op == _OP_GET ? i._arg1 : i._arg2];
        const SQObjectPtr &key = Op == _OP_GET ? stack[i._arg2] :
            closure->_function->_literals[i._arg1];
        SQObjectPtr *raw = sqjit_a64_precise_member<ConstantKey>(base, key, cache);
        const SQObjectPtr *root = closure->_root ? (const SQObjectPtr *)&closure->_root->_obj : NULL;
        // Table/array/field reads dereference weak values; class methods do not.
        const SQObject *source = raw ? (sq_type(*raw) == OT_WEAKREF ? &_weakref(*raw)->_obj : raw) :
            sqjit_a64_borrow_member_value_with_root(stack, Op == _OP_GET ? i._arg1 : i._arg2, &key, root);
        if(!source || !sqjit_a64_precise_can_release(context, vm->temp_reg)) return 0;
        // Read before the temporary drop, including raw weakref dereference.
        // No checked release below can run a callback or destroy an observed
        // graph. Destination/base/key aliases therefore remain valid here.
        // Assignment copies the source bits and adds its reference before
        // releasing the old temporary. A second helper-local pin is redundant.
        vm->temp_reg = *source;
        _Swap(stack[dst], vm->temp_reg);
        return 1;
    }
    case _OP_SET: {
        SQObjectPtr *target = sqjit_a64_precise_member<ConstantKey>(stack[i._arg1], stack[i._arg2], cache);
        if(!target && i._arg1 == 0 && sq_type(vm->_roottable) == OT_TABLE) {
            // Only the original implicit receiver may fall back to the active
            // VM's root. A borrowed lookup adds no apparent program owner.
            const SQObjectPtr &receiver = stack[0];
            bool plain = sq_type(receiver) == OT_TABLE ? !_table(receiver)->_delegate :
                sq_type(receiver) == OT_INSTANCE &&
                sq_type(_instance(receiver)->_class->_metamethods[MT_SET]) == OT_NULL;
            if(plain) target = _table(vm->_roottable)->GetRawSlot(stack[i._arg2]);
        }
        if(!target || !sqjit_a64_precise_can_release(context, *target)) return 0;
        const bool result_write = dst != SQ_JIT_A64_NO_RESULT_SLOT && dst != i._arg3;
        if(result_write) {
            // The first write may discard another alias of the result's old
            // owner. Check the combined drop before either write, without pins.
            SQUnsignedInteger drops = ISREFCOUNTED(sq_type(*target)) &&
                sq_type(*target) == sq_type(stack[dst]) &&
                _rawval(*target) == _rawval(stack[dst]) ? 2 : 1;
            if(!sqjit_a64_precise_can_release(context, stack[dst], drops)) return 0;
        }
        *target = stack[i._arg3];
        if(result_write) stack[dst] = stack[i._arg3];
        return 1;
    }
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
        unsigned op = Op == _OP_ADD ? '+' : Op == _OP_SUB ? '-' :
            Op == _OP_MUL ? '*' : Op == _OP_DIV ? '/' : '%';
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
            !sqjit_a64_precise_can_release(context, stack[dst])) return 0;
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
        const SQObjectPtr &right = stack[Op == _OP_JCMP ? i._arg0 : i._arg1];
        if(!sq_isnumeric(left) || !sq_isnumeric(right)) return 0;
        if(!vm->CMP_OP((CmpOP)i._arg3, left, right, value)) return 0;
        if(Op != _OP_JCMP) break;
        if(!sqjit_a64_precise_can_release(context, vm->temp_reg)) return 0;
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
    if(!sqjit_a64_precise_can_release(context, stack[dst])) return 0;
    stack[dst] = value;
    return 1;
}

typedef SQInteger (*SQJitA64PreciseStep)(SQJitContext *, SQObjectPtr *,
    SQClosure *, SQInteger, SQObjectPtr *, SQVM *, SQJitA64PreciseMemberCache *);

// Select once during compilation. Each helper has a constant opcode, allowing
// the C++ compiler to remove dispatch and unrelated SQObjectPtr cleanup paths.
static SQJitA64PreciseStep sqjit_a64_precise_step_for(unsigned op, bool constant_key)
{
    switch(op) {
    case _OP_LOADINT: return sqjit_a64_precise_step<_OP_LOADINT>;
    case _OP_LOADFLOAT: return sqjit_a64_precise_step<_OP_LOADFLOAT>;
    case _OP_LOADBOOL: return sqjit_a64_precise_step<_OP_LOADBOOL>;
    case _OP_LOAD: return sqjit_a64_precise_step<_OP_LOAD>;
    case _OP_MOVE: return sqjit_a64_precise_step<_OP_MOVE>;
    case _OP_LOADNULLS: return sqjit_a64_precise_step<_OP_LOADNULLS>;
    case _OP_DLOAD: return sqjit_a64_precise_step<_OP_DLOAD>;
    case _OP_GET: return constant_key ? sqjit_a64_precise_step<_OP_GET,true> : sqjit_a64_precise_step<_OP_GET>;
    case _OP_GETK: return sqjit_a64_precise_step<_OP_GETK>;
    case _OP_SET: return constant_key ? sqjit_a64_precise_step<_OP_SET,true> : sqjit_a64_precise_step<_OP_SET>;
    case _OP_ADD: return sqjit_a64_precise_step<_OP_ADD>;
    case _OP_SUB: return sqjit_a64_precise_step<_OP_SUB>;
    case _OP_MUL: return sqjit_a64_precise_step<_OP_MUL>;
    case _OP_DIV: return sqjit_a64_precise_step<_OP_DIV>;
    case _OP_MOD: return sqjit_a64_precise_step<_OP_MOD>;
    case _OP_NEG: return sqjit_a64_precise_step<_OP_NEG>;
    case _OP_NOT: return sqjit_a64_precise_step<_OP_NOT>;
    case _OP_PINCL: return sqjit_a64_precise_step<_OP_PINCL>;
    case _OP_INCL: return sqjit_a64_precise_step<_OP_INCL>;
    case _OP_CMP: return sqjit_a64_precise_step<_OP_CMP>;
    case _OP_JCMP: return sqjit_a64_precise_step<_OP_JCMP>;
    case _OP_JZ: return sqjit_a64_precise_step<_OP_JZ>;
    case _OP_RETURN: return sqjit_a64_precise_step<_OP_RETURN>;
    default: return NULL;
    }
}

// Scalar array GET matches temp_reg = source; Swap(destination,temp_reg).
// All checks and source loads precede writes. An owning old destination moves
// into the non-owning temporary without a refcount change, even when it is the
// receiver. An owning temporary can be dropped inline only when there are no
// ancestor journals and another physical owner survives. Final drops and every
// reference source retain the checked helper; no callback can occur in this path.
static bool sqjit_a64_precise_array_get(SQJitA64Buffer *buf, SQFunctionProto *proto,
    const SQInstruction &i, SQInteger &done)
{
    done = -1;
    if(i.op != _OP_GET && (i.op != _OP_GETK ||
        sq_type(proto->_literals[i._arg1]) != OT_INTEGER)) return true;
    static_assert(sizeof(SQObjectPtr) == 16, "array slot address shift");
    const SQInteger base = i.op == _OP_GET ? i._arg1 : i._arg2;
    const SQInteger temp = (SQInteger)(size_t)&(((SQVM *)0)->temp_reg);
    const SQInteger type = (SQInteger)offsetof(SQObject,_type);
    const SQInteger value = (SQInteger)offsetof(SQObject,_unVal);
    SQJitA64Reloc guards[8]; SQInteger nguards = 0, source_owning, temp_scalar;
    auto guard = [&](unsigned cond) -> bool {
        SQInteger patch;
        return sqjit_a64_emit_bcond_placeholder(buf,cond,&patch) &&
            sqjit_a64_record_reloc(guards,&nguards,8,patch,-1,true,cond);
    };
    if(!sqjit_a64_emit_type_guard(buf,base,OT_ARRAY,guards,&nguards)) return false;
    if(i.op == _OP_GET) {
        if(!sqjit_a64_emit_type_guard(buf,i._arg2,OT_INTEGER,guards,&nguards) ||
            !sqjit_a64_emit_ldr_x(buf,10,19,sqjit_a64_stack_value_disp(i._arg2))) return false;
    }
    else if(!sqjit_a64_emit_mov_imm_x(buf,10,_integer(proto->_literals[i._arg1]))) return false;
    if(!sqjit_a64_emit_ldr_x(buf,11,19,sqjit_a64_stack_value_disp(base)) ||
        !sqjit_a64_emit_ldr_x(buf,9,11,SQArray::RawSizeOffset()) ||
        !sqjit_a64_emit_cmp_reg(buf,10,9) || !guard(SQ_JIT_A64_HS) ||
        !sqjit_a64_emit_ldr_x(buf,11,11,SQArray::RawValuesOffset()) ||
        !sqjit_a64_emit_add_reg_lsl(buf,11,11,10,4) ||
        !sqjit_a64_emit_ldr_w(buf,13,11,type) ||
        !sqjit_a64_emit_test_branch(buf,13,SQ_JIT_A64_REF_COUNTED_BIT,true,&source_owning) ||
        !sqjit_a64_emit_ldr_x(buf,12,11,value) ||
        !sqjit_a64_emit_ldr_w(buf,14,22,temp+type) ||
        !sqjit_a64_emit_test_branch(buf,14,SQ_JIT_A64_REF_COUNTED_BIT,false,&temp_scalar)) return false;
    // Same non-final-drop proof as CanReleaseInContext, before any helper pin.
    // Source bits are already loaded. Preserve the mark bit while decrementing
    // the physical count; only the comparison masks collector bookkeeping.
    const SQInteger refs = (SQInteger)(size_t)&(((SQRefCounted *)0)->_uiRef);
    const SQInteger logs = (SQInteger)(size_t)&(((SQJitContext *)0)->active_logs);
    if(!sqjit_a64_emit_ldr_x(buf,9,31,sqjit_a64_local_disp(0)) ||
        !sqjit_a64_emit_ldr_x(buf,9,9,logs) ||
        !sqjit_a64_emit_cmp_imm(buf,9,0) || !guard(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_x(buf,15,22,temp+value) ||
        !sqjit_a64_emit_ldr_x(buf,14,15,refs)) return false;
#ifndef NO_GARBAGE_COLLECTOR
    if(!sqjit_a64_emit_mov_imm_x(buf,9,(SQInteger)~(SQUnsignedInteger)MARK_FLAG) ||
        !sqjit_a64_emit_and_reg(buf,10,14,9)) return false;
#else
    if(!sqjit_a64_emit_mov_reg(buf,10,14)) return false;
#endif
    if(!sqjit_a64_emit_cmp_imm(buf,10,1) || !guard(SQ_JIT_A64_LS) ||
        !sqjit_a64_emit_sub_imm(buf,14,14,1) ||
        !sqjit_a64_emit_str_x(buf,14,15,refs) ||
        !sqjit_a64_patch_test_branch(buf,temp_scalar,buf->size) ||
        !sqjit_a64_emit_ldr_w(buf,14,19,sqjit_a64_stack_type_disp(i._arg0)) ||
        !sqjit_a64_emit_ldr_x(buf,15,19,sqjit_a64_stack_value_disp(i._arg0)) ||
        !sqjit_a64_emit_str_x(buf,15,22,temp+value) ||
        !sqjit_a64_emit_str_w(buf,14,22,temp+type) ||
        !sqjit_a64_emit_str_x(buf,12,19,sqjit_a64_stack_value_disp(i._arg0)) ||
        !sqjit_a64_emit_str_w(buf,13,19,sqjit_a64_stack_type_disp(i._arg0)) ||
        !sqjit_a64_emit_b_placeholder(buf,&done) ||
        !sqjit_a64_patch_test_branch(buf,source_owning,buf->size)) return false;
    for(SQInteger n=0;n<nguards;++n)
        if(!sqjit_a64_patch_branch(buf,guards[n].patch_offset,buf->size,true,guards[n].cond)) return false;
    return true;
}

// Fast scalar writes never release an owner and never call a helper. Every
// slow branch precedes the first VM write, so it can retry the same bytecode.
static bool sqjit_a64_precise_fast(SQJitA64Buffer *buf, SQFunctionProto *proto,
    const SQInstruction &i, bool extended, bool constant_key, SQInteger &done)
{
    done = -1;
    if(extended && ((i.op == _OP_GET && !constant_key) || i.op == _OP_GETK))
        return sqjit_a64_precise_array_get(buf,proto,i,done);
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
    const bool floating = extended && (i.op == _OP_ADD || i.op == _OP_SUB ||
        i.op == _OP_MUL || i.op == _OP_DIV);
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
        !sqjit_a64_emit_b_placeholder(buf,&done)) return false;
    const SQInteger float_start = buf->size;
    SQJitA64Reloc float_guards[2]; SQInteger nfloat_guards = 0;
    if(floating) {
        // Only integer TYPE failures reach here. Integer divide-by-zero/-1
        // guards go straight to the helper. Both numeric operands therefore
        // imply at least one float, preserving integer-only result semantics.
        auto load_number = [&](SQInteger slot, unsigned fp) -> bool {
            SQInteger is_float, loaded;
            if(!sqjit_a64_emit_ldr_w(buf,9,19,sqjit_a64_stack_type_disp(slot)) ||
                !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_FLOAT) ||
                !sqjit_a64_emit_cmp_reg(buf,9,10) ||
                !sqjit_a64_emit_bcond_placeholder(buf,SQ_JIT_A64_EQ,&is_float) ||
                !sqjit_a64_emit_type_guard(buf,slot,OT_INTEGER,float_guards,&nfloat_guards) ||
                !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(slot)) ||
                !sqjit_a64_emit_scvtf_float_x(buf,fp,9) ||
                !sqjit_a64_emit_b_placeholder(buf,&loaded) ||
                !sqjit_a64_patch_branch(buf,is_float,buf->size,true,SQ_JIT_A64_EQ) ||
                !sqjit_a64_emit_ldr_float(buf,fp,19,sqjit_a64_stack_value_disp(slot)) ||
                !sqjit_a64_patch_branch(buf,loaded,buf->size,false,0)) return false;
            return true;
        };
        SQInteger finished;
        if(!load_number(i._arg2,0) || !load_number(i._arg1,1) ||
            !sqjit_a64_emit_fop_float(buf,(SQOpcode)i.op,0,0,1) ||
            !sqjit_a64_emit_str_float(buf,0,19,sqjit_a64_stack_value_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_w(buf,10,(uint32_t)OT_FLOAT) ||
            !sqjit_a64_emit_str_w(buf,10,19,sqjit_a64_stack_type_disp(dst)) ||
            !sqjit_a64_emit_b_placeholder(buf,&finished) ||
            !sqjit_a64_patch_branch(buf,finished,done,false,0)) return false;
    }
    if(!sqjit_a64_patch_test_branch(buf,owning,buf->size)) return false;
    if(source_owning >= 0 && !sqjit_a64_patch_test_branch(buf,source_owning,buf->size)) return false;
    for(SQInteger n=0;n<nguards;++n)
        if(!sqjit_a64_patch_branch(buf,guards[n].patch_offset,
            floating && n < 2 ? float_start : buf->size,true,guards[n].cond)) return false;
    for(SQInteger n=0;n<nfloat_guards;++n)
        if(!sqjit_a64_patch_branch(buf,float_guards[n].patch_offset,buf->size,true,float_guards[n].cond)) return false;
    return true;
}

// Find a dominating literal definition within the current basic block. Do
// not look through branch joins or non-copy writes. Tracking MOVE and DLOAD
// lets equivalent GET/GETK/SET sites share an immutable-key cache safely.
static SQInteger sqjit_a64_precise_key_literal(SQFunctionProto *proto,
    const SQBytecodeAnalysis &analysis, SQInteger ip, SQInteger key)
{
    while(ip > 0 && !analysis.leaders[ip]) {
        const SQInstruction &i = proto->_instructions[--ip];
        if(!analysis.facts[ip].writes.test(key)) continue;
        if(i.op == _OP_LOAD) return i._arg1;
        if(i.op == _OP_DLOAD) return key == i._arg2 ? i._arg3 : i._arg1;
        if(i.op != _OP_MOVE) return -1;
        key = i._arg1;
    }
    return -1;
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
    // Share a cache between sites using the same operand locations. This is
    // only a grouping heuristic: every use still checks both runtime operands.
    // Bound frame storage; extra sites simply keep the uncached helper path.
    enum { MAX_CACHES = 64 };
    struct CacheOperands { SQInteger base, key; bool literal; } operands[MAX_CACHES];
    SQInteger cache_at[SQ_JIT_A64_IP_TABLE_SIZE], cache_count = 0;
    bool constant_key[SQ_JIT_A64_IP_TABLE_SIZE] = {};
    for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) {
        cache_at[ip] = -1;
        const SQInstruction &i = proto->_instructions[ip];
        if(i.op != _OP_GET && i.op != _OP_GETK && i.op != _OP_SET) continue;
        CacheOperands item = {i.op == _OP_GETK ? i._arg2 : i._arg1,
            i.op == _OP_GETK ? i._arg1 : i._arg2, i.op == _OP_GETK};
        if(!item.literal) {
            SQInteger literal = sqjit_a64_precise_key_literal(proto,analysis,ip,item.key);
            if(literal >= 0) { item.key = literal; item.literal = true; }
        }
        constant_key[ip] = item.literal;
        SQInteger n=0;
        while(n<cache_count && (operands[n].base != item.base ||
            operands[n].key != item.key || operands[n].literal != item.literal)) ++n;
        if(n == MAX_CACHES) continue;
        if(n == cache_count) operands[cache_count++] = item;
        cache_at[ip] = n;
    }
    bool exhausted = false;
    auto emit = [&](bool extended) -> bool {
    SQJitA64Buffer buf; buf.size = 0;
    bool emitted = false;
    struct Budget {
        SQJitA64Buffer &buf; bool &exhausted, &emitted;
        ~Budget() { exhausted = !emitted && buf.size == (SQInteger)sizeof(buf.bytes); }
    } budget = {buf,exhausted,emitted};
    const SQInteger context_slot = 0;
    const SQInteger cache_storage = 16;
    SQInteger frame_size = (cache_storage + cache_count * sizeof(SQJitA64PreciseMemberCache) + 15) & ~SQInteger(15);
    static_assert(alignof(SQJitA64PreciseMemberCache) <= 16, "native cache alignment");
    if(frame_size > 4095 || !sqjit_a64_emit_prologue(&buf, frame_size) ||
        !sqjit_a64_emit_mov_imm_x(&buf,9,(SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate)) ||
        !sqjit_a64_emit_str_x(&buf,9,31,sqjit_a64_local_disp(context_slot))) return false;
    if(cache_count && (!sqjit_a64_emit_add_imm(&buf,0,31,cache_storage) ||
        !sqjit_a64_emit_mov_imm_x(&buf,1,cache_count) ||
        !sqjit_a64_emit_mov_imm_x(&buf,16,(SQInteger)(intptr_t)sqjit_a64_precise_init_caches) ||
        !sqjit_a64_emit_blr_x16(&buf))) return false;
    // No helper in this tier can reenter the VM or relocate its stack. Keep
    // the active VM in a callee-saved register instead of looking it up per op.
    if(!sqjit_a64_emit_mov_imm_x(&buf,22,(SQInteger)(intptr_t)&sqjit_context(proto->_sharedstate).active_vm) ||
        !sqjit_a64_emit_ldr_x(&buf,22,22,0)) return false;
    SQInteger offsets[SQ_JIT_A64_IP_TABLE_SIZE];
    SQJitA64Reloc branches[SQ_JIT_A64_MAX_RELOCS], guards[SQ_JIT_A64_MAX_GUARD_RELOCS];
    SQInteger nbranches = 0, nguards = 0;
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
        if(!sqjit_a64_precise_fast(&buf,proto,i,extended,constant_key[ip],fast_done)) return false;
        SQJitA64PreciseStep step = sqjit_a64_precise_step_for(i.op,constant_key[ip]);
        if(!step) return false;
        if(cache_at[ip] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf,6,31,
                cache_storage + cache_at[ip] * sizeof(SQJitA64PreciseMemberCache))) return false;
        }
        else if(!sqjit_a64_emit_mov_imm_x(&buf,6,0)) return false;
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(context_slot)) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 19) || !sqjit_a64_emit_mov_reg(&buf, 2, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, ip) || !sqjit_a64_emit_mov_reg(&buf, 4, 20) ||
            !sqjit_a64_emit_mov_reg(&buf, 5, 22) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)step) ||
            !sqjit_a64_emit_blr_x16(&buf)) return false;
        if(i.op == _OP_RETURN) {
            if(!sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) return false;
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
        if(!sqjit_a64_patch_branch(&buf, g.patch_offset, buf.size, true, g.cond) ||
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
    emitted = true;
    if(!native->_code.Install(buf.bytes, buf.size)) return false;
    native->_requires_vm_frame = true;
    native->_stack_live_slots = proto->_stacksize;
    native->_stack_storage_slots = proto->_stacksize;
    return true;
    };
    // Optional code growth must not lose existing large-function coverage.
    // Only a full emission buffer triggers retry; unsupported shapes and
    // allocation/install failures do not receive a second compile attempt.
    return emit(true) || (exhausted && emit(false));
}
