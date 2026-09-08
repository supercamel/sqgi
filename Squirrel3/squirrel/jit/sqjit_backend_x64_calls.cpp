#include "sqpcheader.h"
#include <stdint.h>
#include <stddef.h>
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_backend.h"
#include "sqjit_backend_x64_calls.h"
#include "sqjit_backend_x64_leaf.h"
#include "sqjit_code.h"
#include "sqjit_member_plan.h"

extern bool sq_nativeclosure_is_default_len(SQNativeClosure *closure);
static SQInteger string_length_guard(SQClosure *closure, const SQObjectPtr *key)
{
    SQObjectPtr value;
    if(!closure || !_table(_opt_ss(closure)->_string_default_delegate)->Get(*key, value) ||
        sq_type(value) != OT_NATIVECLOSURE) return 0;
    SQNativeClosure *c = _nativeclosure(value);
    return !c->_env && sq_nativeclosure_is_default_len(c) && c->_nparamscheck == 1 &&
        c->_typecheck.size() == 1 && c->_typecheck[0] == _RT_STRING;
}

SQJitX64Calls::SQJitX64Calls(SQFunctionProto *proto, SQObjectPtr *entry, SQJitNativeCodeBuffer &buf,
    SQJitSlotState *slots, SQInteger closure_slot, bool loop, Ensure ensure_int,
    Ensure ensure_float, std::function<bool()> guard, SQInteger leaf_scratch_slots)
    : _leaf_scratch_slots(leaf_scratch_slots), _inlined_instructions(0),
      _hoisted_conversion(false), _hoisted_string_length(false), _stable_heap(false), _proto(proto), _entry(entry), _buf(buf), _slots(slots), _closure_slot(closure_slot),
      _loop(loop), _analysis(NULL), _ensure_int(ensure_int), _ensure_float(ensure_float), _guard(guard)
{
}

SQInteger SQJitX64Calls::LeafScratchSlots(SQFunctionProto *proto, SQObjectPtr *entry, SQInteger first, SQInteger last)
{
    for(SQInteger ip = first; ip <= last; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        if(i.op != _OP_PREPCALLK || i._arg1 < 0 || i._arg1 >= proto->_nliterals ||
            sq_type(entry[i._arg2]) != OT_TABLE) continue;
        SQObjectPtr value;
        if(_table(entry[i._arg2])->Get(proto->_literals[i._arg1], value) &&
            sq_type(value) == OT_CLOSURE && !_closure(value)->_env &&
            SQJitLeafPlan::Eligible(_closure(value)->_function)) return SQJitLeafPlan::MAX_SLOTS + 2;
    }
    return 0;
}

SQWeakRef *SQJitX64Calls::LeafReference(SQFunctionProto *proto)
{
    for(const SQObjectPtr &ref : _leaf_references)
        if(sq_type(_weakref(ref)->_obj) == OT_FUNCPROTO && _funcproto(_weakref(ref)->_obj) == proto) return _weakref(ref);
    SQWeakRef *reference = proto->GetWeakRef(OT_FUNCPROTO);
    _leaf_references.push_back(SQObjectPtr(reference));
    return reference;
}

void SQJitX64Calls::RetainDependencies(SQJitCode &code) const
{
    for(const SQObjectPtr &ref : _leaf_references) code.RetainWeakReference(_weakref(ref));
}

static SQInteger leaf_guard(SQObjectPtr *stack, SQInteger base, const SQObjectPtr *key, SQWeakRef *expected)
{
    if(!stack || base < 0 || !key || !expected || sq_type(expected->_obj) != OT_FUNCPROTO ||
        sq_type(stack[base]) != OT_TABLE) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr value;
    if(!_table(stack[base])->Get(*key, value) || sq_type(value) != OT_CLOSURE) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQClosure *closure = _closure(value);
    return !closure->_env && closure->_function == _funcproto(expected->_obj) ?
        SQ_JIT_NATIVE_RETURNED : SQ_JIT_NATIVE_GUARD_FAILED;
}

bool SQJitX64Calls::LeafGuard(SQInteger base, SQInteger literal, SQWeakRef *prototype)
{
    return sqjit_native_emit_mov_rdi_r13(&_buf) &&
        sqjit_native_emit_mov_rsi_i64(&_buf, base) &&
        sqjit_native_emit_mov_rdx_i64(&_buf, (SQInteger)(intptr_t)&_proto->_literals[literal]) &&
        sqjit_native_emit_mov_rcx_imm64(&_buf, (SQInteger)(intptr_t)prototype) &&
        sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)leaf_guard) &&
        sqjit_native_emit_call_rax(&_buf) && GuardResult();
}

