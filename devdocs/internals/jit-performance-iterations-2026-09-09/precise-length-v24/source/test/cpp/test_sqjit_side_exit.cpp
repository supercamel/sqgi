#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqmemberslot.h"
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
#include <vector>
#include <cmath>
#include <limits>
#include <cstring>

#define CHECK(c, text) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", text); ++failures; } } while(0)

static int native_test_groups = 0;

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

static bool native_word(SQFunctionProto *proto, unsigned word)
{
    if(!proto->_jit || !proto->_jit->_entry) return false;
    const SQJitCode &code = proto->_jit->_entry->_code;
    const unsigned char *bytes = (const unsigned char *)code.Entry();
    for(SQInteger n=0;n+4<=code.MappedSize();n+=4) {
        unsigned actual; memcpy(&actual,bytes+n,4);
        if(actual == word) return true;
    }
    return false;
}

static int generated_scalars()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
    ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function scalar_add(box,x,y) { box[0]=box[0]+1; return x+y; }\n"
        "function scalar_sub(box,x,y) { box[0]=box[0]+1; return x-y; }\n"
        "function scalar_mul(box,x,y) { box[0]=box[0]+1; return x*y; }\n"
        "function scalar_div(box,x,y) { box[0]=box[0]+1; return x/y; }\n"
        "function scalar_get(box,items,key) { box[0]=box[0]+1; return items[key]; }\n"
        "function scalar_getk(box,items,key) { box[0]=box[0]+1; return items.value; }\n"
        "function scalar_temp_get(value,record,items,n) { record.count=record.count+1; value=items[0]; local next=items[1]; return next+record.seen*100; }\n"
        "function scalar_alias(box,items,key) { box[0]=box[0]+1; items=items[key]; return items; }\n"
        "function scalar_temp(value,record,items,n) { record.count=record.count+1; value=items[0]; if(n<2) return record.seen; return record.seen+1; }\n"
        "scalar_record <- {count=0,seen=0};\n")),"define native scalar fixtures");
    SQObjectPtr box = SQArray::Create(v->_sharedstate,1);
    auto invoke = [&](const SQObjectPtr &fn,const SQObjectPtr &x,const SQObjectPtr &y,SQObjectPtr &out) -> bool {
        _array(box)->_values[0] = SQInteger(0);
        SQInteger top = sq_gettop(v);
        sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,box);sq_pushobject(v,x);sq_pushobject(v,y);
        bool ok = SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse));
        out = ok ? v->GetUp(-1) : v->_lasterror;
        sq_settop(v,top);
        CHECK(sq_type(_array(box)->_values[0]) == OT_INTEGER && _integer(_array(box)->_values[0]) == 1,
            "scalar success or exit commits its prefix exactly once");
        return ok;
    };
    auto equal = [](const SQObjectPtr &a,const SQObjectPtr &b) -> bool {
        if(sq_type(a) != sq_type(b)) return false;
        if(sq_type(a) == OT_FLOAT && std::isnan(_float(a)) && std::isnan(_float(b))) return true;
        if(sq_type(a) == OT_STRING) return !scstrcmp(_stringval(a),_stringval(b));
        return _rawval(a) == _rawval(b);
    };
    const SQFloat inf = std::numeric_limits<SQFloat>::infinity();
    const SQFloat nan = std::numeric_limits<SQFloat>::quiet_NaN();
    const SQFloat tiny = std::numeric_limits<SQFloat>::denorm_min();
    const SQFloat huge = std::numeric_limits<SQFloat>::max();
    std::vector<std::pair<SQObjectPtr,SQObjectPtr> > pairs = {
        {SQObjectPtr(SQFloat(1.5)),SQObjectPtr(SQFloat(2.0))},
        {SQObjectPtr(SQFloat(-3.5)),SQObjectPtr(SQInteger(2))},
        {SQObjectPtr(SQInteger(-7)),SQObjectPtr(SQFloat(0.5))},
        {SQObjectPtr(SQFloat(0.0)),SQObjectPtr(SQFloat(-0.0))},
        {SQObjectPtr(SQFloat(-0.0)),SQObjectPtr(SQFloat(-2.0))},
        {SQObjectPtr(SQFloat(1.0)),SQObjectPtr(SQFloat(-0.0))},
        {SQObjectPtr(tiny),SQObjectPtr(SQFloat(2.0))},
        {SQObjectPtr(huge),SQObjectPtr(SQFloat(2.0))},
        {SQObjectPtr(inf),SQObjectPtr(-inf)},
        {SQObjectPtr(nan),SQObjectPtr(SQInteger(3))},
        {SQObjectPtr(std::numeric_limits<SQInteger>::min()),SQObjectPtr(SQFloat(1.25))},
        {SQObjectPtr(std::numeric_limits<SQInteger>::max()),SQObjectPtr(SQFloat(-1.25))},
        {SQObjectPtr(SQInteger(-1001)),SQObjectPtr(SQInteger(7))},
        {SQObjectPtr(SQInteger(7)),SQObjectPtr(SQInteger(0))},
        {SQObjectPtr(SQInteger(-37)),SQObjectPtr(SQInteger(-1))},
        {SQObjectPtr(false),SQObjectPtr(SQFloat(2.0))},
        {SQObjectPtr(SQString::Create(v->_sharedstate,_SC("x"))),SQObjectPtr(SQFloat(2.0))}
    };
    unsigned words[] = {0x1e612800u,0x1e613800u,0x1e610800u,0x1e611800u};
    unsigned op = 0;
    for(const SQChar *name : {_SC("scalar_add"),_SC("scalar_sub"),_SC("scalar_mul"),_SC("scalar_div")}) {
        SQObjectPtr fn = named(v,name), expected, actual;
        SQFunctionProto *proto = _closure(fn)->_function;
        // The VM return path reuses temp_reg. Its boolean is observed at the
        // RETURN helper entry by the native debugger probe, before that reuse.
        for(const auto &pair : pairs) {
            ctx.enabled = false; bool reference = invoke(fn,pair.first,pair.second,expected);
            ctx.enabled = true; SQJitObservation before = {}, after = {};
            sqjit_observe_proto(proto,before);
            bool native = invoke(fn,pair.first,pair.second,actual);
            CHECK(reference == native && equal(expected,actual),
                "native arithmetic matches interpreter tags, values, signed zero, NaN and errors");
            CHECK(proto->_jit && proto->_jit->_entry && proto->_jit->_entry->_requires_vm_frame &&
                sqjit_observe_proto(proto,after),"scalar arithmetic uses a real precise frame");
            if(sq_isnumeric(pair.first) && sq_isnumeric(pair.second) && reference)
                CHECK(after.frame.successes == before.frame.successes+1 && after.frame.side_exits == before.frame.side_exits,
                    "numeric cases return through native code without a side exit");
            else CHECK(after.frame.side_exits == before.frame.side_exits+1,
                "nonnumeric and integer errors take one precise exit");
        }
        CHECK(native_word(proto,words[op++]),"generated code contains the selected binary64 arithmetic instruction");
    }
    SQObjectPtr items = SQArray::Create(v->_sharedstate,3), weak_owner = SQArray::Create(v->_sharedstate,1);
    _array(items)->_values[0] = SQInteger(17);
    _array(items)->_values[1] = SQFloat(-0.0);
    _array(items)->_values[2] = true;
    std::vector<SQObjectPtr> keys = {SQObjectPtr(SQInteger(0)),SQObjectPtr(SQInteger(1)),SQObjectPtr(SQInteger(2)),
        SQObjectPtr(SQInteger(-1)),SQObjectPtr(SQInteger(3)),SQObjectPtr(std::numeric_limits<SQInteger>::max()),
        SQObjectPtr(SQFloat(0.0)),SQObjectPtr(false),SQObjectPtr(SQString::Create(v->_sharedstate,_SC("0")))};
    for(const SQChar *name : {_SC("scalar_get"),_SC("scalar_alias"),_SC("scalar_getk")}) {
        SQObjectPtr fn = named(v,name), expected, actual;
        SQFunctionProto *proto = _closure(fn)->_function;
        if(!scstrcmp(name,_SC("scalar_getk"))) {
            bool literal = false;
            for(SQInteger n=0;n<proto->_nliterals;++n)
                if(sq_type(proto->_literals[n]) == OT_STRING && !scstrcmp(_stringval(proto->_literals[n]),_SC("value"))) {
                    proto->_literals[n] = SQInteger(0);literal = true;
                }
            CHECK(literal,"GETK fixture uses a literal integer array key before compilation");
        }
        if(!scstrcmp(name,_SC("scalar_alias"))) {
            bool aliases = false;
            for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
                SQInstruction &i = proto->_instructions[ip];
                if(i.op != _OP_GET || i._arg1 != 2) continue;
                if(ip+1<proto->_ninstructions) {
                    SQInstruction &next = proto->_instructions[ip+1];
                    if(next.op == _OP_MOVE && next._arg0 == 2 && next._arg1 == i._arg0) {
                        i._arg0 = 2;next.op = _OP_LINE;
                    }
                }
                aliases = i._arg0 == 2;
            }
            CHECK(aliases,"array GET fixture overwrites its owning receiver directly");
        }
        for(const SQObjectPtr &key : keys) {
            ctx.enabled = false;bool reference = invoke(fn,items,key,expected);
            ctx.enabled = true;bool native = invoke(fn,items,key,actual);
            CHECK(reference == native && equal(expected,actual),"array fast path preserves scalar tags, aliases, bounds and key fallback");
        }
        CHECK(proto->_jit && proto->_jit->_entry && proto->_jit->_entry->_requires_vm_frame,
            "array read and receiver-alias fixtures execute the precise tier");
        // Mutate contents and capacity between activations. The fast read must
        // reload backing storage and leave weak dereference to the helper.
        _array(items)->Append(SQObjectPtr(SQInteger(41)));
        _array(items)->_values[0] = weak_owner;
        ctx.enabled=false;bool reference=invoke(fn,items,SQObjectPtr(SQInteger(0)),expected);
        ctx.enabled=true;bool native=invoke(fn,items,SQObjectPtr(SQInteger(0)),actual);
        CHECK(reference && native && equal(expected,actual),"reference array sources preserve the returned owner");
        _array(items)->_values[0] = _array(weak_owner)->GetWeakRef(OT_ARRAY);
        ctx.enabled=false;reference=invoke(fn,items,SQObjectPtr(SQInteger(0)),expected);
        ctx.enabled=true;native=invoke(fn,items,SQObjectPtr(SQInteger(0)),actual);
        CHECK(reference && native && equal(expected,actual) && sq_type(actual) == OT_ARRAY,
            "weak array elements are dereferenced by the checked helper");
        expected.Null();actual.Null();v->temp_reg.Null();weak_owner.Null();
        ctx.enabled=false;reference=invoke(fn,items,SQObjectPtr(SQInteger(0)),expected);
        ctx.enabled=true;native=invoke(fn,items,SQObjectPtr(SQInteger(0)),actual);
        CHECK(reference && native && sq_type(expected) == OT_NULL && sq_type(actual) == OT_NULL,
            "dead weak array elements still read as null");
        weak_owner = SQArray::Create(v->_sharedstate,1);
        _array(items)->_values[0] = SQInteger(17);
    }
    SQObjectPtr record = named(v,_SC("scalar_record"));
    _array(items)->_values[1] = SQInteger(7);
    for(const SQChar *name : {_SC("scalar_temp"),_SC("scalar_temp_get")}) {
    SQObjectPtr fn = named(v,name);
    SQFunctionProto *proto = _closure(fn)->_function;
    bool aliases = false;
    for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
        SQInstruction &i=proto->_instructions[ip];
        if(i.op != _OP_GET || i._arg1 != 3 || aliases) continue;
        if(ip+1<proto->_ninstructions) {
            SQInstruction &next=proto->_instructions[ip+1];
            if(next.op == _OP_MOVE && next._arg0 == 1 && next._arg1 == i._arg0) {i._arg0=1;next.op=_OP_LINE;}
        }
        aliases = i._arg0 == 1;
    }
    std::basic_string<SQChar> warm = name;
    warm += _SC("(0,scalar_record,[5,7],1);");
    CHECK(aliases && run(v,warm.c_str()),"array temporary fixture overwrites its destination in generated code");
    SQJitObservation before = {}, after = {};sqjit_observe_proto(proto,before);
    CHECK(before.frame.successes > 0 && before.frame.side_exits == 0,"array temporary warmup returns natively");
    CHECK(run(v,_SC("scalar_record.count=0; scalar_record.seen=0;")),"reset array release prefix");
    int releases = 0;SQInteger top=sq_gettop(v),value=-1;
    sq_pushobject(v,fn);sq_pushroottable(v);
    ReleaseWitness *witness=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
    witness->record=&record;witness->count=&releases;sq_setreleasehook(v,-1,release_witness);
    sq_pushobject(v,record);sq_pushobject(v,items);sq_pushinteger(v,1);
    CHECK(SQ_SUCCEEDED(sq_call(v,5,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&value)) &&
        value == (!scstrcmp(name,_SC("scalar_temp")) ? 1 : 107) && releases == 1,
        "array GET transfers ownership and a following GET or JCMP releases it in VM order");
    sq_settop(v,top);
    SQObjectPtr count;_table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),count);
    CHECK(_integer(count) == 1 && sqjit_observe_proto(proto,after) && after.frame.side_exits == before.frame.side_exits+1,
        "array temporary exit preserves exactly one committed prefix");
    v->temp_reg.Null();
    }
    // The same two-GET function may drop a non-final temporary inline. A weak
    // observer witnesses survival/death; ancestor pins must not fake an owner.
    SQObjectPtr fn = named(v,_SC("scalar_temp_get"));
    for(int mode : {0,1,2}) {
        CHECK(run(v,_SC("scalar_record.count=0; scalar_record.seen=0;")),"reset non-final array temporary witness");
        SQFunctionProto *p = _closure(fn)->_function;
        SQJitObservation before = {}, after = {};sqjit_observe_proto(p,before);
        int releases=0;SQInteger top=sq_gettop(v),value=-1;
        SQObjectPtr survivor,weak;
        sq_pushobject(v,fn);sq_pushroottable(v);
        ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
        w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
        SQRefCounted *raw=_refcounted(v->GetUp(-1));
        weak=raw->GetWeakRef(OT_USERDATA);
        if(mode != 2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
        if(mode == 1) raw->_uiRef |= MARK_FLAG;
#endif
        {
            SQJitWriteLog parent(1000,sq_vm_malloc,mode == 2 ? &ctx : NULL);
            SQJitWriteLog ancestor(1000,sq_vm_malloc,mode == 2 ? &ctx : NULL);
            if(mode == 2) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                "two ancestors pin the last program-owned temporary");
            sq_pushobject(v,record);sq_pushobject(v,items);sq_pushinteger(v,1);
            CHECK(SQ_SUCCEEDED(sq_call(v,5,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&value)) &&
                value == 7 && releases == 0 && sq_type(_weakref(weak)->_obj) == OT_USERDATA,
                "surviving owner or ancestor pins preserve the weakly observed temporary");
            sq_settop(v,top);CHECK(sqjit_observe_proto(p,after),"observe non-final temporary route");
            if(mode == 2) CHECK(after.frame.side_exits == before.frame.side_exits+1,
                "ancestor pins force the real final-drop side exit before a native decrement");
            else CHECK(after.frame.successes == before.frame.successes+1 && after.frame.side_exits == before.frame.side_exits,
                "a real surviving owner permits native completion without a side exit");
#ifndef NO_GARBAGE_COLLECTOR
            if(mode == 1) {
                CHECK((raw->_uiRef & MARK_FLAG) && (raw->_uiRef & ~(SQUnsignedInteger)MARK_FLAG) == 1,
                    "native decrement preserves the collector mark and exactly one real owner");
                raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG;
            }
#endif
        }
        survivor.Null();
        CHECK(releases == 1 && sq_type(_weakref(weak)->_obj) == OT_NULL && !ctx.active_logs,
            "final real-owner or journal release causes exactly one callback and weak death");
        SQObjectPtr count;_table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),count);
        CHECK(_integer(count) == 1,"non-final temporary paths retain one committed prefix");
        v->temp_reg.Null();
    }
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_exits()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
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

