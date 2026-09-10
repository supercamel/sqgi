#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqclass.h"
#include "sqstdmath.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include "jit/sqjit_member_plan.h"
#include "jit/sqjit_write_log.h"
#include <cstdio>
#include <string>
#include <vector>

static int failures = 0;
#define CHECK(c,m) do { if(!(c)) { puts("FAIL: " m); ++failures; } } while(0)
static bool run(SQVM *v, const char *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("member-plan"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) { sq_getlasterror(v); const SQChar *error = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("FAIL: %s\n"), error); }
    sq_settop(v, top); return ok;
}
static SQClosure *closure(SQVM *v, const char *name)
{
    SQInteger top = sq_gettop(v); SQClosure *c = NULL;
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) { HSQOBJECT obj; sq_getstackobj(v, -1, &obj);
        if(sq_type(obj) == OT_CLOSURE) c = _closure(obj); }
    sq_settop(v, top); return c;
}
static SQJitObservation observe(SQVM *v, const char *name)
{ SQJitObservation o = {}; SQClosure *c = closure(v, name); if(c) sqjit_observe_proto(c->_function, o); return o; }
static bool requires_frame(SQClosure *callee)
{
    return callee && callee->_function->_jit && callee->_function->_jit->_entry &&
        callee->_function->_jit->_entry->_requires_vm_frame;
}

// Keep positive native coverage when an artifact needs a real callee frame.
// A successful interpreter fallback does not count as a native invocation.
static bool call_native(SQVM *v, SQClosure *callee, SQObjectPtr *stack,
    SQInteger nargs, SQObjectPtr &out)
{
    if(!requires_frame(callee)) return sqjit_try_execute_closure(v,callee,stack,nargs,out);
    SQJitObservation before = {}, after = {};
    sqjit_observe_proto(callee->_function,before);
    SQInteger top = sq_gettop(v);
    sq_pushobject(v,SQObjectPtr(callee));
    for(SQInteger n=0;n<nargs;++n) sq_pushobject(v,stack[n]);
    bool ok = SQ_SUCCEEDED(sq_call(v,nargs,SQTrue,SQFalse));
    if(ok) out = v->GetUp(-1);
    sq_settop(v,top);
    sqjit_observe_proto(callee->_function,after);
    return ok && after.frame.successes > before.frame.successes;
}
static void *fail_allocate(SQUnsignedInteger) { return NULL; }

static void cells(SQVM *v)
{
    SQObjectPtr stack[1] = {SQObjectPtr(SQTable::Create(v->_sharedstate, 0))};
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("payload")));
    std::vector<SQObjectPtr> values;
    for(int n = 0; n < 19; ++n) values.push_back(SQObjectPtr(SQArray::Create(v->_sharedstate, 0)));
    _table(stack[0])->NewSlot(key, values[0]);
    SQJitMemberCell cell, alias;
    CHECK(sqjit_member_cell_init(stack, 0, &key, &cell), "resolve existing field");
    CHECK(sqjit_member_cell_init(stack, 0, &key, &alias) && cell.value == alias.value, "aliases share the actual field");
    CHECK(_refcounted(values[0])->_uiRef == 2, "field cache borrows references");
    SQInteger log = 0;
    for(int n = 1; n < 200; ++n) {
        SQJitMemberCell *target = n % 2 ? &cell : &alias;
        CHECK(sqjit_member_cell_store(&log, target, (SQInteger)_rawval(values[n % 19]), OT_ARRAY), "larger owner set uses complete log");
        CHECK(_array(*cell.value) == _array(values[n % 19]), "aliased cell sees every store immediately");
    }
    CHECK(((SQJitWriteLog *)(intptr_t)log)->Size() == 19, "log retains every distinct displaced owner beyond the small cache");
    sqjit_write_log_release(&log, true);
    CHECK(_array(*cell.value) == _array(values[0]), "rollback restores the first owner");
    for(int n = 0; n < 19; ++n) CHECK(_refcounted(values[n])->_uiRef == (SQUnsignedInteger)(n ? 1 : 2), "rollback balances all references");
    CHECK(sqjit_member_cell_init(stack, 0, &key, &cell) && !cell.logged && !cell.retained[0] && !cell.retained[1], "new invocation clears borrowed owner cache");
    SQObjectPtr weak(_array(values[0])->GetWeakRef(OT_ARRAY));
    _table(stack[0])->Set(key, weak);
    CHECK(sqjit_member_cell_store(&log, &cell, 42, OT_INTEGER), "store over raw weak reference");
    sqjit_write_log_release(&log, true);
    CHECK(sq_type(*cell.value) == OT_WEAKREF && _weakref(*cell.value) == _weakref(weak), "rollback preserves weak reference tag and identity");
    _table(stack[0])->Set(key, values[0]);
    CHECK(sqjit_member_cell_init(stack, 0, &key, &cell), "reset cell for allocation failure");
    {
        SQJitWriteLog limited(0); SQInteger slot = (SQInteger)(intptr_t)&limited;
        CHECK(!sqjit_member_cell_store(&slot, &cell, 7, OT_INTEGER) && !cell.logged && !cell.retained[0] &&
            _array(*cell.value) == _array(values[0]), "failed first record changes neither heap nor fast-store eligibility");
    }
    {
        SQJitWriteLog limited(64, fail_allocate); SQInteger slot = (SQInteger)(intptr_t)&limited;
        for(int n = 1; n <= 8; ++n) CHECK(sqjit_member_cell_store(&slot, &cell, (SQInteger)_rawval(values[n]), OT_ARRAY), "inline log capacity");
        SQRefCounted *cached = cell.retained[0];
        CHECK(!sqjit_member_cell_store(&slot, &cell, (SQInteger)_rawval(values[9]), OT_ARRAY) &&
            cell.retained[0] == cached && _array(*cell.value) == _array(values[8]), "log growth failure publishes no unretained owner");
        limited.Rollback();
    }
    CHECK(_array(*cell.value) == _array(values[0]), "allocation failure remains rollback safe");
}

static void key_flow(SQVM *v)
{
    SQObjectPtr owner(SQFunctionProto::Create(v->_sharedstate, 8, 2, 0, 0, 0, 0, 0, 0));
    SQFunctionProto *p = _funcproto(owner); p->_stacksize = 6;
    p->_literals[0] = SQString::Create(v->_sharedstate, _SC("caption"));
    p->_literals[1] = SQString::Create(v->_sharedstate, _SC("len"));
    SQInstruction code[] = {
        SQInstruction(_OP_LOAD, 2, 0), SQInstruction(_OP_JZ, 1, 2),
        SQInstruction(_OP_LOADINT, 3, 7), SQInstruction(_OP_JMP, 0, 1),
        SQInstruction(_OP_LOADINT, 3, 9), SQInstruction(_OP_SET, 0xff, 0, 2, 3),
        SQInstruction(_OP_JMP, 0, -7), SQInstruction(_OP_RETURN, 0xff)
    };
    for(int n = 0; n < 8; ++n) p->_instructions[n] = code[n];
    SQBytecodeAnalysis a; SQJitKeyFlow keys;
    CHECK(a.Build(p->_instructions, 8, 6) && keys.Build(p, a, 0, 7), "analyze diamond and backedge");
    CHECK(keys.Literal(5, 2) == 0 && !keys.MayEqual(5, 2, _SC("len")), "literal key survives conditional value and loop backedge");
    p->_instructions[4] = SQInstruction(_OP_LOAD, 2, 1);
    CHECK(a.Build(p->_instructions, 8, 6) && keys.Build(p, a, 0, 7), "analyze disagreeing keys");
    CHECK(keys.Literal(5, 2) < 0 && keys.MayEqual(5, 2, _SC("len")), "one aliasing branch prevents hoisting");
    p->_instructions[4] = SQInstruction(_OP_DMOVE, 2, 3, 3, 2);
    CHECK(a.Build(p->_instructions, 8, 6) && keys.Build(p, a, 0, 7), "analyze sequential aliased move");
    CHECK(keys.Literal(5, 2) < 0, "entry-unknown key stays unknown at join");
    p->_instructions[0] = SQInstruction(_OP_DLOAD, 2, 0, 3, 1);
    p->_instructions[4] = SQInstruction(_OP_DMOVE, 2, 3, 4, 2);
    CHECK(a.Build(p->_instructions, 8, 6) && keys.Build(p, a, 0, 7) && keys.MayEqual(5, 4, _SC("len")), "DMOVE second source observes first assignment");
    CHECK(!keys.Build(p, a, -1, 7) && keys.Literal(5, 2) < 0, "invalid region clears previous analysis");
}

static void wide_record(SQVM *v, bool enabled)
{
    std::string source = "function wide(t,n) { local sum=0; for(local i=0;i<n;i++) {";
    SQObjectPtr table(SQTable::Create(v->_sharedstate, 0));
    for(int n = 0; n < 24; ++n) {
        std::string key = "field" + std::to_string(n);
        source += "t." + key + "=t." + key + "+1; sum+=t." + key + ";";
        _table(table)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate, key.c_str())), SQObjectPtr((SQInteger)0));
    }
    source += "} return sum; }";
    CHECK(run(v, source.c_str()), "define record larger than the field cache");
    SQFunctionProto *p = closure(v, "wide")->_function;
    SQBytecodeAnalysis a; SQJitMemberPlan plan;
    SQObjectPtr stack[MAX_FUNC_STACKSIZE]; stack[1] = table;
    CHECK(a.Build(p->_instructions, p->_ninstructions, p->_stacksize), "analyze wide record");
    plan.Build(p, stack, a, 0, p->_ninstructions - 1);
    CHECK(plan.fields.size() == SQJitMemberPlan::MAX_FIELDS, "wide record uses bounded frame storage");
    for(int j = 0; j < 3; ++j) {
        SQInteger top = sq_gettop(v); sq_pushobject(v, SQObjectPtr(closure(v, "wide"))); sq_pushroottable(v);
        sq_pushobject(v, table); sq_pushinteger(v, 20);
        SQInteger actual = 0;
        CHECK(SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQTrue)) && SQ_SUCCEEDED(sq_getinteger(v, -1, &actual)) &&
            actual == 24 * (210 + j * 400), "cached and uncached fields preserve all wide-record writes");
        sq_settop(v, top);
    }
#if SQJIT_HAS_X64_NATIVE
    if(enabled) CHECK(observe(v, "wide").frame.successes > 0 || observe(v, "wide").loop.successes > 0,
        "wide record executes a native region beyond the field cache capacity");
#endif
    plan.Build(p, stack, a, 1, 0);
    CHECK(plan.fields.empty() && plan.Key(0, 1) < 0, "plan reuse discards stale facts");
}