bool SQJitX64Calls::MathGuard(SQInteger base, SQInteger literal, const SQNativeMathSpec *spec, SQInteger ip)
{
    // Replacing an old class cache owner can run a release hook. When a
    // delegate guard is hoisted, use an uncached lookup to keep this call pure.
    return sqjit_native_emit_mov_rdi_r13(&_buf) &&
        sqjit_native_emit_mov_rsi_i64(&_buf, base) &&
        sqjit_native_emit_mov_rdx_i64(&_buf, (SQInteger)(intptr_t)&_proto->_literals[literal]) &&
        sqjit_native_emit_mov_rcx_imm64(&_buf, spec->kind) &&
        sqjit_native_emit_mov_r8_i64(&_buf, (SQInteger)(intptr_t)
            ((_stable_heap || _hoisted_conversion || _hoisted_string_length) ? NULL : _proto->MemberCacheAt(ip))) &&
        sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_math_guard) &&
        sqjit_native_emit_call_rax(&_buf) && GuardResult();
}

bool SQJitX64Calls::ConversionGuard(const SQObjectPtr &key)
{
    return sqjit_native_emit_mov_rdi_mem(&_buf, _closure_slot) &&
        sqjit_native_emit_mov_rsi_i64(&_buf, (SQInteger)(intptr_t)&key) &&
        sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)sqjit_number_conversion_guard) &&
        sqjit_native_emit_call_rax(&_buf) && GuardResult();
}

bool SQJitX64Calls::HoistGuards(const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last)
{
    _analysis = &analysis;
    bool pure = true, conversion_stable = true, string_length_stable = true;
    SQJitKeyFlow keys;
    bool needs_keys = false;
    for(SQInteger ip = first; ip <= last; ++ip)
        needs_keys |= _proto->_instructions[ip].op == _OP_SET;
    if(needs_keys) keys.Build(_proto, analysis, first, last);
    for(SQInteger ip = first; ip <= last; ++ip) {
        const SQBytecodeFacts &f = analysis.facts[ip];
        unsigned char op = _proto->_instructions[ip].op;
        if(f.writes.test(0)) pure = false;
        if(((f.effects & SQ_BC_OUTER) && op != _OP_RETURN) ||
            op == _OP_NEWOBJ || op == _OP_APPENDARRAY) return true;
        if((f.effects & SQ_BC_MUTATE) && op != _OP_CALL && op != _OP_TAILCALL) {
            pure = false;
            if(op != _OP_SET) return true;
            conversion_stable &= !keys.MayEqual(ip, _proto->_instructions[ip]._arg2, _SC("tofloat"));
            string_length_stable &= !keys.MayEqual(ip, _proto->_instructions[ip]._arg2, _SC("len"));
        }
    }
    // Audited calls and scalar leaf bodies cannot mutate or reenter the VM.
    // Member writes retain displaced owners in the undo log, so their release
    // hooks cannot change a delegate until after the native region exits.
    for(SQInteger ip = first; ip <= last; ++ip) {
        const SQInstruction &i = _proto->_instructions[ip];
        if(i.op != _OP_PREPCALLK || i._arg1 < 0 || i._arg1 >= _proto->_nliterals) continue;
        const SQObjectPtr &key = _proto->_literals[i._arg1];
        if(conversion_stable && !_hoisted_conversion && sq_type(key) == OT_STRING && scstrcmp(_stringval(key), _SC("tofloat")) == 0) {
            if(!ConversionGuard(key)) return false;
            _hoisted_conversion = true;
        }
        if(string_length_stable && !_hoisted_string_length && sq_type(key) == OT_STRING &&
            scstrcmp(_stringval(key), _SC("len")) == 0) {
            if(!sqjit_native_emit_mov_rdi_mem(&_buf, _closure_slot) ||
                !sqjit_native_emit_mov_rsi_i64(&_buf, (SQInteger)(intptr_t)&key) ||
                !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)string_length_guard) ||
                !sqjit_native_emit_call_rax(&_buf) || !GuardResult()) return false;
            _hoisted_string_length = true;
        }
        if(!pure || i._arg2 != 0 || sq_type(_entry[0]) != OT_TABLE) continue;
        SQObjectPtr value;
        if(!_table(_entry[0])->Get(key, value)) continue;
        if(_leaf_scratch_slots && sq_type(value) == OT_CLOSURE && !_closure(value)->_env &&
            SQJitLeafPlan::Eligible(_closure(value)->_function)) {
            bool found = false;
            for(const HoistedLeaf &guard : _hoisted_leaf) found |= guard.literal == i._arg1;
            if(!found) {
                SQWeakRef *reference = LeafReference(_closure(value)->_function);
                if(!LeafGuard(0, i._arg1, reference)) return false;
                HoistedLeaf guard = {i._arg1, reference};
                _hoisted_leaf.push_back(guard);
            }
            continue;
        }
        if(sq_type(value) != OT_NATIVECLOSURE) continue;
        const SQNativeMathSpec *spec = sqjit_math_spec(_nativeclosure(value));
        if(!spec) continue;
        bool found = false;
        for(const HoistedMath &guard : _hoisted_math) found |= guard.literal == i._arg1;
        if(found) continue;
        // A hoisted check must not replace a cache owner: releasing an old
        // class cache could run release hooks. An uncached table read is pure.
        if(!MathGuard(0, i._arg1, spec, -1)) return false;
        HoistedMath guard = {i._arg1, spec};
        _hoisted_math.push_back(guard);
    }
    return true;
}

