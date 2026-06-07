/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_BACKEND_AARCH64_PRIVATE_H_
#define _SQJIT_BACKEND_AARCH64_PRIVATE_H_

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
#include "sqjit_backend_aarch64_emit.h"
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

enum {
    SQ_JIT_A64_NO_RESULT_SLOT = 0xFF,
    SQ_JIT_A64_MAX_INSTRUCTIONS = 512,
    SQ_JIT_A64_IP_TABLE_SIZE = SQ_JIT_A64_MAX_INSTRUCTIONS + 1,
    SQ_JIT_A64_MAX_RELOCS = SQ_JIT_A64_MAX_INSTRUCTIONS,
    SQ_JIT_A64_MAX_EXIT_RELOCS = 128,
    SQ_JIT_A64_MAX_GUARD_RELOCS = MAX_FUNC_STACKSIZE + SQ_JIT_A64_MAX_RELOCS
};

enum SQJitA64SlotKind {
    SQ_JIT_A64_SLOT_UNKNOWN = 0,
    SQ_JIT_A64_SLOT_INT,
    SQ_JIT_A64_SLOT_FLOAT,
    SQ_JIT_A64_SLOT_BOOL,
    SQ_JIT_A64_SLOT_STACK_OBJECT,
    SQ_JIT_A64_SLOT_ARRAY_PTR,
    SQ_JIT_A64_SLOT_OBJECT_PTR
};

static inline bool sqjit_a64_slot_index_valid(SQInteger slot);
static inline bool sqjit_a64_type_is_object_ptr(SQObjectType type);

struct SQJitA64SlotState {
    SQJitA64SlotKind kind;
    SQInteger stack_object_reg;
    SQArray *array_ptr_observed;
    bool array_ptr_fresh;
    SQInteger object_ptr_observed;
    SQObjectType object_ptr_observed_type;
    bool object_ptr_fresh_table;
    SQObjectType stack_object_observed_type;
    SQInteger stack_object_observed_ptr;
    bool known_const;
    SQInteger const_value;
    bool dirty;
    bool entry_loaded;

    void AssertConsistent() const
    {
#ifndef NDEBUG
        if(kind != SQ_JIT_A64_SLOT_STACK_OBJECT) {
            assert(stack_object_reg == -1);
            assert(stack_object_observed_type == OT_NULL);
            assert(stack_object_observed_ptr == 0);
        }
        if(kind != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            assert(array_ptr_observed == NULL);
            assert(!array_ptr_fresh);
        }
        if(kind != SQ_JIT_A64_SLOT_OBJECT_PTR) {
            assert(object_ptr_observed == 0);
            assert(object_ptr_observed_type == OT_NULL);
            assert(!object_ptr_fresh_table);
        }
        if(!known_const) {
            assert(const_value == 0);
        }
        if(stack_object_observed_type == OT_NULL) {
            assert(stack_object_observed_ptr == 0);
        }
#endif
    }

    void ClearDerived()
    {
        stack_object_reg = -1;
        array_ptr_observed = NULL;
        array_ptr_fresh = false;
        object_ptr_observed = 0;
        object_ptr_observed_type = OT_NULL;
        object_ptr_fresh_table = false;
        stack_object_observed_type = OT_NULL;
        stack_object_observed_ptr = 0;
        known_const = false;
        const_value = 0;
    }

    void Reset()
    {
        kind = SQ_JIT_A64_SLOT_UNKNOWN;
        ClearDerived();
        dirty = false;
        entry_loaded = false;
        AssertConsistent();
    }

    void MarkUnknown()
    {
        kind = SQ_JIT_A64_SLOT_UNKNOWN;
        ClearDerived();
        AssertConsistent();
    }

    void MarkInt()
    {
        kind = SQ_JIT_A64_SLOT_INT;
        ClearDerived();
        AssertConsistent();
    }

    void MarkFloat()
    {
        kind = SQ_JIT_A64_SLOT_FLOAT;
        ClearDerived();
        AssertConsistent();
    }

    void MarkBool()
    {
        kind = SQ_JIT_A64_SLOT_BOOL;
        ClearDerived();
        AssertConsistent();
    }

    void MarkStackObject(SQInteger reg)
    {
        kind = SQ_JIT_A64_SLOT_STACK_OBJECT;
        ClearDerived();
        stack_object_reg = reg;
        AssertConsistent();
    }

    void MarkArrayPtr(SQArray *observed, bool fresh)
    {
        kind = SQ_JIT_A64_SLOT_ARRAY_PTR;
        ClearDerived();
        array_ptr_observed = observed;
        array_ptr_fresh = fresh;
        AssertConsistent();
    }

    void MarkObjectPtr(SQObjectType type, SQInteger observed, bool fresh_table)
    {
        kind = SQ_JIT_A64_SLOT_OBJECT_PTR;
        ClearDerived();
        object_ptr_observed_type = type;
        object_ptr_observed = observed;
        object_ptr_fresh_table = fresh_table;
        AssertConsistent();
    }