// Distinct helper exits in one function must retain their own resume IP even
// when generated code shares the result publication and frame restoration.
static int generated_exit_sites()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
    sqjit_observe_enable(v);
    {
    std::basic_string<SQChar> source = _SC("function exit_sites(box,denoms) {");
    for(int n=0;n<8;++n) {
        source += _SC("box[0]=box[0]+1; box[1]=box[1]+100/denoms[");
        source += SQChar('0'+n); source += _SC("]; ");
    }
    source += _SC("return box[1]; } "
        "local box=[0,0]; if(exit_sites(box,[10,10,10,10,10,10,10,10])!=80 || box[0]!=8)"
        " throw \"exit-site warmup\";");
    CHECK(run(v,source.c_str()),"warm a function with eight distinct possible division exits");
    SQObjectPtr closure = named(v,_SC("exit_sites"));
    SQFunctionProto *p = sq_type(closure) == OT_CLOSURE ? _closure(closure)->_function : NULL;
    SQJitObservation before = {}, after = {};
    CHECK(p && p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
        sqjit_observe_proto(p,before) && before.frame.successes == 1 && before.frame.side_exits == 0,
        "all exit-site warmup operations execute on the native route");
    CHECK(run(v,_SC(
        "for(local fail=0;fail<8;fail++) { local box=[0,0],denoms=[10,10,10,10,10,10,10,10];"
        " denoms[fail]=0; local caught=false; try { exit_sites(box,denoms); } catch(e) { caught=true; }"
        " if(!caught || box[0]!=fail+1 || box[1]!=10*fail) throw \"distinct exit IP\"; }")),
        "each failure resumes exactly its division without replaying prior stores or executing later stores");
    CHECK(p && sqjit_observe_proto(p,after) && after.frame.side_exits == before.frame.side_exits+8 &&
        after.frame.guard_failures == before.frame.guard_failures,
        "all eight late failures use precise native continuations");
    }
    sq_close(v);
#endif
    return failures;
}

struct StoreReleaseWitness {
    ReleaseWitness release;
    SQObjectPtr *slot;
    SQObjectType type;
    SQRawObjectVal bits;
};
static SQInteger store_release_witness(SQUserPointer pointer, SQInteger size)
{
    StoreReleaseWitness *w = (StoreReleaseWitness *)pointer;
    if(sq_type(*w->slot) != w->type || _rawval(*w->slot) != w->bits)
        *w->release.count = -100;
    return release_witness(&w->release,size);
}

static int generated_store_release()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function store_value(r,c,key,old,source) { r.count=r.count+1; c[key]=old; old=0;"
        " c[key]=source; r.observed=r.seen; return source; }\n"
        "function store_same_result(r,c,key,old,source) { r.count=r.count+1; c[key]=old; old=0;"
        " c[key]=source; r.observed=r.seen; return source; }\n"
        "store_record <- {count=0,seen=0,observed=0};\n"
        "store_table <- {value=0}; class StoreBox { value=0; } store_instance <- StoreBox();\n")),"define existing-slot store witnesses");
    SQObjectPtr record=named(v,_SC("store_record"));
    auto field=[&](const SQChar *name)->SQObjectPtr & {
        return *_table(record)->GetRawSlot(SQObjectPtr(SQString::Create(v->_sharedstate,name)));
    };
    auto reset=[&]() {
        v->temp_reg.Null();field(_SC("count"))=SQInteger(0);
        field(_SC("seen"))=SQInteger(0);field(_SC("observed"))=SQInteger(-1);
    };
    for(const SQChar *name : {_SC("store_value"),_SC("store_same_result")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;
        int target_stores=0;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];
            if(i.op==_OP_SET && i._arg1==2) {
                ++target_stores;
                CHECK(i._arg0==0xFF,"store fixture starts with no separate result write");
                if(!scstrcmp(name,_SC("store_same_result"))) i._arg0=i._arg3;
            }
        }
        CHECK(target_stores==2,"store fixture primes and overwrites the same target slot");
        for(int container_kind : {0,1,2}) {
            SQObjectPtr container=container_kind==0 ? SQObjectPtr(SQArray::Create(v->_sharedstate,1)) :
                named(v,container_kind==1 ? _SC("store_table") : _SC("store_instance"));
            SQObjectPtr key=container_kind==0 ? SQObjectPtr(SQInteger(0)) :
                SQObjectPtr(SQString::Create(v->_sharedstate,_SC("value")));
            SQObjectPtr *slot=container_kind==0 ? &_array(container)->_values[0] : sq_member_raw_slot(container,key);
            CHECK(slot,"all store targets are existing raw slots");
            if(!slot) continue;
            for(int mode : {0,1,2,3,4}) {
                reset();*slot=SQInteger(0);
                SQInteger top=sq_gettop(v);int old_releases=0,source_releases=0;
                SQObjectPtr source,survivor,out,old_weak,source_weak;
                ReleaseWitness *sw=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
                sw->record=&record;sw->count=&source_releases;sq_setreleasehook(v,-1,release_witness);
                source=v->GetUp(-1);sq_settop(v,top);
                source_weak=_refcounted(source)->GetWeakRef(sq_type(source));
                SQJitObservation before={},after={};sqjit_observe_proto(p,before);
                sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);sq_pushobject(v,container);sq_pushobject(v,key);
                if(mode==3) sq_pushobject(v,source);
                else {
                    StoreReleaseWitness *w=(StoreReleaseWitness *)sq_newuserdata(v,sizeof(StoreReleaseWitness));
                    w->release.record=&record;w->release.count=&old_releases;w->slot=slot;
                    w->type=sq_type(source);w->bits=_rawval(source);sq_setreleasehook(v,-1,store_release_witness);
                }
                SQRefCounted *old_raw=_refcounted(v->GetUp(-1));
                old_weak=old_raw->GetWeakRef(sq_type(v->GetUp(-1)));
                if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2 || mode==3) old_raw->_uiRef |= MARK_FLAG;
