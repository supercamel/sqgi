#include "sqpcheader.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqstring.h"
#include "jit/sqjit_write_log.h"
#include "jit/sqjit_platform.h"
#if SQJIT_HAS_X64_NATIVE
#include "jit/sqjit_backend_x64_helpers.h"
#endif
#include <stdio.h>
#include <string.h>
#include <initializer_list>

#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
static int allocations_left = 0;
static void *failing_allocate(SQUnsignedInteger size)
{
    return --allocations_left == 0 ? NULL : sq_vm_malloc(size);
}

int main()
{
    int rc = 0;
    SQVM *v = sq_open(64);
    {
        // Reuse poisoned caller-owned storage at empty/partial/full/grown sizes.
        // Unused inline entries must never be read or destroyed.
        alignas(SQJitWriteLog) unsigned char storage[sizeof(SQJitWriteLog)];
        SQObjectPtr target(SQArray::Create(v->_sharedstate, 32));
        for(SQInteger count : {0,1,7,8,9,32}) for(bool rollback : {false,true}) {
            memset(storage, 0xa5, sizeof(storage));
            for(SQInteger n=0; n<32; ++n) _array(target)->Set(n, SQObjectPtr(n));
            SQInteger slot = 0;
            sqjit_write_log_init_frame(&slot, storage);
            SQJitWriteLog *log = sqjit_write_log_ensure(&slot);
            CHECK((void *)log == (void *)storage, "frame storage avoids allocating the log object");
            for(SQInteger n=0; n<count; ++n) {
                CHECK(log->RecordArray(target, n), "frame log grows using the ordinary journal");
                _array(target)->Set(n, SQObjectPtr(n+100));
            }
            sqjit_write_log_release(&slot, rollback, false);
            CHECK(!slot && _refcounted(target)->_uiRef == 1, "frame cleanup releases every retained owner");
            for(SQInteger n=0; n<32; ++n)
                CHECK(_integer(_array(target)->_values[n]) == n + (!rollback && n<count ? 100 : 0),
                    "frame commit and rollback preserve array contents");
        }
    }
    {
        SQObjectPtr a(SQArray::Create(v->_sharedstate, 16000));
        SQObjectPtr alias(a);
        SQArray *array = _array(a);
        for(SQInteger n = 0; n < array->Size(); ++n) array->Set(n, SQObjectPtr(n));
        {
            SQJitWriteLog log;
            for(SQInteger n = 0; n < 100000; ++n) {
                CHECK(log.RecordArray(n & 1 ? a : alias, n % 8), "repeated/aliased record succeeds");
                array->Set(n % 8, SQObjectPtr(n + 10));
            }
            CHECK(log.Size() == 8, "repeated scalar writes retain exactly the first values");
            log.Rollback();
            for(SQInteger n = 0; n < 8; ++n) CHECK(_integer(array->_values[n]) == n, "repeated rollback restores original");
        }
        {
            SQJitWriteLog log;
            for(SQInteger n = 0; n < array->Size(); ++n) {
                CHECK(log.RecordArray(a, n), "distinct record succeeds through hash growth");
                array->Set(n, SQObjectPtr(n + 10));
            }
            CHECK(log.Size() == 16000, "distinct entries retained");
            for(SQInteger n = 0; n < array->Size(); ++n) CHECK(log.RecordArray(a, n), "indexed repeated record succeeds");
            CHECK(log.Size() == 16000, "hash lookup deduplicates existing destinations");
            log.Rollback();
            for(SQInteger n = 0; n < array->Size(); ++n) CHECK(_integer(array->_values[n]) == n, "distinct rollback restores original");
        }
        for(int fail_at = 1; fail_at <= 2; ++fail_at) {
            allocations_left = fail_at;
            SQJitWriteLog log(100, failing_allocate);
            for(SQInteger n = 64; n < 72; ++n) {
                CHECK(log.RecordArray(a, n), "inline log needs no allocation");
                array->Set(n, SQObjectPtr(n + 10));
            }
            if(fail_at == 1) {
                CHECK(!log.RecordArray(a, 72) && log.Size() == 8, "failed entry allocation leaves log intact");
            }
            else {
                CHECK(log.RecordArray(a, 72) && log.Size() == 9, "ordered writes defer hash allocation");
                CHECK(!log.RecordArray(a, 64) && log.Size() == 9, "failed hash allocation leaves log intact");
            }
            log.Rollback();
            for(SQInteger n = 64; n < 73; ++n) CHECK(_integer(array->_values[n]) == n, "allocation failure is replayable");
        }
        {
            SQJitWriteLog log(1);
            CHECK(log.RecordArray(a, 0) && log.RecordArray(alias, 0), "existing destinations work at budget");
            CHECK(!log.RecordArray(a, 1) && log.Size() == 1, "budget rejects before mutation");
            CHECK(!log.RecordArray(a, -1) && !log.RecordArray(a, 16000), "bounds checked before record");
        }
        {
            SQJitWriteLog log;
            CHECK(log.RecordArray(a, 0), "record before resize");
            array->Set(0, SQObjectPtr((SQInteger)99));
            CHECK(log.RecordArraySize(a, array->Size()), "record structural boundary");
            array->Resize(16001);
            CHECK(log.RecordArray(a, 0) && log.RecordArray(a, 16000), "record after growth");
            array->Set(0, SQObjectPtr((SQInteger)100));
            array->Set(16000, SQObjectPtr((SQInteger)100));
            log.Rollback();
            CHECK(array->Size() == 16000 && _integer(array->_values[0]) == 0, "reverse replay crosses resize correctly");
        }
        {
            SQObjectPtr other(SQArray::Create(v->_sharedstate,65));
            _array(other)->Set(63,SQObjectPtr((SQInteger)7));
            SQJitWriteLog log;
            CHECK(log.RecordArray(a,63) && log.RecordArray(a,64), "bitmap boundary records");
            array->Set(63,SQObjectPtr((SQInteger)100)); array->Set(64,SQObjectPtr((SQInteger)100));
            CHECK(log.RecordArray(other,63), "bitmap distinguishes array identity");
            _array(other)->Set(63,SQObjectPtr((SQInteger)100));
            CHECK(log.RecordArray(a,63) && log.RecordArray(a,64) && log.RecordArray(other,63), "bitmap and indexed lookup agree");
            CHECK(log.Size()==3,"distinct identities retain first values");
            log.Rollback();
            CHECK(_integer(array->_values[63])==63 && _integer(array->_values[64])==64 &&
                _integer(_array(other)->_values[63])==7,"bitmap boundary and identity rollback");
        }
        SQObjectPtr old(SQArray::Create(v->_sharedstate, 0));
        array->Set(0, old);
        SQUnsignedInteger refs = _refcounted(old)->_uiRef;
        {
            SQJitWriteLog log;
            CHECK(log.RecordArray(a, 0), "old object retained");
            array->Set(0, SQObjectPtr((SQInteger)3));
            CHECK(_refcounted(old)->_uiRef == refs, "undo log owns displaced object");
            CHECK(log.RecordArray(a, 0), "later scalar replacement deduplicates");
            array->Set(0, SQObjectPtr((SQInteger)4));
            log.Rollback();
            CHECK(sq_type(array->_values[0]) == OT_ARRAY && _array(array->_values[0]) == _array(old), "rollback restores object identity");
        }
        CHECK(_refcounted(old)->_uiRef == refs, "log destruction balances references");
        {
            SQJitWriteLog log;
            CHECK(log.RecordArray(a, 0), "commit log retains original");
            array->Set(0, SQObjectPtr((SQInteger)5));
        }
        CHECK(_refcounted(old)->_uiRef == refs - 1 && _integer(array->_values[0]) == 5, "commit releases old value and keeps mutation");
        SQObjectPtr weak(_array(old)->GetWeakRef(OT_ARRAY));
        array->Set(0, weak);
        {
            SQJitWriteLog log;
            CHECK(log.RecordArray(a, 0), "weak reference recorded without dereference");
            array->Set(0, SQObjectPtr((SQInteger)0));
            log.Rollback();
        }
        CHECK(sq_type(array->_values[0]) == OT_WEAKREF && _weakref(array->_values[0]) == _weakref(weak), "rollback preserves weak reference tag and identity");
        SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
        SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("value")));
        _table(table)->NewSlot(key, SQObjectPtr((SQInteger)1));
        {
            SQJitWriteLog log;
            CHECK(log.RecordMember(table, key, SQObjectPtr((SQInteger)1)), "member record");
            _table(table)->Set(key, SQObjectPtr((SQInteger)2));
            CHECK(log.RecordMember(table, key, SQObjectPtr((SQInteger)2)), "repeated member record");
            CHECK(log.Size() == 1, "member scalar replacement retains first value only");
            _table(table)->Set(key, SQObjectPtr((SQInteger)3));
            log.Rollback();
        }
        {
            SQObjectPtr owner(SQArray::Create(v->_sharedstate, 32));
            SQObjectPtr value(SQArray::Create(v->_sharedstate, 0));
            for(SQInteger n = 0; n < 32; ++n) _array(owner)->Set(n, value);
            SQUnsignedInteger value_refs = _refcounted(value)->_uiRef;
            SQUnsignedInteger key_refs = _refcounted(key)->_uiRef;
            {
                SQJitWriteLog log;
                for(SQInteger n = 0; n < 32; ++n) {
                    CHECK(log.RecordArray(owner, n), "owned array values survive log growth");
                    _array(owner)->Set(n, SQObjectPtr(n));
                    CHECK(log.RecordMember(table, key, SQObjectPtr(n ? n - 1 : 1)), "member keys survive log growth");
                    _table(table)->Set(key, SQObjectPtr(n));
                    CHECK(_refcounted(value)->_uiRef == value_refs, "growth transfers every displaced value reference exactly once");
                    CHECK(_refcounted(key)->_uiRef == key_refs + 1, "growth retains the deduplicated member key exactly once");
                }
                log.Rollback();
                for(SQInteger n = 0; n < 32; ++n)
                    CHECK(sq_type(_array(owner)->_values[n]) == OT_ARRAY &&
                        _array(_array(owner)->_values[n]) == _array(value), "mixed grown log restores object identity");
            }
            CHECK(_refcounted(value)->_uiRef == value_refs && _refcounted(key)->_uiRef == key_refs,
                "destroying a grown mixed log balances all moved references");
        }
        SQObjectPtr result;
        CHECK(_table(table)->Get(key, result) && _integer(result) == 1, "member reverse replay restores original");
        {
            SQObjectPtr other(SQTable::Create(v->_sharedstate, 0));
            for(SQInteger n = 0; n < 32; ++n) {
                _table(table)->NewSlot(SQObjectPtr(n), SQObjectPtr(n));
                _table(other)->NewSlot(SQObjectPtr(n), SQObjectPtr(n));
            }
            SQJitWriteLog log(64);
            for(SQInteger n = 0; n < 100000; ++n) {
                const SQObjectPtr &target = n & 32 ? table : other;
                SQObjectPtr member(n % 32), old_value;
                CHECK(_table(target)->Get(member, old_value), "read old scalar member");
                CHECK(log.RecordMember(target, member, old_value), "repeated member writes stay within budget");
                _table(target)->Set(member, SQObjectPtr(n + 100));
            }
            CHECK(log.Size() == 64, "member hash distinguishes target identity and key");
            CHECK(!log.RecordMember(table, key, SQObjectPtr((SQInteger)1)), "new member fails at budget");
            log.Rollback();
            for(SQInteger n = 0; n < 32; ++n) {
                CHECK(_table(table)->Get(SQObjectPtr(n), result) && _integer(result) == n, "table member restored");
                CHECK(_table(other)->Get(SQObjectPtr(n), result) && _integer(result) == n, "aliased key in other table restored");
            }
        }
        {
            SQJitWriteLog log;
            SQObjectPtr first(SQArray::Create(v->_sharedstate, 0));
            SQObjectPtr second(SQArray::Create(v->_sharedstate, 0));
            _table(table)->Set(key, first);
            CHECK(log.RecordMember(table, key, first), "first owning member value retained");
            _table(table)->Set(key, second);
            CHECK(log.RecordMember(table, key, second), "intermediate owning member value retained");
            _table(table)->Set(key, SQObjectPtr((SQInteger)0));
            CHECK(log.RecordMember(table, key, SQObjectPtr((SQInteger)0)) && log.Size() == 2,
                "only scalar intermediate member values are elided");
            CHECK(_refcounted(first)->_uiRef == 2 && _refcounted(second)->_uiRef == 2,
                "undo log owns both displaced objects");
            for(int n=0; n<100000; ++n) {
                const SQObjectPtr &value = n%2 ? first : second;
                CHECK(log.RecordMember(table,key,value), "repeated displaced owner stays retained");
                _table(table)->Set(key,value);
            }
            CHECK(log.Size()==2, "object swaps use one record per distinct displaced owner");
            log.Rollback();
            CHECK(_table(table)->Get(key, result) && _array(result) == _array(first), "owning member rollback restores original identity");
        }
#if SQJIT_HAS_X64_NATIVE
        {
            SQObjectPtr stack[1] = {table};
            _table(table)->Set(key, weak);
            SQInteger log_slot = 0;
            CHECK(sqjit_helper_table_set_integer_logged(&log_slot, stack, 0, &key, 7) == SQ_JIT_NATIVE_RETURNED,
                "native table write logs raw weak reference");
            sqjit_write_log_release(&log_slot, true);
            CHECK(_table(table)->GetRaw(key, result) && sq_type(result) == OT_WEAKREF &&
                _weakref(result) == _weakref(weak), "native member rollback preserves weak reference identity");
        }
#endif
    }
    sq_close(v);
    return rc ? 1 : 0;
}
