/* Shared checked member access for interpreter and native call guards. */
#ifndef SQMEMBERCACHE_H
#define SQMEMBERCACHE_H
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqtable.h"
#include "sqclass.h"

static inline bool sq_member_cache_hit(SQMemberCache *cache,
    const SQObjectPtr &self, const SQObjectPtr &key, SQObjectPtr &dest)
{
    if(!cache || cache->_kind == SQ_MEMBER_CACHE_EMPTY ||
        cache->_index < 0) {
        return false;
    }

    if(cache->_kind == SQ_MEMBER_CACHE_TABLE_SLOT) {
        // An index is only a hint, not a shared shape or retained receiver.
        // Check the current table's bounds and key on every access. A moved
        // or deleted field misses normally, even if the old index is reused.
        return sq_type(self) == OT_TABLE &&
            _table(self)->GetCachedSlot(cache->_index, key, dest);
    }

    if(sq_type(cache->_owner) != OT_CLASS) {
        return false;
    }

    SQClass *klass = _class(cache->_owner);
    switch(cache->_kind) {
    case SQ_MEMBER_CACHE_INSTANCE_FIELD:
        if(sq_type(self) == OT_INSTANCE && _instance(self)->_class == klass &&
            cache->_index < (SQInteger)klass->_defaultvalues.size()) {
            dest = _realval(_instance(self)->_values[cache->_index]);
            return true;
        }
        break;
    case SQ_MEMBER_CACHE_INSTANCE_METHOD:
        if(sq_type(self) == OT_INSTANCE && _instance(self)->_class == klass &&
            cache->_index < (SQInteger)klass->_methods.size()) {
            dest = klass->_methods[cache->_index].val;
            return true;
        }
        break;
    case SQ_MEMBER_CACHE_CLASS_FIELD:
        if(sq_type(self) == OT_CLASS && _class(self) == klass &&
            cache->_index < (SQInteger)klass->_defaultvalues.size()) {
            dest = _realval(klass->_defaultvalues[cache->_index].val);
            return true;
        }
        break;
    case SQ_MEMBER_CACHE_CLASS_METHOD:
        if(sq_type(self) == OT_CLASS && _class(self) == klass &&
            cache->_index < (SQInteger)klass->_methods.size()) {
            dest = klass->_methods[cache->_index].val;
            return true;
        }
        break;
    default:
        break;
    }
    return false;
}

static inline bool sq_member_cache_fill(SQMemberCache *cache,
    const SQObjectPtr &self, const SQObjectPtr &key, SQObjectPtr &dest)
{
    SQClass *klass = NULL;
    bool instance = false;
    if(sq_type(self) == OT_INSTANCE) {
        klass = _instance(self)->_class;
        instance = true;
    }
    else if(sq_type(self) == OT_CLASS) {
        klass = _class(self);
    }
    else if(sq_type(self) == OT_TABLE) {
        SQInteger index = -1;
        if(!_table(self)->GetCacheSlot(key, index, dest)) {
            return false;
        }
        if(cache) {
            cache->_owner.Null();
            cache->_kind = SQ_MEMBER_CACHE_TABLE_SLOT;
            cache->_index = index;
        }
        return true;
    }
    else {
        return false;
    }

    SQObjectPtr idx;
    if(!klass || !klass->_members->Get(key, idx)) {
        return false;
    }

    SQInteger member_idx = _member_idx(idx);
    if(_isfield(idx)) {
        if(member_idx >= (SQInteger)klass->_defaultvalues.size()) {
            return false;
        }
        dest = instance ? _realval(_instance(self)->_values[member_idx]) :
            _realval(klass->_defaultvalues[member_idx].val);
        if(cache) {
            cache->_owner = klass;
            cache->_kind = instance ? SQ_MEMBER_CACHE_INSTANCE_FIELD :
                SQ_MEMBER_CACHE_CLASS_FIELD;
            cache->_index = member_idx;
        }
        return true;
    }

    if(!_ismethod(idx) || member_idx >= (SQInteger)klass->_methods.size()) {
        return false;
    }
    dest = klass->_methods[member_idx].val;
    if(cache) {
        cache->_owner = klass;
        cache->_kind = instance ? SQ_MEMBER_CACHE_INSTANCE_METHOD :
            SQ_MEMBER_CACHE_CLASS_METHOD;
        cache->_index = member_idx;
    }
    return true;
}


#endif
