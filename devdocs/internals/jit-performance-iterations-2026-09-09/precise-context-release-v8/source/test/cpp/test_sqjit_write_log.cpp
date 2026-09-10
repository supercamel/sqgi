#include "sqpcheader.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqclass.h"
#include "jit/sqjit_write_log.h"
#include "jit/sqjit_platform.h"
#include "jit/sqjit_context.h"
#if SQJIT_HAS_X64_NATIVE
#include "jit/sqjit_backend_x64_helpers.h"
#endif
#include <stdio.h>
#include <string.h>
#include <initializer_list>
#include <vector>

#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
static int allocations_left = 0;
static void *failing_allocate(SQUnsignedInteger size)
{
    return --allocations_left == 0 ? NULL : sq_vm_malloc(size);
}

struct ReleasePinCheck {
    SQJitContext *context;
    SQJitWriteLog *parent;
    SQObjectPtr *cleared, *remaining;
    int *calls, *failures;
};

static SQInteger check_pins_on_release(SQUserPointer pointer, SQInteger)
{
    ReleasePinCheck &state = *(ReleasePinCheck *)pointer;
    int &rc = *state.failures;
    ++*state.calls;
    CHECK(state.context->active_logs == state.parent, "destroying journal stays registered during release hooks");
    {
        SQJitWriteLog child(1000, sq_vm_malloc, state.context);
        CHECK(child.CanRelease(*state.cleared), "reentry does not count pins already cleared by parent destruction");
        CHECK(!child.CanRelease(*state.remaining), "reentry counts the parent's not-yet-released pins");
    }
    CHECK(state.context->active_logs == state.parent, "nested release-hook journal restores the destroying parent");
    return 0;
}

static void release_barrier_tests(SQVM *v, int &rc)
{
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQObjectPtr a(SQTable::Create(v->_sharedstate, 0)), b(SQTable::Create(v->_sharedstate, 0));
    // The only strong program references are these two heap slots. Weak
    // observers make final destruction observable even for childless arrays.
    std::vector<SQObjectPtr> observed;
    for(SQInteger n = 0; n < 73; ++n) {
        SQObjectPtr value(SQArray::Create(v->_sharedstate, 0));
        observed.push_back(SQObjectPtr(_array(value)->GetWeakRef(OT_ARRAY)));
        _table(a)->NewSlot(SQObjectPtr(n), value);
        _table(b)->NewSlot(SQObjectPtr(n), value);
    }
    {
        SQJitWriteLog outer(1000, sq_vm_malloc, &ctx);
        CHECK(ctx.active_logs == &outer, "native journal registers per shared state");
        for(SQInteger n = 0; n < 73; ++n) {
            SQObjectPtr key(n);
            SQObjectPtr *slot = _table(a)->GetRawSlot(key);
            CHECK(outer.RecordMember(a, key, *slot), "another real owner permits a heap store");
            *slot = (SQInteger)0;
        }
        for(SQInteger n = 0; n < 73; ++n) {
            SQObjectPtr key(n);
            SQObjectPtr *slot = _table(b)->GetRawSlot(key);
            CHECK(!outer.RecordMember(b, key, *slot), "indexed journal pins cannot hide a final release");
        }
        {
            SQJitWriteLog inner(1000, sq_vm_malloc, &ctx);
            CHECK(ctx.active_logs == &inner, "nested native journal shares pin accounting");
            SQObjectPtr key((SQInteger)37);
            SQObjectPtr *slot = _table(b)->GetRawSlot(key);
            CHECK(!inner.RecordMember(b, key, *slot) && inner.Size() == 0,
                "callee cannot treat caller pins as independent program owners");
            SQObjectPtr keep(*slot);
            CHECK(inner.RecordMember(b, key, *slot), "an actual additional owner permits the same nested store");
            *slot = (SQInteger)9;
            inner.Rollback();
        }
        CHECK(ctx.active_logs == &outer, "nested journal restores its parent");
        outer.Rollback();
    }
    CHECK(ctx.active_logs == NULL, "native journal chain clears after rollback");
    {
        SQObjectPtr array(SQArray::Create(v->_sharedstate, 2));
        SQObjectPtr weak;
        {
            SQObjectPtr value(SQArray::Create(v->_sharedstate, 0));
            weak = _array(value)->GetWeakRef(OT_ARRAY);
            _array(array)->_values[0] = value; _array(array)->_values[1] = value;
        }
        SQJitWriteLog log;
        CHECK(log.RecordArray(array, 0), "aliased array element has another real owner");
        _array(array)->_values[0] = (SQInteger)0;
        CHECK(!log.RecordArray(array, 1), "array element release ignores earlier undo pins");
        log.Rollback();
    }
    {
        SQObjectPtr value(SQString::Create(v->_sharedstate, _SC("observed-release-leaf")));
        SQObjectPtr weak(_refcounted(value)->GetWeakRef(OT_STRING));
        SQJitWriteLog log;
        CHECK(!log.CanRelease(value), "even a leaf's weakly observed final release is observable");
        CHECK(log.RetainValue(value) && !log.CanRelease(value), "capture pins do not change weak-death eligibility");
        SQObjectPtr keep(value);
        CHECK(log.CanRelease(value), "another program owner keeps a weakly observed leaf alive");
    }
    {
        allocations_left = 100;
        SQJitWriteLog log(1000, failing_allocate);
        SQObjectPtr scalar_table(SQTable::Create(v->_sharedstate, 0));
        // Scalar old values build a nonempty journal without needing a pin index.
        for(SQInteger n = 0; n < 9; ++n) {
            SQObjectPtr key(n);
            _table(scalar_table)->NewSlot(key, SQObjectPtr(n));
            CHECK(log.RecordMember(scalar_table, key, *_table(scalar_table)->GetRawSlot(key)),
                "prepare pin-index allocation failure");
        }
        allocations_left = 1;
        SQObjectPtr *slot = _table(b)->GetRawSlot(SQObjectPtr((SQInteger)0));
        SQUnsignedInteger refs = _refcounted(*slot)->_uiRef;
        CHECK(!log.CanRelease(*slot) && _refcounted(*slot)->_uiRef == refs && log.Size() == 9,
            "pin-index allocation failure leaves owners and journal unchanged");
    }
    for(bool heap : {false, true}) for(bool mixed : {false, true}) {
        SQObjectPtr cleared(SQArray::Create(v->_sharedstate, 0)), keep(cleared);
        SQObjectPtr remaining(SQArray::Create(v->_sharedstate, 0));
        SQObjectPtr weak_remaining(_array(remaining)->GetWeakRef(OT_ARRAY));
        SQObjectPtr interleaved(SQArray::Create(v->_sharedstate, 2));
        int calls = 0;
        ReleasePinCheck state = {&ctx, NULL, &cleared, &remaining, &calls, &rc};
        {
            SQJitWriteLog log(1000, sq_vm_malloc, &ctx);
            state.parent = &log;
            SQObjectPtr hook_owner(SQClass::Create(v->_sharedstate, NULL));
            _class(hook_owner)->_typetag = &state;
            _class(hook_owner)->_hook = check_pins_on_release;
            // Inline entries are destroyed backwards; heap entries forwards.
            CHECK(log.RetainValue(heap ? cleared : remaining), "prepare first cleanup owner");
            if(mixed) CHECK(log.RecordArray(interleaved, 0), "interleave heap and compact cleanup records");
            CHECK(log.RetainValue(hook_owner), "prepare cleanup callback");
            if(mixed) CHECK(log.RecordArray(interleaved, 1), "interleave another heap record after callback");
            CHECK(log.RetainValue(heap ? remaining : cleared), "prepare last cleanup owner");
            hook_owner.Null();
            if(heap) for(int n = 0; n < 24; ++n) {
                SQObjectPtr padding(SQArray::Create(v->_sharedstate, 0));
                CHECK(log.RetainValue(padding), "grow the parent journal before cleanup reentry");
            }
            CHECK(log.CanRelease(cleared), "populate parent pin census before destructive reentry");
        }
        CHECK(calls == 1 && ctx.active_logs == NULL,
            "inline and heap cleanup invoke one callback and unregister the journal");
        CHECK(_refcounted(cleared)->_uiRef == 2 && _refcounted(remaining)->_uiRef == 1,
            "cleanup reentry preserves exact remaining program ownership");
    }
}