#endif
                {
                    SQJitWriteLog parent(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                    SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                    if(mode==4) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                        "two ancestor pins cannot conceal the final heap owner");
                    sq_pushobject(v,source);
                    CHECK(SQ_SUCCEEDED(sq_call(v,6,SQTrue,SQFalse)),"store returns its unmodified source");
                    out=v->GetUp(-1);sq_settop(v,top);v->temp_reg.Null();
                    CHECK(sq_type(*slot)==sq_type(source) && _rawval(*slot)==_rawval(source) &&
                        sq_type(out)==sq_type(source) && _rawval(out)==_rawval(source) &&
                        old_releases==(mode==0 ? 1 : 0) && source_releases==0 &&
                        _integer(field(_SC("count")))==1 && _integer(field(_SC("observed")))==(mode==0 ? 1 : 0),
                        "heap publication precedes release callback and later reads without replay");
                    CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
                        native_word(p,0xf900056cu) && sqjit_observe_proto(p,after),
                        "store witness includes native x12 publication into the resolved heap slot");
                    if(mode==0 || mode==4) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                        "final and ancestor-sensitive heap drops take one precise continuation");
                    else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                        "non-final and self-aliased heap stores finish natively");
#ifndef NO_GARBAGE_COLLECTOR
                    if(mode==2 || mode==3) {
                        CHECK((old_raw->_uiRef & MARK_FLAG) &&
                            (old_raw->_uiRef & ~(SQUnsignedInteger)MARK_FLAG)==(mode==3 ? 3 : 1),
                            "heap alias reload preserves the collector mark and exact count");
                        old_raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG;
                    }
#endif
                    CHECK(_refcounted(source)->_uiRef==3,"only source, heap and returned result own the stored value");
                }
                survivor.Null();
                CHECK(mode==3 || (old_releases==1 && sq_type(_weakref(old_weak)->_obj)==OT_NULL),
                    "old heap owner dies exactly once after its final real or journal owner");
                out.Null();*slot=SQInteger(0);CHECK(_refcounted(source)->_uiRef==1,"store leaves no hidden source pin");
                source.Null();CHECK(source_releases==1 && sq_type(_weakref(source_weak)->_obj)==OT_NULL,
                    "stored source has exact final release and weak death");
                CHECK(!ctx.active_logs,"store leaves the ancestor chain balanced");
            }
            SQObjectPtr target=SQArray::Create(v->_sharedstate,1),weak=_refcounted(target)->GetWeakRef(OT_ARRAY);
            for(int dead : {0,1}) {
                if(dead) target.Null();
                for(int alias : {0,1}) {
                    reset();*slot=SQInteger(0);SQInteger top=sq_gettop(v);
                    SQUnsignedInteger count=_weakref(weak)->_uiRef;SQJitObservation before={},after={};sqjit_observe_proto(p,before);
                    sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);sq_pushobject(v,container);sq_pushobject(v,key);
                    if(alias) sq_pushobject(v,weak);else sq_pushinteger(v,3);
                    sq_pushobject(v,weak);
                    CHECK(SQ_SUCCEEDED(sq_call(v,6,SQTrue,SQFalse)) && sq_type(v->GetUp(-1))==OT_WEAKREF &&
                        _rawval(v->GetUp(-1))==_rawval(weak) && sq_type(*slot)==OT_WEAKREF && _rawval(*slot)==_rawval(weak),
                        "SET stores live and dead weak objects without dereferencing them");
                    sq_settop(v,top);v->temp_reg.Null();
                    CHECK(_weakref(weak)->_uiRef==count+1 && sq_type(_weakref(weak)->_obj)==(dead ? OT_NULL : OT_ARRAY) &&
                        (dead || _refcounted(target)->_uiRef==1),"weak store pins only the weak object once for the heap slot");
                    CHECK(sqjit_observe_proto(p,after) && after.frame.successes==before.frame.successes+1 &&
                        after.frame.side_exits==before.frame.side_exits,"weak stores and aliases complete natively");
                    *slot=SQInteger(0);CHECK(_weakref(weak)->_uiRef==count,"weak store cleanup restores its exact count");
                }
            }
        }
    }
    CHECK(run(v,_SC(
        "function store_switch(r,owners,keys,values,n) { for(local i=0;i<n;i++) {"
        " local c=owners[i%4],key=keys[i%2]; r.count=r.count+1; c[key]=values[i%3]; } return r.count; }\n"
        "store_a <- {}; store_b <- {}; store_a[false]<-3; store_a[0]<-11; store_b[false]<-17; store_b[0]<-23;\n"
        "local x=[1],y=[2],z=[3]; store_record.count=0;"
        "if(store_switch(store_record,[store_a,store_a,store_b,store_b],[false,0],[x,y,z],16)!=16"
        " || store_a[false]!=x || store_a[0]!=y || store_b[false]!=z || store_b[0]!=x) throw \"store key tags\";\n"
        "store_array_a <- [0]; store_array_b <- [0]; store_record.count=0;"
        "if(store_switch(store_record,[store_array_a,store_a,store_array_b,store_b],[0,0],[3,5,7],8)!=8"
        " || store_array_a[0]!=5 || store_a[0]!=7 || store_array_b[0]!=3 || store_b[0]!=5) throw \"store owner kinds\";\n"
        "class StoreOther { padding=0; value=0; } local o={value=0},p=StoreBox(),q={pad=9,value=0},t=StoreOther();"
        " store_record.count=0; if(store_switch(store_record,[o,p,q,t],[\"value\",\"value\"],[3,5,7],8)!=8"
        " || o.value!=5 || p.value!=7 || q.value!=3 || t.value!=5) throw \"store field layouts\";\n")),"native SET handles changing key tags, receiver identities and instance layouts without a preceding target GET");
    SQObjectPtr switch_fn=named(v,_SC("store_switch"));SQFunctionProto *switch_proto=_closure(switch_fn)->_function;
    SQJitObservation switch_before={},switch_after={};
    CHECK(sqjit_observe_proto(switch_proto,switch_before) && switch_before.frame.successes==3 &&
        switch_before.frame.side_exits==0 && switch_proto->_jit->_entry->_requires_vm_frame &&
        native_word(switch_proto,0xf900056cu),"polymorphic store loops execute native heap stores");
    SQObjectPtr table=named(v,_SC("store_a"));
    _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("store_pointer_bits"))),
        SQObjectPtr((SQInteger)_rawval(table)));
    CHECK(run(v,_SC(
        "foreach(bad in [-1,1]) { local a=[0]; store_record.count=0; local caught=false;"
        " try { store_switch(store_record,[a,a,a,a],[0,bad],[11,13,17],4); } catch(e) { caught=true; }"
        " if(!caught || store_record.count!=2 || a[0]!=11) throw \"store array bounds\"; }\n"
        "store_record.count=0; local caught=false; try {"
        " store_switch(store_record,[store_a,store_pointer_bits,store_a,store_a],[0,0],[11,13,17],4);"
        " } catch(e) { caught=true; } if(!caught || store_record.count!=2 || store_a[0]!=11) throw \"store receiver tag\";\n"
        "store_record.count=0; caught=false; try {"
        " store_switch(store_record,[store_table,store_table,store_table,store_table],[\"value\",\"missing\"],[11,13,17],4);"
        " } catch(e) { caught=true; } if(!caught || store_record.count!=2 || store_table.value!=11"
        " || (\"missing\" in store_table)) throw \"store missing key\";\n")),"late SET bounds, receiver-tag and missing-slot failures preserve one committed prefix");
    CHECK(sqjit_observe_proto(switch_proto,switch_after) && switch_after.frame.side_exits==switch_before.frame.side_exits+4 &&
        switch_after.frame.guard_failures==switch_before.frame.guard_failures,
        "all late invalid store operands use exact native continuations");
    }
    sq_close(v);
#endif
    return failures;
}

// These fixtures intentionally construct a valid DLOAD. The frontend emits
// separate LOADs for parameter assignments, so do not depend on peephole fusion.
static bool fixture_double_load(SQFunctionProto *p,SQInteger first,SQInteger second)
{
    for(SQInteger ip=0;ip+1<p->_ninstructions;++ip) {
        SQInstruction &a=p->_instructions[ip],&b=p->_instructions[ip+1];
        if(a.op==_OP_LOAD && a._arg0==first && b.op==_OP_LOAD && b._arg0==second) {
            a.op=_OP_DLOAD;a._arg2=b._arg0;a._arg3=(unsigned char)b._arg1;
            b.op=_OP_LINE;return true;
        }
    }
    return false;
}

