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
#include "sqjit_write_log.h"
#include "sqbytecode.h"
#include "sqjit_value.h"
#include "sqjit_intrinsics.h"
#include "sqjit_leaf.h"
#include <string.h>

enum {
    SQ_JIT_A64_NO_RESULT_SLOT = 0xFF,
    SQ_JIT_A64_MAX_INSTRUCTIONS = 512,
    SQ_JIT_A64_IP_TABLE_SIZE = SQ_JIT_A64_MAX_INSTRUCTIONS + 1,
    SQ_JIT_A64_MAX_RELOCS = SQ_JIT_A64_MAX_INSTRUCTIONS,
    SQ_JIT_A64_MAX_EXIT_RELOCS = 128,
    SQ_JIT_A64_MAX_GUARD_RELOCS = MAX_FUNC_STACKSIZE + SQ_JIT_A64_MAX_RELOCS
};


static inline bool sqjit_a64_slot_index_valid(SQInteger slot);
static inline bool sqjit_a64_type_is_object_ptr(SQObjectType type);

struct SQJitA64SlotState : SQJitSlotState {
    SQArray *array_ptr_observed;
    bool array_ptr_fresh;
    // Construction-derived preference, never a proof about the live array.
    // Aliases/calls/control flow can invalidate it: every selected load must
    // retain its bounds and element-tag guards, with ordinary replay on miss.
    SQUnsignedInteger array_element_types;
    SQInteger object_ptr_observed;
    SQObjectType object_ptr_observed_type;
    bool object_ptr_fresh_table;
    SQObjectType stack_object_observed_type;
    SQInteger stack_object_observed_ptr;

    void AssertConsistent() const
    {
#ifndef NDEBUG
        if(kind != SQ_JIT_SLOT_STACK_OBJECT) {
            assert(stack_object_reg == -1);
            assert(stack_object_observed_type == OT_NULL);
            assert(stack_object_observed_ptr == 0);
        }
        if(kind != SQ_JIT_SLOT_ARRAY_PTR) {
            assert(array_ptr_observed == NULL);
            assert(!array_ptr_fresh);
            assert(array_element_types == 0);
        }
        if(kind != SQ_JIT_SLOT_OBJECT_PTR) {
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
        array_element_types = 0;
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
        SQJitSlotState::Reset();
        ClearDerived();
        AssertConsistent();
    }

    void MarkUnknown()
    {
        kind = SQ_JIT_SLOT_UNKNOWN;
        ClearDerived();
        AssertConsistent();
    }

    void MarkInt()
    {
        MarkScalar(SQ_JIT_SLOT_INT, false);
        ClearDerived();
        AssertConsistent();
    }

    void MarkFloat()
    {
        MarkScalar(SQ_JIT_SLOT_FLOAT, false);
        ClearDerived();
        AssertConsistent();
    }

    void MarkBool()
    {
        MarkScalar(SQ_JIT_SLOT_BOOL, false);
        ClearDerived();
        AssertConsistent();
    }

    void MarkStackObject(SQInteger reg)
    {
        kind = SQ_JIT_SLOT_STACK_OBJECT;
        ClearDerived();
        stack_object_reg = reg;
        AssertConsistent();
    }

    void MarkArrayPtr(SQArray *observed, bool fresh)
    {
        kind = SQ_JIT_SLOT_ARRAY_PTR;
        ClearDerived();
        array_ptr_observed = observed;
        array_ptr_fresh = fresh;
        AssertConsistent();
    }

    void MarkObjectPtr(SQObjectType type, SQInteger observed, bool fresh_table)
    {
        kind = SQ_JIT_SLOT_OBJECT_PTR;
        ClearDerived();
        object_ptr_observed_type = type;
        object_ptr_observed = observed;
        object_ptr_fresh_table = fresh_table;
        AssertConsistent();
    }

    void CopyArrayPtrFrom(const SQJitA64SlotState &src)
    {
        assert(src.kind == SQ_JIT_SLOT_ARRAY_PTR);
        SQUnsignedInteger element_types = src.array_element_types;
        MarkArrayPtr(src.array_ptr_observed, src.array_ptr_fresh);
        array_element_types = element_types;
    }

    void NoteArrayElement(SQObjectType type)
    {
        assert(kind == SQ_JIT_SLOT_ARRAY_PTR);
        // OT_NULL also represents an unknown appended value. Either prevents
        // an unsupported or mixed construction from acquiring a scalar hint.
        array_element_types |= _RAW_TYPE(type);
    }

    SQObjectType ArrayElementHint() const
    {
        if(array_element_types == _RT_INTEGER) return OT_INTEGER;
        if(array_element_types == _RT_FLOAT) return OT_FLOAT;
        return OT_NULL;
    }

    void CopyObjectPtrFrom(const SQJitA64SlotState &src)
    {
        assert(src.kind == SQ_JIT_SLOT_OBJECT_PTR);
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
        assert(kind == SQ_JIT_SLOT_STACK_OBJECT);
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



enum SQJitA64NumberConversion {
    SQ_JIT_A64_NUMBER_CONVERSION_NONE = 0,
    SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT,
    SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER
};

struct SQJitA64CommonPreparedCallState {
    SQInteger array_len_base[MAX_FUNC_STACKSIZE];
    SQClosure *direct_closure[MAX_FUNC_STACKSIZE];
    SQNativeMathKind math_intrinsic[MAX_FUNC_STACKSIZE];
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
        math_intrinsic[slot] = SQ_NATIVE_MATH_NONE;
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
