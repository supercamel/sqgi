#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqstring.h"
#include "jit/sqjit.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include "jit/sqjit_write_log.h"
#include <stdio.h>
#include <initializer_list>
#include <string>

#define CHECK(c, text) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", text); ++failures; } } while(0)

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("side-exit"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQFalse)); }
    if(!ok) {
        sq_getlasterror(v); const SQChar *error = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("script error: %s\n"), error);
    }
    sq_settop(v, top);
    return ok;
}

static SQObjectPtr named(SQVM *v, const SQChar *name)
{
    SQObjectPtr result;
    _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, name)), result);
    return result;
}

enum ExitMode { COMMIT, ENTRY_GUARD, NEGATIVE_IP, END_IP, WRONG_TAG };
static ExitMode mode = COMMIT;
static int entered = 0;
static SQInteger resume_ip = -1;
static SQVM *nested_vm = NULL;
static bool nested_ok = true;

// This deliberately injected entry tests the runtime ABI independently of any
// compiler's supported subset. It models native effects and publishes incoming
// scalar state; it is not a claim of generated-code side-exit coverage.
static SQInteger exit_entry(SQObjectPtr *stack, SQObjectPtr *result, SQClosure *closure)
{
    ++entered;
    if(mode == ENTRY_GUARD) return SQ_JIT_NATIVE_GUARD_FAILED;
    if(mode == NEGATIVE_IP) { *result = SQInteger(-1); return SQ_JIT_NATIVE_SIDE_EXIT; }
    if(mode == END_IP) { *result = closure->_function->_ninstructions; return SQ_JIT_NATIVE_SIDE_EXIT; }
    if(mode == WRONG_TAG) { *result = true; return SQ_JIT_NATIVE_SIDE_EXIT; }
    SQArray *a = _array(stack[1]);
    a->_values[0] = _integer(a->_values[0]) + 1;
    stack[2] = _integer(stack[2]) + 3;
    if(nested_vm) {
        SQVM *child = nested_vm;
        nested_vm = NULL;
        SQJitContext &ctx = sqjit_context(closure->_function->_sharedstate);
        SQVM *outer = ctx.active_vm;
        nested_ok = run(child, _SC("if(resume_work(shared_array,4)!=14) throw \"nested resume\";")) &&
            ctx.active_vm == outer;
    }
    *result = resume_ip;
    return SQ_JIT_NATIVE_SIDE_EXIT;
}

static bool call(SQVM *v, const SQObjectPtr &closure, const SQObjectPtr &a, SQInteger x, SQInteger &value)
{
    SQInteger top = sq_gettop(v);
    sq_pushobject(v, closure); sq_pushroottable(v); sq_pushobject(v, a); sq_pushinteger(v, x);
    bool ok = SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQFalse));
    if(ok) ok = SQ_SUCCEEDED(sq_getinteger(v, -1, &value));
    sq_settop(v, top);
    return ok;
}
static void debug_hook(HSQUIRRELVM, SQInteger, const SQChar *, SQInteger, const SQChar *) {}

struct ReleaseWitness { SQObjectPtr *record; int *count; };
static SQInteger release_witness(SQUserPointer pointer, SQInteger)
{
    ReleaseWitness *witness = (ReleaseWitness *)pointer;
    ++*witness->count;
    SQTable *record = _table(*witness->record);
    SQObjectPtr *seen = record->GetRawSlot(SQObjectPtr(SQString::Create(record->_sharedstate, _SC("seen"))));
    *seen = _integer(*seen) + 1;
    return 0;
}

static SQInteger set_result_release(SQUserPointer pointer, SQInteger size)
{
    ReleaseWitness *witness = (ReleaseWitness *)pointer;
    SQTable *record = _table(*witness->record);
    SQObjectPtr current;
    record->Get(SQObjectPtr(SQString::Create(record->_sharedstate,_SC("current"))),current);
    // The callback from the second drop must see the completed heap write.
    if(sq_type(current) != OT_INTEGER || _integer(current) != 5) *witness->count = -100;
    return release_witness(pointer,size);
}