static int generated_integer_comparisons()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function compare_g(value,r,items,a,b) { r.count=r.count+1; value=items[0]; if(a>b) return 11; return 22; }\n"
        "function compare_ge(value,r,items,a,b) { r.count=r.count+1; value=items[0]; if(a>=b) return 11; return 22; }\n"
        "function compare_l(value,r,items,a,b) { r.count=r.count+1; value=items[0]; if(a<b) return 11; return 22; }\n"
        "function compare_le(value,r,items,a,b) { r.count=r.count+1; value=items[0]; if(a<=b) return 11; return 22; }\n"
        "compare_record <- {count=0,seen=0};\n")),"define signed comparison and temporary lifetime witnesses");
    SQObjectPtr record=named(v,_SC("compare_record")),items=SQArray::Create(v->_sharedstate,1);
    _array(items)->_values[0]=SQInteger(0);
    auto field=[&](const SQChar *name)->SQObjectPtr & {
        return *_table(record)->GetRawSlot(SQObjectPtr(SQString::Create(v->_sharedstate,name)));
    };
    const SQInteger lo=std::numeric_limits<SQInteger>::min(),hi=std::numeric_limits<SQInteger>::max();
    const SQInteger pairs[][2]={{lo,hi},{hi,lo},{lo,lo},{hi,hi},{-1,0},{0,-1},{0,0},{1,0},{0,1}};
    const SQChar *names[]={_SC("compare_g"),_SC("compare_ge"),_SC("compare_l"),_SC("compare_le")};
    for(int relation=0;relation<4;++relation) {
        SQObjectPtr fn=named(v,names[relation]);SQFunctionProto *p=_closure(fn)->_function;
        bool fused=false;SQInteger comparison_ip=-1;unsigned cond=0;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];
            if(i.op==_OP_GET && i._arg1==3 && i._arg0==1) fused=true;
            if(i.op==_OP_GET && i._arg1==3 && ip+1<p->_ninstructions) {
                SQInstruction &next=p->_instructions[ip+1];
                if(next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
                    i._arg0=1;next.op=_OP_LINE;fused=true;
                }
            }
            if(i.op==_OP_JCMP) {
                comparison_ip=ip;
                switch(i._arg3) { case CMP_G:cond=12;break;case CMP_GE:cond=10;break;
                    case CMP_L:cond=11;break;case CMP_LE:cond=13;break; }
            }
        }
        CHECK(fused && comparison_ip>=0,"comparison witness transfers its owning parameter into the VM temporary");
        auto prepare=[&]() {
            v->temp_reg.Null();field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);
            sq_pushobject(v,fn);sq_pushroottable(v);
        };
        auto finish=[&](const SQObjectPtr &a,const SQObjectPtr &b,SQObjectPtr &out)->bool {
            sq_pushobject(v,record);sq_pushobject(v,items);sq_pushobject(v,a);sq_pushobject(v,b);
            bool ok=SQ_SUCCEEDED(sq_call(v,6,SQTrue,SQFalse));
            out=ok ? v->GetUp(-1) : v->_lasterror;
            CHECK(_integer(field(_SC("count")))==1,"comparison preserves its committed prefix exactly once");
            return ok;
        };
        auto truth=[&](SQInteger a,SQInteger b)->bool {
            return relation==0 ? a>b : relation==1 ? a>=b : relation==2 ? a<b : a<=b;
        };
        // The VM return path reuses temp_reg. Its boolean is observed at the
        // RETURN helper entry by the native debugger probe, before that reuse.
        for(const auto &pair : pairs) {
            SQInteger top=sq_gettop(v);prepare();sq_pushinteger(v,0);SQObjectPtr out;
            CHECK(finish(SQObjectPtr(pair[0]),SQObjectPtr(pair[1]),out) && sq_type(out)==OT_INTEGER &&
                _integer(out)==(truth(pair[0],pair[1]) ? 11 : 22),"native signed comparison handles equality and integer extrema");
            sq_settop(v,top);
        }
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            native_word(p,0x9A9F07E0u | ((cond^1u)<<12) | 12u),
            "comparison contains native signed CSET, not only a helper call");
        for(int mode : {0,1,2,3,4,5}) for(SQInteger a : {SQInteger(-1),SQInteger(1)}) {
            SQInteger top=sq_gettop(v);prepare();int releases=0;
            SQObjectPtr survivor,weak,referent,out;SQRefCounted *raw=NULL;
            if(mode<4) {
                ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
                w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
                raw=_refcounted(v->GetUp(-1));weak=raw->GetWeakRef(OT_USERDATA);
                if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2) raw->_uiRef |= MARK_FLAG;
#endif
            } else {
                referent=SQArray::Create(v->_sharedstate,0);
                weak=_refcounted(referent)->GetWeakRef(OT_ARRAY);
                if(mode==5) referent.Null();
                sq_pushobject(v,weak);raw=_refcounted(weak);
            }
            SQJitObservation before={},after={};sqjit_observe_proto(p,before);
            {
                SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                if(mode==3) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                    "comparison release accounts for both ancestor journals");
                CHECK(finish(SQObjectPtr(a),SQObjectPtr(SQInteger(0)),out) && sq_type(out)==OT_INTEGER &&
                    _integer(out)==(truth(a,0) ? 11 : 22),"comparison retains exact branch result across temporary owners");
                sq_settop(v,top);CHECK(sqjit_observe_proto(p,after),"observe comparison lifetime native route");
                CHECK(after.frame.guard_failures==before.frame.guard_failures,
                    "comparison lifetime cases enter the canonical frame");
                if(mode==0 || mode==3) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                    "final or journal-sensitive comparison temporary exits once");
                else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                    "nonfinal strong and weak temporaries complete native comparison");
                CHECK(releases==(mode==0 ? 1 : 0) && _integer(field(_SC("seen")))==(mode==0 ? 1 : 0),
                    "comparison releases a final temporary before returning and preserves other owners");
                if(mode==1 || mode==2 || mode>=4) {
                    SQUnsignedInteger count=raw->_uiRef;
#ifndef NO_GARBAGE_COLLECTOR
                    if(mode==2) { CHECK(count & MARK_FLAG,"comparison preserves the temporary GC mark");raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG; }
                    count &= ~(SQUnsignedInteger)MARK_FLAG;
#endif
                    CHECK(count==1,"comparison drops exactly its single temporary reference");
                }
                if(mode>=4) CHECK(sq_type(_weakref(weak)->_obj)==(mode==4 ? OT_ARRAY : OT_NULL) &&
                    (mode==5 || _refcounted(referent)->_uiRef==1),"comparison never pins or dereferences a weak temporary's referent");
            }
            survivor.Null();
            if(mode<4) CHECK(releases==1 && sq_type(_weakref(weak)->_obj)==OT_NULL,
                "comparison temporary dies once after its final program or journal owner");
            CHECK(!ctx.active_logs,"comparison restores its ancestor journal chain");
        }
        // Mixed numeric operands keep the helper. Nonnumeric operands side-exit
        // to the interpreter; compare its actual result/error without assuming
        // that every cross-type relation is forbidden by the language.
        for(int kind : {0,1,2,3}) {
            SQObjectPtr a=kind==0 ? SQObjectPtr(SQFloat(-0.5)) : kind==1 ? SQObjectPtr(SQFloat(std::numeric_limits<SQFloat>::quiet_NaN())) :
                kind==2 ? SQObjectPtr(true) : SQObjectPtr(SQString::Create(v->_sharedstate,_SC("text")));
            SQObjectPtr expected,actual;bool expected_ok=false,actual_ok=false;
            for(bool native : {false,true}) {
                ctx.enabled=native;SQInteger top=sq_gettop(v);prepare();sq_pushinteger(v,0);
                SQJitObservation before={},after={};sqjit_observe_proto(p,before);
                bool ok=finish(a,SQObjectPtr(SQInteger(0)),native ? actual : expected);
                if(native) {
                    actual_ok=ok;sqjit_observe_proto(p,after);
                    CHECK(after.frame.guard_failures==before.frame.guard_failures &&
                        after.frame.side_exits==before.frame.side_exits+(kind>=2 ? 1 : 0),
                        "mixed numerics use the helper; nonnumeric comparisons preserve a precise exit");
                } else expected_ok=ok;
                sq_settop(v,top);
            }
            CHECK(expected_ok==actual_ok && sq_type(expected)==sq_type(actual) &&
                (expected_ok ? _rawval(expected)==_rawval(actual) : scstrcmp(_stringval(expected),_stringval(actual))==0),
                "comparison fallback matches interpreter result or error");
        }
    }
    v->temp_reg.Null();
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_cache_proofs()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function proof_loop(r,o,key,n) { r.count=r.count+1; local sum=0;"
        " for(local i=0;i<n;i++) { o[key]=i; sum=sum+o[key]; } return sum; }\n"
        "function proof_owner(r,o,next,key) { r.count=r.count+1; o[key]=3; o=next; o[key]=5; return o[key]; }\n"
        "function proof_key(r,o,key,next) { r.count=r.count+1; o[key]=3; key=next; o[key]=5; return o[key]; }\n"
        "function proof_branch(r,o,key,n) { r.count=r.count+1; if(n<1) o[key]=3; else o[key]=5; return o[key]; }\n"
        "proof_record <- {count=0}; proof_a <- {}; proof_b <- {};"
        " proof_a[false]<-0; proof_a[0]<-0; proof_b[false]<-0; proof_b[0]<-0;\n"
        "if(proof_loop(proof_record,proof_a,false,4)!=6 || proof_a[false]!=3) throw \"fixed bool key\";"
        "if(proof_loop(proof_record,proof_b,0,5)!=10 || proof_b[0]!=4) throw \"fixed integer key\";"
        "local a=[0]; if(proof_loop(proof_record,a,0,6)!=15 || a[0]!=5) throw \"fixed array\";"
        "class ProofOne { value=0; } class ProofTwo { padding=19; value=0; } local x=ProofOne(),y=ProofTwo();"
        "if(proof_loop(proof_record,x,\"value\",4)!=6 || proof_loop(proof_record,y,\"value\",5)!=10"
        " || x.value!=3 || y.value!=4) throw \"fixed instance layouts\";"
        "if(proof_loop(proof_record,1,\"missing\",0)!=0) throw \"unused invalid receiver\";"
        "if(proof_owner(proof_record,proof_a,proof_b,false)!=5 || proof_a[false]!=3 || proof_b[false]!=5) throw \"written receiver parameter\";"
        "if(proof_key(proof_record,proof_a,false,0)!=5 || proof_a[false]!=3 || proof_a[0]!=5) throw \"written key tag\";"
        "if(proof_branch(proof_record,proof_a,false,0)!=3 || proof_branch(proof_record,proof_a,false,1)!=5) throw \"conditional first use\";"
        "if(proof_record.count!=10) throw \"cache-proof prefixes\";\n")),"cache proofs preserve changing activations, parameter writes, conditional first uses and loop-first hits");
    for(const SQChar *name : {_SC("proof_loop"),_SC("proof_owner"),_SC("proof_key"),_SC("proof_branch")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;SQJitObservation seen={};
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,seen) && seen.frame.successes>0 && seen.frame.side_exits==0 &&
            native_word(p,0xf900056cu),"cache-proof witnesses retain native heap-store coverage");
    }
    SQObjectPtr a=named(v,_SC("proof_a"));
    _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("proof_pointer_bits"))),
        SQObjectPtr((SQInteger)_rawval(a)));
    CHECK(run(v,_SC(
        "proof_record.count=0; local caught=false; try { proof_owner(proof_record,proof_a,proof_pointer_bits,false); } catch(e) { caught=true; }"
        "if(!caught || proof_record.count!=1 || proof_a[false]!=3) throw \"mutated owner tag\";"
        "caught=false; try { proof_key(proof_record,proof_a,false,\"missing\"); } catch(e) { caught=true; }"
        "if(!caught || proof_record.count!=2 || proof_a[false]!=3 || (\"missing\" in proof_a)) throw \"mutated missing key\";"
        "caught=false; try { proof_loop(proof_record,1,\"missing\",2); } catch(e) { caught=true; }"
        "if(!caught || proof_record.count!=3) throw \"fixed invalid receiver\";"
        "caught=false; try { proof_branch(proof_record,1,\"missing\",1); } catch(e) { caught=true; }"
        "if(!caught || proof_record.count!=4) throw \"conditional null cache\";\n")),"omitted identity checks never omit null-slot or mutable-operand guards");
    for(const SQChar *name : {_SC("proof_loop"),_SC("proof_owner"),_SC("proof_key"),_SC("proof_branch")}) {
        SQObjectPtr fn=named(v,name);SQJitObservation seen={};
        CHECK(sqjit_observe_proto(_closure(fn)->_function,seen) && seen.frame.side_exits==1 && seen.frame.guard_failures==0,
            "each invalid cache-proof operand exits precisely without replaying its prefix");
    }
    // The second DLOAD destination must also invalidate a receiver proof.
    CHECK(run(v,_SC("function proof_double(r,scratch,o,key) { r.count=r.count+1; o[key]=3;"
        " scratch=\"proof-unused\"; o=\"proof-replacement\"; o[key]=5; return o[key]; }")),"define multi-output receiver write");
    SQObjectPtr fn=named(v,_SC("proof_double")),b=named(v,_SC("proof_b"));SQFunctionProto *p=_closure(fn)->_function;
    CHECK(fixture_double_load(p,2,3),"construct the receiver-replacing DLOAD before compilation");
    bool dload=false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
        const SQInstruction &i=p->_instructions[ip];
        if(i.op==_OP_DLOAD && i._arg2==3) { p->_literals[i._arg3]=b; dload=true; }
    }
    CHECK(dload,"DLOAD fixture writes the receiver through its second destination");
    CHECK(run(v,_SC("proof_record.count=0; if(proof_double(proof_record,0,proof_a,false)!=5"
        " || proof_record.count!=1 || proof_a[false]!=3 || proof_b[false]!=5) throw \"DLOAD receiver proof\";")),
        "complete write facts prevent stale addresses after a multi-output parameter assignment");
    SQJitObservation seen={};CHECK(sqjit_observe_proto(p,seen) && seen.frame.successes==1 && seen.frame.side_exits==0 &&
        p->_jit->_entry->_requires_vm_frame,"multi-output receiver witness completes natively");
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_copy_release()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function copy_move(value,r,source) { r.count=r.count+1; value=source; r.observed=r.seen; return value; }\n"
        "function copy_literal(value,r,source) { r.count=r.count+1; value=\"copy-pinned\"; r.observed=r.seen; return value; }\n"
        "function copy_integer(value,r,source) { r.count=r.count+1; value=1007; r.observed=r.seen; return value; }\n"
        "function copy_float(value,r,source) { r.count=r.count+1; value=1.5; r.observed=r.seen; return value; }\n"
        "function copy_bool(value,r,source) { r.count=r.count+1; value=true; r.observed=r.seen; return value; }\n"
        "copy_record <- {count=0,seen=0,observed=0};\n")),"define native single-destination copy witnesses");
    SQObjectPtr record=named(v,_SC("copy_record"));
    auto field=[&](const SQChar *name)->SQObjectPtr & {
        return *_table(record)->GetRawSlot(SQObjectPtr(SQString::Create(v->_sharedstate,name)));
    };
    int kind=0;
    for(const SQChar *name : {_SC("copy_move"),_SC("copy_literal"),_SC("copy_integer"),_SC("copy_float"),_SC("copy_bool")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;
        const SQOpcode opcode[]={_OP_MOVE,_OP_LOAD,_OP_LOADINT,
            sizeof(SQFloat)==sizeof(SQInt32) ? _OP_LOADFLOAT : _OP_LOAD,_OP_LOADBOOL};
        bool direct=false;SQInteger literal=-1;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];if(i.op!=opcode[kind]) continue;
            if(ip+1<p->_ninstructions) {
                SQInstruction &next=p->_instructions[ip+1];
                if(next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
                    i._arg0=1;next.op=_OP_LINE;
                }
            }
            if(i._arg0==1) {direct=true;if(kind==1) literal=i._arg1;}
        }
        std::basic_string<SQChar> warm=name;warm+=_SC("(0,copy_record,0);");
        CHECK(direct && run(v,warm.c_str()),"copy fixture writes directly to its destination parameter");
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame,
            "copy fixtures compile through the actual canonical tier");
        for(int mode : {0,1,2,3,4}) {
            if(mode==3 && kind>1) continue;
            v->temp_reg.Null();field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);field(_SC("observed"))=SQInteger(-1);
            SQJitObservation before={},after={};sqjit_observe_proto(p,before);
            SQInteger top=sq_gettop(v);int old_releases=0,source_releases=0;
            SQObjectPtr source,out,survivor,old_weak,source_weak;
            if(kind==0) {
                ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
                w->record=&record;w->count=&source_releases;sq_setreleasehook(v,-1,release_witness);
                source=v->GetUp(-1);sq_settop(v,top);
            }
            else if(kind==1) source=p->_literals[literal];
            else if(kind==2) source=SQInteger(1007);
            else if(kind==3) source=SQFloat(1.5);
            else source=true;
            SQRefCounted *source_raw=ISREFCOUNTED(sq_type(source)) ? _refcounted(source) : NULL;
            SQUnsignedInteger source_count=source_raw ? source_raw->_uiRef : 0;
            if(source_raw) source_weak=source_raw->GetWeakRef(sq_type(source));
            sq_pushobject(v,fn);sq_pushroottable(v);
            if(mode==3) sq_pushobject(v,source);
            else {
                ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
                w->record=&record;w->count=&old_releases;sq_setreleasehook(v,-1,release_witness);
            }
            SQRefCounted *old_raw=_refcounted(v->GetUp(-1));old_weak=old_raw->GetWeakRef(sq_type(v->GetUp(-1)));
            if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==2 || mode==3) old_raw->_uiRef |= MARK_FLAG;