struct ReleaseState { SQTable *table; int calls; };
static SQInteger rehash_on_release(SQUserPointer pointer, SQInteger)
{
    ReleaseState &state = *(ReleaseState *)pointer; ++state.calls;
    for(int n = 0; n < 256; ++n) state.table->NewSlot(SQObjectPtr((SQInteger)n), SQObjectPtr((SQInteger)n));
    return 0;
}
static void guard_owners(SQVM *v, bool enabled)
{
    sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v, 1);
    CHECK(run(v, R"SQ(
        function guarded_fields(t,n) {
            local sum=0.0;
            for(local i=0;i<n;i++) { t.count=t.count+1; sum+=t.sqrt(4.0)+t.count; }
            return sum;
        }
        guarded_record <- {count=0,sqrt=sqrt};
        if(guarded_fields(guarded_record,20)!=250.0) throw "field math warmup";
    )SQ"), "compile field loop with a math guard");
    SQFunctionProto *p = closure(v, "guarded_fields")->_function;
    SQMemberCache *cache = NULL;
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip)
        if(p->_instructions[ip].op == _OP_PREPCALLK) cache = p->MemberCacheAt(ip);
    CHECK(cache, "math call has a cache slot");
    if(!cache) return;
    sq_pushroottable(v); sq_pushstring(v, _SC("guarded_record"), -1);
    CHECK(SQ_SUCCEEDED(sq_get(v, -2)), "read guard receiver");
    HSQOBJECT obj; sq_getstackobj(v, -1, &obj); SQObjectPtr receiver(obj); sq_pop(v, 2);
    ReleaseState state = {_table(receiver), 0};
    SQClass *stale = SQClass::Create(v->_sharedstate, NULL);
    stale->_typetag = &state; stale->_hook = rehash_on_release;
    cache->_owner = stale; cache->_kind = SQ_MEMBER_CACHE_INSTANCE_METHOD; cache->_index = 0;
    CHECK(run(v, "if(guarded_fields(guarded_record,20)!=650.0) throw \"field math result\";"),
        "math guard and member writes preserve values across stale cache owner");
#if SQJIT_HAS_X64_NATIVE
    if(enabled) {
        CHECK(observe(v, "guarded_fields").frame.successes > 0, "guard owner check executes native member loop");
        CHECK(state.calls == 0, "native guard cannot release a class and invalidate live field addresses");
    }
#endif
    cache->Clear();
    CHECK(state.calls == 1, "stale owner releases once outside the native region");
}

static void compound_members(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function compound_marker(x) { return typeof x }
        class CompoundRow { count=0; weight=0.0; product=6; }
        function compound_dynamic(t,keys,n) {
            compound_marker(0); local sum=0;
            for(local i=0;i<n;i++) { t[keys[i%2]]+=1; sum+=t.count; }
            return sum;
        }
        function compound_snapshot(mode) {
            local n=mode==1 ? 0 : mode==2 ? 1 : 31, width=mode==4 ? 1 : 17;
            local rows=[], bad=array(n,1), divisors=array(n,2);
            for(local j=0;j<width;j++) {
                local r=mode==3 ? CompoundRow() : {product=6,weight=0.0,count=0};
                r.count=j-9; r.weight=j*0.25;
                if(mode==10) for(local k=0;k<257;k++) r[k]<-k;
                rows.append(r);
            }
            if(mode==1) rows[0].clear();
            if(mode==5) bad[11]=false;
            if(mode==6) divisors[11]=0;
            if(mode==7) {
                local backing={product=6,weight=0.0,count=0};
                rows[0]={}; rows[0].setdelegate({
                    _get=function(k){return backing[k]},
                    _set=function(k,value){backing[k]=value}
                });
            }
            if(mode==8) rows[0].count="x";
            local result=0,caught=false;
            try {
                if(mode==9) result=compound_dynamic({count=0,other=100},["count","other"],n);
                else if(mode==3) result=compound_classes(rows,width,n,bad,divisors);
                else result=compound_tables(rows,width,n,bad,divisors);
            } catch(e) { caught=true; }
            local snapshot=caught+":"+result;
            if(mode!=1) foreach(r in rows)
                snapshot+=":"+typeof r.count+":"+r.count+":"+r.weight+":"+r.product;
            return snapshot;
        }
    )SQ"), "define compound-member differential cases");
    for(const char *name : {"compound_tables", "compound_classes"}) {
        std::string source = std::string("function ") + name + R"SQ((rows,width,n,bad,divisors) {
            compound_marker(0); local sum=0;
            for(local i=0;i<n;i++) {
                local row=rows[i%width];
                row.count+=2; row.weight-=0.5; row.product*=2;
                row.product/=divisors[i]; row.count%=97;
                sum+=(row.count+=1); sum+=bad[i];
            }
            return sum;
        })SQ";
        CHECK(run(v, source.c_str()), "define numeric member RMW loop");
    }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    for(int mode : {0,3,0,3,1,2,4,10,5,6,7,8,9}) {
        std::string expected;
        for(int native = 0; native < 2; ++native) {
            ctx.enabled = native && enabled;
            SQInteger top = sq_gettop(v);
            sq_pushobject(v, SQObjectPtr(closure(v, "compound_snapshot")));
            sq_pushroottable(v); sq_pushinteger(v, mode);
            bool ok = SQ_SUCCEEDED(sq_call(v, 2, SQTrue, SQTrue));
            const SQChar *value = NULL;
            ok = ok && SQ_SUCCEEDED(sq_getstring(v, -1, &value));
            CHECK(ok, "compound-member snapshot completes");
            if(ok) {
                if(!native) expected = value;
                else if(expected != value) {
                    fprintf(stderr, "FAIL: compound mode %d: %s != %s\n", mode, value, expected.c_str());
                    ++failures;
                }
            }
            sq_settop(v, top);
        }
    }
    ctx.enabled = enabled;
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        CHECK(observe(v, "compound_tables").loop.successes > 0,
            "table compound arithmetic executes native loops");
        CHECK(observe(v, "compound_classes").loop.successes > 0,
            "instance compound arithmetic executes native loops");
        CHECK(observe(v, "compound_tables").loop.guard_failures > 0,
            "late numeric/type failures exercise native rollback");
    }
#endif
}

static void numeric_store_release(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function numeric_store_loop(t,n) {
            compound_marker(0);
            for(local i=0;i<n;i++) { t.value=i; t.other=i+1; }
            return t.value+t.other;
        }
        numeric_store_target <- {value=0,other=0};
        if(numeric_store_loop(numeric_store_target,20)!=39) throw "numeric store warmup";
    )SQ"), "warm numeric store helper");
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("numeric_store_target"))), target;
    CHECK(_table(v->_roottable)->Get(key, target), "read numeric store receiver");
    if(sq_type(target) != OT_TABLE) return;
    ReleaseState state = {_table(target), 0};
    SQClass *old = SQClass::Create(v->_sharedstate, NULL);
    old->_typetag = &state; old->_hook = rehash_on_release;
    SQObjectPtr field(SQString::Create(v->_sharedstate, _SC("value")));
    _table(target)->Set(field, SQObjectPtr(old));
    CHECK(run(v, "if(numeric_store_loop(numeric_store_target,20)!=39) throw \"numeric store release\";"),
        "displaced owner release may rehash the receiver without stale slot access");
    CHECK(state.calls == 1 && _table(target)->CountUsed() == 258,
        "displaced owner releases once and its rehash remains visible");
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) CHECK(observe(v, "numeric_store_loop").loop.successes > 0 &&
        observe(v, "numeric_store_loop").loop.guard_failures > 0,
        "ordinary numeric stores execute natively, final owner release replays in the VM");
#endif
}

static void numeric_table_hints(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function hint_read(t) { return t.value*3+t.weight; }
        function hint_sum(rows,width,n) {
            compound_marker(0); local sum=0.0;
            for(local i=0;i<n;i++) {
                local r=rows[i%width]; sum+=r.value*3+r.weight;
            }
            return sum;
        }
        hint_rows <- [];
        for(local i=0;i<17;i++) hint_rows.append({value=i-5,weight=i*0.125});
    )SQ"), "define checked native table-read workloads");
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("hint_rows"))), rows;
    CHECK(_table(v->_roottable)->Get(key, rows), "read hint receivers");
    if(sq_type(rows) != OT_ARRAY) return;
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    auto compare = [&]() {
        for(const char *name : {"hint_read", "hint_sum"}) {
            bool expected_ok = false;
            SQFloat expected = 0;
            for(int native = 0; native < 2; ++native) {
                ctx.enabled = enabled && native;
                SQInteger top = sq_gettop(v);
                sq_pushobject(v, SQObjectPtr(closure(v, name))); sq_pushroottable(v);
                if(strcmp(name, "hint_read") == 0) sq_pushobject(v, _array(rows)->_values[0]);
                else { sq_pushobject(v, rows); sq_pushinteger(v, 17); sq_pushinteger(v, 113); }
                SQFloat actual = 0;
                bool ok = SQ_SUCCEEDED(sq_call(v, strcmp(name, "hint_read") == 0 ? 2 : 4,
                    SQTrue, SQFalse));
                if(ok) CHECK(SQ_SUCCEEDED(sq_getfloat(v, -1, &actual)), "numeric read returns a number");
                if(!native) { expected_ok = ok; expected = actual; }
                else CHECK(ok == expected_ok && (!ok || actual == expected),
                    "native table hint and ordinary lookup agree after receiver mutation");
                sq_settop(v, top);
            }
        }
    };
    compare(); compare();
    SQJitObservation warm_loop = observe(v, "hint_sum");
    for(const char *source : {
        R"SQ(foreach(i,r in hint_rows) {
            for(local k=0;k<257;k++) r[k]<-k+1000;
            local x=r.value; delete r.value; r.value<-x+2;
        })SQ",
        R"SQ(foreach(i,r in hint_rows) {
            local x=r.value,w=r.weight; r.clear();
            r.weight<-w+0.25; r.value<-x-3;
        })SQ",
        R"SQ(for(local i=0;i<17;i++) {
            local r={},old=hint_rows[i];
            for(local k=0;k<i*31;k++) r["field"+k]<-k;
            r.weight<-old.weight; r.value<-old.value+7; hint_rows[i]=r;
        })SQ"
    }) {
        CHECK(run(v, source), "rehash, shrink and replace hint receivers");
        compare();
    }
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        SQJitObservation now = observe(v, "hint_sum");
        CHECK(warm_loop.loop.successes > 0 && now.loop.successes > warm_loop.loop.successes,
            "numeric table hint workload actually executes native loops");
        CHECK(now.loop.guard_failures == warm_loop.loop.guard_failures,
            "changed table layouts use lookup fallback without rolling back native loops");
        CHECK(observe(v, "hint_read").frame.successes > 0,
            "numeric table reads also execute whole-function native entry");
    }