static int generated_exits()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
    ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
    CHECK(run(v, _SC(
        "function precise_div(a,x,y) { a[0]=a[0]+1; return x/y; }\n"
        "function precise_mod(a,x,y) { a[0]=a[0]+1; return x%y; }\n"
        "function precise_math(a,x,y) { a[0]=a[0]+1; return x*y+x-y; }\n"
        "function native_resume(a,x) { a[0]=a[0]+1; local y=a[1]+x; a[2]=y; return y; }\n"
        "function temp_loop(value,record,n) { record.count=record.count+1; value=record.payload; while(n<2) n++; return record.seen; }\n"
        "function combined_set(value,record,replacement) { record.count=record.count+1; value=(record.current=replacement); return record.seen; }\n"
        "function double_drop(x,y,record) { record.count=record.count+1; x=\"left\"; y=\"right\"; return record.seen; }\n"
        "function temp_release(value,record,n) { record.count=record.count+1; value=record.payload; if(n<2) return record.seen; return record.seen+1; }\n"
        "witness_record <- {count=0,payload=5,seen=0,current=0};\n"
        "local a=[0,10,0]; if(native_resume(a,2)!=12 || a[0]!=1 || a[2]!=12) throw \"native warmup\";\n"
        "if(temp_release(0,witness_record,1)!=0 || temp_loop(0,witness_record,1)!=0 || double_drop(0,0,witness_record)!=0) throw \"temporary warmup\";\n")), "warm the generated side-exit compiler");
    CHECK(run(v, _SC(
        "local a=[0];\n"
        "foreach(x in [-9223372036854775807-1,-1001,-1,0,1,1001,9223372036854775807]) {\n"
        " local c=a[0]; if(precise_div(a,x,7)!=x/7 || a[0]!=c+1) throw \"signed division\";\n"
        " c=a[0]; if(precise_mod(a,x,-1)!=0 || a[0]!=c+1) throw \"negative-one remainder\"; }\n"
        "if(precise_div(a,-1001,-7)!=143 || precise_math(a,-3,7)!=-31 || precise_math(a,-3.5,2)!=-12.5 || precise_math(a,2,0.5)!=2.5) throw \"integer and mixed float operands\";\n"
        "local c=a[0],caught=false; try { precise_div(a,7,0); } catch(e) { caught=true; }\n"
        "if(!caught || a[0]!=c+1) throw \"division error continuation\";\n")), "scalar fast paths and typed helper fallbacks preserve values and committed effects");
    for(const SQChar *name : {_SC("precise_div"),_SC("precise_mod"),_SC("precise_math")}) {
        SQObjectPtr target = named(v,name);
        SQFunctionProto *p = _closure(target)->_function;
        SQJitObservation route = {};
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,route) && route.frame.successes > 0,
            "arithmetic witnesses execute the generated canonical-slot tier");
    }
    SQObjectPtr closure = named(v, _SC("native_resume"));
    SQFunctionProto *proto = sq_type(closure) == OT_CLOSURE ? _closure(closure)->_function : NULL;
    SQJitObservation before = {}, after = {};
    CHECK(proto && proto->_jit && proto->_jit->_entry && proto->_jit->_entry->_requires_vm_frame &&
        proto->_jit->_entry->_code.MappedSize() > 0 && sqjit_observe_proto(proto, before) &&
        before.frame.successes > 0 && before.frame.side_exits == 0,
        "effectful function executes generated code with no warmup exit");
    CHECK(run(v, _SC("local a=[0,\"x\",0]; if(native_resume(a,2)!=\"x2\" || a[0]!=1 || a[2]!=\"x2\") throw \"late side exit\";")),
        "generated late type exit preserves the first store and retries only the failed addition");
    CHECK(sqjit_observe_proto(proto, after) && after.frame.side_exits == before.frame.side_exits+1 &&
        after.frame.guard_failures == 0, "late type mismatch takes a real native continuation");
    SQObjectPtr temp_closure = named(v, _SC("temp_release"));
    SQObjectPtr record = named(v, _SC("witness_record"));
    SQFunctionProto *temp_proto = _closure(temp_closure)->_function;
    CHECK(sqjit_observe_proto(temp_proto, before) && before.frame.successes > 0 &&
        before.frame.side_exits == 0 && temp_proto->_jit->_entry->_requires_vm_frame,
        "temporary-release witness warms through generated code");
    CHECK(run(v, _SC("witness_record.count=0;")), "reset release witness count");
    int releases = 0;
    SQInteger top = sq_gettop(v), result = -1;
    sq_pushobject(v, temp_closure); sq_pushroottable(v);
    ReleaseWitness *witness = (ReleaseWitness *)sq_newuserdata(v, sizeof(ReleaseWitness));
    witness->record = &record; witness->count = &releases;
    sq_setreleasehook(v, -1, release_witness);
    sq_pushobject(v, record); sq_pushinteger(v, 1);
    CHECK(SQ_SUCCEEDED(sq_call(v, 4, SQTrue, SQFalse)) &&
        SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) && result == 1 && releases == 1,
        "JCMP releases the previous GET temporary before the next member read");
    sq_settop(v, top);
    SQObjectPtr count;
    _table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))), count);
    CHECK(_integer(count) == 1 && sqjit_observe_proto(temp_proto, after) &&
        after.frame.side_exits == before.frame.side_exits+1,
        "observable temporary release exits once without replaying the earlier member store");
    SQObjectPtr loop_closure = named(v, _SC("temp_loop"));
    SQFunctionProto *loop_proto = _closure(loop_closure)->_function;
    CHECK(sqjit_observe_proto(loop_proto,before) && before.frame.successes > 0 &&
        before.frame.side_exits == 0 && loop_proto->_jit->_entry->_requires_vm_frame,
        "loop temporary-release witness warms through generated code");
    CHECK(run(v, _SC("witness_record.count=0; witness_record.seen=0;")), "reset loop witness");
    releases = 0;
    sq_pushobject(v, loop_closure); sq_pushroottable(v);
    witness = (ReleaseWitness *)sq_newuserdata(v, sizeof(ReleaseWitness));
    witness->record = &record; witness->count = &releases;
    sq_setreleasehook(v, -1, release_witness);
    sq_pushobject(v,record); sq_pushinteger(v,1);
    CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
        result == 1 && releases == 1, "loop side exit executes the failing comparison's temporary release");
    sq_settop(v,top);
    _table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))), count);
    CHECK(_integer(count) == 1 && sqjit_observe_proto(loop_proto,after) &&
        after.frame.side_exits == before.frame.side_exits+1,
        "loop continuation preserves its earlier store");
    loop_closure.Null();
    SQObjectPtr double_closure = named(v, _SC("double_drop"));
    SQFunctionProto *double_proto = _closure(double_closure)->_function;
    bool has_dload = false;
    for(SQInteger ip=0; ip<double_proto->_ninstructions; ++ip)
        has_dload = has_dload || double_proto->_instructions[ip].op == _OP_DLOAD;
    CHECK(has_dload && sqjit_observe_proto(double_proto, before) && before.frame.successes > 0 &&
        before.frame.side_exits == 0 && double_proto->_jit->_entry->_requires_vm_frame,
        "two-owner release witness uses generated DLOAD");
    CHECK(run(v, _SC("witness_record.count=0; witness_record.seen=0;")), "reset two-owner witness");
    releases = 0;
    sq_pushobject(v, double_closure); sq_pushroottable(v);
    witness = (ReleaseWitness *)sq_newuserdata(v, sizeof(ReleaseWitness));
    witness->record = &record; witness->count = &releases;
    sq_setreleasehook(v, -1, release_witness);
    sq_push(v, -1); sq_pushobject(v, record);
    CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
        result == 1 && releases == 1, "atomic two-slot guard accounts for both discarded aliases");
    sq_settop(v, top);
    _table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))), count);
    CHECK(_integer(count) == 1 && sqjit_observe_proto(double_proto, after) &&
        after.frame.side_exits == before.frame.side_exits+1,
        "DLOAD alias release exits before either write and keeps the earlier member store");
    SQObjectPtr combined_closure = named(v,_SC("combined_set"));
    SQFunctionProto *combined_proto = _closure(combined_closure)->_function;
    bool assigns_parameter = false;
    CHECK(!combined_proto->_jit || !combined_proto->_jit->_entry,
        "combined SET bytecode fixture is not compiled before construction");
    for(SQInteger ip=0;ip+1<combined_proto->_ninstructions;++ip) {
        SQInstruction &inst = combined_proto->_instructions[ip];
        SQInstruction &next = combined_proto->_instructions[ip+1];
        if(inst.op == _OP_SET && next.op == _OP_MOVE && next._arg0 == 1 && next._arg1 == inst._arg0) {
            // Exercise the valid fused bytecode shape even if the source
            // optimizer emits SET-to-scratch followed by MOVE-to-parameter.
            // Preserve both resulting slots by copying back after the SET.
            next._arg0 = inst._arg0; next._arg1 = 1; inst._arg0 = 1;
            assigns_parameter = true;
        }
    }
    CHECK(run(v,_SC("witness_record.count=0; witness_record.seen=0; if(combined_set(0,witness_record,5)!=0) throw \"combined SET warmup\";")),
        "warm combined SET bytecode through the normal VM entry");
    CHECK(assigns_parameter && sqjit_observe_proto(combined_proto,before) &&
        before.frame.successes > 0 && before.frame.side_exits == 0 &&
        combined_proto->_jit->_entry->_requires_vm_frame,
        "combined-drop witness executes a native SET into an owning parameter slot");
    for(int shape : {0,1,2}) {
        CHECK(run(v,_SC("witness_record.count=0; witness_record.seen=0;")), "reset combined SET witness");
        sqjit_observe_proto(combined_proto,before);
        releases = 0;
        sq_pushobject(v,combined_closure); sq_pushroottable(v);
        witness = (ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
        witness->record = &record; witness->count = &releases;
        sq_setreleasehook(v,-1,set_result_release);
        if(shape == 1) {
            sq_newarray(v,0); sq_push(v,-2); sq_arrayappend(v,-2); sq_remove(v,-2);
        }
        else if(shape == 2) {
            sq_newtable(v); sq_pushstring(v,_SC("child"),-1); sq_push(v,-3);
            sq_newslot(v,-3,SQFalse); sq_remove(v,-2);
        }
        HSQOBJECT owner; sq_getstackobj(v,-1,&owner);
        _table(record)->Set(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("current"))),SQObjectPtr(owner));
        sq_pushobject(v,record); sq_pushinteger(v,5);
        CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
            result == 1 && releases == 1, "combined SET drops direct and wrapped owners at the interpreter's point");
        sq_settop(v,top);
        _table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),count);
        CHECK(_integer(count) == 1 && sqjit_observe_proto(combined_proto,after) &&
            after.frame.side_exits == before.frame.side_exits+1,
            "combined SET exits before either drop and preserves the committed prefix exactly once");
    }
    CHECK(run(v,_SC("witness_record.count=0; witness_record.seen=0;")), "reset ancestor-pin SET witness");
    sqjit_observe_proto(combined_proto,before);
    releases = 0;
    sq_pushobject(v,combined_closure); sq_pushroottable(v);
    witness = (ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
    witness->record = &record; witness->count = &releases;
    sq_setreleasehook(v,-1,set_result_release);
    _table(record)->Set(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("current"))),v->GetUp(-1));
    {
        SQJitWriteLog parent(1000,sq_vm_malloc,&ctx);
        CHECK(parent.RetainValue(v->GetUp(-1)), "parent pins the generated SET owner");
        {
            SQObjectPtr saved = v->GetUp(-1);
            SQJitWriteLog ancestor(1000,sq_vm_malloc,&ctx);
            CHECK(ancestor.RecordStackSlot(&saved), "another ancestor snapshots the same owner");
            saved.Null();
            sq_pushobject(v,record); sq_pushinteger(v,5);
            CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
                result == 0 && releases == 0 && ctx.active_logs == &ancestor,
                "precise return preserves both ancestors and their deferred release");
            sq_settop(v,top);
            _table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),count);
            CHECK(_integer(count) == 1 && sqjit_observe_proto(combined_proto,after) &&
                after.frame.side_exits == before.frame.side_exits+1,
                "two journal pins cannot conceal a combined final drop in generated code");
        }
        CHECK(releases == 0 && ctx.active_logs == &parent,
            "releasing one ancestor leaves the outer journal's pin intact");
    }
    CHECK(releases == 1 && !ctx.active_logs,
        "final ancestor release sees the completed store exactly once");
    combined_closure.Null();
    closure.Null(); temp_closure.Null(); double_closure.Null(); record.Null(); count.Null();
    sq_close(v);