#endif
            {
                SQJitWriteLog parent(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                if(mode==4) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                    "copy guard accounts for two ancestor pins before source acquisition");
                sq_pushobject(v,record);sq_pushobject(v,source);
                CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)),"native copy returns its exact scalar or reference source");
                out=v->GetUp(-1);sq_settop(v,top);v->temp_reg.Null();
                CHECK(sq_type(out)==sq_type(source) && _rawval(out)==_rawval(source) &&
                    old_releases==(mode==0 ? 1 : 0) && source_releases==0 &&
                    _integer(field(_SC("observed")))==(mode==0 ? 1 : 0) && _integer(field(_SC("count")))==1,
                    "copy release precedes the next member read without replaying the prefix");
                CHECK(sqjit_observe_proto(p,after),"observe native copy and exact continuation");
                if(mode==0 || mode==4) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                    "final and ancestor-sensitive copy destinations keep one precise exit");
                else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                    "non-final and aliased destinations finish natively");
                if(source_raw) {
                    SQUnsignedInteger count=source_raw->_uiRef;
#ifndef NO_GARBAGE_COLLECTOR
                    count &= ~(SQUnsignedInteger)MARK_FLAG;
#endif
                    CHECK(count==source_count+1,"only the returned result adds a surviving source reference");
                }
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2 || mode==3) {
                    CHECK((old_raw->_uiRef & MARK_FLAG) &&
                        (old_raw->_uiRef & ~(SQUnsignedInteger)MARK_FLAG)==(mode==3 ? source_count+1 : 1),
                        "copy alias reload preserves the GC mark and exact owner count");
                    old_raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG;
                }
#endif
            }
            survivor.Null();
            CHECK(mode==3 || (old_releases==1 && sq_type(_weakref(old_weak)->_obj)==OT_NULL),
                "old destination dies once when its final real or journal owner is released");
            out.Null();if(source_raw) CHECK(source_raw->_uiRef==source_count,"copy result leaves no extra source pin");
            source.Null();
            if(kind==0) CHECK(source_releases==1 && sq_type(_weakref(source_weak)->_obj)==OT_NULL,
                "copied userdata preserves final weak death");
            if(kind==1) CHECK(sq_type(_weakref(source_weak)->_obj)==OT_STRING,
                "prototype literal ownership survives destination and result cleanup");
            CHECK(!ctx.active_logs,"copy leaves ancestor context balanced");
        }
        ++kind;
    }
    SQObjectPtr fn=named(v,_SC("copy_move"));SQFunctionProto *p=_closure(fn)->_function;
    SQObjectPtr target=SQArray::Create(v->_sharedstate,1),weak=_array(target)->GetWeakRef(OT_ARRAY);
    for(int dead : {0,1}) {
        if(dead) target.Null();
        for(int alias : {0,1}) {
            SQInteger top=sq_gettop(v);v->temp_reg.Null();SQUnsignedInteger count=_weakref(weak)->_uiRef;
            SQJitObservation before={},after={};sqjit_observe_proto(p,before);
            sq_pushobject(v,fn);sq_pushroottable(v);
            if(alias) sq_pushobject(v,weak);else sq_pushinteger(v,0);
            sq_pushobject(v,record);sq_pushobject(v,weak);
            CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && sq_type(v->GetUp(-1))==OT_WEAKREF &&
                _rawval(v->GetUp(-1))==_rawval(weak),"MOVE copies live and dead weak objects without dereferencing them");
            sq_settop(v,top);v->temp_reg.Null();
            CHECK(_weakref(weak)->_uiRef==count && sq_type(_weakref(weak)->_obj)==(dead ? OT_NULL : OT_ARRAY) &&
                (dead || _refcounted(target)->_uiRef==1),"weak copy neither pins its referent nor leaks the weak object");
            CHECK(sqjit_observe_proto(p,after) && after.frame.successes==before.frame.successes+1 &&
                after.frame.side_exits==before.frame.side_exits,"weak-copy and weak-alias cases complete on the native route");
        }
    }
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_reference_reads()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function owning_array(value,r,items) { r.count=r.count+1; local first=items[0]; value=items[0]; local next=items[0]; r.observed=r.seen; return next; }\n"
        "function owning_cache(value,r,items) { r.count=r.count+1; local first=r.payload; value=r.payload; local next=r.payload; r.observed=r.seen; return next; }\n"
        "owning_record <- {count=0,seen=0,observed=0,payload=null};\n")),"define native reference-source lifetime witnesses");
    SQObjectPtr record=named(v,_SC("owning_record"));
    auto field=[&](const SQChar *name)->SQObjectPtr & {
        return *_table(record)->GetRawSlot(SQObjectPtr(SQString::Create(v->_sharedstate,name)));
    };
    for(const SQChar *name : {_SC("owning_array"),_SC("owning_cache")}) {
        const bool cached=!scstrcmp(name,_SC("owning_cache"));
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;
        bool fused=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];
            if((!cached && (i.op!=_OP_GET || i._arg1!=3)) ||
                (cached && (i.op!=_OP_GETK || i._arg2!=2 ||
                    scstrcmp(_stringval(p->_literals[i._arg1]),_SC("payload"))))) continue;
            if(ip+1<p->_ninstructions) {
                SQInstruction &next=p->_instructions[ip+1];
                if(next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
                    i._arg0=1;next.op=_OP_LINE;
                }
            }
            if(i._arg0==1) fused=true;
        }
        std::basic_string<SQChar> warm=_SC("owning_record.payload=[7]; ");warm+=name;
        warm+=_SC("(0,owning_record,[[7]]); owning_record.payload=null;");
        CHECK(fused && run(v,warm.c_str()),"reference GET directly overwrites its owning parameter");
        // Require the source-pin store, not just entry into a helper-only tier.
        const unsigned refs=(unsigned)(size_t)&(((SQRefCounted *)0)->_uiRef);
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            native_word(p,0xF9000000u | ((refs/8)<<10) | (12u<<5) | 9u),
            "reference witnesses contain the native source-refcount store");
        for(int mode : {0,1,2,3,4}) {
            field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);field(_SC("observed"))=SQInteger(-1);
            v->temp_reg.Null();
            SQJitObservation before={},after={};sqjit_observe_proto(p,before);
            SQInteger top=sq_gettop(v);int source_releases=0,old_releases=0;
            SQObjectPtr source,source_weak,survivor,old_weak,out,items=SQArray::Create(v->_sharedstate,1);
            ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
            w->record=&record;w->count=&source_releases;sq_setreleasehook(v,-1,release_witness);
            source=v->GetUp(-1);sq_settop(v,top);
            SQRefCounted *source_raw=_refcounted(source);source_weak=source_raw->GetWeakRef(OT_USERDATA);
            if(cached) field(_SC("payload"))=source;else _array(items)->_values[0]=source;
            sq_pushobject(v,fn);sq_pushroottable(v);
            if(mode==3) sq_pushobject(v,source);
            else {
                w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
                w->record=&record;w->count=&old_releases;sq_setreleasehook(v,-1,release_witness);
            }
            SQRefCounted *old_raw=_refcounted(v->GetUp(-1));old_weak=old_raw->GetWeakRef(OT_USERDATA);
            if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==2 || mode==3) old_raw->_uiRef |= MARK_FLAG;
