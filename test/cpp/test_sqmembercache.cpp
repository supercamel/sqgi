#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqmemberslot.h"
#include "sqarray.h"
#include <stdio.h>
#include <string>
#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
int main()
{
    int rc = 0;
    SQVM *v = sq_open(64);
    {
        SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
        SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("record")));
        SQObjectPtr value(SQArray::Create(v->_sharedstate, 2)), fetched;
        _table(table)->NewSlot(key, value);
        SQInteger index = -1; SQUnsignedInteger version = 0;
        CHECK(_table(table)->GetCacheSlot(key, index, version, fetched), "cache field location");
        SQObjectPtr *slot = sq_member_raw_slot(table, key);
        SQUnsignedInteger references = _array(value)->_uiRef;
        CHECK(slot && _array(*slot) == _array(value) && _array(value)->_uiRef == references,
            "raw slot lookup borrows without copying its value");
        _table(table)->Set(key, SQObjectPtr((SQInteger)42));
        CHECK(_table(table)->GetCachedSlot(index, version, fetched) && _integer(fetched) == 42,
            "value replacement keeps the cached location and reads the new value");
        _table(table)->NewSlot(key, value);
        CHECK(_table(table)->GetCachedSlot(index, version, fetched) && _array(fetched) == _array(value),
            "existing-slot newslot also preserves the location");
        SQObjectPtr weak(_array(value)->GetWeakRef(OT_ARRAY));
        *sq_member_raw_slot(table, key) = weak;
        CHECK(sq_type(*sq_member_raw_slot(table, key)) == OT_WEAKREF &&
            _table(table)->GetCachedSlot(index, version, fetched) && _array(fetched) == _array(value),
            "raw stores preserve weakref tags while cached reads dereference them");
        fetched.Null(); value.Null();
        CHECK(sq_type(*sq_member_raw_slot(table, key)) == OT_WEAKREF &&
            _table(table)->GetCachedSlot(index, version, fetched) && sq_type(fetched) == OT_NULL,
            "dead weakref stays raw and reads as null");
        for(SQInteger n = 0; n < 200; ++n) _table(table)->NewSlot(SQObjectPtr(n), SQObjectPtr(n));
        CHECK(!_table(table)->GetCachedSlot(index, version, fetched), "rehash invalidates cached locations");
        CHECK(_table(table)->GetCacheSlot(key, index, version, fetched), "refresh after rehash");
        _table(table)->Remove(key);
        CHECK(!_table(table)->GetCachedSlot(index, version, fetched) && !sq_member_raw_slot(table, key),
            "removing a field invalidates caches and raw lookup");
        CHECK(!sq_member_raw_slot(table, SQObjectPtr()), "null does not resolve an unused slot");
        SQObjectPtr klass(SQClass::Create(v->_sharedstate, NULL));
        _class(klass)->NewSlot(v->_sharedstate, key, SQObjectPtr((SQInteger)9), false);
        SQObjectPtr instance(_class(klass)->CreateInstance());
        slot = sq_member_raw_slot(instance, key);
        CHECK(slot && _integer(*slot) == 9, "borrow a class field");
        if(slot) *slot = (SQInteger)11;
        CHECK(_instance(instance)->Get(key, fetched) && _integer(fetched) == 11, "raw instance field store");
    }
    std::basic_string<SQChar> source = _SC("function access(t) { local x=0;");
    for(int n = 0; n < 100; ++n) source += _SC("x=x+1;");
    source += _SC("return t.value }\n"
        "local t={value=7}; if(access(t)!=7) throw \"initial cache\";\n"
        "for(local i=0;i<1000;i++) t[i]<-i; if(access(t)!=7) throw \"rehash\";\n"
        "t.value=11; if(access(t)!=11) throw \"replacement\";\n"
        "delete t.value; t.setdelegate({value=13}); if(access(t)!=13) throw \"delegate fallback\";\n"
        "t.value<-17; if(access(t)!=17) throw \"new slot\";\n"
        "local other={value=19}; for(local i=0;i<5;i++) { if(access(other)!=19 || access(t)!=17) throw \"alternating receivers\"; }\n");
    CHECK(SQ_SUCCEEDED(sq_compilebuffer(v, source.c_str(), source.size(), _SC("member-cache"), SQTrue)), "compile cache workload");
    sq_pushroottable(v);
    CHECK(SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)), "cache preserves rehash, mutation, delegate and receiver behavior");
    sq_pop(v, 1);
    sq_pushroottable(v); sq_pushstring(v, _SC("access"), -1);
    CHECK(SQ_SUCCEEDED(sq_get(v, -2)), "find cached function");
    HSQOBJECT obj; sq_getstackobj(v, -1, &obj);
    if(sq_type(obj) == OT_CLOSURE) {
        SQFunctionProto *p = _closure(obj)->_function;
        CHECK(p->_membercache.size() == 1, "allocate cache records only for access sites");
        CHECK(p->_membercache_offsets.size() == (SQUnsignedInteger)p->_ninstructions, "sparse IP lookup is built once");
        CHECK(p->_membercache.size() * sizeof(SQMemberCache) + p->_membercache_offsets.size() * sizeof(SQInt32) <
            (SQUnsignedInteger)p->_ninstructions * sizeof(SQMemberCache), "sparse cache uses less memory than instruction-wide records");
        const SQObjectPtr &owner = p->_membercache[0]._owner;
        CHECK(sq_type(owner) == OT_WEAKREF && sq_type(_weakref(owner)->_obj) == OT_NULL, "table cache does not retain dead receiver");
    }
    sq_close(v);
    return rc ? 1 : 0;
}