    void CopyArrayPtrFrom(const SQJitA64SlotState &src)
    {
        assert(src.kind == SQ_JIT_A64_SLOT_ARRAY_PTR);
        MarkArrayPtr(src.array_ptr_observed, src.array_ptr_fresh);
    }

    void CopyObjectPtrFrom(const SQJitA64SlotState &src)
    {
        assert(src.kind == SQ_JIT_A64_SLOT_OBJECT_PTR);
        MarkObjectPtr(src.object_ptr_observed_type, src.object_ptr_observed,
            src.object_ptr_fresh_table);
    }

    void MarkFreshArrayPtr(SQArray *observed)
    {
        MarkArrayPtr(observed, true);
    }

    void MarkFreshObjectPtr(SQObjectType type, SQInteger observed)
    {
        MarkObjectPtr(type, observed, true);
    }

    void SetStackObjectReg(SQInteger reg)
    {
        assert(kind == SQ_JIT_A64_SLOT_STACK_OBJECT);
        stack_object_reg = reg;
        AssertConsistent();
    }

    void ClearStackObjectObservation()
    {
        stack_object_observed_type = OT_NULL;
        stack_object_observed_ptr = 0;
        AssertConsistent();
    }

    void SetStackObjectObservation(SQObjectType type, SQInteger observed)
    {
        if(type != OT_NULL && sqjit_a64_type_is_object_ptr(type)) {
            stack_object_observed_type = type;
            stack_object_observed_ptr = observed;
        }
        else {
            ClearStackObjectObservation();
        }
        AssertConsistent();
    }

    void CopyStackObjectObservationFrom(const SQJitA64SlotState &src)
    {
        stack_object_observed_type = src.stack_object_observed_type;
        stack_object_observed_ptr =
            src.stack_object_observed_type != OT_NULL ?
            src.stack_object_observed_ptr : 0;
        AssertConsistent();
    }

    void SetConst(SQInteger value)
    {
        known_const = true;
        const_value = value;
        AssertConsistent();
    }

    void ClearConst()
    {
        known_const = false;
        const_value = 0;
        AssertConsistent();
    }

    void CopyConstFrom(const SQJitA64SlotState &src)
    {
        known_const = src.known_const;
        const_value = src.known_const ? src.const_value : 0;
        AssertConsistent();
    }
};

static inline bool sqjit_a64_slot_state_accept_result(SQInteger slot,
    bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    return sqjit_a64_slot_index_valid(slot);
}

static inline bool sqjit_a64_slot_state_mark_unknown(
    SQJitA64SlotState *slots, SQInteger slot, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot)) {
        return false;
    }
    slots[slot].MarkUnknown();
    return true;
}

static inline bool sqjit_a64_slot_state_mark_int(
    SQJitA64SlotState *slots, SQInteger slot, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot)) {
        return false;
    }
    slots[slot].MarkInt();
    return true;
}

static inline bool sqjit_a64_slot_state_mark_float(
    SQJitA64SlotState *slots, SQInteger slot, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot)) {
        return false;
    }
    slots[slot].MarkFloat();
    return true;
}

static inline bool sqjit_a64_slot_state_mark_bool(
    SQJitA64SlotState *slots, SQInteger slot, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot)) {
        return false;
    }
    slots[slot].MarkBool();
    return true;
}

static inline bool sqjit_a64_slot_state_mark_stack_object(
    SQJitA64SlotState *slots, SQInteger slot, SQInteger stack_reg,
    bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot) ||
        !sqjit_a64_slot_index_valid(stack_reg)) {
        return false;
    }
    slots[slot].MarkStackObject(stack_reg);
    return true;
}

static inline bool sqjit_a64_slot_state_mark_array_ptr(
    SQJitA64SlotState *slots, SQInteger slot, SQArray *observed,
    bool fresh, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot)) {
        return false;
    }
    slots[slot].MarkArrayPtr(observed, fresh);
    return true;
}

static inline bool sqjit_a64_slot_state_mark_object_ptr(
    SQJitA64SlotState *slots, SQInteger slot, SQObjectType type,
    SQInteger observed, bool fresh_table, bool allow_no_result)
{
    if(slot == SQ_JIT_A64_NO_RESULT_SLOT) {
        return allow_no_result;
    }
    if(!slots || !sqjit_a64_slot_index_valid(slot) ||
        !sqjit_a64_type_is_object_ptr(type)) {
        return false;
    }
    slots[slot].MarkObjectPtr(type, observed, fresh_table);
    return true;
}

enum SQJitA64WriteKind {
    SQ_JIT_A64_WRITE_ARRAY_INDEX,
    SQ_JIT_A64_WRITE_ARRAY_SIZE,
    SQ_JIT_A64_WRITE_MEMBER_VALUE
};