static void scalar_array_release_tests(SQVM *v, int &rc)
{
    for(SQInteger size : {0, 1, 4, 64}) {
        SQObjectPtr value(SQArray::Create(v->_sharedstate, size));
        for(SQInteger n = 0; n < size; ++n) {
            switch(n % 4) {
                case 0: _array(value)->_values[n] = n; break;
                case 1: _array(value)->_values[n] = (SQFloat)0.5; break;
                case 2: _array(value)->_values[n] = true; break;
                default: _array(value)->_values[n].Null(); break;
            }
        }
        SQJitWriteLog log;
        CHECK(log.CanRelease(value), "unobserved scalar-only arrays have no release effects");
        CHECK(log.RetainValue(value) && log.CanRelease(value), "scalar leaf proof is independent of journal pins");
        SQObjectPtr weak(_array(value)->GetWeakRef(OT_ARRAY));
        CHECK(!log.CanRelease(value), "a new weak observer immediately invalidates the scalar array proof");
        {
            SQObjectPtr real_alias(value);
            CHECK(log.CanRelease(value), "an observed array with a real alias still passes normal owner accounting");
        }
        CHECK(!log.CanRelease(value), "removing the real alias restores the observed final-release guard");
    }
    {
        SQObjectPtr value(SQArray::Create(v->_sharedstate, 1));
        SQJitWriteLog log;
        CHECK(log.CanRelease(value), "initial scalar contents permit the leaf proof");
        _array(value)->_values[0] = SQArray::Create(v->_sharedstate, 0);
        CHECK(!log.CanRelease(value), "a newly inserted child invalidates the proof without cached type assumptions");
        _array(value)->_values[0] = SQString::Create(v->_sharedstate, _SC("owned-child"));
        CHECK(!log.CanRelease(value), "reference-valued elements remain conservative even when they are leaves");
        _array(value)->_values[0] = (SQInteger)7;
        CHECK(log.CanRelease(value), "current scalar contents can recover eligibility");
        _array(value)->Reserve(65);
        CHECK(!log.CanRelease(value), "large reserved backing storage stays outside bounded deferred release");
    }
}