#endif
    for(const char *source : {
        R"SQ(class HintRow {value=23;weight=1.5} hint_rows[0]=HintRow();)SQ",
        R"SQ(hint_rows[0]={value=2.5,weight=4.0};)SQ",
        R"SQ(hint_rows[0]={}.setdelegate({_get=function(k){return k=="value" ? 7 : 0.5}});)SQ",
        R"SQ(hint_rows[0]={value=false,weight=0.0};)SQ",
        R"SQ(local owner={}; hint_rows[0]={value=owner.weakref(),weight=0.0};)SQ",
        R"SQ(hint_rows[0]={weight=0.0};)SQ",
        R"SQ(hint_rows[0]={value=41,weight=2.0};)SQ"
    }) {
        CHECK(run(v, source), "change receiver and value kinds at a compiled access site");
        compare();
    }
    ctx.enabled = enabled;
}

static void reference_table_hints(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function ref_hint_echo(t,out,bad) {
            local prior=t.value; out.value=prior;
            local checked=bad[0]+1; return prior;
        }
        function ref_hint_sum(rows,out,width,n) {
            compound_marker(0); local sum=0;
            for(local i=0;i<n;i++) {
                local r=rows[i%width], prior=r.value; out.value=prior;
                sum+=out.value[0]+prior[0];
            }
            return sum;
        }
        ref_hint_rows <- [];
        for(local i=0;i<23;i++) ref_hint_rows.append({value=[i+3]});
        ref_hint_out <- {value=null};
    )SQ"), "define reference-valued checked table reads");
    SQObjectPtr rows, out;
    CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("ref_hint_rows"))), rows) &&
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("ref_hint_out"))), out),
        "get reference-read receiver owners");
    if(sq_type(rows) != OT_ARRAY || sq_type(out) != OT_TABLE) return;
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    const char *phase = "warmup";
    auto compare = [&]() {
        for(bool loop : {false, true}) {
            bool expected_ok = false;
            SQObjectPtr expected;
            for(int native : {0, 1}) {
                ctx.enabled = enabled && native;
                SQInteger top = sq_gettop(v);
                sq_pushobject(v, SQObjectPtr(closure(v, loop ? "ref_hint_sum" : "ref_hint_echo")));
                sq_pushroottable(v); sq_pushobject(v, loop ? rows : _array(rows)->_values[0]);
                sq_pushobject(v, out);
                if(loop) { sq_pushinteger(v, 23); sq_pushinteger(v, 137); }
                else {
                    SQObjectPtr bad(SQArray::Create(v->_sharedstate, 1));
                    _array(bad)->Set(0, SQObjectPtr((SQInteger)1)); sq_pushobject(v, bad);
                }
                bool ok = SQ_SUCCEEDED(sq_call(v, loop ? 5 : 4, SQTrue, SQFalse));
                SQObjectPtr actual;
                if(ok) { HSQOBJECT value; sq_getstackobj(v, -1, &value); actual = value; }
                if(!native) { expected_ok = ok; expected = actual; }
                else {
                    bool match = ok == expected_ok && (!ok || (sq_type(actual) == sq_type(expected) &&
                        _rawval(actual) == _rawval(expected)));
                    if(!match) printf("reference hint mismatch: enabled=%d loop=%d ok=%d/%d type=%u/%u bits=%llu/%llu phase=%s\n",
                        enabled, loop, ok, expected_ok, (unsigned)sq_type(actual), (unsigned)sq_type(expected),
                        (unsigned long long)_rawval(actual), (unsigned long long)_rawval(expected), phase);
                    CHECK(match, "checked reference reads preserve identity and ordinary fallback");
                }
                sq_settop(v, top);
            }
        }
    };
    compare(); compare();
    SQJitObservation warm = observe(v, "ref_hint_sum");
    for(const char *source : {
        R"SQ(foreach(i,r in ref_hint_rows) {
            for(local k=0;k<193;k++) r[k]<-k;
            local a=r.value; delete r.value; r.value<-a;
        })SQ",
        R"SQ(foreach(i,r in ref_hint_rows) {
            local a=r.value; r.clear(); r.padding<-31; r.value<-a;
        })SQ",
        R"SQ(for(local i=0;i<23;i++) {
            local r={}; for(local k=0;k<i*17;k++) r["key"+k]<-k;
            r.value<-ref_hint_rows[i].value; ref_hint_rows[i]=r;
        })SQ"
    }) {
        phase = source;
        CHECK(run(v, source), "rehash, shrink and replace reference-hint tables"); compare();
    }
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        SQJitObservation now = observe(v, "ref_hint_sum");
        CHECK(warm.loop.successes > 0 && now.loop.successes > warm.loop.successes,
            "reference read hints execute native loops");
        CHECK(now.loop.guard_failures == warm.loop.guard_failures,
            "reference layout misses stay within the native invocation");
        CHECK(observe(v, "ref_hint_echo").frame.successes > 0,
            "reference read hints execute native frames");
    }
#endif
    // The unqualified global read inside _get is intentionally recursive:
    // receiver delegation must happen before root lookup, even in native code.
    for(const char *source : {
        R"SQ(class RefHintRow {value=[41]} ref_hint_rows[0]=RefHintRow();)SQ",
        R"SQ(ref_hint_rows[0]={value={a=5}};)SQ",
        R"SQ(ref_hint_rows[0]={value="caption"};)SQ",
        R"SQ(ref_hint_rows[0]={value=function(){return 7}};)SQ",
        R"SQ(ref_hint_rows[0]={value=RefHintRow};)SQ",
        R"SQ(ref_hint_rows[0]={value=RefHintRow()};)SQ",
        R"SQ(ref_hint_rows[0]={value=false};)SQ",
        R"SQ(ref_hint_rows[0]={value=null};)SQ",
        R"SQ(ref_hint_rows[0]={value=17.25};)SQ",
        R"SQ(ref_hint_rows[0]={}.setdelegate({_get=function(k){return ref_hint_rows[1].value}});)SQ",
        R"SQ(local a=[53]; ref_hint_rows[0]={value=a.weakref(),keep=a};)SQ",
        R"SQ(ref_hint_out.value=null; ref_hint_rows[0].keep=null;)SQ",
        R"SQ(ref_hint_rows[0]={};)SQ",
        R"SQ(ref_hint_rows[0]={value=[71]};)SQ"
    }) {
        phase = source;
        CHECK(run(v, source), "change reference read tag, weakref liveness and receiver type"); compare();
    }
    ctx.enabled = enabled;
    // Give each supported reference tag its own freshly compiled site, so
    // semantic fallback after an earlier array guard cannot satisfy coverage.
    for(const char *value : {"[13]", "{number=13}", "\"typed caption\"",
        "function(){return 13}", "RefHintRow", "RefHintRow()"}) {
        std::string source =
            "function ref_hint_typed(t,out) { out.value=t.value; return out.value; } "
            "ref_hint_fixture <- {input={value=" + std::string(value) + "},output={value=null}}; "
            "local input=ref_hint_fixture.input,out=ref_hint_fixture.output; "
            "for(local i=0;i<8;i++) if(ref_hint_typed(input,out)!=input.value || out.value!=input.value) "
            "throw \"typed reference hint lost identity\";";
        CHECK(run(v, source.c_str()), "each reference tag preserves identity at a fresh site");
#if SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) {
            // The first call from the preceding script can legitimately exit
            // on its caller's release-bearing VM temporary. Later calls use
            // the direct route, so separately require a native C API frame.
            SQObjectPtr fixture, input, output;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("ref_hint_fixture"))), fixture) &&
                _table(fixture)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("input"))), input) &&
                _table(fixture)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("output"))), output),
                "resolve the reference-tag frame fixture");
            SQInteger top = sq_gettop(v);
            SQInteger before = observe(v, "ref_hint_typed").frame.successes;
            sq_pushobject(v, SQObjectPtr(closure(v, "ref_hint_typed"))); sq_pushroottable(v);
            sq_pushobject(v, input); sq_pushobject(v, output);
            CHECK(SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQTrue)), "reference tag also completes through a C API frame");
            sq_settop(v, top);
            SQJitObservation o = observe(v, "ref_hint_typed");
            if(o.frame.successes == before) printf("reference tag route: %s ip=%lld reason=%s guards=%llu\n", value,
                (long long)o.compilation.ip, o.compilation.reason ? o.compilation.reason : "none",
                (unsigned long long)o.frame.guard_failures);
            CHECK(o.frame.successes > before, "each reference hint tag executes a native frame");
        }
#endif
        _table(v->_roottable)->Remove(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("ref_hint_fixture"))));
    }
}

static void root_receiver_fallback(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        root_receiver_value <- [13,29];
        function root_receiver_read() { return root_receiver_value[0]+root_receiver_value[1]; }
        class RootReceiver {}
        root_receiver_samples <- [[],{},"receiver",17,2.5,true,null,function(){},RootReceiver,RootReceiver()];
    )SQ"), "define default-delegate/root lookup coverage");
    SQObjectPtr receivers;
    CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("root_receiver_samples"))), receivers),
        "load varied implicit receiver kinds");
    if(sq_type(receivers) != OT_ARRAY) return;
    auto call = [&](const SQObjectPtr &receiver, SQInteger expected) {
        SQInteger top = sq_gettop(v), actual = 0;
        sq_pushobject(v, SQObjectPtr(closure(v, "root_receiver_read"))); sq_pushobject(v, receiver);
        CHECK(SQ_SUCCEEDED(sq_call(v, 1, SQTrue, SQTrue)) &&
            SQ_SUCCEEDED(sq_getinteger(v, -1, &actual)) && actual == expected,
            "receiver default lookup precedes root fallback");
        sq_settop(v, top);
    };
    for(int n = 0; n < 4; ++n) call(_array(receivers)->_values[0], 42);
    for(SQInteger n = 0; n < _array(receivers)->Size(); ++n) {
        const SQObjectPtr &receiver = _array(receivers)->_values[n];
        SQJitObservation before = observe(v, "root_receiver_read");
        call(receiver, 42);
#if SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v, "root_receiver_read").frame.successes > before.frame.successes,
            "ordinary non-table receivers retain native root lookup");