#endif
    return failures;
}

static int generated_caches()
{
    int failures = 0;
#if defined(SQJIT_CPU_AARCH64)
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
    sqjit_observe_enable(v);
    CHECK(run(v, _SC(
        "function cached_keys(objects,keys,n) { local sum=0; for(local i=0;i<n;i++) {"
        " local o=objects[i%4],key=keys[i%2]; local x=o[key]; o[key]=x+1; sum=sum+o[key]; } return sum; }\n"
        "function cached_fields(objects,n) { local sum=0; for(local i=0;i<n;i++) {"
        " local o=objects[i%3]; sum=sum+o.value; o.value=o.value+1; sum=sum+o.value; } return sum; }\n"
        "function cached_weak(record,next) { local first=record.target[0]; record.target=next;"
        " local second=record.target[0]; record.marker=1; return first*100+second; }\n"
        "cache_a <- {}; cache_b <- {}; cache_a[false] <- 3; cache_a[0] <- 11;"
        " cache_b[false] <- 17; cache_b[0] <- 23;\n"
        "if(cached_keys([cache_a,cache_a,cache_b,cache_b],[false,0],8)!=120) throw \"key tag/owner cache\";\n"
        "class CacheOne { value=11; } class CacheTwo { padding=99; value=17; }\n"
        "if(cached_fields([{value=3},CacheOne(),CacheTwo()],6)!=136) throw \"field value reload\";\n"
        "cache_left <- [7]; cache_right <- [13]; cache_record <- {target=cache_left.weakref(),marker=0};\n"
        "if(cached_weak(cache_record,cache_right.weakref())!=713 || cache_record.marker!=1) throw \"weak cached slot\";\n"
    )), "generated member caches preserve key tags, polymorphic receivers, current values and weak reads");
    for(const SQChar *name : {_SC("cached_keys"),_SC("cached_fields"),_SC("cached_weak")}) {
        SQObjectPtr c = named(v,name);
        SQFunctionProto *p = sq_type(c) == OT_CLOSURE ? _closure(c)->_function : NULL;
        SQJitObservation route = {};
        CHECK(p && p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,route) && route.frame.successes > 0 && route.frame.side_exits == 0,
            "cache witnesses execute generated code without interpreter exits");
    }
    SQObjectPtr c = named(v,_SC("cached_keys"));
    SQJitObservation before = {}, after = {};
    if(sq_type(c) == OT_CLOSURE) sqjit_observe_proto(_closure(c)->_function,before);
    CHECK(run(v, _SC(
        "for(local j=1;j<200;j++) { cache_a[j] <- j; cache_b[j] <- -j; }\n"
        "for(local j=1;j<150;j++) { delete cache_a[j]; delete cache_b[j]; }\n"
        "cache_a[false]=3; cache_a[0]=11; cache_b[false]=17; cache_b[0]=23;\n"
        "if(cached_keys([cache_a,cache_a,cache_b,cache_b],[false,0],8)!=120) throw \"rehash between frames\";\n"
        "cache_array_a <- [3]; cache_array_b <- [17];\n"
        "if(cached_keys([cache_array_a,cache_array_a,cache_array_b,cache_array_b],[0,0],8)!=100) throw \"array cache\";\n"
        "for(local j=0;j<300;j++) { cache_array_a.append(j); cache_array_b.append(j); }\n"
        "cache_array_a[0]=3; cache_array_b[0]=17; cache_a[0]=11; cache_b[0]=23;\n"
        "if(cached_keys([cache_array_a,cache_a,cache_array_b,cache_b],[0,0],8)!=120) throw \"resize/mixed owners\";\n"
    )), "caches restart after table rehash and array resize between calls");
    CHECK(sq_type(c) == OT_CLOSURE && sqjit_observe_proto(_closure(c)->_function,after) &&
        after.frame.successes == before.frame.successes+3 && after.frame.side_exits == before.frame.side_exits,
        "rebound and structurally changed receivers retain native coverage");
    c.Null();
    CHECK(run(v, _SC(
        "function cached_branch(o,n) { local key=\"left\",sum=0; for(local i=0;i<n;i++) {"
        " if((i%2)<1) key=\"left\"; else key=\"right\";"
        " local x=o[key]; o[key]=x+1; sum=sum+o[key]; } return sum; }\n"
        "function cached_copy(o) { local key=\"left\",copy=key; local x=o[copy];"
        " o[copy]=x+1; return o.left+o.right; }\n"
        "function cached_double(ignored,key,o) { ignored=\"left\"; key=\"right\";"
        " local x=o[key]; o[key]=x+1; return o.left+o[key]; }\n"
        "cache_branch_record <- {left=3,right=11}; cache_collision_record <- {value=3};\n"
        "if(cached_branch(cache_branch_record,6)!=54) throw \"branch key joins\";\n"
        "cache_branch_record.left=3; cache_branch_record.right=11;\n"
        "if(cached_copy(cache_branch_record)!=15) throw \"copied literal key\";\n"
    )), "constant-key sharing respects branch joins and copied definitions");
    for(const SQChar *name : {_SC("cached_branch"),_SC("cached_copy")}) {
        c = named(v,name);
        CHECK(sq_type(c) == OT_CLOSURE && sqjit_observe_proto(_closure(c)->_function,after) &&
            after.frame.successes > 0 && after.frame.side_exits == 0 &&
            _closure(c)->_function->_jit->_entry->_requires_vm_frame,
            "literal and branch-key witnesses retain native coverage");
    }
    c = named(v,_SC("cached_double"));
    bool fused = false;
    if(sq_type(c) == OT_CLOSURE) {
        SQFunctionProto *p = _closure(c)->_function;
        CHECK(!p->_jit || !p->_jit->_entry, "construct the DLOAD fixture before native compilation");
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i = p->_instructions[ip];
            if(i.op == _OP_DLOAD) {
                // Valid bytecode with both destinations equal: the second
                // literal wins. The unused first parameter remains scalar.
                i._arg0 = i._arg2; fused = true; break;
            }
        }
    }
    CHECK(fused, "literal-key fixture exercises DLOAD's second-write precedence");
    CHECK(run(v,_SC("cache_branch_record.left=3; cache_branch_record.right=11;"
        "if(cached_double(0,0,cache_branch_record)!=15) throw \"DLOAD key provenance\";")),
        "the surviving DLOAD literal determines cache identity");
    CHECK(sq_type(c) == OT_CLOSURE && sqjit_observe_proto(_closure(c)->_function,after) &&
        after.frame.successes > 0 && after.frame.side_exits == 0 &&
        _closure(c)->_function->_jit->_entry->_requires_vm_frame,
        "DLOAD key provenance executes natively");
    c = named(v,_SC("cached_fields"));
    sqjit_observe_proto(_closure(c)->_function,before);
    SQObjectPtr collision = named(v,_SC("cache_collision_record"));
    _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("cache_collision_bits"))),
        SQObjectPtr((SQInteger)_rawval(collision)));
    CHECK(run(v,_SC("local caught=false; try {"
        "cached_fields([cache_collision_record,cache_collision_bits,cache_collision_record],2);"
        "} catch(e) { caught=true; }"
        "if(!caught || cache_collision_record.value!=4) throw \"receiver tag collision\";")),
        "an integer matching a cached owner's pointer bits cannot use its slot");
    CHECK(sqjit_observe_proto(_closure(c)->_function,after) &&
        after.frame.side_exits == before.frame.side_exits+1,
        "receiver-tag collision side-exits after exactly one committed prefix");
    collision.Null(); c.Null();
    // More distinct member sites than the bounded activation cache: the tail
    // must keep the ordinary checked lookup without exceeding native storage.
    std::basic_string<SQChar> body = _SC("function cached_many(o) { o.count=o.count+1; local sum=0;");
    std::basic_string<SQChar> fields = _SC("cache_many_record <- {count=0};");
    for(int n=0;n<70;++n) {
        std::basic_string<SQChar> digits;
        if(n>=10) digits += SQChar('0'+n/10);
        digits += SQChar('0'+n%10);
        body += _SC("sum=sum+o.f"); body += digits; body += _SC(";");
        fields += _SC("cache_many_record.f"); fields += digits;
        fields += _SC("<-"); fields += digits; fields += _SC(";");
    }
    body += _SC("return sum; }"); body += fields;
    body += _SC("if(cached_many(cache_many_record)!=2415 || cache_many_record.count!=1) throw \"bounded member caches\";");
    CHECK(run(v,body.c_str()), "bounded cache storage leaves excess member sites correct");
    c = named(v,_SC("cached_many"));
    CHECK(sq_type(c) == OT_CLOSURE && _closure(c)->_function->_jit &&
        _closure(c)->_function->_jit->_entry && _closure(c)->_function->_jit->_entry->_requires_vm_frame &&
        sqjit_observe_proto(_closure(c)->_function,after) && after.frame.successes > 0 &&
        after.frame.side_exits == 0, "more than 64 member sites still execute native code");
    c.Null(); sq_close(v);
