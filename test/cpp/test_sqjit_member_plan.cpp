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

int main()
{
    std::vector<SQFloat> reference;
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(1024); SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1; sqjit_observe_enable(v);
        cells(v); key_flow(v); wide_record(v, enabled != 0); guard_owners(v, enabled != 0);
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
        sq_close(v);
    }
    return failures ? 1 : 0;
}