static void logical_stack_tests(SQVM *v, int &rc, bool fused)
{
    auto publish = [fused](SQJitWriteLog &log, SQObjectPtr *slot, const SQObject &value, bool getter) {
        return fused ? log.PublishStackWrite(slot, value, getter) :
            log.BeginStackWrite(slot) && log.FinishStackWrite(value, getter);
    };
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQJitExecutionScope execution(ctx, v);
    SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("owner")));
    _table(table)->NewSlot(key, SQObjectPtr(SQArray::Create(v->_sharedstate, 0)));
    SQObjectPtr *member = _table(table)->GetRawSlot(key);
    SQObjectPtr weak(_array(*member)->GetWeakRef(OT_ARRAY));
    SQObjectPtr locals[2];
    v->temp_reg.Null();
    {
        SQJitWriteLog log(1000, sq_vm_malloc, &ctx);
        CHECK(publish(log, &locals[0], *member, true),
            "GET materializes a real logical local owner");
        CHECK(_array(locals[0]) == _array(*member) && sq_type(v->temp_reg) == OT_NULL,
            "GET swaps the old destination into the real VM temporary");
        CHECK(log.RecordMember(table, key, *member), "a materialized local permits displacement of the heap owner");
        *member = (SQInteger)9;
        CHECK(!publish(log, &locals[0], SQObjectPtr((SQInteger)5), false),
            "last logical local release cannot be hidden by heap or stack snapshots");
        CHECK(sq_type(locals[0]) == OT_ARRAY, "failed local overwrite leaves its current value intact");
        CHECK(publish(log, &locals[1], locals[0], false),
            "MOVE creates a second real local owner");
        CHECK(publish(log, &locals[0], SQObjectPtr((SQInteger)5), false),
            "another local permits an otherwise identical overwrite");
        // Simulate a boxed getter which published into the destination before
        // its emitter can finish the VM temporary transition.
        CHECK(log.BeginStackWrite(&locals[1]), "stage a helper-materialized getter");
        locals[1] = (SQInteger)7;
        CHECK(log.FinishStackWrite(locals[1], true) && _integer(locals[1]) == 7 &&
            sq_type(v->temp_reg) == OT_ARRAY, "GET restores the displaced owner before swapping through temp_reg");
        CHECK(!publish(log, &locals[0], SQObjectPtr((SQInteger)8), true),
            "next GET detects final destruction of the VM temporary");
        log.Rollback();
    }
    CHECK(sq_type(locals[0]) == OT_NULL && sq_type(locals[1]) == OT_NULL &&
        sq_type(v->temp_reg) == OT_NULL && sq_type(*member) == OT_ARRAY &&
        _refcounted(*member)->_uiRef == 1 && sq_type(_weakref(weak)->_obj) == OT_ARRAY,
        "logical owner rollback restores exact heap, VM stack and temporary ownership");
    {
        SQJitWriteLog log;
        for(SQInteger n = 0; n < 1000; ++n) {
            CHECK(publish(log, &locals[0], SQObjectPtr(n), false),
                "repeated scalar publication stays bounded");
        }
        CHECK(log.Size() == 1, "one snapshot suffices for repeated scalar slot writes");
        log.Rollback();
    }
}