void SQJitX64Calls::Begin(const SQInstruction &inst)
{
    if(inst.op == _OP_CALL || inst.op == _OP_TAILCALL) return;
    SQBytecodeFacts facts = sq_bytecode_facts(inst, 0, _proto->_stacksize);
    for(SQInteger n = 0; n < _proto->_stacksize; ++n)
        if(facts.writes.test(n) || facts.target >= 0 || !facts.fallthrough) _prepared[n] = Prepared();
}

bool SQJitX64Calls::GuardResult()
{
    return sqjit_native_emit_cmp_rax_i32(&_buf, SQ_JIT_NATIVE_RETURNED) && _guard();
}

bool SQJitX64Calls::CopyScalar(SQInteger target, SQInteger source)
{
    if(target < 0 || target >= _proto->_stacksize || source < 0 || source >= _proto->_stacksize) return false;
    SQJitSlotKind kind = _slots[source].kind;
    if(kind == SQ_JIT_SLOT_STACK_OBJECT && _slots[source].stack_object_reg >= 0) {
        SQObjectType observed = sq_type(_entry[_slots[source].stack_object_reg]);
        if(observed == OT_FLOAT) { if(!_ensure_float(source)) return false; }
        else if(observed == OT_INTEGER) { if(!_ensure_int(source)) return false; }
        else if(observed == OT_BOOL) {
            SQInteger reg = _slots[source].stack_object_reg;
            if(!sqjit_native_emit_cmp_stack_type_i32(&_buf, reg, OT_BOOL) || !_guard() ||
                !sqjit_native_emit_mov_rax_stack_value(&_buf, reg) ||
                !sqjit_native_emit_mov_mem_rax(&_buf, source)) return false;
            _slots[source].MarkScalar(SQ_JIT_SLOT_BOOL, false);
            _slots[source].entry_loaded = _loop;
        }
        else return false;
        kind = _slots[source].kind;
    }
    if(kind == SQ_JIT_SLOT_FLOAT) {
        if(!_ensure_float(source) || !sqjit_native_emit_copy_float(&_buf, target, source)) return false;
    }
    else if(kind == SQ_JIT_SLOT_INT || kind == SQ_JIT_SLOT_BOOL) {
        if((kind == SQ_JIT_SLOT_INT && !_ensure_int(source)) ||
            !sqjit_native_emit_mov_rax_mem(&_buf, source) || !sqjit_native_emit_mov_mem_rax(&_buf, target)) return false;
    }
    else return false;
    bool entry_loaded = _slots[target].entry_loaded || _slots[source].entry_loaded;
    _slots[target] = _slots[source];
    _slots[target].dirty = _loop;
    _slots[target].entry_loaded = entry_loaded;
    return true;
}