#endif
    }
    // Default delegates are runtime state, not a compile-time promise that a
    // global's name can never be shadowed. Change one after native warmup.
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("root_receiver_value")));
    SQObjectPtr shadow(SQArray::Create(v->_sharedstate, 2));
    _array(shadow)->Set(0, SQObjectPtr((SQInteger)5));
    _array(shadow)->Set(1, SQObjectPtr((SQInteger)7));
    SQTable *delegate = _table(v->_sharedstate->_array_default_delegate);
    SQObjectPtr saved;
    bool existed = delegate->GetRaw(key, saved);
    delegate->NewSlot(key, shadow);
    SQJitObservation before = observe(v, "root_receiver_read");
    call(_array(receivers)->_values[0], 12);
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) CHECK(observe(v, "root_receiver_read").frame.guard_failures > before.frame.guard_failures,
        "new default-delegate shadow exits native lookup before reading root");
#endif
    SQObjectPtr owner(SQArray::Create(v->_sharedstate, 0));
    SQObjectPtr weak(_array(owner)->GetWeakRef(OT_ARRAY));
    owner.Null();
    CHECK(sq_type(_weakref(weak)->_obj) == OT_NULL, "default-member weakref test has a dead referent");
    for(const SQObjectPtr &value : {SQObjectPtr(), weak}) {
        delegate->Set(key, value);
        SQInteger top = sq_gettop(v);
        sq_pushobject(v, SQObjectPtr(closure(v, "root_receiver_read")));
        sq_pushobject(v, _array(receivers)->_values[0]);
        CHECK(SQ_FAILED(sq_call(v, 1, SQTrue, SQFalse)),
            "null and dead weakref default members still shadow root values");
        sq_settop(v, top);
    }
    if(existed) delegate->Set(key, saved); else delegate->Remove(key);
    call(_array(receivers)->_values[0], 42);
}

static void store_fallback_semantics(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        store_fallback_value <- 7;
        function store_existing(value) {
            count=count+1; store_fallback_value=value; return count;
        }
        store_existing_receiver <- {count=0,store_fallback_value=7,put=store_existing};
        for(local i=0;i<12;i++) if(store_existing_receiver.put(13)!=i+1)
            throw "existing-slot native warmup";
    )SQ"), "warm ordinary writable-slot stores");
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) CHECK(observe(v, "store_existing").frame.successes > 0,
        "ordinary existing-field stores execute native frames");
#endif
    CHECK(run(v, R"SQ(
        local r=store_existing_receiver,seen=[];
        delete r.store_fallback_value;
        r.setdelegate({_set=function(key,value) { seen.append(value); }});
        if(r.put(29)!=13 || r.count!=13 || seen.len()!=1 || seen[0]!=29 || store_fallback_value!=7)
            throw "late store fallback must replay the earlier increment exactly once";
        r.setdelegate(null);
        if(r.put(37)!=14 || r.count!=14 || store_fallback_value!=37)
            throw "missing table slot falls back to VM root";
        class FallbackSetter {
            count=0;
            function put(value) { store_fallback_value=value; return 11; }
        }
        local target=FallbackSetter();
        for(local i=0;i<8;i++) target.put(13);
        FallbackSetter._set <- function(key,value) { count=count+1; };
        store_fallback_value=7;
        target.put(29);
        if(store_fallback_value!=7 || target.count!=1)
            throw "new _set must run before root write fallback";
        class FallbackAlternateRoot {
            function put(value) { store_fallback_value=value; return 11; }
        }
        local other=FallbackAlternateRoot(), alternate={store_fallback_value=101};
        FallbackAlternateRoot.put.setroot(alternate);
        for(local i=0;i<8;i++) other.put(13);
        store_fallback_value=7;
        other.put(37);
        if(store_fallback_value!=37 || alternate.store_fallback_value!=101)
            throw "SET fallback uses VM root, not closure read root";
        class FallbackReferenceRoot {
            function put(value) { store_fallback_value=value; return value; }
        }
        local reference=FallbackReferenceRoot(), value=[42];
        FallbackReferenceRoot.put.setroot(alternate);
        for(local i=0;i<8;i++) if(reference.put(value)!=value || store_fallback_value!=value)
            throw "reference-valued root fallback preserves assignment identity";
        if(alternate.store_fallback_value!=101) throw "reference fallback changed closure root";
    )SQ"), "setter delegation, runtime rebinding, VM root and replay preserve interpreter semantics");
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        SQJitObservation o = observe(v, "store_existing");
        if(requires_frame(closure(v,"store_existing")))
            CHECK(o.frame.side_exits > 0, "unresolved store resumes after the committed prefix");
        else CHECK(o.frame.guard_failures + o.direct.guard_failures > 0,
            "unresolved store triggers native rollback after an earlier write");
        for(const char *name : {"FallbackSetter", "FallbackAlternateRoot", "FallbackReferenceRoot"}) {
            SQObjectPtr klass, method;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, name)), klass) &&
                sq_type(klass) == OT_CLASS &&
                _class(klass)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("put"))), method) &&
                sq_type(method) == OT_CLOSURE, "find root-store test method");
            if(sq_type(method) != OT_CLOSURE) continue;
            SQJitObservation calls = {};
            sqjit_observe_proto(_closure(method)->_function, calls);
            CHECK(calls.frame.successes + calls.direct.successes > 0,
                "root-store methods execute natively with the active VM root");
            if(std::string(name) == "FallbackSetter") {
                if(requires_frame(_closure(method)))
                    CHECK(calls.frame.side_exits > 0, "new instance _set exits before the root write");
                else CHECK(calls.frame.guard_failures + calls.direct.guard_failures > 0,
                    "new instance _set invalidates native root-store fallback");
            }
        }
    }
#endif
}

struct RootStoreReentry {
    SQVM *outer;
    SQVM *inner;
    SQClosure *callee;
    int *calls;
    SQVM *expected_context;
};

static SQInteger root_store_reentry(SQUserPointer pointer, SQInteger)
{
    RootStoreReentry &test = *(RootStoreReentry *)pointer;
    SQJitContext &ctx = sqjit_context(test.outer->_sharedstate);
    CHECK(ctx.active_vm == test.expected_context, "release hook sees the enclosing execution context");
    SQObjectPtr stack[MAX_FUNC_STACKSIZE], out;
    stack[0] = SQTable::Create(test.inner->_sharedstate, 0);
    stack[1] = (SQInteger)71;
    CHECK(call_native(test.inner, test.callee, stack, 2, out) &&
        sq_type(out) == OT_INTEGER && _integer(out) == 72,
        "release hook re-enters native code on another shared-state VM");
    CHECK(ctx.active_vm == test.expected_context, "inner native return restores the release-hook context");
    ++*test.calls;
    return 0;
}

