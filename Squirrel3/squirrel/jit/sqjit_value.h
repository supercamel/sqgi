/* Native value identity is separate from its machine-word representation. */
#ifndef SQJIT_VALUE_H
#define SQJIT_VALUE_H
#include "sqpcheader.h"

enum SQJitSlotKind {
    SQ_JIT_SLOT_UNKNOWN = 0, SQ_JIT_SLOT_INT, SQ_JIT_SLOT_FLOAT, SQ_JIT_SLOT_BOOL,
    SQ_JIT_SLOT_ARRAY_PTR, SQ_JIT_SLOT_STACK_OBJECT, SQ_JIT_SLOT_LITERAL_OBJECT,
    SQ_JIT_SLOT_OBJECT_PTR, SQ_JIT_SLOT_STRING_PTR, SQ_JIT_SLOT_VIRTUAL_ARRAY
};

inline SQObjectType sqjit_scalar_type(SQJitSlotKind kind)
{
    switch(kind) {
    case SQ_JIT_SLOT_INT: return OT_INTEGER;
    case SQ_JIT_SLOT_FLOAT: return OT_FLOAT;
    case SQ_JIT_SLOT_BOOL: return OT_BOOL;
    default: return OT_NULL;
    }
}

struct SQJitSlotState {
    SQJitSlotState() { Reset(); }
    SQJitSlotKind kind;
    SQInteger stack_object_reg, literal_object_index;
    bool int_materialized, float_materialized, known_const;
    SQInteger const_value;
    SQFloat float_const_value;
    bool dirty, entry_loaded;

    void Reset()
    {
        kind = SQ_JIT_SLOT_UNKNOWN;
        stack_object_reg = literal_object_index = -1;
        int_materialized = float_materialized = known_const = dirty = entry_loaded = false;
        const_value = 0; float_const_value = 0;
    }
    void MarkScalar(SQJitSlotKind type, bool written)
    {
        assert(sqjit_scalar_type(type) != OT_NULL);
        kind = type;
        stack_object_reg = literal_object_index = -1;
        int_materialized = type == SQ_JIT_SLOT_INT || type == SQ_JIT_SLOT_BOOL;
        float_materialized = type == SQ_JIT_SLOT_FLOAT;
        known_const = false; const_value = 0; float_const_value = 0;
        dirty = dirty || written;
    }
};
#endif