bool SQJitX64Calls::Prepare(const SQInstruction &i)
{
    if(i._arg1 < 0 || i._arg1 >= _proto->_nliterals || i._arg0 >= _proto->_stacksize ||
        i._arg2 >= _proto->_stacksize || i._arg3 >= _proto->_stacksize) return false;
    const SQObjectPtr &key = _proto->_literals[i._arg1];
    SQJitSlotState source = _slots[i._arg2];
    Prepared prepared;
    prepared.receiver = i._arg3;
    if(_loop && source.kind == SQ_JIT_SLOT_STRING_PTR && sq_type(key) == OT_STRING &&
        scstrcmp(_stringval(key), _SC("len")) == 0) {
        if((!_hoisted_string_length && (!sqjit_native_emit_mov_rdi_mem(&_buf, _closure_slot) ||
            !sqjit_native_emit_mov_rsi_i64(&_buf, (SQInteger)(intptr_t)&key) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)string_length_guard) ||
            !sqjit_native_emit_call_rax(&_buf) || !GuardResult())) ||
            !sqjit_native_emit_mov_rax_mem(&_buf, i._arg2) ||
            !sqjit_native_emit_mov_mem_rax(&_buf, i._arg3)) return false;
        _slots[i._arg3] = source;
        prepared.string_length = true;
    }
    else if((source.kind == SQ_JIT_SLOT_INT || source.kind == SQ_JIT_SLOT_FLOAT) &&
        sq_type(key) == OT_STRING && scstrcmp(_stringval(key), _SC("tofloat")) == 0) {
        if(!_hoisted_conversion && !ConversionGuard(key)) return false;
        if(source.kind == SQ_JIT_SLOT_FLOAT) {
            if(!_ensure_float(i._arg2) || !sqjit_native_emit_mov_xmm0_local_float(&_buf, i._arg2) ||
                !sqjit_native_emit_mov_local_float_xmm0(&_buf, i._arg3)) return false;
        }
        else if(!_ensure_int(i._arg2) || !sqjit_native_emit_mov_rax_mem(&_buf, i._arg2) ||
            !sqjit_native_emit_mov_mem_rax(&_buf, i._arg3)) return false;
        _slots[i._arg3].MarkScalar(source.kind, _loop);
        _slots[i._arg3].entry_loaded = _loop;
        prepared.conversion = true;
    }
    else if(source.kind == SQ_JIT_SLOT_STACK_OBJECT && source.stack_object_reg >= 0 &&
        sq_type(_entry[source.stack_object_reg]) == OT_TABLE) {
        SQObjectPtr value;
        if(!_table(_entry[source.stack_object_reg])->Get(key, value)) return false;
        bool hoisted = false;
        if(_leaf_scratch_slots && sq_type(value) == OT_CLOSURE && !_closure(value)->_env &&
            SQJitLeafPlan::Eligible(_closure(value)->_function)) {
            prepared.leaf = _closure(value)->_function;
            SQWeakRef *reference = LeafReference(prepared.leaf);
            if(i._arg2 == 0 && source.stack_object_reg == 0)
                for(const HoistedLeaf &guard : _hoisted_leaf)
                    hoisted |= guard.literal == i._arg1 && guard.prototype == reference;
            if(!hoisted && !LeafGuard(source.stack_object_reg, i._arg1, reference)) return false;
        }
        else {
            if(sq_type(value) != OT_NATIVECLOSURE || !(prepared.math = sqjit_math_spec(_nativeclosure(value)))) return false;
            if(i._arg2 == 0 && source.stack_object_reg == 0)
                for(const HoistedMath &guard : _hoisted_math)
                    hoisted |= guard.literal == i._arg1 && guard.spec == prepared.math;
            if(!hoisted && !MathGuard(source.stack_object_reg, i._arg1, prepared.math, &i - _proto->_instructions)) return false;
        }
        _slots[i._arg3] = source;
    }
    else return false;
    _slots[i._arg0].Reset();
    _prepared[i._arg0] = prepared;
    return true;
}

bool SQJitX64Calls::ConvertInteger(SQInteger from, SQInteger to)
{
    return _ensure_int(from) && sqjit_native_emit_mov_rax_mem(&_buf, from) &&
        sqjit_native_emit_convert_rax_float(&_buf) && sqjit_native_emit_mov_local_float_xmm0(&_buf, to);
}

SQInteger SQJitX64Calls::FloatArgument(SQInteger slot, SQInteger scratch)
{
    if(_slots[slot].kind == SQ_JIT_SLOT_FLOAT ||
        (_slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT && _slots[slot].stack_object_reg >= 0 &&
         sq_type(_entry[_slots[slot].stack_object_reg]) == OT_FLOAT)) return _ensure_float(slot) ? slot : -1;
    return ConvertInteger(slot, scratch) ? scratch : -1;
}