static void active_vm_root_stores(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        vm_context_slot <- 0;
        function vm_scoped_store(value) { vm_context_slot=value; return value+1; }
        function vm_root_transaction(value,bad) { vm_context_slot=value; return bad[0]+1; }
        function vm_scoped_boolean(value) { vm_context_slot=true; return value+1; }
        function vm_boolean_result() { return vm_context_slot=true; }
        function vm_scoped_float(value) { vm_context_slot=value*0.25; return value+1; }
        function vm_context_marker(value) { return value; }
        function vm_scoped_loop(value,n) {
            vm_context_marker(0); local sum=0;
            for(local i=0;i<n;i++) { vm_context_slot=value; sum+=i; }
            return sum;
        }
        function vm_inline_caller(target,n) {
            vm_context_marker(0); local sum=0;
            for(local i=0;i<n;i++) sum+=target.put(i);
            return sum;
        }
        function vm_boolean_loop(n) {
            vm_context_marker(0); local sum=0;
            for(local i=0;i<n;i++) { vm_context_slot=true; sum+=i; }
            return sum;
        }
        local r={put=vm_scoped_store,loop=vm_scoped_loop};
        for(local i=0;i<12;i++) if(r.put(i)!=i+1 || vm_context_slot!=i)
            throw "native VM-root setter warmup";
        for(local i=0;i<3;i++) {
            if(r.loop(31,29)!=406 || vm_context_slot!=31) throw "root-store loop";
            if(vm_inline_caller(r,29)!=435 || vm_context_slot!=28) throw "inlined root-store loop";
        }
        foreach(receiver in [{}, {vm_context_slot=false}]) {
            receiver.put <- vm_boolean_result;
            receiver.loop <- vm_boolean_loop;
            for(local i=0;i<8;i++) {
                if(typeof receiver.put()!="bool" || receiver.put()!=true || receiver.loop(29)!=406)
                    throw "boolean store result or native loop";
            }
        }
    )SQ"), "VM-root stores preserve interpreter, loop and inlined-call results");
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(!enabled) return;
    CHECK(observe(v, "vm_scoped_loop").loop.successes > 0,
        "implicit-receiver root stores execute in native loops");
    CHECK(observe(v, "vm_inline_caller").loop.successes > 0,
        "callee receiver remapping preserves root-store eligibility in native loops");
    CHECK(observe(v, "vm_boolean_result").frame.successes > 0 &&
        observe(v, "vm_boolean_loop").loop.successes > 0,
        "boolean assignment results and loop stores execute natively");
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    CHECK(ctx.active_vm == NULL, "normal VM exits clear the borrowed native context");
    SQInteger top = sq_gettop(v);
    SQVM *other = sq_newthread(v, 1024);
    CHECK(other, "create VM sharing JIT artifacts and context");
    if(!other) return;
    // Keep the child on the parent's API stack throughout these tests.
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("vm_context_slot")));
    other->_roottable = SQTable::Create(v->_sharedstate, 0);
    _table(other->_roottable)->NewSlot(key, SQObjectPtr((SQInteger)101));
    SQClosure *callee = closure(v, "vm_scoped_store");
    SQObjectPtr stack[MAX_FUNC_STACKSIZE], out, actual;
    stack[0] = SQTable::Create(v->_sharedstate, 0);
    stack[1] = (SQInteger)37;
    _table(v->_roottable)->Set(key, SQObjectPtr((SQInteger)7));
    {
        SQJitExecutionScope outer(ctx, v);
        CHECK(call_native(other, callee, stack, 2, out) &&
            sq_type(out) == OT_INTEGER && _integer(out) == 38,
            "same compiled closure executes on another VM");
        CHECK(ctx.active_vm == v, "native entry restores an enclosing VM context");
    }
    CHECK(ctx.active_vm == NULL, "scoped native VM does not escape its invocation");
    CHECK(_table(other->_roottable)->Get(key, actual) && _integer(actual) == 37 &&
        _table(v->_roottable)->Get(key, actual) && _integer(actual) == 7,
        "shared artifact writes the executing VM root, not its closure's root");
    SQObjectPtr old_root(_table(other->_roottable)->GetWeakRef(OT_TABLE));
    other->_roottable = SQTable::Create(v->_sharedstate, 0);
    _table(other->_roottable)->NewSlot(key, SQObjectPtr((SQInteger)103));
    CHECK(sq_type(_weakref(old_root)->_obj) == OT_NULL,
        "neither compiled code nor inactive execution context retains a VM root");
    stack[1] = (SQInteger)41;
    CHECK(call_native(other, callee, stack, 2, out) &&
        _table(other->_roottable)->Get(key, actual) && _integer(actual) == 41,
        "root rebinding is observed without recompiling the shared artifact");

    // A last-owner hook must execute at the VM assignment, not journal commit.
    // Its nested native call still has to restore the enclosing VM context.
    int releases = 0;
    RootStoreReentry *hook = (RootStoreReentry *)sq_newuserdata(v, sizeof(RootStoreReentry));
    *hook = {v, other, callee, &releases, NULL};
    sq_setreleasehook(v, -1, root_store_reentry);
    HSQOBJECT userdata;
    sq_getstackobj(v, -1, &userdata);
    _table(v->_roottable)->Set(key, SQObjectPtr(userdata));
    sq_pop(v, 1);
    stack[1] = (SQInteger)53;
    bool executed = sqjit_try_execute_closure(v, callee, stack, 2, out);
    CHECK(!executed && releases == 0, "last-owner root write exits before any hook runs");
    if(!executed) {
        SQInteger call_top = sq_gettop(v);
        sq_pushobject(v, SQObjectPtr(callee)); sq_pushobject(v, stack[0]); sq_pushobject(v, stack[1]);
        CHECK(SQ_SUCCEEDED(sq_call(v, 2, SQTrue, SQTrue)), "replay root write with native callback re-entry");
        sq_settop(v, call_top);
    }
    CHECK(releases == 1, "root overwrite invokes the displaced owner's hook exactly once");
    CHECK(ctx.active_vm == NULL && _table(other->_roottable)->Get(key, actual) &&
        _integer(actual) == 71 && _table(v->_roottable)->Get(key, actual) && _integer(actual) == 53,
        "nested native stores preserve separate VM roots and clear context");

    if(callee->_function->_jit && callee->_function->_jit->_entry) {
        // Explicit backend requests retain the raw rollback ABI, even when
        // the runtime has also installed a frame-requiring artifact.
        SQJitNative raw_native;
        CHECK(sqjit_backend_compile_proto(callee->_function,stack,callee,&raw_native) &&
            !raw_native._requires_vm_frame, "raw compiler requests preserve the frameless ABI");
        if(!raw_native._code.Entry()) { sq_settop(v,top); return; }
        SQJitNativeObjectFn fn = (SQJitNativeObjectFn)raw_native._code.Entry();
        SQObjectPtr receiver = stack[0];
        for(int kind : {0,1,2}) {
            if(kind == 0) stack[0].Null();
            else if(kind == 1) stack[0] = (SQInteger)1;
            else stack[0] = SQArray::Create(v->_sharedstate, 0);
            SQJitExecutionScope execution(ctx, other);
            CHECK(fn(stack, &out, callee) == SQ_JIT_NATIVE_GUARD_FAILED &&
                _table(other->_roottable)->Get(key, actual) && _integer(actual) == 71,
                "non-member receivers retain VM error fallback without changing the root");
        }
        stack[0] = receiver;
    }

    // Raw backend execution distinguishes true rollback from interpreter replay.
    SQClosure *transaction = closure(v, "vm_root_transaction");
    stack[1] = SQArray::Create(v->_sharedstate, 0);
    stack[2] = SQArray::Create(v->_sharedstate, 1);
    _array(stack[2])->_values[0] = (SQInteger)9;
    SQJitNative native;
    CHECK(sqjit_backend_compile_proto(transaction->_function, stack, transaction, &native),
        "compile transactional reference-valued root store");
    if(native._code.Entry()) {
        SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native._code.Entry();
        CHECK(fn(stack, &out, transaction) == SQ_JIT_NATIVE_GUARD_FAILED,
            "root miss without an active VM scope fails safely");
        SQObjectPtr owner(SQArray::Create(v->_sharedstate, 0));
        SQObjectPtr weak(_array(owner)->GetWeakRef(OT_ARRAY));
        for(int dead : {0,1}) {
            if(dead) owner.Null();
            _table(other->_roottable)->Set(key, weak);
            _array(stack[2])->_values[0] = false;
            {
                SQJitExecutionScope execution(ctx, other);
                CHECK(fn(stack, &out, transaction) == SQ_JIT_NATIVE_GUARD_FAILED,
                    "late arithmetic guard fails after a native root write");
            }
            CHECK(_table(other->_roottable)->GetRaw(key, actual) &&
                sq_type(actual) == OT_WEAKREF && _weakref(actual) == _weakref(weak),
                "rollback restores the active VM's exact live/dead weak owner");
        }
        _array(stack[2])->_values[0] = (SQInteger)9;
        {
            SQJitExecutionScope execution(ctx, other);
            CHECK(fn(stack, &out, transaction) == SQ_JIT_NATIVE_RETURNED &&
                _table(other->_roottable)->Get(key, actual) && _array(actual) == _array(stack[1]),
                "successful native reference store publishes into the current root");
        }
    }
    for(const char *name : {"vm_scoped_boolean", "vm_scoped_float"}) {
        SQClosure *scalar = closure(v, name);
        // These are independent raw invocations. Do not inherit the previous
        // transaction's owning scratch registers as new function temporaries.
        SQObjectPtr scalar_stack[MAX_FUNC_STACKSIZE];
        scalar_stack[0] = stack[0];
        scalar_stack[1] = (SQInteger)8;
        SQJitNative scalar_native;
        SQJitCompileResult scalar_result = sqjit_backend_compile_proto(scalar->_function, scalar_stack, scalar, &scalar_native);
        if(!scalar_result) printf("scalar compile reject: %s ip %lld %s\n", name,
            (long long)scalar_result.ip, scalar_result.reason);
        CHECK(scalar_result,
            "compile boolean/float root-store helpers");
        if(scalar_native._code.Entry()) {
            SQJitExecutionScope execution(ctx, other);
            CHECK(((SQJitNativeObjectFn)scalar_native._code.Entry())(scalar_stack, &out, scalar) ==
                SQ_JIT_NATIVE_RETURNED && _table(other->_roottable)->Get(key, actual),
                "boolean/float root stores execute natively");
            CHECK(std::string(name) == "vm_scoped_boolean" ?
                sq_type(actual) == OT_BOOL && _integer(actual) == 1 :
                sq_type(actual) == OT_FLOAT && _float(actual) == 2.0,
                "root store preserves scalar value and tag");
        }
    }

    // Explicit aliases of register zero must not acquire implicit root SET
    // fallback when the native register mapper folds their MOVE away.
    SQObjectPtr proto_owner(SQFunctionProto::Create(v->_sharedstate, 4, 1, 2, 0, 0, 0, 0, 0));
    SQFunctionProto *alias = _funcproto(proto_owner);
    alias->_varparams = false;
    alias->_bgenerator = false;
    alias->_stacksize = 4;
    alias->_literals[0] = key;
    alias->_instructions[0] = SQInstruction(_OP_MOVE, 3, 0);
    alias->_instructions[1] = SQInstruction(_OP_LOAD, 2, 0);
    alias->_instructions[2] = SQInstruction(_OP_SET, 0xff, 3, 2, 1);
    alias->_instructions[3] = SQInstruction(_OP_RETURN, 1, 1);
    SQObjectPtr alias_owner(SQClosure::Create(v->_sharedstate, alias, callee->_root));
    SQJitNative alias_native;
    SQJitCompileResult alias_result = sqjit_backend_compile_proto(alias, stack, _closure(alias_owner), &alias_native);
    if(!alias_result) printf("alias compile reject: ip %lld %s\n",
        (long long)alias_result.ip, alias_result.reason);
    CHECK(alias_result,
        "compile folded receiver-alias store");
    if(alias_native._code.Entry()) {
        _table(other->_roottable)->Set(key, SQObjectPtr((SQInteger)107));
        SQJitExecutionScope execution(ctx, other);
        CHECK(((SQJitNativeObjectFn)alias_native._code.Entry())(stack, &out, _closure(alias_owner)) ==
            SQ_JIT_NATIVE_GUARD_FAILED && _table(other->_roottable)->Get(key, actual) && _integer(actual) == 107,
            "folded explicit receiver alias cannot write the VM root");
    }
    SQInteger other_top = sq_gettop(other);
    ctx.enabled = false;
    sq_pushobject(other, alias_owner); sq_pushobject(other, stack[0]); sq_pushobject(other, stack[1]);
    CHECK(SQ_FAILED(sq_call(other, 2, SQTrue, SQFalse)) &&
        _table(other->_roottable)->Get(key, actual) && _integer(actual) == 107,
        "interpreter also rejects the explicit alias instead of writing its VM root");
    sq_settop(other, other_top);
    ctx.enabled = enabled;
    CHECK(ctx.active_vm == NULL, "all native success and failure paths restore the active VM");
    sq_settop(v, top);
#else
    (void)enabled;
#endif
}

struct RootHookOrder {
    SQVM *vm;
    int *calls;
};

static SQInteger root_hook_order(SQUserPointer pointer, SQInteger)
{
    RootHookOrder &state = *(RootHookOrder *)pointer;
    SQObjectPtr key(SQString::Create(state.vm->_sharedstate, _SC("vm_hook_value")));
    _table(state.vm->_roottable)->Set(key, SQObjectPtr((SQInteger)99));
    ++*state.calls;
    return 0;
}