static void private_publication_tests(SQVM *v, int &rc)
{
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQJitExecutionScope execution(ctx, v);
    for(bool getter : {false, true}) for(bool rollback : {false, true})
        for(int source = 0; source < 3; ++source) {
        SQObjectPtr owners[3] = {SQObjectPtr(SQArray::Create(v->_sharedstate, 0)),
            SQObjectPtr(SQArray::Create(v->_sharedstate, 0)),
            SQObjectPtr(SQArray::Create(v->_sharedstate, 0))};
        SQObjectPtr slot(owners[0]); v->temp_reg = owners[1];
        const SQObject &input = source == 0 ? slot : source == 1 ? v->temp_reg : owners[2];
        {
            SQJitWriteLog log(100, sq_vm_malloc, &ctx);
            CHECK(log.PublishStackWrite(&slot, input, getter), "private publication accepts destination and temporary aliases");
            CHECK(_array(slot) == _array(owners[source]) &&
                _array(v->temp_reg) == _array(owners[getter ? 0 : 1]),
                "private publication preserves assignment versus GET-swap state");
            CHECK(log.Size() == (getter ? 2 : 1), "private publication uses only the required rollback snapshots");
            if(rollback) log.Rollback();
        }
        const int final_slot = rollback ? 0 : source, final_temp = rollback ? 1 : getter ? 0 : 1;
        for(int n = 0; n < 3; ++n)
            CHECK(_refcounted(owners[n])->_uiRef == (SQUnsignedInteger)(1 + (n == final_slot) + (n == final_temp)),
                "private commit/rollback preserves exact aliased owner counts");
        v->temp_reg.Null();
    }
    {
        SQObjectPtr slot(SQString::Create(v->_sharedstate, _SC("private-self-observed")));
        SQObjectPtr weak(_refcounted(slot)->GetWeakRef(OT_STRING));
        {
            SQJitWriteLog log;
            CHECK(log.PublishStackWrite(&slot, slot, false), "self publication never drops a weakly observed final owner");
            log.Rollback();
        }
        CHECK(_refcounted(slot)->_uiRef == 1 && sq_type(_weakref(weak)->_obj) == OT_STRING,
            "self publication leaves no staging references");
    }
    {
        SQObjectPtr slots[2] = {SQObjectPtr((SQInteger)11), SQObjectPtr((SQInteger)17)};
        SQJitWriteLog log;
        CHECK(!log.PublishStackWrite(NULL, slots[0], false) && log.Size() == 0,
            "invalid private destination does not acquire a snapshot");
        CHECK(log.BeginStackWrite(&slots[0]), "prepare mixed staged/private publication");
        CHECK(!log.PublishStackWrite(&slots[1], slots[0], false) && log.Size() == 1 && _integer(slots[1]) == 17,
            "private publication cannot bypass an outstanding staged write");
        CHECK(log.FinishStackWrite(slots[1], false) && _integer(slots[0]) == 17,
            "rejected private publication leaves the staged write usable");
        log.Rollback();
        CHECK(_integer(slots[0]) == 11, "mixed publication rollback restores the staged input");
    }
    {
        SQObjectPtr slot((SQInteger)11), value(SQArray::Create(v->_sharedstate, 0));
        v->temp_reg = (SQInteger)17;
        SQJitWriteLog log(1, sq_vm_malloc, &ctx);
        CHECK(!log.PublishStackWrite(&slot, value, true) && log.Size() == 1 &&
            _integer(slot) == 11 && _integer(v->temp_reg) == 17 && _refcounted(value)->_uiRef == 1,
            "temporary-snapshot capacity failure changes no destination or source owner");
        log.Rollback(); v->temp_reg.Null();
    }
    {
        SQObjectPtr slots[9], value(SQArray::Create(v->_sharedstate, 0));
        allocations_left = 100;
        SQJitWriteLog log(100, failing_allocate, &ctx);
        for(int n = 0; n < 9; ++n) {
            slots[n] = (SQInteger)n;
            CHECK(log.RecordStackSlot(&slots[n]), "prepare grown private-publication snapshots");
        }
        allocations_left = 1;
        CHECK(!log.PublishStackWrite(&slots[8], value, false) && _integer(slots[8]) == 8 &&
            _refcounted(value)->_uiRef == 1, "private snapshot-index allocation failure is replayable");
        allocations_left = 100;
        CHECK(log.PublishStackWrite(&slots[8], value, false), "private publication retries after index allocation recovers");
        log.Rollback();
        CHECK(_integer(slots[8]) == 8 && _refcounted(value)->_uiRef == 1,
            "recovered private publication restores its original scalar slot");
    }
}

static void owner_index_tests(SQVM *v, int &rc)
{
    const int count = 73;
    std::vector<SQObjectPtr> values;
    for(int n = 0; n < count; ++n) values.push_back(SQObjectPtr(SQArray::Create(v->_sharedstate, 0)));
    SQObjectPtr tables[] = {SQObjectPtr(SQTable::Create(v->_sharedstate, 0)),
        SQObjectPtr(SQTable::Create(v->_sharedstate, 0))};
    SQObjectPtr keys[] = {SQObjectPtr(SQString::Create(v->_sharedstate, _SC("first"))),
        SQObjectPtr(SQString::Create(v->_sharedstate, _SC("second"))), SQObjectPtr((SQInteger)0)};
    for(auto &table : tables) for(int k = 0; k < 3; ++k)
        _table(table)->NewSlot(keys[k], SQObjectPtr((SQInteger)(k - 13)));
    {
        SQJitWriteLog log(6 * (count + 1));
        for(int t = 0; t < 2; ++t) for(int k = 0; k < 3; ++k) {
            for(int n = 0; n < count * 3; ++n) {
                SQObjectPtr old;
                CHECK(_table(tables[t])->GetRaw(keys[k], old), "read raw old owner");
                CHECK(log.RecordMember(tables[t], keys[k], old), "shared owners keep independent destination histories");
                _table(tables[t])->Set(keys[k], values[(n * 19 + k + t) % count]);
            }
            SQObjectPtr old;
            CHECK(_table(tables[t])->GetRaw(keys[k], old) && log.RecordMember(tables[t], keys[k], old),
                "retain the last displaced owner");
            _table(tables[t])->Set(keys[k], SQObjectPtr((SQInteger)99));
            CHECK(log.RecordMember(tables[t], keys[k], SQObjectPtr((SQInteger)99)),
                "scalar writes find the first destination despite many later owners");
        }
        CHECK(log.Size() == 6 * (count + 1), "one first scalar plus each distinct owner per destination");
        for(const auto &value : values)
            CHECK(_refcounted(value)->_uiRef == 7, "all displaced owners retained once for each destination");
        log.Rollback();
        for(auto &table : tables) for(int k = 0; k < 3; ++k) {
            SQObjectPtr actual;
            CHECK(_table(table)->GetRaw(keys[k], actual) && sq_type(actual) == OT_INTEGER &&
                _integer(actual) == k - 13, "grown owner index restores the first scalar value");
        }
    }
    for(const auto &value : values) CHECK(_refcounted(value)->_uiRef == 1, "indexed owner cleanup balances references");

    // Fail each allocation through initial indexes and three entry/index growth
    // stages. A failed lookup/append must not mutate or acquire the next owner.
    for(int fail_at = 1; fail_at <= 12; ++fail_at) {
        allocations_left = fail_at;
        bool failed = false;
        {
            SQJitWriteLog log(1000, failing_allocate);
            for(int n = 0; n <= count; ++n) {
                SQObjectPtr old;
                CHECK(_table(tables[0])->GetRaw(keys[0], old), "read before injected owner-index failure");
                SQUnsignedInteger refs = ISREFCOUNTED(sq_type(old)) ? _refcounted(old)->_uiRef : 0;
                if(!log.RecordMember(tables[0], keys[0], old)) {
                    CHECK(!refs || _refcounted(old)->_uiRef == refs, "failed owner index allocation acquires nothing");
                    failed = true; break;
                }
                _table(tables[0])->Set(keys[0], values[n % count]);
            }
            CHECK(failed, "exercise every owner-index allocation failure stage");
            log.Rollback();
        }
        SQObjectPtr actual;
        CHECK(_table(tables[0])->GetRaw(keys[0], actual) && sq_type(actual) == OT_INTEGER &&
            _integer(actual) == -13, "allocation failure preserves complete reverse replay");
        for(const auto &value : values) CHECK(_refcounted(value)->_uiRef == 1, "failed index growth leaks no owners");
    }
    {
        SQObjectPtr array(SQArray::Create(v->_sharedstate, 1));
        SQObjectPtr referent(SQArray::Create(v->_sharedstate, 0));
        SQObjectPtr weak(_array(referent)->GetWeakRef(OT_ARRAY));
        _table(tables[0])->Set(keys[0], weak);
        {
            SQJitWriteLog log;
            for(int epoch = 0; epoch < 2; ++epoch) {
                for(int n = 0; n <= count; ++n) {
                    SQObjectPtr old;
                    CHECK(_table(tables[0])->GetRaw(keys[0], old) && log.RecordMember(tables[0], keys[0], old),
                        "owner history stays valid across structural epochs");
                    _table(tables[0])->Set(keys[0], values[n % count]);
                }
                if(epoch == 0) {
                    CHECK(log.RecordArraySize(array, 1), "resize separates owner deduplication epochs");
                    _array(array)->Resize(3);
                    CHECK(log.RecordArray(array, 2), "mixed indexed array write after resize");
                    _array(array)->Set(2, SQObjectPtr((SQInteger)91));
                }
            }
            referent.Null();
            CHECK(sq_type(_weakref(weak)->_obj) == OT_NULL, "retaining a raw weakref does not keep its referent alive");
            log.Rollback();
            SQObjectPtr actual;
            CHECK(_table(tables[0])->GetRaw(keys[0], actual) && sq_type(actual) == OT_WEAKREF &&
                _weakref(actual) == _weakref(weak), "indexed rollback preserves dead weakref tag and identity");
            CHECK(_array(array)->Size() == 1, "owner and resize indexes preserve reverse ordering");
        }
        for(const auto &value : values) CHECK(_refcounted(value)->_uiRef == 1, "structural epochs balance all owners");
    }
}

