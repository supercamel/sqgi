/* Borrowed access to existing table slots and instance fields. */
#ifndef SQMEMBERSLOT_H
#define SQMEMBERSLOT_H
#include "sqtable.h"
#include "sqclass.h"

// No delegation, weakref dereference, allocation or user callback. Callers
// must not retain this address across structural mutations or callbacks.
static inline SQObjectPtr *sq_member_raw_slot(const SQObjectPtr &owner, const SQObjectPtr &key)
{
    if(sq_type(owner) == OT_TABLE) return _table(owner)->GetRawSlot(key);
    if(sq_type(owner) != OT_INSTANCE) return NULL;
    SQInstance *instance = _instance(owner);
    SQObjectPtr *index = instance->_class->_members->GetRawSlot(key);
    return index && _isfield(*index) ? &instance->_values[_member_idx(*index)] : NULL;
}
#endif
