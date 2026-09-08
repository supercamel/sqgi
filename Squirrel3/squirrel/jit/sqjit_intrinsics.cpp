#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqmembercache.h"
#include "sqjit_backend.h"
#include "sqjit_intrinsics.h"

const SQNativeMathSpec *sqjit_math_spec(SQNativeClosure *closure)
{
    if(!closure) return NULL;
    const SQNativeMathSpec *spec = sq_native_math_spec(closure->_function);
    if(!spec || closure->_nparamscheck != spec->nargs + 1 ||
        closure->_typecheck.size() != (SQUnsignedInteger)(spec->nargs + 1) || closure->_typecheck[0] != -1) return NULL;
    for(SQInteger n = 1; n <= spec->nargs; ++n)
        if(closure->_typecheck[n] != (_RT_INTEGER | _RT_FLOAT)) return NULL;
    return spec;
}

SQInteger sqjit_math_unary(SQInteger op, const SQFloat *arg, SQFloat *out)
{
    const SQNativeMathSpec *spec = sq_native_math_spec((SQNativeMathKind)op);
    if(!spec || !spec->unary || !arg || !out) return SQ_JIT_NATIVE_GUARD_FAILED;
    *out = spec->unary(*arg);
    return SQ_JIT_NATIVE_RETURNED;
}
SQInteger sqjit_math_binary(SQInteger op, const SQFloat *left, const SQFloat *right, SQFloat *out)
{
    const SQNativeMathSpec *spec = sq_native_math_spec((SQNativeMathKind)op);
    if(!spec || !spec->binary || !left || !right || !out) return SQ_JIT_NATIVE_GUARD_FAILED;
    *out = spec->binary(*left, *right);
    return SQ_JIT_NATIVE_RETURNED;
}
SQInteger sqjit_integer_to_float(SQInteger value, SQFloat *out)
{
    if(!out) return SQ_JIT_NATIVE_GUARD_FAILED;
    *out = (SQFloat)value;
    return SQ_JIT_NATIVE_RETURNED;
}
SQInteger sqjit_math_guard(SQObjectPtr *stack, SQInteger base, const SQObjectPtr *key, SQInteger kind, SQMemberCache *cache)
{
    if(!stack || !key || base < 0 || base >= MAX_FUNC_STACKSIZE || sq_type(stack[base]) != OT_TABLE)
        return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr value;
    if(!(sq_member_cache_hit(cache, stack[base], *key, value) || sq_member_cache_fill(cache, stack[base], *key, value)) || sq_type(value) != OT_NATIVECLOSURE)
        return SQ_JIT_NATIVE_GUARD_FAILED;
    const SQNativeMathSpec *spec = sqjit_math_spec(_nativeclosure(value));
    return spec && spec->kind == kind ? SQ_JIT_NATIVE_RETURNED : SQ_JIT_NATIVE_GUARD_FAILED;
}
SQInteger sqjit_number_conversion_guard(SQClosure *closure, const SQObjectPtr *key)
{
    if(!closure || !key) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr value;
    if(!_table(_opt_ss(closure)->_number_default_delegate)->Get(*key, value) || sq_type(value) != OT_NATIVECLOSURE)
        return SQ_JIT_NATIVE_GUARD_FAILED;
    SQNativeClosure *callee = _nativeclosure(value);
    // A bound native closure replaces the numeric receiver before executing.
    return !callee->_env && callee->_function == sq_native_number_tofloat() && callee->_nparamscheck == 1 &&
        callee->_typecheck.size() == 1 && callee->_typecheck[0] == (_RT_INTEGER | _RT_FLOAT | _RT_BOOL) ?
        SQ_JIT_NATIVE_RETURNED : SQ_JIT_NATIVE_GUARD_FAILED;
}