static void stable_stack_snapshot_tests(SQVM *v, int &rc)
{
    // Stable addresses visited in a permuted order exercise deduplication and
    // index collisions. Growth must not leave entry pointers dangling, and a
    // resize must invalidate all earlier-epoch snapshots.
    const int count = 41;
    SQObjectPtr locals[count], owners[count];
    SQObjectPtr array(SQArray::Create(v->_sharedstate, 1));
    for(int n = 0; n < count; ++n) owners[n] = SQArray::Create(v->_sharedstate, 0);
    for(bool rollback : {false, true}) {
        for(int n = 0; n < count; ++n) locals[n] = (SQInteger)n;
        _array(array)->Resize(1);
        {
            SQJitWriteLog log;
            for(int epoch = 0; epoch < 3; ++epoch) {
                for(int visit = 0; visit < count; ++visit) {
                    const int n = visit * 17 % count;
                    CHECK(log.RecordStackSlot(&locals[n]), "snapshot lookup handles independent stable addresses");
                    locals[n] = owners[n];
                    CHECK(log.RecordStackSlot(&locals[n]), "saved snapshot pins newly displaced owners");
                    locals[n] = (SQInteger)(n + 100);
                    CHECK(log.RecordStackSlot(&locals[n]), "saved snapshot reads the current scalar tag");
                    locals[n] = owners[n];
                    CHECK(log.RecordStackSlot(&locals[n]), "saved snapshot still deduplicates repeated owners");
                    locals[n] = (SQInteger)(n + 200);
                }
                // Revisit after every growth and collision, not just immediately
                // after insertion. Lookup never changes the journal budget.
                for(int n = 0; n < count; ++n)
                    CHECK(log.RecordStackSlot(&locals[n]), "snapshot lookup survives compact stream relocation");
                CHECK(log.Size() == (SQUnsignedInteger)(2 * count * (epoch + 1) + epoch),
                    "one snapshot and one pin per slot per epoch, with no index-owned references");
                if(epoch < 2) {
                    CHECK(log.RecordArraySize(array, _array(array)->Size()), "structural change separates snapshot epochs");
                    _array(array)->Resize(_array(array)->Size() + 1);
                }
            }
            for(int n = 0; n < count; ++n)
                CHECK(_refcounted(owners[n])->_uiRef == 4, "snapshot indexes do not acquire additional owner pins");
            if(rollback) log.Rollback();
        }
        for(int n = 0; n < count; ++n) {
            CHECK(_integer(locals[n]) == n + (rollback ? 0 : 200), "indexed snapshots preserve commit and reverse replay");
            CHECK(_refcounted(owners[n])->_uiRef == 1, "snapshot cleanup balances all epoch pins");
        }
        CHECK(_array(array)->Size() == (rollback ? 1 : 3), "indexed stack and heap epochs remain interleaved");
    }
    // A failed index allocation must consume no snapshot. The saved prefix and
    // the previously missed address must both remain usable after recovery.
    allocations_left = 100;
    SQJitWriteLog log(1000, failing_allocate);
    for(int n = 0; n < 9; ++n) CHECK(log.RecordStackSlot(&locals[n]), "prepare lazy snapshot-index allocation");
    allocations_left = 1;
    CHECK(!log.RecordStackSlot(&locals[9]) && log.Size() == 9, "failed index allocation publishes no snapshot");
    allocations_left = 100;
    CHECK(log.RecordStackSlot(&locals[8]) && log.Size() == 9, "saved snapshot stays valid after an unrelated allocation failure");
    CHECK(log.RecordStackSlot(&locals[9]) && log.Size() == 10, "failed snapshot address can be retried safely");
}