static void root_release_order(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        vm_hook_value <- 0;
        vm_hook_alias <- 0;
        function root_read_after_store(value) { vm_hook_value=value; return vm_hook_value+1; }
        function root_read_after_two(value) {
            vm_hook_value=value; vm_hook_alias=value; return vm_hook_value+1;
        }
        function member_read_after_store(target,value) {
            target.vm_hook_value=value; return target.vm_hook_value+1;
        }
        function member_read_after_two(target,value) {
            target.vm_hook_value=value; target.vm_hook_alias=value; return target.vm_hook_value+1;
        }
        local r={put=root_read_after_store,twice=root_read_after_two};
        for(local i=0;i<12;i++) if(r.put(i)!=i+1 || r.twice(i)!=i+1 ||
            member_read_after_store(getroottable(),i)!=i+1 || member_read_after_two(getroottable(),i)!=i+1)
            throw "release ordering warmup";
    )SQ"), "warm root read after root store");
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("vm_hook_value")));
    SQObjectPtr alias(SQString::Create(v->_sharedstate, _SC("vm_hook_alias")));
    for(int member : {0,1}) for(int shape : {0,1,2,3}) for(int native : {0,1}) {
        ctx.enabled = enabled && native;
        int calls = 0;
        SQInteger top = sq_gettop(v);
        RootHookOrder *hook = (RootHookOrder *)sq_newuserdata(v, sizeof(RootHookOrder));
        *hook = {v, &calls};
        sq_setreleasehook(v, -1, root_hook_order);
        HSQOBJECT value;
        sq_getstackobj(v, -1, &value);
        {
            SQObjectPtr payload(value);
            if(shape == 1) {
                SQObjectPtr container(SQArray::Create(v->_sharedstate, 1));
                _array(container)->_values[0] = payload;
                payload = container;
            }
            else if(shape == 2) {
                SQObjectPtr container(SQTable::Create(v->_sharedstate, 0));
                _table(container)->NewSlot(key, payload);
                payload = container;
            }
            _table(v->_roottable)->Set(key, payload);
            if(shape == 3) _table(v->_roottable)->Set(alias, payload);
        }
        sq_pop(v, 1);
        const char *name = member ? (shape == 3 ? "member_read_after_two" : "member_read_after_store") :
            (shape == 3 ? "root_read_after_two" : "root_read_after_store");
        sq_pushobject(v, SQObjectPtr(closure(v, name)));
        sq_newtable(v);
        if(member) sq_pushroottable(v);
        sq_pushinteger(v, 5);
        SQInteger result = 0;
        bool ok = SQ_SUCCEEDED(sq_call(v, member ? 3 : 2, SQTrue, SQTrue)) &&
            SQ_SUCCEEDED(sq_getinteger(v, -1, &result));
        if(!ok || result != 100 || calls != 1)
            printf("release ordering: enabled=%d native=%d member=%d shape=%d result=%lld releases=%d\n",
                enabled, native, member, shape, (long long)result, calls);
        CHECK(ok && result == 100 && calls == 1,
            "overwrite release hook runs before a subsequent member/root read");
        sq_settop(v, top);
    }
    ctx.enabled = enabled;
}

static void stack_release_order(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function stack_release_move(value, replacement) {
            value=replacement; return vm_hook_value+1;
        }
        function stack_release_get(value, replacement) {
            value=replacement.number;
            // GET swaps the displaced value into the VM temporary. The first
            // read captures zero before clearing it; the next must see 99.
            local before=vm_hook_value; return before*1000+vm_hook_value+1;
        }
        function stack_release_boxed(value, replacement) {
            value=replacement.payload;
            local before=vm_hook_value; return before*1000+vm_hook_value+1;
        }
        function stack_release_get_float(value, replacement) {
            value=replacement.number;
            local before=vm_hook_value; return before*1000+vm_hook_value+1;
        }
        function stack_release_get_array(value, replacement) {
            value=replacement[0];
            local before=vm_hook_value; return before*1000+vm_hook_value+1;
        }
        function stack_release_two(value, alias, replacement) {
            value=replacement; alias=replacement; return vm_hook_value+1;
        }
        function stack_release_literal(value, replacement) {
            value=7; return vm_hook_value+1;
        }
        function stack_release_arithmetic(value, replacement) {
            value=replacement+7; return vm_hook_value+1;
        }
        function stack_release_not(value, replacement) {
            value=!replacement; return vm_hook_value+1;
        }
        function stack_release_branch(value, replacement) {
            if(replacement>0) value=replacement;
            else value=7;
            return vm_hook_value+1;
        }
        for(local i=0;i<12;i++) {
            vm_hook_value=0;
            if(stack_release_move(i,5)!=1 || stack_release_get(i,{number=5})!=1 ||
                stack_release_boxed(i,{payload=[5]})!=1 || stack_release_two(i,i,5)!=1 ||
                stack_release_get_float(i,{number=5.5})!=1 || stack_release_get_array(i,[5])!=1 ||
                stack_release_literal(i,5)!=1 || stack_release_arithmetic(i,5)!=1 || stack_release_not(i,5)!=1 ||
                stack_release_branch(i,5)!=1 || stack_release_branch(i,-5)!=1)
                throw "stack release ordering warmup";
        }
    )SQ"), "warm native stack overwrite paths");
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("vm_hook_value")));
    for(const char *name : {"stack_release_move", "stack_release_get", "stack_release_boxed", "stack_release_two",
        "stack_release_literal", "stack_release_arithmetic", "stack_release_branch",
        "stack_release_get_float", "stack_release_get_array",
#if SQJIT_HAS_EXTERNAL_NATIVE
        "stack_release_not",
#endif
        }) {
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v, name).frame.successes > 0,
            "stack ordering warmup exercises native whole-function execution");
#endif
        for(int shape : {0,1,2}) for(int native : {0,1}) {
            ctx.enabled = enabled && native;
            _table(v->_roottable)->Set(key, SQObjectPtr((SQInteger)0));
            int calls = 0;
            SQInteger top = sq_gettop(v);
            sq_pushobject(v, SQObjectPtr(closure(v, name))); sq_pushroottable(v);
            RootHookOrder *hook = (RootHookOrder *)sq_newuserdata(v, sizeof(RootHookOrder));
            *hook = {v, &calls};
            sq_setreleasehook(v, -1, root_hook_order);
            // Leave the only owner in the actual argument slot: an extra C++
            // SQObjectPtr or caller local would hide its observable overwrite.
            if(shape) {
                HSQOBJECT raw; sq_getstackobj(v, -1, &raw);
                SQObjectPtr container(shape == 1 ? SQObjectPtr(SQArray::Create(v->_sharedstate, 1)) :
                    SQObjectPtr(SQTable::Create(v->_sharedstate, 0)));
                if(shape == 1) _array(container)->_values[0] = SQObjectPtr(raw);
                else _table(container)->NewSlot(key, SQObjectPtr(raw));
                sq_pop(v, 1); sq_pushobject(v, container);
            }
            bool twice = !strcmp(name, "stack_release_two");
            if(twice) sq_push(v, -1);
            bool float_get = !strcmp(name, "stack_release_get_float");
            if(!strcmp(name, "stack_release_get") || !strcmp(name, "stack_release_boxed") || float_get) {
                sq_newtable(v);
                sq_pushstring(v, strcmp(name, "stack_release_boxed") ? _SC("number") : _SC("payload"), -1);
                if(float_get) sq_pushfloat(v, (SQFloat)5.5);
                else if(!strcmp(name, "stack_release_get")) sq_pushinteger(v, 5);
                else sq_newarray(v, 1);
                sq_newslot(v, -3, SQFalse);
            }
            else if(!strcmp(name, "stack_release_get_array")) {
                sq_newarray(v, 0); sq_pushinteger(v, 5); sq_arrayappend(v, -2);
            }
            else sq_pushinteger(v, !strcmp(name, "stack_release_branch") && shape == 1 ? -5 : 5);
            SQInteger actual = -1;
            bool ok = SQ_SUCCEEDED(sq_call(v, twice ? 4 : 3, SQTrue, SQTrue)) &&
                SQ_SUCCEEDED(sq_getinteger(v, -1, &actual));
            // Clean any unreleased argument while the callback state is alive.
            sq_settop(v, top);
            if(!ok || actual != 100 || calls != 1)
                printf("stack ordering: %s enabled=%d native=%d shape=%d result=%lld releases=%d\n",
                    name, enabled, native, shape, (long long)actual, calls);
            CHECK(ok && actual == 100 && calls == 1,
                "logical stack overwrite releases before the following root read");
        }
        ctx.enabled = enabled;
    }
}

static void scalar_array_weak_release(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        scalar_array_observer <- null;
        function scalar_array_drop(value) { value=7; return scalar_array_observer; }
        for(local n=0;n<12;n++)
            if(scalar_array_drop([n])!=null) throw "scalar array drop warmup";
    )SQ"), "warm scalar-array replacement before adding a weak observer");
#if SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) CHECK(observe(v, "scalar_array_drop").frame.successes > 0,
        "scalar-array replacement warms native whole-function execution");
#endif
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("scalar_array_observer")));
    for(bool native : {false, true}) {
        ctx.enabled = enabled && native;
        SQInteger top = sq_gettop(v);
        sq_pushobject(v, SQObjectPtr(closure(v, "scalar_array_drop")));
        sq_pushroottable(v);
        sq_newarray(v, 1);
        HSQOBJECT raw;
        sq_getstackobj(v, -1, &raw);
        // Keep only a weak reference outside the argument slot: an extra
        // strong C++ owner would conceal an incorrectly delayed release.
        SQObjectPtr weak(_array(raw)->GetWeakRef(OT_ARRAY));
        _table(v->_roottable)->Set(key, weak);
        bool ok = SQ_SUCCEEDED(sq_call(v, 2, SQTrue, SQTrue));
        CHECK(ok && sq_gettype(v, -1) == OT_NULL && sq_type(_weakref(weak)->_obj) == OT_NULL,
            "a weak observer added after warmup sees death before the next root read");
        sq_settop(v, top);
    }
    ctx.enabled = enabled;
}

static void borrowed_member_guards(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function borrow_add(x) { return x+3; }
        function borrow_other(x) { return x+17; }
        class BorrowMethod { function f(x) { return x+3; } }
        class BorrowField { f=null; }
        BorrowField.f <- borrow_add;
    )SQ"), "define member guard targets");
    // Each receiver kind gets fresh call sites so an old type guard cannot
    // satisfy the test by sending every subsequent call to the interpreter.
    for(const char *receiver : {"{f=borrow_add}", "BorrowMethod()", "BorrowMethod", "BorrowField()", "BorrowField"}) {
        std::string source = R"SQ(
            function borrow_call(t,x) { return t.f(x)+1; }
            function borrow_nested(t,x) { return t.box.f(x)+1; }
            borrow_receiver <- )SQ" + std::string(receiver) + R"SQ(;
            if(borrow_receiver instanceof BorrowField) borrow_receiver.f=borrow_add;
            borrow_wrapper <- {box=borrow_receiver};
            for(local i=0;i<12;i++) {
                if(borrow_call(borrow_receiver,9)!=13 || borrow_nested(borrow_wrapper,9)!=13)
                    throw "member guard warmup";
            }
        )SQ";
        CHECK(run(v, source.c_str()), "warm member guard for each receiver kind");
#if SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) for(const char *name : {"borrow_call", "borrow_nested"}) {
            SQJitObservation o = observe(v, name);
            if(o.frame.successes == 0) scprintf(_SC("borrow route %s: ip=%d reason=%s\n"),
                name, (int)o.compilation.ip, o.compilation.reason ? o.compilation.reason : "none");
            CHECK(o.frame.successes > 0, "member guards execute native frames for each receiver kind");
        }