enum SQJitA64MathIntrinsic {
    SQ_JIT_A64_MATH_NONE = 0,
    SQ_JIT_A64_MATH_SQRT,
    SQ_JIT_A64_MATH_SIN,
    SQ_JIT_A64_MATH_COS,
    SQ_JIT_A64_MATH_ASIN,
    SQ_JIT_A64_MATH_ACOS,
    SQ_JIT_A64_MATH_LOG,
    SQ_JIT_A64_MATH_LOG10,
    SQ_JIT_A64_MATH_TAN,
    SQ_JIT_A64_MATH_ATAN,
    SQ_JIT_A64_MATH_FLOOR,
    SQ_JIT_A64_MATH_CEIL,
    SQ_JIT_A64_MATH_EXP,
    SQ_JIT_A64_MATH_FABS,
    SQ_JIT_A64_MATH_ATAN2,
    SQ_JIT_A64_MATH_POW
};

enum SQJitA64NumberConversion {
    SQ_JIT_A64_NUMBER_CONVERSION_NONE = 0,
    SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT,
    SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER
};

struct SQJitA64CommonPreparedCallState {
    SQInteger array_len_base[MAX_FUNC_STACKSIZE];
    SQClosure *direct_closure[MAX_FUNC_STACKSIZE];
    SQJitA64MathIntrinsic math_intrinsic[MAX_FUNC_STACKSIZE];
    SQInteger math_nargs[MAX_FUNC_STACKSIZE];
    SQJitA64NumberConversion number_conversion[MAX_FUNC_STACKSIZE];
    SQInteger number_conversion_base[MAX_FUNC_STACKSIZE];

    void Clear(SQInteger slot)
    {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return;
        }
        array_len_base[slot] = -1;
        direct_closure[slot] = NULL;
        math_intrinsic[slot] = SQ_JIT_A64_MATH_NONE;
        math_nargs[slot] = 0;
        number_conversion[slot] = SQ_JIT_A64_NUMBER_CONVERSION_NONE;
        number_conversion_base[slot] = -1;
    }

    void ClearAll()
    {
        for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
            Clear(n);
        }
    }
};

struct SQJitA64ProtoPreparedCallState : SQJitA64CommonPreparedCallState {
    SQInteger array_append_base[MAX_FUNC_STACKSIZE];
    SQClass *klass[MAX_FUNC_STACKSIZE];

    void Clear(SQInteger slot)
    {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return;
        }
        SQJitA64CommonPreparedCallState::Clear(slot);
        array_append_base[slot] = -1;
        klass[slot] = NULL;
    }

    void ClearAll()
    {
        for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
            Clear(n);
        }
    }
};

enum SQJitA64CtorArrayFieldMode {
    SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3 = 1,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK2,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK3,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK4
};

struct SQJitA64WriteLogEntry {
    SQJitA64WriteKind kind;
    SQInteger target_index;
    SQObjectPtr key;
    SQObjectPtr old_value;
    SQInteger index;
};

struct SQJitA64WriteLog {
    SQJitA64WriteLog()
        : last_target_type(OT_NULL), last_target_raw(0), last_target_index(-1)
    {
    }

    sqvector<SQObjectPtr> targets;
    sqvector<SQJitA64WriteLogEntry> entries;
    SQObjectType last_target_type;
    SQRawObjectVal last_target_raw;
    SQInteger last_target_index;
};

struct SQJitA64InstanceFieldObservation {
    SQClass *klass;
    SQInteger class_disp;
    SQInteger value_disp;
    SQInteger field_index;
    SQObjectType value_type;
    SQArray *array_value;
    SQInteger object_ptr_value;
};

static inline SQInteger sqjit_loadint_value(const SQInstruction &inst)
{
#ifndef _SQ64
    return (SQInteger)inst._arg1;
#else
    return (SQInteger)((SQInt32)inst._arg1);
#endif
}

static inline bool sqjit_loadfloat_value(const SQInstruction &inst,
    SQFloat *value)
{
    if(!value || sizeof(SQFloat) != sizeof(SQInt32)) {
        return false;
    }
    SQInt32 bits = inst._arg1;
    memcpy(value, &bits, sizeof(bits));
    return true;
}

static inline SQInteger sqjit_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

static inline SQInteger sqjit_signed_arg3(const SQInstruction &inst)
{
    return (SQInteger)((signed char)inst._arg3);
}

static inline bool sqjit_a64_slot_index_valid(SQInteger slot)
{
    return slot >= 0 && slot < MAX_FUNC_STACKSIZE;
}

static inline bool sqjit_a64_result_slot_valid(SQInteger slot)
{
    return slot == SQ_JIT_A64_NO_RESULT_SLOT ||
        sqjit_a64_slot_index_valid(slot);
}

static inline bool sqjit_a64_slot_range_valid(SQInteger start, SQInteger count)
{
    return sqjit_a64_slot_index_valid(start) && count >= 0 &&
        count <= MAX_FUNC_STACKSIZE - start;
}

static inline bool sqjit_a64_call_args_valid(SQInteger arg_base,
    SQInteger nargs)
{
    return sqjit_a64_slot_index_valid(arg_base) && nargs > 0 &&
        nargs <= MAX_FUNC_STACKSIZE - arg_base;
}

static inline bool sqjit_a64_type_is_object_ptr(SQObjectType type)
{
    return type == OT_TABLE || type == OT_INSTANCE || type == OT_CLASS ||
        type == OT_CLOSURE || type == OT_STRING;
}

#endif