static void compact_value_tests(SQVM *v, int &rc)
{
    // Exercise the two undo APIs against the same stable cell. Replaying an
    // entire stream before the other would restore the wrong value in one
    // ordering. Structural epochs require another snapshot in both streams.
    for(int width : {1,19}) for(bool stack_first : {false,true}) {
        SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
        SQObjectPtr array(SQArray::Create(v->_sharedstate, 1));
        for(SQInteger n = 0; n < width; ++n) _table(table)->NewSlot(SQObjectPtr(n), SQObjectPtr(n + 1));
        {
            SQJitWriteLog log;
            for(int epoch = 0; epoch < 2; ++epoch) {
                for(SQInteger n = 0; n < width; ++n) {
                    SQObjectPtr key(n);
                    SQObjectPtr *cell = _table(table)->GetRawSlot(key);
                    CHECK(stack_first ? log.RecordStackSlot(cell) : log.RecordMember(table, key, *cell),
                        "record first stream at a stable mixed destination");
                    *cell = n + 101 + epoch * 200;
                    CHECK(stack_first ? log.RecordMember(table, key, *cell) : log.RecordStackSlot(cell),
                        "record second stream at the same destination");
                    *cell = n + 201 + epoch * 200;
                }
                if(!epoch) {
                    CHECK(log.RecordArraySize(array, 1), "resize starts a new epoch in both streams");
                    _array(array)->Resize(2);
                }
            }
            CHECK(log.Size() == (SQUnsignedInteger)(4 * width + 1), "mixed size includes both epoch histories");
            log.Rollback();
        }
        for(SQInteger n = 0; n < width; ++n)
            CHECK(_integer(*_table(table)->GetRawSlot(SQObjectPtr(n))) == n + 1,
                "merged reverse replay preserves interleaving and structural epochs");
        CHECK(_array(array)->Size() == 1, "mixed replay restores array extent");
    }
    const int count = 73;
    SQObjectPtr values[count], locals[count];
    SQObjectPtr array(SQArray::Create(v->_sharedstate, count));
    for(SQInteger n = 0; n < count; ++n) values[n] = SQArray::Create(v->_sharedstate, 0);
    // Both streams grow repeatedly, and the value index grows independently.
    // Failing each allocation must retain the exact prefix and no new owner.
    for(int fail_at = 1; fail_at <= 14; ++fail_at) {
        for(SQInteger n = 0; n < count; ++n) { locals[n] = n; _array(array)->_values[n] = n; }
        allocations_left = fail_at;
        bool failed = false;
        {
            SQJitWriteLog log(1000, failing_allocate);
            for(SQInteger n = 0; n < count; ++n) {
                if(!log.RecordStackSlot(&locals[n])) { failed = true; break; }
                locals[n] = n + 100;
                if(!log.RetainValue(values[n]) || !log.RecordArray(array, n)) { failed = true; break; }
                _array(array)->_values[n] = n + 200;
            }
            CHECK(failed, "exercise each compact/heap growth and index failure");
            log.Rollback();
        }
        for(SQInteger n = 0; n < count; ++n) {
            CHECK(_integer(locals[n]) == n && _integer(_array(array)->_values[n]) == n,
                "allocation failure restores both journal streams");
            CHECK(_refcounted(values[n])->_uiRef == 1, "failed compact growth leaves no retained owner");
        }
    }
    {
        SQJitWriteLog log(2);
        CHECK(log.RecordStackSlot(&locals[0]) && log.RecordArray(array, 0) && log.Size() == 2,
            "stack and heap storage share one entry budget");
        CHECK(log.RecordStackSlot(&locals[0]) && log.RecordArray(array, 0), "deduplication works at the joint limit");
        CHECK(!log.RecordStackSlot(&locals[1]) && !log.RetainValue(values[0]) && !log.RecordArray(array, 1),
            "neither stream can evade the joint budget");
    }
    SQJitContext &context = sqjit_context(v->_sharedstate);
    SQObjectPtr observed_owner(_array(values[0])->GetWeakRef(OT_ARRAY));
    {
        SQJitWriteLog log(1000, sq_vm_malloc, &context);
        _array(array)->_values[0] = values[0];
        CHECK(log.RecordArray(array, 0), "record one heap pin before compact growth");
        _array(array)->_values[0].Null();
        locals[0] = values[0];
        CHECK(log.RecordStackSlot(&locals[0]), "record one stack pin before compact growth");
        locals[0].Null();
        for(const auto &value : values) CHECK(log.RetainValue(value), "retain enough compact owners for a pin index");
        CHECK(!log.CanRelease(values[0]), "heap, stack and retained pins are all excluded from real owners");
        {
            SQJitWriteLog child(1000, sq_vm_malloc, &context);
            CHECK(!child.CanRelease(values[0]), "nested census includes both parent streams");
            SQObjectPtr alias(values[0]);
            CHECK(child.CanRelease(values[0]), "one actual alias still authorizes the drop");
        }
    }
    for(const auto &value : values) CHECK(_refcounted(value)->_uiRef == 1, "mixed pin-index cleanup balances references");
}