#endif
            {
                SQJitWriteLog parent(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==4 ? &ctx : NULL);
                if(mode==4) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                    "reference read sees both ancestor pins before adding its source owner");
                sq_pushobject(v,record);sq_pushobject(v,items);
                CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)),"reference read completes with exact source identity");
                out=v->GetUp(-1);sq_settop(v,top);v->temp_reg.Null();
                CHECK(sq_type(out)==OT_USERDATA && _rawval(out)==_rawval(source) && source_releases==0 &&
                    old_releases==(mode==0 ? 1 : 0) && _integer(field(_SC("observed")))==(mode==0 ? 1 : 0) &&
                    _integer(field(_SC("count")))==1,
                    "source pin survives while final temporary release precedes the following member read");
                CHECK(sqjit_observe_proto(p,after),"observe owning-source native completion");
                if(mode==0 || mode==4) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                    "final and ancestor-sensitive temporaries retain a single precise exit");
                else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                    "surviving and source-alias temporaries complete the actual native read");
                SQUnsignedInteger source_count=source_raw->_uiRef;
#ifndef NO_GARBAGE_COLLECTOR
                source_count &= ~(SQUnsignedInteger)MARK_FLAG;
#endif
                CHECK(source_count==3,
                    "source, container and result are the only three surviving source owners");
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2 || mode==3) {
                    CHECK((old_raw->_uiRef & MARK_FLAG) &&
                        (old_raw->_uiRef & ~(SQUnsignedInteger)MARK_FLAG)==(mode==3 ? 3u : 1u),
                        "source/temp alias reload preserves the GC mark and exact physical count");
                    old_raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG;
                }
#endif
            }
            survivor.Null();
            CHECK(mode==3 || (old_releases==1 && sq_type(_weakref(old_weak)->_obj)==OT_NULL),
                "discarded temporary dies once after its last real or journal owner");
            field(_SC("payload")).Null();_array(items)->_values[0].Null();out.Null();
            CHECK(source_raw->_uiRef==1 && source_releases==0,"only the explicit source owner remains");
            source.Null();CHECK(source_releases==1 && sq_type(_weakref(source_weak)->_obj)==OT_NULL && !ctx.active_logs,
                "native reference acquisition leaves no leak and preserves weak death");
        }
    }
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_cached_release()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);
    SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function cached_cmp(value,r,n) { r.count=r.count+1; local first=r.payload; value=r.payload; if(n<2) return r.seen; return first; }\n"
        "function cached_drop(value,r,n) { r.count=r.count+1; local first=r.payload; value=r.payload; local next=r.payload; return next+r.seen; }\n"
        "cached_release_record <- {count=0,payload=5,seen=0};\n")),"define cache-hit temporary-release witnesses");
    SQObjectPtr record=named(v,_SC("cached_release_record"));
    for(const SQChar *name : {_SC("cached_cmp"),_SC("cached_drop")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;
        bool fused=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];
            if(i.op!=_OP_GETK || i._arg2!=2 || sq_type(p->_literals[i._arg1])!=OT_STRING ||
                scstrcmp(_stringval(p->_literals[i._arg1]),_SC("payload"))) continue;
            if(ip+1<p->_ninstructions) {
                SQInstruction &next=p->_instructions[ip+1];
                if(next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
                    i._arg0=1;next.op=_OP_LINE;
                }
            }
            if(i._arg0==1) fused=true;
        }
        std::basic_string<SQChar> warm=name;warm+=_SC("(0,cached_release_record,1);");
        CHECK(fused && run(v,warm.c_str()),"primed cache GET writes directly into an owning parameter");
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame,
            "cached release witnesses compile through the canonical tier");
        for(int mode : {0,1,2,3}) {
            CHECK(run(v,_SC("cached_release_record.count=0;cached_release_record.seen=0;")),"reset cached release witness");
            SQJitObservation before={},after={};sqjit_observe_proto(p,before);
            int releases=0;SQInteger top=sq_gettop(v),value=-1;
            SQObjectPtr survivor,weak;
            sq_pushobject(v,fn);sq_pushroottable(v);
            ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
            w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
            SQRefCounted *raw=_refcounted(v->GetUp(-1));weak=raw->GetWeakRef(OT_USERDATA);
            if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==2) raw->_uiRef |= MARK_FLAG;
#endif
            {
                SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                if(mode==3) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                    "two ancestor pins cannot masquerade as a surviving cached-read owner");
                sq_pushobject(v,record);sq_pushinteger(v,1);
                SQInteger expected=!scstrcmp(name,_SC("cached_drop")) ? 5 : 0;
                if(mode==0) ++expected;
                CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&value)) &&
                    value==expected && releases==(mode==0 ? 1 : 0),
                    "cached GET and following GET/JCMP preserve the callback's interpreter-visible order");
                sq_settop(v,top);CHECK(sqjit_observe_proto(p,after),"observe cached-read continuation");
                if(mode==0 || mode==3) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                    "cached final drops and ancestor pins require one precise exit");
                else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                    "a real surviving owner permits cached native completion");
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2) {
                    CHECK((raw->_uiRef & MARK_FLAG) && (raw->_uiRef & ~(SQUnsignedInteger)MARK_FLAG)==1,
                        "cached-read sequence preserves the mark and exactly one real owner");
                    raw->_uiRef &= ~(SQUnsignedInteger)MARK_FLAG;
                }
#endif
            }
            survivor.Null();
            CHECK(releases==1 && sq_type(_weakref(weak)->_obj)==OT_NULL && !ctx.active_logs,
                "cached temporary witnesses release once and preserve weak death");
            SQObjectPtr count;_table(record)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),count);
            CHECK(_integer(count)==1,"cached exits never replay the committed prefix");
            v->temp_reg.Null();
        }
    }
    CHECK(run(v,_SC(
        "function cached_kind(r,next) { r.count=r.count+1; local first=r.payload; r.payload=next; return r.payload; }\n"
        "local r={count=0,payload=5},a=[7];\n"
        "if(cached_kind(r,a)!=a) throw \"cached reference reload\"; r.payload=5;\n"
        "if(cached_kind(r,a.weakref())!=a) throw \"cached weak reload\"; r.payload=5;\n"
        // Clear the caller's sole temporary owner before calling cached_kind.
        // Otherwise its first GET must correctly side-exit to release that owner.
        "local dead=[11].weakref(); local cleared=r.count;"
        " if(dead.ref()!=null) throw \"dead weak fixture\";"
        " if(cached_kind(r,dead)!=null) throw \"cached dead weak reload\"; r.payload=5;\n"
        "if(typeof cached_kind(r,false)!=\"bool\") throw \"cached scalar tag reload\";\n"
        "if(r.count!=4) throw \"cached type-change prefixes\";\n")),"cache hits reload current scalar/reference/weak slot contents after stores");
    SQObjectPtr kind=named(v,_SC("cached_kind"));SQJitObservation route={};
    CHECK(_closure(kind)->_function->_jit && _closure(kind)->_function->_jit->_entry &&
        _closure(kind)->_function->_jit->_entry->_requires_vm_frame &&
        sqjit_observe_proto(_closure(kind)->_function,route) && route.frame.successes==4 && route.frame.side_exits==0,
        "type-changing cached slots remain on the native route with current-value reads");
    }
    sq_close(v);
#endif
    return failures;
}

static int generated_caches()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
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
        CHECK(fixture_double_load(p,1,2),"construct the repeated-destination DLOAD before compilation");
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
    CHECK(!native_word(_closure(c)->_function,0x1e612800u),
        "large-function code budget retries without optional float lowering and preserves native coverage");
    c.Null(); sq_close(v);
#endif
    return failures;
}

static int precise_len_override_calls=0;
static SQInteger precise_len_override(HSQUIRRELVM v)
{
    ++precise_len_override_calls;
    sq_pushinteger(v,99);
    return 1;
}

