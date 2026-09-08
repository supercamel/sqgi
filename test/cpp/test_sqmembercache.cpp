#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqmemberslot.h"
#include "sqmembercache.h"
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
        SQInteger index = -1;
        CHECK(_table(table)->GetCacheSlot(key, index, fetched), "cache field location");
        SQObjectPtr *slot = sq_member_raw_slot(table, key);
        SQUnsignedInteger references = _array(value)->_uiRef;
        CHECK(slot && _array(*slot) == _array(value) && _array(value)->_uiRef == references,
            "raw slot lookup borrows without copying its value");
        _table(table)->Set(key, SQObjectPtr((SQInteger)42));
        CHECK(_table(table)->GetCachedSlot(index, key, fetched) && _integer(fetched) == 42,
            "value replacement keeps the cached location and reads the new value");
        _table(table)->NewSlot(key, value);
        CHECK(_table(table)->GetCachedSlot(index, key, fetched) && _array(fetched) == _array(value),
            "existing-slot newslot also preserves the location");
        SQObjectPtr weak(_array(value)->GetWeakRef(OT_ARRAY));
        *sq_member_raw_slot(table, key) = weak;
        CHECK(sq_type(*sq_member_raw_slot(table, key)) == OT_WEAKREF &&
            _table(table)->GetCachedSlot(index, key, fetched) && _array(fetched) == _array(value),
            "raw stores preserve weakref tags while cached reads dereference them");
        fetched.Null(); value.Null();
        CHECK(sq_type(*sq_member_raw_slot(table, key)) == OT_WEAKREF &&
            _table(table)->GetCachedSlot(index, key, fetched) && sq_type(fetched) == OT_NULL,
            "dead weakref stays raw and reads as null");
        for(SQInteger n = 0; n < 200; ++n) _table(table)->NewSlot(SQObjectPtr(n), SQObjectPtr(n));
        CHECK(!_table(table)->GetCachedSlot(index, key, fetched) || sq_type(fetched) == OT_NULL,
            "old hint either misses or reads the correct field after rehash");
        CHECK(_table(table)->GetCacheSlot(key, index, fetched), "refresh after rehash");
        _table(table)->Remove(key);
        CHECK(!_table(table)->GetCachedSlot(index, key, fetched) && !sq_member_raw_slot(table, key),
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
    {
        SQMemberCache cache;
        SQObjectPtr table(SQTable::Create(v->_sharedstate, 8));
        SQObjectPtr other(SQTable::Create(v->_sharedstate, 8));
        SQObjectPtr key((SQInteger)1), fetched;
        for(SQInteger n = 0; n < 6; ++n) {
            _table(table)->NewSlot(SQObjectPtr(n), SQObjectPtr(n + 10));
            _table(other)->NewSlot(SQObjectPtr(5 - n), SQObjectPtr(25 - n));
        }
        CHECK(sq_member_cache_fill(&cache, table, key, fetched) && _integer(fetched) == 11,
            "fill checked table hint");
        CHECK(sq_member_cache_hit(&cache, other, key, fetched) && _integer(fetched) == 21,
            "reuse hint across receivers with different insertion orders");
        CHECK(sq_type(cache._owner) == OT_NULL && !_table(table)->_weakref && !_table(other)->_weakref,
            "table hints neither retain nor allocate weak references to receivers");
        _table(table)->Remove(key);
        _table(table)->NewSlot(SQObjectPtr((SQInteger)9), SQObjectPtr((SQInteger)99));
        CHECK(!sq_member_cache_hit(&cache, table, key, fetched),
            "a colliding new key at the old index cannot produce a stale hit");
        CHECK(sq_member_cache_hit(&cache, table, SQObjectPtr((SQInteger)9), fetched) && _integer(fetched) == 99,
            "hint checks the requested key even when it changes");
        SQObjectPtr tiny(SQTable::Create(v->_sharedstate, 0));
        _table(tiny)->NewSlot(SQObjectPtr(true), SQObjectPtr((SQInteger)77));
        CHECK(!sq_member_cache_hit(&cache, tiny, key, fetched), "key types must match, not just raw bits");
        CHECK(!_table(tiny)->GetCachedSlot(-1, key, fetched) &&
            !_table(tiny)->GetCachedSlot(6, key, fetched) &&
            !_table(tiny)->GetCachedSlot(0, SQObjectPtr(), fetched),
            "negative, out-of-bounds and null-key hints miss safely");
        _table(other)->Clear();
        CHECK(!sq_member_cache_hit(&cache, other, key, fetched), "clearing a table invalidates its hint");
        table.Null(); other.Null();
        CHECK(!sq_member_cache_hit(&cache, table, key, fetched), "dead or non-table receiver misses safely");

        SQObjectPtr field(SQString::Create(v->_sharedstate, _SC("value")));
        SQObjectPtr klass(SQClass::Create(v->_sharedstate, NULL));
        _class(klass)->NewSlot(v->_sharedstate, field, SQObjectPtr((SQInteger)31), false);
        SQObjectPtr instance(_class(klass)->CreateInstance());
        CHECK(sq_member_cache_fill(&cache, instance, field, fetched) &&
            sq_member_cache_hit(&cache, instance, field, fetched) && _integer(fetched) == 31,
            "a table access site can switch to an instance field cache");
        SQUnsignedInteger refs = _class(klass)->_uiRef;
        _table(tiny)->NewSlot(field, SQObjectPtr((SQInteger)41));
        CHECK(!sq_member_cache_hit(&cache, tiny, field, fetched) &&
            sq_member_cache_fill(&cache, tiny, field, fetched) && _integer(fetched) == 41 &&
            sq_type(cache._owner) == OT_NULL && _class(klass)->_uiRef == refs - 1,
            "switching back to a table releases the cached class layout");
    }
    {
        // Keep stale hints across receiver changes, rehashes, shrinking,
        // deletes and same-hash collisions; compare every read to lookup.
        SQObjectPtr tables[17];
        SQMemberCache hints[32];
        for(int n = 0; n < 17; ++n) tables[n] = SQTable::Create(v->_sharedstate, n * 4);
        SQUnsignedInteger state = 83;
        for(SQInteger n = 0; n < 4096; ++n) {
            state = (state * 1664525 + 1013904223) & 0xffffffffu;
            SQObjectPtr &table = tables[(state >> 8) % 17];
            SQObjectPtr key((SQInteger)((state >> 16) % 32));
            if(n % 127 == 0) _table(table)->Clear();
            else if(n % 7 == 0) _table(table)->Remove(key);
            else _table(table)->NewSlot(key, SQObjectPtr(n));
            for(SQInteger k = 0; k < 32; ++k) {
                SQObjectPtr probe(k), actual, expected;
                bool found = sq_member_cache_hit(&hints[k], table, probe, actual) ||
                    sq_member_cache_fill(&hints[k], table, probe, actual);
                bool exists = _table(table)->Get(probe, expected);
                CHECK(found == exists && (!found ||
                    (sq_type(actual) == sq_type(expected) && _rawval(actual) == _rawval(expected))),
                    "checked hints agree with lookup during structural mutation");
            }
        }
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
    source += _SC("function invoke(t) { local x=0;");
    for(int n = 0; n < 100; ++n) source += _SC("x=x+1;");
    source += _SC("return t.read() }\n"
        "local records=[]; for(local i=0;i<31;i++) { local r={};"
        "for(local j=0;j<i;j++) r[j]<-j;"
        "r.value<-i; r.read<-function(){return this.value}; records.append(r); }\n"
        "for(local round=0;round<3;round++) foreach(r in records)"
        "if(invoke(r)!=r.value) throw \"method receiver hint\";\n"
        "local r=records[7]; r.read=function(){return this.value+100};"
        "if(invoke(r)!=107) throw \"method replacement\";\n"
        "delete r.read; r.setdelegate({read=function(){return this.value+200}});"
        "if(invoke(r)!=207) throw \"method delegate\";\n"
        "r.setdelegate({_get=function(k){if(k==\"read\") return function(){return this.value+300}; throw k}});"
        "if(invoke(r)!=307) throw \"method metamethod\";\n");
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
        CHECK(sq_type(p->_membercache[0]._owner) == OT_NULL,
            "table cache stores no receiver after its lifetime ends");
    }
    sq_close(v);
    return rc ? 1 : 0;
}