static void contextual_release_tests(SQVM *v, int &rc)
{
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    CHECK(!ctx.active_logs, "contextual predicate starts without a journal");
    SQObjectPtr value(SQTable::Create(v->_sharedstate,0));
    CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,value), "context rejects the last graph owner");
#ifndef NO_GARBAGE_COLLECTOR
    _refcounted(value)->_uiRef |= MARK_FLAG;
    CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,value), "GC mark bit is not a surviving owner");
    _refcounted(value)->_uiRef &= ~MARK_FLAG;
#endif
    SQObjectPtr alias = value;
    CHECK(SQJitWriteLog::CanReleaseInContext(ctx,value) &&
        !SQJitWriteLog::CanReleaseInContext(ctx,value,2), "no-journal proof honors combined drops");
    {
        SQJitWriteLog parent(1000,sq_vm_malloc,&ctx);
        CHECK(parent.RetainValue(value), "prepare contextual ancestor pin");
        {
            SQJitWriteLog inner(1000,sq_vm_malloc,&ctx);
            CHECK(inner.BeginStackWrite(&alias), "prepare an ancestor's pending write pin");
            CHECK(SQJitWriteLog::CanReleaseInContext(ctx,value) &&
                !SQJitWriteLog::CanReleaseInContext(ctx,value,2), "context excludes retained and pending pins");
            alias.Null();
            CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,value), "context counts pending pins after the real alias dies");
        }
        CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,value), "context follows the restored ancestor chain");
    }
    SQObjectPtr leaf(SQArray::Create(v->_sharedstate,2));
    CHECK(SQJitWriteLog::CanReleaseInContext(ctx,leaf), "context retains the unobserved scalar-array proof");
    SQObjectPtr weak(_array(leaf)->GetWeakRef(OT_ARRAY));
    CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,leaf), "context observes weak death for a final leaf drop");
    SQObjectPtr real_alias = leaf;
    CHECK(SQJitWriteLog::CanReleaseInContext(ctx,leaf), "real alias authorizes a weakly observed non-final drop");
    {
        allocations_left = 100;
        SQJitWriteLog parent(1000,failing_allocate,&ctx);
        SQObjectPtr target(SQTable::Create(v->_sharedstate,0));
        for(SQInteger n=0;n<9;++n) {
            _table(target)->NewSlot(SQObjectPtr(n),SQObjectPtr(n));
            CHECK(parent.RecordMember(target,SQObjectPtr(n),*_table(target)->GetRawSlot(SQObjectPtr(n))),
                "populate contextual pin-index allocation witness");
        }
        allocations_left = 1;
        CHECK(!SQJitWriteLog::CanReleaseInContext(ctx,leaf),
            "context preserves ancestor pin-index allocation failure even with a real alias");
    }
    CHECK(!ctx.active_logs, "contextual checks never register an empty child");
}

