/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include "sqjit_platform.h"
#include "sqjit_specialize.h"

static bool sqjit_member_get_value(const SQObjectPtr &target, const SQObjectPtr *key,
    SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Get(*key, value);
    }
    return false;
}

static bool sqjit_member_set_value(const SQObjectPtr &target, const SQObjectPtr *key,
    const SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Set(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Set(*key, value);
    }
    return false;
}

static SQInteger sqjit_accessor_entry(SQObjectPtr *stack, SQObjectPtr *outres,
    SQClosure *closure)
{
    if(!stack || !outres || !closure || !closure->_function || !closure->_function->_jit ||
        !closure->_function->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = closure->_function->_jit->_entry;
    SQFunctionProto *proto = closure->_function;
    if((SQJitNativeKind)native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        if(native->_setter_count <= 0 ||
            native->_setter_count > SQ_JIT_NATIVE_MAX_SETTERS) {
            return SQ_JIT_NATIVE_GUARD_FAILED;
        }
        for(SQInteger n = 0; n < native->_setter_count; n++) {
            SQInteger base_slot = native->_setter_base_slots[n];
            SQInteger field_literal_index = native->_setter_field_literal_indices[n];
            SQInteger value_slot = native->_setter_value_slots[n];
            if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
                field_literal_index < 0 || field_literal_index >= proto->_nliterals ||
                value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            const SQObjectPtr *field_key = &proto->_literals[field_literal_index];
            if(native->_setter_array_indices[n] >= 0 || native->_setter_index_slots[n] >= 0) {
                SQObjectPtr array_value;
                if(!sqjit_member_get_value(stack[base_slot], field_key, array_value) ||
                    sq_type(array_value) != OT_ARRAY) {
                    return SQ_JIT_NATIVE_GUARD_FAILED;
                }
                SQInteger index = native->_setter_array_indices[n];
                SQInteger index_slot = native->_setter_index_slots[n];
                if(index_slot >= 0) {
                    if(index_slot >= MAX_FUNC_STACKSIZE ||
                        sq_type(stack[index_slot]) != OT_INTEGER) {
                        return SQ_JIT_NATIVE_GUARD_FAILED;
                    }
                    index = _integer(stack[index_slot]);
                }
                if(index < 0 || !_array(array_value)->Set(index, stack[value_slot])) {
                    return SQ_JIT_NATIVE_GUARD_FAILED;
                }
            }
            else if(!sqjit_member_set_value(stack[base_slot], field_key, stack[value_slot])) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
        }
        if(native->_return_slot >= 0) {
            if(native->_return_slot >= MAX_FUNC_STACKSIZE) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = stack[native->_return_slot];
        }
        else {
            outres->Null();
        }
        return SQ_JIT_NATIVE_RETURNED;
    }

    if(native->_base_slot < 0 || native->_base_slot >= MAX_FUNC_STACKSIZE ||
        native->_field_literal_index < 0 ||
        native->_field_literal_index >= proto->_nliterals) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_member_get_value(stack[native->_base_slot],
        &proto->_literals[native->_field_literal_index], value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_FIELD_ACCESSOR:
            *outres = value;
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR:
            if(sq_type(value) != OT_ARRAY || native->_array_index < 0 ||
                !_array(value)->Get(native->_array_index, *outres)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR:
            if(sq_type(value) != OT_ARRAY || native->_index_slot < 0 ||
                native->_index_slot >= MAX_FUNC_STACKSIZE ||
                sq_type(stack[native->_index_slot]) != OT_INTEGER ||
                !_array(value)->Get(_integer(stack[native->_index_slot]), *outres)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_LEN_ACCESSOR:
            if(sq_type(value) != OT_ARRAY) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = _array(value)->Size();
            return SQ_JIT_NATIVE_RETURNED;
        default:
            return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_next_effective_ip(SQFunctionProto *proto, SQInteger ip)
{
    while(proto && ip < proto->_ninstructions &&
        proto->_instructions[ip].op == _OP_LINE) {
        ip++;
    }
    return ip;
}

static bool sqjit_return_matches_slot(const SQInstruction &inst, SQInteger slot)
{
    return inst.op == _OP_RETURN && inst._arg0 != 0xFF && inst._arg1 == slot;
}

static bool sqjit_return_matches_null(const SQInstruction &inst)
{
    return inst.op == _OP_RETURN && inst._arg0 == 0xFF;
}

static SQInteger sqjit_native_loadint_value(const SQInstruction &inst)
{
#ifndef _SQ64
    return (SQInteger)inst._arg1;
#else
    return (SQInteger)((SQInt32)inst._arg1);
#endif
}

static SQInteger sqjit_native_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

static SQInteger sqjit_native_branch_target(SQInteger ip, const SQInstruction &inst)
{
    return ip + 1 + sqjit_native_signed_arg1(inst);
}

static bool sqjit_literal_is_string(SQFunctionProto *proto, SQInteger literal_index,
    const SQChar *value)
{
    return proto && value && literal_index >= 0 && literal_index < proto->_nliterals &&
        sq_type(proto->_literals[literal_index]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[literal_index]), value) == 0;
}

static bool sqjit_native_is_loadint_value(const SQInstruction &inst,
    SQInteger slot, SQInteger value)
{
    return inst.op == _OP_LOADINT && inst._arg0 == slot &&
        sqjit_native_loadint_value(inst) == value;
}

static bool sqjit_numeric_compare(CmpOP op, const SQObjectPtr &left,
    const SQObjectPtr &right, bool &out)
{
    if(!sq_isnumeric(left) || !sq_isnumeric(right)) {
        return false;
    }

    if(sq_type(left) == OT_INTEGER && sq_type(right) == OT_INTEGER) {
        SQInteger l = _integer(left);
        SQInteger r = _integer(right);
        switch(op) {
            case CMP_G: out = l > r; return true;
            case CMP_GE: out = l >= r; return true;
            case CMP_L: out = l < r; return true;
            case CMP_LE: out = l <= r; return true;
            default: return false;
        }
    }

    SQFloat l = tofloat(left);
    SQFloat r = tofloat(right);
    switch(op) {
        case CMP_G: out = l > r; return true;
        case CMP_GE: out = l >= r; return true;
        case CMP_L: out = l < r; return true;
        case CMP_LE: out = l <= r; return true;
        default: return false;
    }
}

static SQInteger sqjit_numeric_entry(SQObjectPtr *stack, SQObjectPtr *outres,
    SQClosure *closure)
{
    if(!stack || !outres || !closure || !closure->_function ||
        !closure->_function->_jit || !closure->_function->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = closure->_function->_jit->_entry;
    bool selected = false;
    SQObjectPtr zero((SQInteger)0);
    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_NUMERIC_ABS:
            if(!sq_isnumeric(stack[1]) ||
                !sqjit_numeric_compare(CMP_L, stack[1], zero, selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            if(!selected) {
                *outres = stack[1];
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(sq_type(stack[1]) == OT_INTEGER) {
                *outres = -_integer(stack[1]);
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(sq_type(stack[1]) == OT_FLOAT) {
                *outres = -_float(stack[1]);
                return SQ_JIT_NATIVE_RETURNED;
            }
            return SQ_JIT_NATIVE_GUARD_FAILED;
        case SQ_JIT_NATIVE_NUMERIC_MIN:
            if(!sqjit_numeric_compare(CMP_L, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[1] : stack[2];
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_NUMERIC_MAX:
            if(!sqjit_numeric_compare(CMP_G, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[1] : stack[2];
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_NUMERIC_CLAMP:
            if(!sqjit_numeric_compare(CMP_L, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            if(selected) {
                *outres = stack[2];
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(!sqjit_numeric_compare(CMP_G, stack[1], stack[3], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[3] : stack[1];
            return SQ_JIT_NATIVE_RETURNED;
        default:
            return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

bool sqjit_native_precheck(SQJitNative *native, SQObjectPtr *stack)
{
    if(!native || !stack) {
        return false;
    }

    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR:
            return native->_index_slot >= 0 &&
                native->_index_slot < MAX_FUNC_STACKSIZE &&
                sq_type(stack[native->_index_slot]) == OT_INTEGER;
        case SQ_JIT_NATIVE_SETTER:
            if(native->_setter_count <= 0 ||
                native->_setter_count > SQ_JIT_NATIVE_MAX_SETTERS) {
                return false;
            }
            for(SQInteger n = 0; n < native->_setter_count; n++) {
                SQInteger index_slot = native->_setter_index_slots[n];
                if(index_slot >= 0 && (index_slot >= MAX_FUNC_STACKSIZE ||
                    sq_type(stack[index_slot]) != OT_INTEGER)) {
                    return false;
                }
            }
            return true;
        case SQ_JIT_NATIVE_NUMERIC_ABS:
            return sq_isnumeric(stack[1]);
        case SQ_JIT_NATIVE_NUMERIC_MIN:
        case SQ_JIT_NATIVE_NUMERIC_MAX:
            return sq_isnumeric(stack[1]) && sq_isnumeric(stack[2]);
        case SQ_JIT_NATIVE_NUMERIC_CLAMP:
            return sq_isnumeric(stack[1]) && sq_isnumeric(stack[2]) &&
                sq_isnumeric(stack[3]);
        default:
            return true;
    }
}

static bool sqjit_typeof_integer_guard_matches(SQFunctionProto *proto, SQInteger start_ip,
    SQInteger *index_slot, SQInteger *body_ip, SQInteger *fallback_ip)
{
    if(!proto || !index_slot || !body_ip || !fallback_ip) {
        return false;
    }

    SQInteger ip0 = sqjit_next_effective_ip(proto, start_ip);
    if(ip0 >= proto->_ninstructions || proto->_instructions[ip0].op != _OP_TYPEOF) {
        return false;
    }
    const SQInstruction &type_inst = proto->_instructions[ip0];
    if(type_inst._arg1 < 0 || type_inst._arg1 >= proto->_nparameters) {
        return false;
    }

    SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
    if(ip1 >= proto->_ninstructions || proto->_instructions[ip1].op != _OP_EQ) {
        return false;
    }
    const SQInstruction &eq_inst = proto->_instructions[ip1];
    if(eq_inst._arg2 != type_inst._arg0 ||
        !sqjit_literal_is_string(proto, eq_inst._arg1, _SC("integer"))) {
        return false;
    }

    SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
    if(ip2 >= proto->_ninstructions || proto->_instructions[ip2].op != _OP_JZ ||
        proto->_instructions[ip2]._arg0 != eq_inst._arg0) {
        return false;
    }

    SQInteger target_ip = ip2 + 1 + sqjit_native_signed_arg1(proto->_instructions[ip2]);
    SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
    if(ip3 >= proto->_ninstructions || target_ip <= ip3 ||
        target_ip >= proto->_ninstructions) {
        return false;
    }

    *index_slot = type_inst._arg1;
    *body_ip = ip3;
    *fallback_ip = target_ip;
    return true;
}

static bool sqjit_tail_is_throw_null(SQFunctionProto *proto, SQInteger ip)
{
    ip = sqjit_next_effective_ip(proto, ip);
    if(!proto || ip >= proto->_ninstructions ||
        proto->_instructions[ip].op != _OP_LOADNULLS) {
        return false;
    }
    ip = sqjit_next_effective_ip(proto, ip + 1);
    if(ip >= proto->_ninstructions || proto->_instructions[ip].op != _OP_THROW) {
        return false;
    }
    for(ip = sqjit_next_effective_ip(proto, ip + 1); ip < proto->_ninstructions;
        ip = sqjit_next_effective_ip(proto, ip + 1)) {
        if(!sqjit_return_matches_null(proto->_instructions[ip])) {
            return false;
        }
    }
    return true;
}

static bool sqjit_tail_is_only_null_returns(SQFunctionProto *proto, SQInteger ip)
{
    if(!proto) {
        return false;
    }
    for(ip = sqjit_next_effective_ip(proto, ip); ip < proto->_ninstructions;
        ip = sqjit_next_effective_ip(proto, ip + 1)) {
        if(!sqjit_return_matches_null(proto->_instructions[ip])) {
            return false;
        }
    }
    return true;
}

static bool sqjit_compile_numeric_select_proto(SQFunctionProto *proto,
    SQJitNative *native)
{
    if(!proto || !native || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_bgenerator || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16) {
        return false;
    }

    auto set_numeric_native = [&](SQJitNativeKind kind) -> bool {
        native->_native_kind = kind;
        native->_base_slot = -1;
        native->_field_literal_index = -1;
        native->_array_index = -1;
        native->_index_slot = -1;
        native->_code.SetStub((void *)sqjit_numeric_entry);
        return true;
    };

    if(proto->_nparameters == 2) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        SQInteger ip5 = sqjit_next_effective_ip(proto, ip4 + 1);
        if(ip5 < proto->_ninstructions &&
            sqjit_native_is_loadint_value(proto->_instructions[ip0],
                proto->_instructions[ip0]._arg0, 0) &&
            proto->_instructions[ip1].op == _OP_JCMP &&
            proto->_instructions[ip1]._arg0 == proto->_instructions[ip0]._arg0 &&
            proto->_instructions[ip1]._arg2 == 1 &&
            proto->_instructions[ip1]._arg3 == CMP_L &&
            sqjit_native_branch_target(ip1, proto->_instructions[ip1]) == ip4 &&
            proto->_instructions[ip2].op == _OP_NEG &&
            proto->_instructions[ip2]._arg1 == 1 &&
            proto->_instructions[ip3].op == _OP_JMP &&
            sqjit_native_branch_target(ip3, proto->_instructions[ip3]) == ip5 &&
            proto->_instructions[ip4].op == _OP_MOVE &&
            proto->_instructions[ip4]._arg0 == proto->_instructions[ip2]._arg0 &&
            proto->_instructions[ip4]._arg1 == 1 &&
            sqjit_return_matches_slot(proto->_instructions[ip5],
                proto->_instructions[ip2]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip5 + 1)) {
            return set_numeric_native(SQ_JIT_NATIVE_NUMERIC_ABS);
        }
    }

    if(proto->_nparameters == 3) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        if(ip4 < proto->_ninstructions &&
            proto->_instructions[ip0].op == _OP_JCMP &&
            proto->_instructions[ip0]._arg0 == 2 &&
            proto->_instructions[ip0]._arg2 == 1 &&
            (proto->_instructions[ip0]._arg3 == CMP_L ||
            proto->_instructions[ip0]._arg3 == CMP_G) &&
            sqjit_native_branch_target(ip0, proto->_instructions[ip0]) == ip3 &&
            proto->_instructions[ip1].op == _OP_MOVE &&
            proto->_instructions[ip1]._arg1 == 1 &&
            proto->_instructions[ip2].op == _OP_JMP &&
            sqjit_native_branch_target(ip2, proto->_instructions[ip2]) == ip4 &&
            proto->_instructions[ip3].op == _OP_MOVE &&
            proto->_instructions[ip3]._arg0 == proto->_instructions[ip1]._arg0 &&
            proto->_instructions[ip3]._arg1 == 2 &&
            sqjit_return_matches_slot(proto->_instructions[ip4],
                proto->_instructions[ip1]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip4 + 1)) {
            return set_numeric_native(
                proto->_instructions[ip0]._arg3 == CMP_L ?
                SQ_JIT_NATIVE_NUMERIC_MIN : SQ_JIT_NATIVE_NUMERIC_MAX);
        }
    }

    if(proto->_nparameters == 4) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        SQInteger ip5 = sqjit_next_effective_ip(proto, ip4 + 1);
        SQInteger ip6 = sqjit_next_effective_ip(proto, ip5 + 1);
        SQInteger ip7 = sqjit_next_effective_ip(proto, ip6 + 1);
        SQInteger ip8 = sqjit_next_effective_ip(proto, ip7 + 1);
        if(ip8 < proto->_ninstructions &&
            proto->_instructions[ip0].op == _OP_JCMP &&
            proto->_instructions[ip0]._arg0 == 2 &&
            proto->_instructions[ip0]._arg2 == 1 &&
            proto->_instructions[ip0]._arg3 == CMP_L &&
            sqjit_native_branch_target(ip0, proto->_instructions[ip0]) == ip3 &&
            proto->_instructions[ip1].op == _OP_MOVE &&
            proto->_instructions[ip1]._arg1 == 2 &&
            proto->_instructions[ip2].op == _OP_JMP &&
            sqjit_native_branch_target(ip2, proto->_instructions[ip2]) == ip8 &&
            proto->_instructions[ip3].op == _OP_JCMP &&
            proto->_instructions[ip3]._arg0 == 3 &&
            proto->_instructions[ip3]._arg2 == 1 &&
            proto->_instructions[ip3]._arg3 == CMP_G &&
            sqjit_native_branch_target(ip3, proto->_instructions[ip3]) == ip6 &&
            proto->_instructions[ip4].op == _OP_MOVE &&
            proto->_instructions[ip4]._arg1 == 3 &&
            proto->_instructions[ip5].op == _OP_JMP &&
            sqjit_native_branch_target(ip5, proto->_instructions[ip5]) == ip7 &&
            proto->_instructions[ip6].op == _OP_MOVE &&
            proto->_instructions[ip6]._arg0 == proto->_instructions[ip4]._arg0 &&
            proto->_instructions[ip6]._arg1 == 1 &&
            proto->_instructions[ip7].op == _OP_MOVE &&
            proto->_instructions[ip7]._arg0 == proto->_instructions[ip1]._arg0 &&
            proto->_instructions[ip7]._arg1 == proto->_instructions[ip4]._arg0 &&
            sqjit_return_matches_slot(proto->_instructions[ip8],
                proto->_instructions[ip1]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip8 + 1)) {
            return set_numeric_native(SQ_JIT_NATIVE_NUMERIC_CLAMP);
        }
    }

    return false;
}

static bool sqjit_compile_accessor_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
    if(ip0 >= proto->_ninstructions || proto->_instructions[ip0].op != _OP_GETK) {
        return false;
    }
    const SQInstruction &field_get = proto->_instructions[ip0];
    if(field_get._arg1 < 0 || field_get._arg1 >= proto->_nliterals ||
        field_get._arg2 < 0 || field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
    if(ip1 >= proto->_ninstructions) {
        return false;
    }
    const SQInstruction &second = proto->_instructions[ip1];
    if(sqjit_return_matches_slot(second, field_get._arg0)) {
        native->_native_kind = SQ_JIT_NATIVE_FIELD_ACCESSOR;
        native->_base_slot = field_get._arg2;
        native->_field_literal_index = field_get._arg1;
        native->_code.SetStub((void *)sqjit_accessor_entry);
        return true;
    }

    SQInteger value_slot = -1;
    SQInteger array_index = -1;
    SQInteger index_slot = -1;
    SQJitNativeKind kind = SQ_JIT_NATIVE_RAW_CODE;
    if(second.op == _OP_PREPCALLK && second._arg0 == field_get._arg0 &&
        second._arg2 == field_get._arg0 &&
        second._arg1 >= 0 && second._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[second._arg1]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[second._arg1]), _SC("len")) == 0) {
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        if(ip2 >= proto->_ninstructions ||
            (proto->_instructions[ip2].op != _OP_CALL &&
            proto->_instructions[ip2].op != _OP_TAILCALL) ||
            proto->_instructions[ip2]._arg1 != field_get._arg0 ||
            proto->_instructions[ip2]._arg2 != second._arg3 ||
            proto->_instructions[ip2]._arg3 != 1) {
            return false;
        }
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        if(ip3 >= proto->_ninstructions ||
            !sqjit_return_matches_slot(proto->_instructions[ip3], proto->_instructions[ip2]._arg0)) {
            return false;
        }
        native->_native_kind = SQ_JIT_NATIVE_FIELD_ARRAY_LEN_ACCESSOR;
        native->_base_slot = field_get._arg2;
        native->_field_literal_index = field_get._arg1;
        native->_array_index = -1;
        native->_index_slot = -1;
        native->_code.SetStub((void *)sqjit_accessor_entry);
        return true;
    }

    if(second.op == _OP_GETK && second._arg2 == field_get._arg0 &&
        second._arg1 >= 0 && second._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[second._arg1]) == OT_INTEGER) {
        value_slot = second._arg0;
        array_index = _integer(proto->_literals[second._arg1]);
        kind = SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR;
    }
    else if(second.op == _OP_GET && second._arg1 == field_get._arg0 &&
        second._arg2 >= 0 && second._arg2 < proto->_nparameters) {
        value_slot = second._arg0;
        index_slot = second._arg2;
        kind = SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR;
    }
    else {
        return false;
    }

    SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
    if(ip2 >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[ip2], value_slot)) {
        return false;
    }

    native->_native_kind = kind;
    native->_base_slot = field_get._arg2;
    native->_field_literal_index = field_get._arg1;
    native->_array_index = array_index;
    native->_index_slot = index_slot;
    native->_code.SetStub((void *)sqjit_accessor_entry);
    return true;
}

static bool sqjit_compile_guarded_accessor_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 2 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger index_slot = -1;
    SQInteger body_ip = -1;
    SQInteger fallback_ip = -1;
    if(!sqjit_typeof_integer_guard_matches(proto, 0, &index_slot, &body_ip,
        &fallback_ip)) {
        return false;
    }

    const SQInstruction &field_get = proto->_instructions[body_ip];
    if(field_get.op != _OP_GETK || field_get._arg1 < 0 ||
        field_get._arg1 >= proto->_nliterals || field_get._arg2 < 0 ||
        field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger read_ip = sqjit_next_effective_ip(proto, body_ip + 1);
    if(read_ip >= proto->_ninstructions || proto->_instructions[read_ip].op != _OP_GET ||
        proto->_instructions[read_ip]._arg1 != field_get._arg0 ||
        proto->_instructions[read_ip]._arg2 != index_slot) {
        return false;
    }
    SQInteger return_ip = sqjit_next_effective_ip(proto, read_ip + 1);
    if(return_ip >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[return_ip],
            proto->_instructions[read_ip]._arg0) ||
        !sqjit_tail_is_throw_null(proto, fallback_ip)) {
        return false;
    }

    native->_native_kind = SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR;
    native->_base_slot = field_get._arg2;
    native->_field_literal_index = field_get._arg1;
    native->_array_index = -1;
    native->_index_slot = index_slot;
    native->_code.SetStub((void *)sqjit_accessor_entry);
    return true;
}

static void sqjit_native_record_setter(SQJitNative *native, SQInteger base_slot,
    SQInteger field_literal_index, SQInteger array_index, SQInteger index_slot,
    SQInteger value_slot)
{
    SQInteger setter_index = native->_setter_count++;
    native->_setter_base_slots[setter_index] = base_slot;
    native->_setter_field_literal_indices[setter_index] = field_literal_index;
    native->_setter_array_indices[setter_index] = array_index;
    native->_setter_index_slots[setter_index] = index_slot;
    native->_setter_value_slots[setter_index] = value_slot;
}

static bool sqjit_compile_setter_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 32 || proto->_bgenerator) {
        return false;
    }

    SQInteger literal_slot[MAX_FUNC_STACKSIZE];
    bool integer_slot_known[MAX_FUNC_STACKSIZE];
    SQInteger integer_slot_value[MAX_FUNC_STACKSIZE];
    SQInteger field_base_slot[MAX_FUNC_STACKSIZE];
    SQInteger field_literal_slot[MAX_FUNC_STACKSIZE];
    SQInteger param_alias_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        literal_slot[n] = -1;
        integer_slot_known[n] = false;
        integer_slot_value[n] = 0;
        field_base_slot[n] = -1;
        field_literal_slot[n] = -1;
        param_alias_slot[n] = n < proto->_nparameters ? n : -1;
    }

    native->_setter_count = 0;
    native->_return_slot = -1;

    auto clear_slot = [&](SQInteger slot) {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return;
        }
        literal_slot[slot] = -1;
        integer_slot_known[slot] = false;
        integer_slot_value[slot] = 0;
        field_base_slot[slot] = -1;
        field_literal_slot[slot] = -1;
        param_alias_slot[slot] = -1;
    };

    auto load_literal_slot = [&](SQInteger slot, SQInteger literal_index) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        clear_slot(slot);
        literal_slot[slot] = literal_index;
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            integer_slot_known[slot] = true;
            integer_slot_value[slot] = _integer(proto->_literals[literal_index]);
        }
        return true;
    };

    auto load_integer_slot = [&](SQInteger slot, SQInteger value) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        clear_slot(slot);
        integer_slot_known[slot] = true;
        integer_slot_value[slot] = value;
        return true;
    };

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1) ||
                    !load_literal_slot(inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_LOADINT:
                if(!load_integer_slot(inst._arg0, sqjit_native_loadint_value(inst))) {
                    return false;
                }
                break;
            case _OP_MOVE:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return false;
                }
                literal_slot[inst._arg0] = literal_slot[inst._arg1];
                integer_slot_known[inst._arg0] = integer_slot_known[inst._arg1];
                integer_slot_value[inst._arg0] = integer_slot_value[inst._arg1];
                field_base_slot[inst._arg0] = field_base_slot[inst._arg1];
                field_literal_slot[inst._arg0] = field_literal_slot[inst._arg1];
                param_alias_slot[inst._arg0] = param_alias_slot[inst._arg1];
                break;
            case _OP_GETK:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg2] < 0 ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING) {
                    return false;
                }
                clear_slot(inst._arg0);
                field_base_slot[inst._arg0] = param_alias_slot[inst._arg2];
                field_literal_slot[inst._arg0] = inst._arg1;
                break;
            case _OP_GET: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg1] < 0) {
                    return false;
                }
                SQInteger literal_index = literal_slot[inst._arg2];
                if(literal_index < 0 || literal_index >= proto->_nliterals ||
                    sq_type(proto->_literals[literal_index]) != OT_STRING) {
                    return false;
                }
                clear_slot(inst._arg0);
                field_base_slot[inst._arg0] = param_alias_slot[inst._arg1];
                field_literal_slot[inst._arg0] = literal_index;
                break;
            }
            case _OP_SET: {
                if(native->_setter_count >= SQ_JIT_NATIVE_MAX_SETTERS ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    inst._arg3 < 0 || inst._arg3 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg3] < 0) {
                    return false;
                }
                SQInteger value_slot = param_alias_slot[inst._arg3];
                if(field_literal_slot[inst._arg1] >= 0) {
                    SQInteger array_index = -1;
                    SQInteger index_slot = -1;
                    if(integer_slot_known[inst._arg2]) {
                        array_index = integer_slot_value[inst._arg2];
                    }
                    else if(param_alias_slot[inst._arg2] >= 0) {
                        index_slot = param_alias_slot[inst._arg2];
                    }
                    else {
                        return false;
                    }
                    sqjit_native_record_setter(native, field_base_slot[inst._arg1],
                        field_literal_slot[inst._arg1], array_index, index_slot, value_slot);
                }
                else {
                    SQInteger base_slot = param_alias_slot[inst._arg1];
                    SQInteger key_literal_index = literal_slot[inst._arg2];
                    if(base_slot < 0 || key_literal_index < 0 ||
                        key_literal_index >= proto->_nliterals ||
                        sq_type(proto->_literals[key_literal_index]) != OT_STRING) {
                        return false;
                    }
                    sqjit_native_record_setter(native, base_slot, key_literal_index,
                        -1, -1, value_slot);
                }
                if(inst._arg0 >= 0 && inst._arg0 < MAX_FUNC_STACKSIZE) {
                    clear_slot(inst._arg0);
                }
                break;
            }
            case _OP_RETURN:
                if(native->_setter_count <= 0) {
                    return false;
                }
                if(sqjit_return_matches_null(inst)) {
                    native->_return_slot = -1;
                }
                else if(inst._arg0 != 0xFF && inst._arg1 >= 0 &&
                    inst._arg1 < MAX_FUNC_STACKSIZE && param_alias_slot[inst._arg1] >= 0) {
                    native->_return_slot = param_alias_slot[inst._arg1];
                }
                else {
                    return false;
                }
                for(SQInteger tail_ip = sqjit_next_effective_ip(proto, ip + 1);
                    tail_ip < proto->_ninstructions;
                    tail_ip = sqjit_next_effective_ip(proto, tail_ip + 1)) {
                    if(!sqjit_return_matches_null(proto->_instructions[tail_ip])) {
                        return false;
                    }
                }
                native->_native_kind = SQ_JIT_NATIVE_SETTER;
                native->_base_slot = 0;
                native->_field_literal_index = 0;
                native->_array_index = -1;
                native->_index_slot = -1;
                native->_code.SetStub((void *)sqjit_accessor_entry);
                return true;
            default:
                return false;
        }
    }

    return false;
}