#endif
        SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("f")));
        SQObjectPtr target;
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("borrow_receiver"))), target);
        SQObjectPtr *slot = NULL;
        bool dereference = true;
        if(sq_type(target) == OT_TABLE) slot = _table(target)->GetRawSlot(key);
        else {
            SQClass *klass = sq_type(target) == OT_CLASS ? _class(target) : _instance(target)->_class;
            SQObjectPtr index;
            CHECK(klass->_members->Get(key, index), "resolve class guard target");
            if(_isfield(index)) slot = sq_type(target) == OT_CLASS ?
                &klass->_defaultvalues[_member_idx(index)].val : &_instance(target)->_values[_member_idx(index)];
            else { slot = &klass->_methods[_member_idx(index)].val; dereference = false; }
        }
        CHECK(slot && sq_type(*slot) == OT_CLOSURE, "member guard starts with a closure");
        if(!slot || sq_type(*slot) != OT_CLOSURE) continue;
        SQObjectPtr saved(*slot);
        SQObjectPtr weak(_closure(saved)->GetWeakRef(OT_CLOSURE));
        *slot = weak;
        // Public Get treats weak methods differently from weak table/field
        // values. Exercise the guard against the same underlying storage.
        const auto call = [&](const char *name, SQInteger expected, bool succeeds) {
            SQObjectPtr argument;
            _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,
                !strcmp(name, "borrow_call") ? _SC("borrow_receiver") : _SC("borrow_wrapper"))), argument);
            SQInteger top = sq_gettop(v), actual = 0;
            sq_pushobject(v, SQObjectPtr(closure(v, name))); sq_pushroottable(v);
            sq_pushobject(v, argument); sq_pushinteger(v, 9);
            bool ok = SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQFalse));
            CHECK(ok == succeeds, "borrowed member call preserves success/failure semantics");
            if(ok) CHECK(SQ_SUCCEEDED(sq_getinteger(v, -1, &actual)) && actual == expected,
                "borrowed guard reads the current member identity");
            sq_settop(v, top);
        };
        for(const char *name : {"borrow_call", "borrow_nested"}) {
            SQJitObservation before = observe(v, name);
            call(name, 13, dereference);
#if SQJIT_HAS_EXTERNAL_NATIVE
            if(enabled && dereference) CHECK(observe(v, name).frame.successes > before.frame.successes,
                "live weak table/field references pass the native closure identity guard");
#endif
        }
        *slot = closure(v, "borrow_other");
        for(const char *name : {"borrow_call", "borrow_nested"}) call(name, 27, true);
        // A never-compiled referent can really die: compiled targets themselves
        // may be retained by the native code's literal/closure ownership.
        CHECK(run(v, "borrow_dead <- function(x) { return x+91; };"), "create unobserved weak target");
        SQObjectPtr dead(closure(v, "borrow_dead")->GetWeakRef(OT_CLOSURE));
        _table(v->_roottable)->Remove(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("borrow_dead"))));
        CHECK(sq_type(_weakref(dead)->_obj) == OT_NULL, "weak guard target is actually dead");
        for(const SQObjectPtr &value : {SQObjectPtr(), dead}) {
            *slot = value;
            for(const char *name : {"borrow_call", "borrow_nested"}) call(name, 0, false);
        }
        *slot = saved;
        for(const char *name : {"borrow_call", "borrow_nested"}) call(name, 13, true);
    }
}

static void reference_assignment_results(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function capture_ref(t,a) { local r=(t.current=a); a=t.empty; return r; }
        function replace_ref(t,a,b) { local r=(t.current=a); t.current=b; return r; }
        function receiver_ref(t,a) { t=(t.current=a); return t; }
        function nested_ref(t,a,b) { return (t.current=(a.current=b)); }
        function change_ref(t,b) { t.current=b; return 1; }
        function capture_call(t,a,b) {
            local r=(t.current=a); a=t.empty; change_ref(t,b); return r;
        }
        function capture_late(t,a,bad) {
            local r=(t.current=a); a=t.empty; local z=bad[0]+1; return r;
        }
        class AssignmentRecord { current=null; empty=null; }
        for(local j=0;j<8;j++) {
            local t=j%2 ? AssignmentRecord() : {current=null,empty=null};
            local a=[j],b=[j+1];
            if(capture_ref(t,a)!=a || t.current!=a) throw "capture lost overwritten argument";
            if(replace_ref(t,a,b)!=a || t.current!=b) throw "capture lost displaced owner";
            if(receiver_ref(t,a)!=a || t.current!=a) throw "result aliases receiver";
            local holder={current=null};
            if(nested_ref(t,holder,b)!=b || t.current!=b || holder.current!=b)
                throw "nested reference assignment result";
            if(capture_call(t,a,b)!=a || t.current!=b) throw "capture survives a nested mutating call";
            if(capture_late(t,a,[1])!=a) throw "late-capture warmup";
        }
        foreach(a in [null,false,37,2.5,"text",{},[3],function(){return 1}]) {
            local t={current=[7],empty=null},b=[9];
            if(capture_ref(t,a)!=a || t.current!=a) throw "changed assignment value tag";
            if(replace_ref(t,a,b)!=a || t.current!=b) throw "changed displaced result tag";
        }
        local t={current=[1],empty=null},a=[42],caught=false;
        try { capture_late(t,a,[false]); } catch(e) { caught=true; }
        if(!caught || t.current!=a) throw "late guard replay lost the original argument";
    )SQ"), "reference assignment results preserve values, tags and aliases");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        for(const char *name : {"capture_ref", "replace_ref", "receiver_ref", "nested_ref", "capture_late"}) {
            SQJitObservation o = observe(v, name);
            if(o.frame.successes == 0) scprintf(_SC("reference route %s: frame ip=%d reason=%s\n"),
                name, (int)o.compilation.ip, o.compilation.reason ? o.compilation.reason : "none");
            CHECK(o.frame.successes > 0, "assignment-result cases execute native whole-function stores");
        }
        if(requires_frame(closure(v,"capture_late")))
            CHECK(observe(v,"capture_late").frame.side_exits > 0,
                "late guard resumes with the committed reference assignment");
        else CHECK(observe(v, "capture_late").frame.guard_failures > 0 ||
            observe(v, "capture_late").direct.guard_failures > 0,
            "late guard exercises native input and heap rollback");
    }
#endif
}

static void reference_loop_results(SQVM *v, bool enabled)
{
    CHECK(run(v, R"SQ(
        function owner_sequence(t,other,pool,n,width,bad) {
            compound_marker(0); local sum=0;
            for(local i=0;i<n;i++) {
                local previous=t.current;
                local captured=(t.current=pool[i%width]); other.current=captured;
                captured[0]=(previous[0]+i)%97;
                sum+=other.current[0]+bad[i];
            }
            return sum;
        }
        function sequence_snapshot(width,n,classes,alias,poison) {
            local pool=[]; for(local i=0;i<width;i++) pool.append([i+1]);
            local t=classes?AssignmentRecord():{current=null,empty=null};
            t.current=pool[width-1]; local other=alias?t:{current=pool[0]};
            local bad=array(n,1); if(poison && n>11) bad[11]=false;
            local result=0,caught=false;
            try { result=owner_sequence(t,other,pool,n,width,bad); } catch(e) { caught=true; }
            local snapshot=caught+":"+result+":"+t.current[0]+":"+other.current[0];
            foreach(a in pool) snapshot+=":"+a[0];
            return snapshot;
        }
    )SQ"), "define native reference-result loop differential cases");
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    for(int width : {1,2,19,257}) for(int n : {31,0,1,511})
        for(int classes : {0,1}) for(int alias : {0,1}) for(int poison : {0,1}) {
            std::string expected;
            for(int native : {0,1}) {
                ctx.enabled = enabled && native;
                SQInteger top = sq_gettop(v);
                sq_pushobject(v, SQObjectPtr(closure(v, "sequence_snapshot"))); sq_pushroottable(v);
                sq_pushinteger(v, width); sq_pushinteger(v, n);
                sq_pushbool(v, classes); sq_pushbool(v, alias); sq_pushbool(v, poison);
                const SQChar *actual = NULL;
                bool ok = SQ_SUCCEEDED(sq_call(v, 6, SQTrue, SQTrue)) &&
                    SQ_SUCCEEDED(sq_getstring(v, -1, &actual));
                CHECK(ok, "reference loop snapshot completes");
                if(ok) {
                    if(!native) expected = actual;
                    else CHECK(expected == actual, "captured owners, aliases and late rollback agree with interpreter");
                }
                sq_settop(v, top);
            }
        }
    ctx.enabled = enabled;
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        SQJitObservation o = observe(v, "owner_sequence");
        CHECK(o.loop.successes > 0 && o.loop.guard_failures > 0,
            "rotating reference captures execute native loops and late guard rollback");
    }
#endif
}

static void native_call_stack_bounds()
{
    SQVM *v = sq_open(64);
    sq_settop(v, 8);
    SQObjectPtr *base = v->_stack._vals;
    SQObjectPtr raw[12];
    CHECK(sqjit_native_call_fits_stack(v, base + 4, 4), "frameless call may fill the remaining live slots");
    CHECK(!sqjit_native_call_fits_stack(v, base + 4, 5), "frameless owner publication cannot exceed the live frame");
    CHECK(sqjit_native_call_fits_stack(v, base + 4, 12, 4), "private scalar storage can use reserved VM capacity");
    CHECK(!sqjit_native_call_fits_stack(v, base + 4, 12, 5), "owner bound is independent of storage capacity");
    CHECK(sqjit_native_call_fits_stack(v, base + 12, 4, 0), "a proven non-owning callee needs only allocated storage");
    CHECK(!sqjit_native_call_fits_stack(v, base + v->_stack.size(), 1, 0), "one-past VM storage is not a foreign raw frame");
    CHECK(!sqjit_native_call_fits_stack(v, reinterpret_cast<SQObjectPtr *>(reinterpret_cast<char *>(base) + 1), 1),
        "misaligned VM stack addresses are rejected without dereferencing");
    CHECK(sqjit_native_call_fits_stack(v, raw, 12) && sqjit_native_call_fits_stack(NULL, raw, 12),
        "raw native callers keep their independent storage contract");
    CHECK(!sqjit_native_call_fits_stack(v, NULL, 1) && !sqjit_native_call_fits_stack(v, raw, 0) &&
        !sqjit_native_call_fits_stack(v, raw, MAX_FUNC_STACKSIZE + 1) &&
        !sqjit_native_call_fits_stack(v, raw, 12, 13) && !sqjit_native_call_fits_stack(v, raw, 12, -2),
        "invalid frame extents change no VM state");
    CHECK(sq_gettop(v) == 8, "frame eligibility checks never enter or resize the VM frame");
    sq_close(v);
}