int main()
{
    int rc = 0;
    SQVM *v = sq_open(64);
    owner_index_tests(v, rc);
    release_barrier_tests(v, rc);
    contextual_release_tests(v, rc);
    scalar_array_release_tests(v, rc);
    logical_stack_tests(v, rc, false);
    logical_stack_tests(v, rc, true);
    private_publication_tests(v, rc);
    compact_value_tests(v, rc);
    stable_stack_snapshot_tests(v, rc);
    {
        SQObjectPtr owner(SQArray::Create(v->_sharedstate, 1));
        SQObjectPtr input(owner);
        _array(owner)->Set(0, SQObjectPtr((SQInteger)3));
        for(bool rollback : {false, true}) {
            input = owner;
            _array(owner)->Set(0, SQObjectPtr((SQInteger)3));
            {
                SQJitWriteLog log;
                CHECK(log.RecordStackSlot(&input), "record overwritten native entry input");
                CHECK(log.RecordArray(owner, 0), "mix stack restoration and heap undo");
                input.Null(); _array(owner)->Set(0, SQObjectPtr((SQInteger)9));
                CHECK(_refcounted(owner)->_uiRef == 3, "saved input and heap log retain the original owner");
                if(rollback) log.Rollback();
            }
            CHECK(rollback ? sq_type(input) == OT_ARRAY && _array(input) == _array(owner) :
                sq_type(input) == OT_NULL, "only rollback restores the entry argument");
            CHECK(_integer(_array(owner)->_values[0]) == (rollback ? 3 : 9), "heap and stack rollback agree");
            CHECK(_refcounted(owner)->_uiRef == (SQUnsignedInteger)(rollback ? 2 : 1),
                "saved input cleanup balances references");
        }
        SQJitWriteLog limited(0);
        CHECK(!limited.RecordStackSlot(&input) && !limited.RecordStackSlot(NULL),
            "invalid or capacity-limited stack snapshot changes nothing");
    }
    {
        SQObjectPtr values[19];
        for(int n = 0; n < 19; ++n) values[n] = SQArray::Create(v->_sharedstate, 1);
        for(bool rollback : {false, true}) {
            {
                SQJitWriteLog log;
                for(int n = 0; n < 200; ++n)
                    CHECK(log.RetainValue(values[n % 19]), "captured owners survive index and storage growth");
                CHECK(log.Size() == 19, "captured values deduplicate by identity");
                CHECK(log.RetainValue(SQObjectPtr()) && log.RetainValue(SQObjectPtr((SQInteger)7)) &&
                    log.Size() == 19, "non-owning captures need no lifetime entries");
                for(int n = 0; n < 19; ++n) {
                    CHECK(_refcounted(values[n])->_uiRef == 2, "each captured owner retained exactly once");
                    _array(values[n])->Set(0, SQObjectPtr((SQInteger)n));
                }
                if(rollback) log.Rollback();
                for(int n = 0; n < 19; ++n)
                    CHECK(_integer(_array(values[n])->_values[0]) == n,
                        "lifetime-only entries do not undo unrelated writes");
            }
            for(int n = 0; n < 19; ++n)
                CHECK(_refcounted(values[n])->_uiRef == 1, "commit and rollback release captured owners");
        }
        {
            SQJitWriteLog log(1);
            CHECK(log.RetainValue(values[0]) && log.RetainValue(values[0]), "capture dedup works at capacity");
            CHECK(!log.RetainValue(values[1]) && _refcounted(values[1])->_uiRef == 1,
                "capacity failure does not acquire the new owner");
        }
        for(int fail_at : {1,2}) {
            allocations_left = fail_at;
            SQJitWriteLog log(100, failing_allocate);
            for(int n = 0; n < 8; ++n) CHECK(log.RetainValue(values[n]), "inline captured values need no allocation");
            if(fail_at == 1) CHECK(!log.RetainValue(values[8]), "capture storage growth can fail safely");
            else {
                CHECK(log.RetainValue(values[8]), "grow captured value storage");
                CHECK(!log.RetainValue(values[9]), "capture index allocation can fail safely");
            }
            CHECK(_refcounted(values[fail_at == 1 ? 8 : 9])->_uiRef == 1,
                "failed capture allocation leaves new owner untouched");
            log.Rollback();
        }
    }
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
        // A native frame can mix saved VM inputs, captured expression values,
        // and enough displaced member owners to grow both indexes. Reuse the
        // same poisoned storage after commit and rollback, including empty
        // early-guard exits, without ever freeing the frame itself.
        alignas(SQJitWriteLog) unsigned char storage[sizeof(SQJitWriteLog)];
        SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
        SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("payload")));
        std::vector<SQObjectPtr> values;
        for(int n = 0; n < 32; ++n) values.push_back(SQObjectPtr(SQArray::Create(v->_sharedstate, 0)));
        _table(table)->NewSlot(key, SQObjectPtr((SQInteger)-7));
        for(bool rollback : {false, true}) for(bool empty : {false, true}) {
            memset(storage, 0x5a, sizeof(storage));
            _table(table)->Set(key, SQObjectPtr((SQInteger)-7));
            SQObjectPtr input(values[0]);
            SQInteger slot = 0;
            sqjit_write_log_init_frame(&slot, storage);
            SQJitWriteLog *log = sqjit_write_log_ensure(&slot);
            if(!empty) {
                CHECK(log->RecordStackSlot(&input), "frame captures live-in ownership");
                CHECK(log->RetainValue(values[1]), "frame pins assignment result independently");
                input.Null();
                for(int n = 0; n <= 32; ++n) {
                    SQObjectPtr old;
                    CHECK(_table(table)->GetRaw(key, old) && log->RecordMember(table, key, old),
                        "frame grows mixed destination and owner indexes");
                    _table(table)->Set(key, n == 32 ? SQObjectPtr((SQInteger)99) : values[n]);
                }
            }
            sqjit_write_log_release(&slot, rollback, false);
            CHECK(!slot, "frame journal released exactly once");
            // Releasing an already released log must also leave storage alone.
            sqjit_write_log_release(&slot, rollback, false);
            SQObjectPtr actual;
            CHECK(_table(table)->GetRaw(key, actual) && sq_type(actual) == OT_INTEGER &&
                _integer(actual) == (empty || rollback ? -7 : 99), "mixed frame heap replay");
            CHECK(empty || rollback ? sq_type(input) == OT_ARRAY && _array(input) == _array(values[0]) :
                sq_type(input) == OT_NULL, "mixed frame VM input replay");
            input.Null();
            for(const auto &value : values) CHECK(_refcounted(value)->_uiRef == 1, "mixed frame cleanup balances owners");
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
                CHECK(log.RecordMember(table,key,*_table(table)->GetRawSlot(key)),
                    "repeated displaced owner stays retained");
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