static bool sqjit_compile_guarded_setter_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 3 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger index_slot = -1;
    SQInteger body_ip = -1;
    SQInteger fallback_ip = -1;
    if(!sqjit_typeof_integer_guard_matches(proto, 0, &index_slot, &body_ip,
        &fallback_ip)) {
        return false;
    }

    const SQInstruction &field_get = proto->_instructions[body_ip];
    if(field_get.op != _OP_GETK || field_get._arg1 < 0 ||
        field_get._arg1 >= proto->_nliterals || field_get._arg2 < 0 ||
        field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger set_ip = sqjit_next_effective_ip(proto, body_ip + 1);
    if(set_ip >= proto->_ninstructions || proto->_instructions[set_ip].op != _OP_SET ||
        proto->_instructions[set_ip]._arg1 != field_get._arg0 ||
        proto->_instructions[set_ip]._arg2 != index_slot ||
        proto->_instructions[set_ip]._arg3 < 0 ||
        proto->_instructions[set_ip]._arg3 >= proto->_nparameters) {
        return false;
    }

    SQInteger return_ip = sqjit_next_effective_ip(proto, set_ip + 1);
    if(return_ip >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[return_ip],
            proto->_instructions[set_ip]._arg3) ||
        !sqjit_tail_is_throw_null(proto, fallback_ip)) {
        return false;
    }

    native->_native_kind = SQ_JIT_NATIVE_SETTER;
    native->_base_slot = 0;
    native->_field_literal_index = 0;
    native->_array_index = -1;
    native->_index_slot = -1;
    native->_setter_count = 0;
    sqjit_native_record_setter(native, field_get._arg2, field_get._arg1,
        -1, index_slot, proto->_instructions[set_ip]._arg3);
    native->_return_slot = proto->_instructions[set_ip]._arg3;
    native->_code.SetStub((void *)sqjit_accessor_entry);
    return true;
}

bool sqjit_compile_specialized_proto(SQFunctionProto *proto, SQJitNative *native)
{
    return sqjit_compile_numeric_select_proto(proto, native) ||
        sqjit_compile_accessor_proto(proto, native) ||
        sqjit_compile_guarded_accessor_proto(proto, native) ||
        sqjit_compile_setter_proto(proto, native) ||
        sqjit_compile_guarded_setter_proto(proto, native);
}