static void native_call_frame_cleanup()
{
    for(bool enabled : {false, true}) for(bool tail : {false, true}) for(int locals : {8,16,24}) {
        SQVM *v = sq_open(64);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled; ctx.threshold = 1; sqjit_observe_enable(v);
        {
            SQObjectPtr box(SQTable::Create(v->_sharedstate, 0));
            SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("value")));
            SQObjectPtr value(SQArray::Create(v->_sharedstate, 1));
            _array(value)->_values[0] = (SQInteger)1;
            SQObjectPtr weak(_array(value)->GetWeakRef(OT_ARRAY));
            _table(box)->NewSlot(key, value);
            value.Null();
            _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("boundary_box"))), box);
            std::string source = "function boundary_wide(box) {\n";
            for(int n = 0; n < locals; ++n)
                source += "local v" + std::to_string(n) + "=box.value;\n";
            source += "return v0[0]+v" + std::to_string(locals - 1) + "[0];\n}\n";
            source += tail ? "function boundary_thin(box) { return boundary_wide(box); }\n" :
                "function boundary_thin(box) { local result=boundary_wide(box); return result+0; }\n";
            source += "for(local n=0;n<6;n++) if(boundary_thin(boundary_box)!=2) throw \"frame boundary result\";\n";
            CHECK(run(v, source.c_str()), "small caller invokes a larger reference-holding callee");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
            if(enabled) {
                SQJitObservation o = observe(v, "boundary_wide");
                CHECK(o.frame.successes + o.direct.successes > 0,
                    "large-callee lifetime test exercises native function execution");
            }
#endif
            _table(box)->Set(key, SQObjectPtr());
            // temp_reg is a legitimate retained VM owner. Clear it explicitly
            // to isolate references stranded outside the live VM stack.
            v->temp_reg.Null();
            if(sq_type(_weakref(weak)->_obj) != OT_NULL) {
                printf("frame cleanup: jit=%d tail=%d locals=%d top=%lld retained slots:", enabled, tail, locals, (long long)v->_top);
                for(SQInteger n = 0; n < (SQInteger)v->_stack.size(); ++n)
                    if(sq_type(v->_stack._vals[n]) == OT_ARRAY &&
                        _array(v->_stack._vals[n]) == _array(_weakref(weak)->_obj)) printf(" %lld", (long long)n);
                puts("");
            }
            CHECK(sq_type(_weakref(weak)->_obj) == OT_NULL,
                "native return releases callee locals beyond the caller frame");
        }
        sq_close(v);
    }
}

int main()
{
    native_call_stack_bounds();
    native_call_frame_cleanup();
    std::vector<SQFloat> reference;
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(1024); SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1; sqjit_observe_enable(v);
        cells(v); key_flow(v); wide_record(v, enabled != 0); guard_owners(v, enabled != 0);
        compound_members(v, enabled != 0);
        numeric_store_release(v, enabled != 0);
        numeric_table_hints(v, enabled != 0);
        reference_table_hints(v, enabled != 0);
        root_receiver_fallback(v, enabled != 0);
        store_fallback_semantics(v, enabled != 0);
        active_vm_root_stores(v, enabled != 0);
        root_release_order(v, enabled != 0);
        stack_release_order(v, enabled != 0);
        scalar_array_weak_release(v, enabled != 0);
        borrowed_member_guards(v, enabled != 0);
        reference_assignment_results(v, enabled != 0);
        reference_loop_results(v, enabled != 0);
        CHECK(run(v, R"SQ(
            function marker(x) { return typeof x }
            class Record { current=null; caption="idle"; count=0; weight=0.0 }
            function cycle(t,alias,pool,n,width,bad) {
                marker(0); local sum=0;
                for(local i=0;i<n;i++) {
                    local old=t.current; t.current=pool[i%width]; alias.current=t.current;
                    t.caption=i%2==0 ? "available" : "in flight";
                    t.current[0]=(t.current[0]+old[0]+i)%997;
                    t.count=t.count+1; t.weight=t.weight+0.25;
                    sum=(sum+alias.current[0]+t.caption.len()+bad[i])%1000003;
                }
                return sum;
            }
            function type_alias(t,other,n) {
                marker(0); local sum=0;
                for(local i=0;i<n;i++) { t.current=t.spare; other.current=i; sum+=t.current[0]; }
                return sum;
            }
            function scalar(t,n) {
                local sum=0.0;
                for(local i=0;i<n;i++) { sum+=(t.weight=t.weight+0.25)+(t.count=t.count+1); }
                return sum;
            }
            function sample(width,n,classes,aliased,poison) {
                local pool=[]; for(local i=0;i<width;i++) pool.append([i+1]);
                local t=classes?Record():{current=null,caption="idle",count=0,weight=0.0};
                if(!classes) for(local i=0;i<width;i++) t[i]<-i;
                t.current=pool[width-1]; local alias=aliased?t:{current=pool[0]};
                local bad=array(n,1); if(poison && n>9) bad[9]="bad";
                local result=0, caught=false;
                try { result=cycle(t,alias,pool,n,width,bad) } catch(e) { caught=true }
                if(caught!=(poison && n>9)) throw "exception differs";
                result+=t.count*8192+t.weight*128+t.caption.len()+t.current[0]*7+alias.current[0]*13;
                foreach(value in pool) result=result*1.0000000000000002+value[0];
                return result;
            }
            for(local j=0;j<3;j++) {
                if(type_alias({current=[0],spare=[7]},{current=0},20)!=140) throw "type alias warmup";
                local t={current=[0],spare=[7]},caught=false;
                try { type_alias(t,t,20) } catch(e) { caught=true }
                if(!caught || t.current!=0) throw "cached read missed alias type change";
                t={weight=0.0,count=0}; if(scalar(t,20)!=262.5) throw "numeric assignment values";
                for(local k=0;k<200;k++) t[k]<-k;
                if(scalar(t,2)!=53.75) throw "table rehash between invocations";
                delete t.weight; t.weight<-0.0;
                if(scalar(t,2)!=47.75) throw "delete and reinsert between invocations";
                t.clear(); if(scalar(t,0)!=0.0) throw "zero trip missing members";
            }
            function exchange(a,b,caption) {
                local previous=a.current;
                a.current=b.current; a.caption=caption; b.current=previous;
                return a.current[0]+b.current[1];
            }
            function assign_refs(a,input,caption) {
                a.current=input; a.caption=caption;
                return a.current[0]+input[1];
            }
            class Alternate { padding=123; current=null; caption=null; }
            for(local j=0;j<6;j++) {
                local a=j%2 ? Record() : {current=null,caption=null};
                local b=j%3 ? Alternate() : {caption=null,current=null};
                a.current=[1,2]; b.current=[10,20];
                if(exchange(a,b,"first")!=12 || a.current[0]!=10 || b.current[0]!=1)
                    throw "straight-line reference exchange";
                if(exchange(a,b,"second")!=21 || exchange(a,a,"alias")!=3)
                    throw "aliased reference exchange";
                if(assign_refs(a,[40,50],"parameter")!=90 || a.caption!="parameter")
                    throw "borrowed reference parameters";
                local caption=[7];
                if(assign_refs(a,[40,50],caption)!=90 || a.caption!=caption)
                    throw "changed parameter type fallback";
            }
            // Failure occurs after all three stores. Replay must swap once,
            // preserve the caption write and report the interpreter's error.
            local a={current=[1],caption="old"}, b={current=[10,20],caption="b"}, caught=false;
            try { exchange(a,b,"after") } catch(e) { caught=true }
            if(!caught || a.current[0]!=10 || b.current.len()!=1 || a.caption!="after")
                throw "straight-line late guard rollback";
            a={current=[1,"q"],caption="old"}; b={current=[10,20],caption="b"};
            if(exchange(a,b,"changed")!="10q") throw "changed element type fallback";
        )SQ"), "define and check native field workloads");
        size_t sample = 0;
        for(int width : {1,2,5,19,257}) for(int n : {31,0,1,2,127})
            for(int classes = 0; classes < 2; ++classes) for(int alias = 0; alias < 2; ++alias)
                for(int poison = 0; poison < 2; ++poison) {
                    SQInteger top = sq_gettop(v); sq_pushobject(v, SQObjectPtr(closure(v, "sample")));
                    sq_pushroottable(v); sq_pushinteger(v, width); sq_pushinteger(v, n);
                    sq_pushbool(v, classes); sq_pushbool(v, alias); sq_pushbool(v, poison);
                    SQFloat actual = 0;
                    CHECK(SQ_SUCCEEDED(sq_call(v, 6, SQTrue, SQTrue)) && SQ_SUCCEEDED(sq_getfloat(v, -1, &actual)), "varied field workload completes");
                    if(!enabled) reference.push_back(actual);
                    else CHECK(actual == reference[sample], "fields, aliases, owner working sets and late rollback agree with interpreter");
                    ++sample; sq_settop(v, top);
                }
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            CHECK(observe(v, "cycle").loop.successes > 0 && observe(v, "cycle").loop.guard_failures > 0, "member ownership stress executes native stores and guard rollback");
            CHECK(observe(v, "type_alias").loop.successes > 0 && observe(v, "type_alias").loop.guard_failures > 0, "aliased type change takes native guard");
            CHECK(observe(v, "scalar").frame.successes > 0, "numeric member loops execute whole-function entry");
            CHECK(observe(v, "exchange").frame.successes > 0 && observe(v, "exchange").direct.successes > 0 &&
                observe(v, "exchange").direct.guard_failures > 0, "mutating leaf uses native entry and late rollback");
            CHECK(observe(v, "assign_refs").frame.successes > 0, "array/string parameters execute natively");
        }
#endif
#if SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) {
            // cycle contains an internal diamond; AArch64 loop-region
            // branching is a separate, still unsupported capability.
            for(const char *name : {"type_alias"}) {
                SQJitObservation o = observe(v, name);
                if(!o.loop.successes) scprintf(_SC("reference loop %s: ip=%d reason=%s\n"),
                    name, (int)o.loop_compilation.ip,
                    o.loop_compilation.reason ? o.loop_compilation.reason : "none");
                CHECK(o.loop.successes > 0 && o.loop.guard_failures > 0,
                    "AArch64 ownership loops execute native stores and late rollback");
            }
            CHECK(observe(v, "exchange").frame.successes > 0,
                "AArch64 reference exchange executes native member stores");
            CHECK(observe(v, "assign_refs").frame.successes > 0,
                "AArch64 array/string parameters execute native member stores");
        }
#endif
        sq_close(v);
    }
    return failures ? 1 : 0;
}