static int generated_length_intrinsics()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);
    SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function length_cycle(r,n) { local sum=0; for(local j=0;j<n;j++) { r.label=j%3==0 ? \"longer\" : \"q\"; r.count=r.count+1; sum+=r.label.len(); } return sum+r.count; }\n"
        "function length_equal(r,a,b) { r.count=r.count+1; return r.label.len()+(a==b ? 100 : 0)+(a!=b ? 1000 : 0); }\n"
        "function length_release(value,r) { r.count=r.count+1; value=r.label.len(); return value+r.seen; }\n"
        "function length_callee_legacy(value,r,s,counter) { counter=counter+1; r.count=counter; return s.len()+r.seen; }\n"
        "function length_result_legacy(value,r,s,counter) { counter=counter+1; r.count=counter; value=s.len(); return value+r.seen; }\n"
        "function length_prepare_legacy(value,r,s,counter) { counter=counter+1; r.count=counter; return s.len()+r.seen; }\n"
        "function length_callee_register(value,r,s,counter) { counter=counter+1; r.count=counter; local method=\"len\"; return s[method]()+r.seen; }\n"
        "function length_prepare_register(value,r,s,counter) { counter=counter+1; r.count=counter; local method=\"len\"; return s[method]()+r.seen; }\n"
        "function length_callee_precise(value,r,s,counter) { counter=counter+1; r.count=counter; local result=s.len()+r.seen; local text=\"q\"; return result+text.len()-1; }\n"
        "function length_prepare(value,r,s,counter) { counter=counter+1; r.count=counter; local result=s.len()+r.seen; local text=\"q\"; return result+text.len()-1; }\n"
        "length_record <- {count=0,label=\"q\",seen=0};\n"
        "if(length_cycle(length_record,11)!=42 || length_record.count!=11) throw \"length cycle\";\n"
        "length_record.label=\"q\"; if(length_equal(length_record,1,1.0)!=101) throw \"length equality\";\n")),"define and warm effectful equality/default-length functions");
    SQObjectPtr record=named(v,_SC("length_record"));
    auto field=[&](const SQChar *key)->SQObjectPtr & {
        return *_table(record)->GetRawSlot(SQObjectPtr(SQString::Create(v->_sharedstate,key)));
    };
    for(const SQChar *name : {_SC("length_cycle"),_SC("length_equal")}) {
        SQFunctionProto *p=_closure(named(v,name))->_function;SQJitObservation o={};
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,o) && o.frame.successes>0 && o.frame.side_exits==0,
            "expanded precise tier actually runs effectful equality/default-length code");
    }
    SQObjectPtr equal=named(v,_SC("length_equal"));
    SQFloat nan=std::numeric_limits<SQFloat>::quiet_NaN();
    struct Pair { SQObjectPtr a,b; } pairs[]={
        {SQObjectPtr(SQFloat(0.0)),SQObjectPtr(SQFloat(-0.0))},
        {SQObjectPtr(nan),SQObjectPtr(nan)},
        {SQObjectPtr(SQInteger(1)),SQObjectPtr(SQFloat(1.0))},
        {SQObjectPtr(SQInteger(1)),SQObjectPtr(SQFloat(1.5))},
        {SQObjectPtr(SQString::Create(v->_sharedstate,_SC("same"))),SQObjectPtr(SQString::Create(v->_sharedstate,_SC("same")))},
        {SQObjectPtr(SQString::Create(v->_sharedstate,_SC("left"))),SQObjectPtr(SQString::Create(v->_sharedstate,_SC("right")))}
    };
    for(const Pair &pair:pairs) {
        bool expected=false;CHECK(v->IsEqual(pair.a,pair.b,expected),"reference VM equality");
        SQInteger top=sq_gettop(v),result=-1,count=_integer(field(_SC("count")));
        SQJitObservation before={},after={};SQFunctionProto *p=_closure(equal)->_function;sqjit_observe_proto(p,before);
        sq_pushobject(v,equal);sq_pushroottable(v);sq_pushobject(v,record);sq_pushobject(v,pair.a);sq_pushobject(v,pair.b);
        CHECK(SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
            result==(expected ? 101 : 1001) && _integer(field(_SC("count")))==count+1,
            "native EQ/NE preserve NaN, signed zero, numeric and string semantics");
        sq_settop(v,top);CHECK(sqjit_observe_proto(p,after) && after.frame.successes==before.frame.successes+1,
            "equality samples complete through actual native code");
    }
    SQObjectPtr cycle=named(v,_SC("length_cycle"));SQFunctionProto *cp=_closure(cycle)->_function;
    SQObjectPtr key=SQString::Create(v->_sharedstate,_SC("len"));
    SQObjectPtr original_method=*_table(v->_sharedstate->_string_default_delegate)->GetRawSlot(key);
    sq_newclosure(v,precise_len_override,0);SQObjectPtr replacement=v->GetUp(-1);sq_pop(v,1);
    _table(v->_sharedstate->_string_default_delegate)->Set(key,replacement);
    field(_SC("count"))=SQInteger(0);precise_len_override_calls=0;
    SQJitObservation before={},after={};sqjit_observe_proto(cp,before);
    CHECK(run(v,_SC("if(length_cycle(length_record,1)!=100 || length_record.count!=1) throw \"length override\";")),
        "delegate replacement executes only the remaining CALL and continuation");
    CHECK(precise_len_override_calls==1 && sqjit_observe_proto(cp,after) &&
        after.frame.side_exits==before.frame.side_exits+1,
        "changed native callee takes an exact exit without replaying the store prefix");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,original_method);

    // Force a legal CALL-result/parameter alias so the exact result publication
    // is covered independently of the frontend's preferred temporary register.
    SQObjectPtr fn=named(v,_SC("length_release"));SQFunctionProto *p=_closure(fn)->_function;
    bool fused=false;
    for(SQInteger ip=0;ip+1<p->_ninstructions;++ip) {
        SQInstruction &i=p->_instructions[ip],&next=p->_instructions[ip+1];
        if(i.op==_OP_CALL && i._arg0==1) fused=true;
        if(i.op==_OP_CALL && next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
            i._arg0=1;next.op=_OP_LINE;fused=true;
        }
    }
    CHECK(fused && run(v,_SC("length_record.label=\"q\"; length_record.count=0; length_record.seen=0; if(length_release(0,length_record)!=1) throw \"release warmup\";")),
        "warm direct canonical CALL-result publication");
    CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame,
        "CALL-result witness uses expanded precise code");
    for(int mode=0;mode<4;++mode) {
        field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);v->temp_reg.Null();
        SQJitObservation before={},after={};sqjit_observe_proto(p,before);
        int releases=0;SQInteger top=sq_gettop(v),result=-1;SQObjectPtr survivor,weak;
        sq_pushobject(v,fn);sq_pushroottable(v);
        ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
        w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
        SQRefCounted *raw=_refcounted(v->GetUp(-1));weak=raw->GetWeakRef(OT_USERDATA);
        if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
        if(mode==2) raw->_uiRef|=MARK_FLAG;
#endif
        {
            SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            if(mode==3) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                "two ancestor pins cannot fake a surviving CALL-result owner");
            sq_pushobject(v,record);
            CHECK(SQ_SUCCEEDED(sq_call(v,3,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
                result==(mode==0 ? 2 : 1) && releases==(mode==0 ? 1 : 0),
                "CALL result and callback-visible continuation preserve interpreter ordering");
            sq_settop(v,top);CHECK(sqjit_observe_proto(p,after),"observe CALL-result native route");
            if(mode==0 || mode==3) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                "final and ancestor-sensitive CALL results take one exact exit");
            else CHECK(after.frame.successes==before.frame.successes+1 && after.frame.side_exits==before.frame.side_exits,
                "a real surviving owner permits native CALL-result publication");
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==2) {
                CHECK((raw->_uiRef&MARK_FLAG) && (raw->_uiRef&~(SQUnsignedInteger)MARK_FLAG)==1,
                    "CALL-result publication preserves the mark and one real owner");
                raw->_uiRef&=~(SQUnsignedInteger)MARK_FLAG;
            }