#endif
    return failures;
}

int main()
{
    int failures = generated_exits() + generated_caches();
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = true; ctx.threshold = 1000000;
    ctx.trace = ctx.trace_stats = false;
    sqjit_observe_enable(v);
    CHECK(run(v, _SC("shared_array <- [0];\n"
        "function resume_work(a,x) { a[0]=a[0]+1; x=x+3; return x*2; }\n"
        "function caller(a,x) { local r=resume_work(a,x); return r+1; }\n"
        "function tail(a,x) { return resume_work(a,x); }\n")), "define continuation fixtures");
    SQObjectPtr closure = named(v, _SC("resume_work"));
    SQObjectPtr a = named(v, _SC("shared_array"));
    if(sq_type(closure) != OT_CLOSURE || sq_type(a) != OT_ARRAY) {
        closure.Null(); a.Null(); sq_close(v); return 1;
    }
    SQFunctionProto *proto = _closure(closure)->_function;
    for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_LOADINT && inst._arg1 == 2) resume_ip = ip;
    }
    CHECK(resume_ip > 0, "continuation starts before the final multiply's constant load");
    if(resume_ip <= 0) { closure.Null(); a.Null(); sq_close(v); return 1; }
    proto->_jit = new (sq_vm_malloc(sizeof(SQJitProto))) SQJitProto;
    SQJitNative *native = new (sq_vm_malloc(sizeof(SQJitNative))) SQJitNative;
    proto->_jit->_entry = native;
    native->_ninstructions = proto->_ninstructions;
    native->_requires_vm_frame = true;
    native->_code.SetStub((void *)exit_entry);

    SQInteger value = -1;
    CHECK(call(v, closure, a, 4, value) && value == 14 && _integer(_array(a)->_values[0]) == 1,
        "root side exit keeps the committed store and published scalar exactly once");
    CHECK(run(v, _SC("if(caller(shared_array,5)!=17 || shared_array[0]!=2) throw \"caller continuation\";")),
        "ordinary call resumes its callee and then returns to the caller");
    CHECK(run(v, _SC("if(tail(shared_array,6)!=18 || shared_array[0]!=3) throw \"tail continuation\";")),
        "tail call resumes its real callee frame");
    CHECK(entered == 3, "frameless attempts never enter code requiring a VM frame");
    SQJitObservation observation = {};
    CHECK(sqjit_observe_proto(proto, observation) && observation.frame.side_exits == 3 &&
        observation.frame.successes == 0 && observation.frame.guard_failures == 0 &&
        observation.direct.attempts > 0 && observation.direct.successes == 0,
        "side exits are observed separately from native returns and rollback failures");

    {
        SQObjectPtr owner = SQTable::Create(v->_sharedstate,0), alias = owner;
        SQJitWriteLog log;
        CHECK(log.CanRelease(owner) && !log.CanRelease(owner,2), "two real owners permit one drop, not two");
        CHECK(log.RetainValue(owner) && log.CanRelease(owner) && !log.CanRelease(owner,2),
            "journal pins do not make a two-owner drop safe");
        SQObjectPtr extra = owner;
        CHECK(log.CanRelease(owner,2), "a surviving real alias permits two drops");
    }
    SQObjectPtr raw[MAX_FUNC_STACKSIZE], out;
    raw[0] = v->_roottable; raw[1] = a; raw[2] = SQInteger(4);
    CHECK(!sqjit_try_execute_closure(v, _closure(closure), raw, 3, out) && entered == 3,
        "caller-provided raw storage does not supply the required callee frame");

    SQVM *thread = sq_newthread(v, 64);
    SQObjectPtr thread_owner = v->GetUp(-1);
    sq_pop(v, 1);
    nested_vm = thread;
    CHECK(call(v, closure, a, 4, value) && value == 14 && nested_ok && entered == 5 &&
        _integer(_array(a)->_values[0]) == 5 && !ctx.active_vm && !ctx.active_logs,
        "nested VM side exits restore the active VM and preserve both frames' writes");

    const int before_debug = entered;
    sq_setnativedebughook(v, debug_hook);
    CHECK(call(v, closure, a, 7, value) && value == 20 && entered == before_debug &&
        _integer(_array(a)->_values[0]) == 6, "debugger bypass still executes the original bytecode");
    sq_setnativedebughook(v, NULL);

    mode = ENTRY_GUARD;
    CHECK(call(v, closure, a, 4, value) && value == 14 && _integer(_array(a)->_values[0]) == 7,
        "ordinary entry guard still replays the unchanged entry state");
    CHECK(sqjit_observe_proto(proto, observation) && observation.frame.side_exits == 5 &&
        observation.frame.guard_failures == 1, "entry guard and side-exit counts stay distinct");
    for(ExitMode invalid : {NEGATIVE_IP, END_IP, WRONG_TAG}) {
        mode = invalid;
        CHECK(!call(v, closure, a, 4, value) && _integer(_array(a)->_values[0]) == 7,
            "invalid resume positions or tags raise an error without entry replay");
        const SQChar *error = NULL;
        sq_getlasterror(v);
        CHECK(SQ_SUCCEEDED(sq_getstring(v,-1,&error)) && !scstrcmp(error,_SC("invalid native side exit")),
            "invalid continuation has an explicit execution error");
        sq_pop(v,1);
    }
    mode = COMMIT; native->_requires_vm_frame = false;
    CHECK(!call(v, closure, a, 4, value) && _integer(_array(a)->_values[0]) == 8,
        "unflagged side exit is an error and does not replay its committed effect");
    native->_requires_vm_frame = true; native->_scalarized = true;
    CHECK(!call(v, closure, a, 4, value) && _integer(_array(a)->_values[0]) == 9,
        "lowered virtual-register artifacts cannot resume source bytecode");
    native->_scalarized = false;
    thread_owner.Null(); closure.Null(); a.Null(); raw[0].Null(); raw[1].Null();
    sq_close(v);
    if(!failures) puts("[OK] frame side-exit dispatch, committed state, reentry and invalid exits");
    return failures ? 1 : 0;
}