bool SQJitX64Calls::Call(const SQInstruction &i)
{
    if(i._arg0 == 0xFF || i._arg1 < 0 || i._arg1 >= _proto->_stacksize ||
        i._arg2 + i._arg3 > _proto->_stacksize) return false;
    Prepared prepared = _prepared[i._arg1];
    _prepared[i._arg1] = Prepared();
    _prepared[i._arg0] = Prepared();
    if(prepared.receiver != i._arg2) return false;
    if(prepared.string_length && i._arg3 == 1) {
        // The receiver is retained by the heap, a literal or the loop undo log.
        // Identity was checked at PREPCALLK, before evaluating any arguments.
        if(!sqjit_native_emit_mov_rax_mem(&_buf, i._arg2) ||
            !sqjit_native_emit_u8(&_buf, 0x48) || !sqjit_native_emit_u8(&_buf, 0x8b) ||
            !sqjit_native_emit_u8(&_buf, 0x80) || !sqjit_native_emit_i32(&_buf, offsetof(SQString, _len)) ||
            !sqjit_native_emit_mov_mem_rax(&_buf, i._arg0)) return false;
        _slots[i._arg0].MarkScalar(SQ_JIT_SLOT_INT, _loop);
        _slots[i._arg0].entry_loaded = _loop;
        return true;
    }
    if(prepared.leaf) return InlineLeaf(prepared.leaf, i);
    if(prepared.conversion && i._arg3 == 1) {
        if(_slots[i._arg2].kind == SQ_JIT_SLOT_FLOAT) {
            if(!_ensure_float(i._arg2) || !sqjit_native_emit_mov_xmm0_local_float(&_buf, i._arg2) ||
                !sqjit_native_emit_mov_local_float_xmm0(&_buf, i._arg0)) return false;
        }
        else if(!ConvertInteger(i._arg2, i._arg0)) return false;
    }
    else if(prepared.math && i._arg3 == prepared.math->nargs + 1) {
        SQInteger left = FloatArgument(i._arg2 + 1, _closure_slot + 2);
        SQInteger right = prepared.math->nargs == 2 ? FloatArgument(i._arg2 + 2, _closure_slot + 3) : -1;
        if(left < 0 || (prepared.math->nargs == 2 && right < 0) ||
            !sqjit_native_emit_mov_xmm0_local_float(&_buf, left)) return false;
        if(prepared.math->nargs == 1) {
            if(!sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)prepared.math->unary)) return false;
        }
        else if(!sqjit_native_emit_mov_xmm1_local_float(&_buf, right) ||
            !sqjit_native_emit_mov_rax_ptr(&_buf, (const void *)prepared.math->binary)) return false;
        // Identity/argument guards have already passed. Audited evaluators
        // return a scalar directly and cannot reenter the VM or guard-fail.
        if(!sqjit_native_emit_call_rax(&_buf) ||
            !sqjit_native_emit_mov_local_float_xmm0(&_buf, i._arg0)) return false;
    }
    else return false;
    _slots[i._arg0].MarkScalar(SQ_JIT_SLOT_FLOAT, _loop);
    _slots[i._arg0].entry_loaded = _loop;
    return true;
}

bool SQJitX64Calls::InlineLeaf(SQFunctionProto *callee, const SQInstruction &call)
{
    if(call._arg3 != callee->_nparameters || _inlined_instructions + callee->_ninstructions > 256 ||
        _leaf_scratch_slots < SQJitLeafPlan::MAX_SLOTS + 2) return false;
    std::vector<SQJitSlotKind> arguments(call._arg3, SQ_JIT_SLOT_UNKNOWN);
    for(SQInteger n = 1; n < call._arg3; ++n) {
        SQInteger slot = call._arg2 + n;
        if(!CopyScalar(slot, slot)) return false;
        arguments[n] = _slots[slot].kind;
    }
    SQJitLeafPlan plan;
    if(!plan.Build(callee, arguments)) return false;
    const SQInteger scratch = _closure_slot + 4;
    // Private copies preserve pass-by-value parameters and prevent a callee's
    // temporaries from overwriting caller arguments or an outer prepared call.
    for(SQInteger n = 1; n < call._arg3; ++n) {
        SQInteger from = call._arg2 + n, to = scratch + n;
        if(arguments[n] == SQ_JIT_SLOT_FLOAT) {
            if(!sqjit_native_emit_copy_float(&_buf, to, from)) return false;
        }
        else if(!sqjit_native_emit_mov_rax_mem(&_buf, from) || !sqjit_native_emit_mov_mem_rax(&_buf, to)) return false;
    }
    // The private argument copies are complete. Caller names dead after this
    // call need no preservation while lowering the callee. Loop VM locals
    // retain their existing conservative exit-writeback contract.
    if(!_loop && _analysis) {
        SQInteger next = &call - _proto->_instructions + 1;
        for(SQInteger n=0; n<_proto->_stacksize; ++n)
            if(!_analysis->live_in[next].test(n)) sqjit_native_discard_float_slot(&_buf, n);
    }
    if(!sqjit_x64_inline_leaf(_buf, callee, plan, scratch, call._arg0, _guard)) return false;
    _slots[call._arg0].MarkScalar(plan.return_kind, _loop);
    _slots[call._arg0].entry_loaded = _loop;
    _inlined_instructions += callee->_ninstructions;
    return true;
}