#endif
        }
        survivor.Null();CHECK(releases==1 && sq_type(_weakref(weak)->_obj)==OT_NULL && !ctx.active_logs,
            "CALL-result ownership has no leak and exact weak death");
        CHECK(_integer(field(_SC("count")))==1,"CALL-result exit does not replay the committed prefix");
    }
    // Both private PREPCALL forms and the expanded precise compiler must
    // publish the receiver to its actual VM slot. The precise fixture adds a
    // known string length after the observed expression to require that tier.
    // A legal prepared-receiver/parameter alias makes both old owners visible.
    // The scalar counter before SET also detects accidental entry replay without
    // touching the incoming VM temporary before PREPCALLK.
    SQObjectPtr prepared; SQFunctionProto *pp=NULL;
    SQObjectPtr receivers[]={SQObjectPtr(SQString::Create(v->_sharedstate,_SC("q"))),
        SQObjectPtr(SQArray::Create(v->_sharedstate,3))};
    auto warm_prepared=[&](const SQObjectPtr &receiver)->bool {
        SQInteger top=sq_gettop(v),result=-1;v->temp_reg.Null();field(_SC("seen"))=SQInteger(0);
        sq_pushobject(v,prepared);sq_pushroottable(v);sq_pushinteger(v,0);
        sq_pushobject(v,record);sq_pushobject(v,receiver);sq_pushinteger(v,0);
        bool ok=SQ_SUCCEEDED(sq_call(v,5,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)) &&
            result==(sq_type(receiver)==OT_STRING ? 1 : 3) && _integer(field(_SC("count")))==1;
        sq_settop(v,top);return ok;
    };
    for(const SQChar *name : {_SC("length_prepare_legacy"),_SC("length_prepare_register"),
        _SC("length_callee_legacy"),_SC("length_callee_register"),_SC("length_result_legacy"),
        _SC("length_callee_precise"),_SC("length_prepare")}) {
    const bool legacy=scstrcmp(name,_SC("length_prepare"))!=0 && scstrcmp(name,_SC("length_callee_precise"))!=0;
    const bool callee_alias=scstrstr(name,_SC("callee"))!=NULL;
    const bool result_alias=scstrstr(name,_SC("result"))!=NULL;
    ctx.precise_exits=!legacy;
    prepared=named(v,name);
    pp=_closure(prepared)->_function;bool receiver_alias=false;
    for(SQInteger ip=0;ip+1<pp->_ninstructions;++ip) {
        SQInstruction &i=pp->_instructions[ip],&next=pp->_instructions[ip+1];
        if(result_alias) {
            if(i.op==_OP_CALL && i._arg0==1) { receiver_alias=true;break; }
            if(i.op==_OP_CALL && next.op==_OP_MOVE && next._arg0==1 && next._arg1==i._arg0) {
                i._arg0=1;next.op=_OP_LINE;receiver_alias=true;break;
            }
        }
        else if((i.op==_OP_PREPCALLK || i.op==_OP_PREPCALL) && next.op==_OP_CALL && next._arg1==i._arg0 &&
            next._arg2==i._arg3 && next._arg3==1) {
            if(callee_alias) { i._arg0=1;next._arg1=1; }
            else { i._arg3=1;next._arg2=1; }
            receiver_alias=true;break;
        }
    }
    const bool prepared_warm=warm_prepared(receivers[legacy ? 1 : 0]);
    CHECK(receiver_alias && prepared_warm && pp->_jit && pp->_jit->_entry &&
        pp->_jit->_entry->_requires_vm_frame==!legacy,"prepare receiver alias uses its intended native compiler");
    for(const SQObjectPtr &receiver:receivers) for(int mode=0;mode<5;++mode) {
        ctx.enabled=true;CHECK(warm_prepared(receiver),"reset prepared-length native route");
        SQInteger reference_result=-1,reference_seen=-1;int reference_releases=-1;
        for(int jit=0;jit<2;++jit) {
            ctx.enabled=jit!=0;v->temp_reg.Null();
            field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);
            SQJitObservation before={},after={};sqjit_observe_proto(pp,before);
            int releases=0;SQInteger top=sq_gettop(v),result=-1;SQObjectPtr survivor,weak;
            sq_pushobject(v,prepared);sq_pushroottable(v);
            ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
            w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
            SQRefCounted *raw=_refcounted(v->GetUp(-1));weak=raw->GetWeakRef(OT_USERDATA);
            if(mode!=4) v->temp_reg=v->GetUp(-1);
            if(mode==1 || mode==2) survivor=v->GetUp(-1);
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==2) raw->_uiRef|=MARK_FLAG;
#endif
            {
                SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
                if(mode==3) CHECK(parent.RetainValue(v->GetUp(-1)) && ancestor.RetainValue(v->GetUp(-1)),
                    "ancestor pins do not justify combined prepared-receiver/temp drops");
                sq_pushobject(v,record);sq_pushobject(v,receiver);sq_pushinteger(v,0);
                CHECK(SQ_SUCCEEDED(sq_call(v,5,SQTrue,SQFalse)) && SQ_SUCCEEDED(sq_getinteger(v,-1,&result)),
                    "prepared-length alias call returns normally");
                sq_settop(v,top);
                if(!jit) { reference_result=result;reference_seen=_integer(field(_SC("seen")));reference_releases=releases; }
                else {
                    if(result!=reference_result || _integer(field(_SC("seen")))!=reference_seen || releases!=reference_releases)
                        fprintf(stderr,"PREP_MISMATCH receiver=%u mode=%d value=%lld/%lld seen=%lld/%lld releases=%d/%d precise=%d\n",
                            (unsigned)sq_type(receiver),mode,(long long)result,(long long)reference_result,
                            (long long)_integer(field(_SC("seen"))),(long long)reference_seen,releases,reference_releases,
                            pp->_jit && pp->_jit->_entry ? pp->_jit->_entry->_requires_vm_frame : -1);
                    CHECK(result==reference_result && _integer(field(_SC("seen")))==reference_seen &&
                        releases==reference_releases,"string/array preparation matches interpreter callback and temporary ordering");
                }
                CHECK(_integer(field(_SC("count")))==1,"prepared-length exit preserves exactly one counter increment");
                CHECK(sqjit_observe_proto(pp,after),"observe prepared-length native path");
                if(jit && !legacy && (mode==0 || mode>=3)) CHECK(after.frame.side_exits==before.frame.side_exits+1,
                    "observable final/ancestor-sensitive prepared drops take exactly one exit");
                if(jit && (!legacy || sq_type(receiver)==OT_ARRAY) && (mode==1 || mode==2)) CHECK(after.frame.successes==before.frame.successes+1 &&
                    after.frame.side_exits==before.frame.side_exits,"a real survivor permits the complete prepared-length native path");
                if(jit && legacy && (sq_type(receiver)==OT_STRING || mode==0 || mode>=3))
                    CHECK(after.frame.guard_failures==before.frame.guard_failures+1,
                        "private receiver publication rejects observable drops with complete rollback");
#ifndef NO_GARBAGE_COLLECTOR
                if(mode==2) {
                    CHECK((raw->_uiRef&MARK_FLAG) && (raw->_uiRef&~(SQUnsignedInteger)MARK_FLAG)==1,
                        "combined prepared drops preserve mark and exact surviving ownership");
                    raw->_uiRef&=~(SQUnsignedInteger)MARK_FLAG;
                }
#endif
            }
            survivor.Null();CHECK(releases==1 && sq_type(_weakref(weak)->_obj)==OT_NULL && !ctx.active_logs,
                "prepared aliases release once, preserve weak death and leave no ancestor state");
        }
    }
    }
    ctx.precise_exits=true;
    ctx.enabled=true;CHECK(warm_prepared(receivers[0]),"restore normal prepared-length entry");
    sqjit_observe_proto(pp,before);
    CHECK(run(v,_SC("length_record.count=0; local caught=false; try { length_prepare(0,length_record,17,0); } catch(e) { caught=true; } if(!caught || length_record.count!=1) throw \"length receiver error\";")),
        "wrong receiver resumes original lookup error after one committed prefix");
    CHECK(sqjit_observe_proto(pp,after) && after.frame.side_exits==before.frame.side_exits+1,
        "wrong prepared receiver takes a real native continuation");
    CHECK(warm_prepared(receivers[0]),"reset before callee replacement");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,SQObjectPtr(SQInteger(7)));
    sqjit_observe_proto(pp,before);
    CHECK(run(v,_SC("length_record.count=0; local caught=false; try { length_prepare(0,length_record,\"q\",0); } catch(e) { caught=true; } if(!caught || length_record.count!=1) throw \"length callee error\";")),
        "non-callable replacement preserves the interpreter CALL error and prefix");
    CHECK(sqjit_observe_proto(pp,after) && after.frame.side_exits==before.frame.side_exits+1,
        "wrong length callee exits before executing CALL effects");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,original_method);

    // String lookup dereferences weak values; array's cached len key follows
    // the VM's distinct shared-state shortcut even if its delegate slot changes.
    CHECK(warm_prepared(receivers[0]),"reset before weak method lookup");
    SQObjectPtr weak_method=_nativeclosure(original_method)->GetWeakRef(OT_NATIVECLOSURE);
    _table(v->_sharedstate->_string_default_delegate)->Set(key,weak_method);
    sqjit_observe_proto(pp,before);CHECK(warm_prepared(receivers[0]),"live weak length method is dereferenced");
    CHECK(sqjit_observe_proto(pp,after) && after.frame.successes==before.frame.successes+1,
        "live weak default method remains on the native route");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,original_method);
    SQObjectPtr dead_method;
    {
        sq_newclosure(v,precise_len_override,0);SQObjectPtr doomed=v->GetUp(-1);sq_pop(v,1);
        dead_method=_nativeclosure(doomed)->GetWeakRef(OT_NATIVECLOSURE);
    }
    CHECK(sq_type(_weakref(dead_method)->_obj)==OT_NULL,"dead method fixture has no strong owner");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,dead_method);sqjit_observe_proto(pp,before);
    CHECK(run(v,_SC("length_record.count=0; local caught=false; try { length_prepare(0,length_record,\"q\",0); } catch(e) { caught=true; } if(!caught || length_record.count!=1) throw \"dead length callee\";")),
        "dead weak method preserves null-call error and one prefix");
    CHECK(sqjit_observe_proto(pp,after) && after.frame.side_exits==before.frame.side_exits+1,
        "dead weak method takes an exact native continuation");
    _table(v->_sharedstate->_string_default_delegate)->Set(key,original_method);
    SQObjectPtr array_method=*_table(v->_sharedstate->_array_default_delegate)->GetRawSlot(key);
    _table(v->_sharedstate->_array_default_delegate)->Set(key,SQObjectPtr(SQInteger(7)));
    sqjit_observe_proto(pp,before);CHECK(warm_prepared(receivers[1]),"array cached length follows the VM's shared closure");
    CHECK(sqjit_observe_proto(pp,after) && after.frame.successes==before.frame.successes+1,
        "array-special method publication completes natively");
    _table(v->_sharedstate->_array_default_delegate)->Set(key,array_method);

    CHECK(run(v,_SC(
        "function length_discard(r,s) { r.count=r.count+1; s.len(); return r.count; }\n"
        "function length_literal(r,x) { r.count=r.count+1; return r.label.len()+(x==\"q\" ? 100 : 0); }\n"
        "length_record.count=0; if(length_discard(length_record,\"q\")!=1 || length_discard(length_record,[1,2,3])!=2) throw \"discarded length\";\n")),"discarded CALL results preserve both default-length receiver paths");
    SQObjectPtr literal_fn=named(v,_SC("length_literal"));SQFunctionProto *lp=_closure(literal_fn)->_function;
    SQInteger literal=-1;for(SQInteger n=0;n<lp->_nliterals;++n)
        if(sq_type(lp->_literals[n])==OT_STRING && !scstrcmp(_stringval(lp->_literals[n]),_SC("q"))) literal=n;
    bool literal_eq=false;
    for(SQInteger ip=0;ip<lp->_ninstructions;++ip) if(lp->_instructions[ip].op==_OP_EQ && literal>=0) {
        lp->_instructions[ip]._arg1=literal;lp->_instructions[ip]._arg3=1;literal_eq=true;
    }
    CHECK(literal_eq && run(v,_SC("length_record.label=\"q\"; if(length_literal(length_record,\"q\")!=101 || length_literal(length_record,\"other\")!=1 || length_literal(length_record,1)!=1) throw \"literal equality\";")),
        "COND_LITERAL equality honors constant operands and mixed types");
    for(const SQChar *name : {_SC("length_discard"),_SC("length_literal")}) {
        SQFunctionProto *p=_closure(named(v,name))->_function;SQJitObservation o={};
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,o) && o.frame.successes>=2 && o.frame.side_exits==0,
            "discarded calls and literal equality execute actual precise native code");
    }
    CHECK(run(v,_SC("function ignored_receiver(r,s,counter) { counter=counter+1; r.count=counter; local result=s.tofloat(); return result; } length_record.count=0; if(ignored_receiver(length_record,3,0)!=3.0) throw \"ignored receiver warmup\";")),
        "warm a lowered numeric built-in with an otherwise dead receiver");
    SQObjectPtr ignored=named(v,_SC("ignored_receiver"));SQFunctionProto *ignored_proto=_closure(ignored)->_function;
    SQInteger receiver_slot=-1;
    for(SQInteger ip=0;ip<ignored_proto->_ninstructions;++ip)
        if(ignored_proto->_instructions[ip].op==_OP_PREPCALLK) receiver_slot=ignored_proto->_instructions[ip]._arg3;
    bool ignored_native=receiver_slot>=4 && ignored_proto->_jit && ignored_proto->_jit->_entry &&
        !ignored_proto->_jit->_entry->_requires_vm_frame && ignored_proto->_jit->_entry->_code.Entry();
    CHECK(ignored_native,"ignored receiver witness executes private whole-function code");
    if(ignored_native) for(int mode=0;mode<5;++mode) {
        v->temp_reg.Null();field(_SC("count"))=SQInteger(0);field(_SC("seen"))=SQInteger(0);
        std::vector<SQObjectPtr> frame((size_t)ignored_proto->_stacksize);
        frame[0]=v->_roottable;frame[1]=record;frame[2]=SQInteger(3);frame[3]=SQInteger(0);frame[receiver_slot]=SQInteger(99);
        int releases=0;SQObjectPtr owner,weak;SQRefCounted *raw=NULL;
        if(mode) {
            ReleaseWitness *w=(ReleaseWitness *)sq_newuserdata(v,sizeof(ReleaseWitness));
            w->record=&record;w->count=&releases;sq_setreleasehook(v,-1,release_witness);
            frame[receiver_slot]=v->GetUp(-1);sq_pop(v,1);raw=_refcounted(frame[receiver_slot]);
            weak=raw->GetWeakRef(OT_USERDATA);
            if(mode==2 || mode==4) owner=frame[receiver_slot];
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==4) raw->_uiRef|=MARK_FLAG;
#endif
        }
        {
            SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            if(mode==3) CHECK(parent.RetainValue(frame[receiver_slot]) && ancestor.RetainValue(frame[receiver_slot]),
                "ignored receiver guard cannot mistake two journal pins for program ownership");
            SQObjectPtr result;SQInteger status;
            { SQJitExecutionScope scope(ctx,v);
              status=((SQJitNativeObjectFn)ignored_proto->_jit->_entry->_code.Entry())(frame.data(),&result,_closure(ignored)); }
            if(!mode) CHECK(status==SQ_JIT_NATIVE_RETURNED && sq_type(result)==OT_FLOAT && _float(result)==3.0 &&
                _integer(field(_SC("count")))==1,"non-owning ignored receiver keeps the lowered built-in native");
            else CHECK(status==SQ_JIT_NATIVE_GUARD_FAILED && releases==0 &&
                _integer(field(_SC("count")))==0 && sq_type(frame[receiver_slot])==OT_USERDATA &&
                sq_type(_weakref(weak)->_obj)==OT_USERDATA,
                "owning ignored receiver rejects with exact prefix rollback and no deferred callback");
#ifndef NO_GARBAGE_COLLECTOR
            if(mode==4) { CHECK(raw->_uiRef&MARK_FLAG,"ignored receiver guard preserves the mark");raw->_uiRef&=~(SQUnsignedInteger)MARK_FLAG; }
#endif
            frame[receiver_slot].Null();owner.Null();
        }
        if(mode) CHECK(releases==1 && sq_type(_weakref(weak)->_obj)==OT_NULL && !ctx.active_logs,
            "ignored receiver cleanup releases exactly once and restores ancestor state");
    }
    v->temp_reg.Null();
    }
    sq_close(v);
    printf("[coverage] executed AArch64 precise length and equality contracts\n");
#endif
    return failures;
}

int main()
{
    int failures = generated_length_intrinsics() + generated_exits() + generated_exit_sites() + generated_store_release() + generated_integer_comparisons() + generated_cache_proofs() + generated_caches() + generated_scalars() + generated_cached_release() + generated_reference_reads() + generated_copy_release();
#if defined(__aarch64__) && defined(__linux__)
    CHECK(native_test_groups==11,"all eleven AArch64 generated-code test groups actually execute");
    fprintf(stdout,"[coverage] executed %d AArch64 generated-code groups\n",native_test_groups);
#endif
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
