#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include "jit/sqjit_leaf.h"
#include <stdio.h>
#include <initializer_list>

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("jit-leaf"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) {
        sq_getlasterror(v); const SQChar *error = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("FAIL: %s\n"), error);
    }
    sq_settop(v, top); return ok;
}

static SQFunctionProto *prototype(SQVM *v, const SQChar *name)
{
    SQFunctionProto *result = NULL;
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT object; sq_getstackobj(v, -1, &object);
        if(sq_type(object) == OT_CLOSURE) result = _closure(object)->_function;
        sq_pop(v, 1);
    }
    sq_pop(v, 1); return result;
}

static SQJitObservation observe(SQVM *v, const SQChar *name)
{
    SQJitObservation result = {};
    sqjit_observe_proto(prototype(v, name), result);
    return result;
}
static void debug_hook(HSQUIRRELVM, SQInteger, const SQChar *, SQInteger, const SQChar *) {}

int main()
{
    int failures = 0;
#define CHECK(c, message) do { if(!(c)) { puts("FAIL: " message); ++failures; } } while(0)
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(64);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1;
        ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
        CHECK(run(v, _SC(
            "function step(x,y) { return (x*33+y)%97 }\n"
            "function call_step(x,y) { return step(x,y)+1 }\n"
            "function nested_calls(x) { return step(step(x,1),step(x,2)) }\n"
            "function bump(x) { x=x+7; return x }\n"
            "function isolated(x) { local y=bump(x); return x*100+y }\n"
            "function choose(x,y,flag) { local r=0; if(flag) r=x+3; else r=y+2; return r }\n"
            "function call_choose(x,y,flag) { return choose(x,y,flag) }\n"
            "function blend(x,y) { return x*1.5+y }\n"
            "function call_blend(x,y) { return blend(x,y) }\n"
            "function less(x,y) { return x<y }\n"
            "function call_less(x,y) { return less(x,y) }\n"
            "function equal(x,y) { return x==y }\n"
            "function call_equal(x,y) { return equal(x,y) }\n"
            "function call_bool_equal(x,y) { return equal(x,y) }\n"
            "function early_return(x) { if(x<0) return -x; if(x==17) return x+1; return x-2 }\n"
            "function call_early_return(x) { return early_return(x) }\n"
            "function division(x,y) { return x/y }\n"
            "function logged_division(a,x,y) { a[0]=a[0]+1; return division(x,y) }\n"
            "function logged_step(a,x,y) { a[0]=a[0]+1; return step(x,y) }\n"
            "function prep_mutation(x) { return step((this.step=9),x) }\n"
            "function mixed(flag,x) { if(flag) return x; return true }\n"
            "function mixed_join(flag) { local x=0; if(flag) x=true; return x }\n"
            "function captured() { local n=3; return function(x) { return x+n } }\n"
            "closed <- captured();\n"
            "function impure(x) { this.side=x; return x }\n"
            "function receiver(x) { return this.side+x }\n"
            "function recursive(x) { return recursive(x-1) }\n"
            "function default_arg(x=1) { return x }\n"
            "function varying(...) { return 1 }\n"
            "function has_loop(x) { while(x>0) x=x-1; return x }\n"
            "function barrier(x) { return typeof x }\n"
            "function call_loop(n) { barrier(0); local s=0; for(local i=0;i<n;i++) s+=step(i,1); return s }\n"
            "function volatile_leaf(x) { return x+5 }\n"
            "function volatile_caller(x) { return volatile_leaf(x) }\n"
            "function call_mixed(flag,x) { return mixed(flag,x) }\n"
            "for(local n=0;n<3;n++) {\n"
            " if(call_step(4,2)!=38 || nested_calls(2)!=48 || isolated(4)!=411) throw \"integer call values\";\n"
            " if(call_choose(10,20,true)!=13 || call_choose(10,20,false)!=22) throw \"branch values\";\n"
            " if(call_blend(4,0.5)!=6.5) throw \"mixed float arguments\";\n"
            " if(call_less(1,2)!=true || call_less(2,1)!=false || typeof call_less(1,2)!=\"bool\") throw \"comparison tag\";\n"
            " if(call_equal(1,1)!=true || call_equal(1,2)!=false) throw \"equality values\";\n"
            " if(call_bool_equal(true,true)!=true || call_bool_equal(true,false)!=false) throw \"boolean equality\";\n"
            " for(local x=-30;x<30;x++) { local expected=x<0 ? -x : (x==17 ? x+1 : x-2);\n"
            "  if(call_early_return(x)!=expected) throw \"early return branches\"; }\n"
            " local a=[0]; if(logged_division(a,9,2)!=4 || a[0]!=1) throw \"division value\";\n"
            " a=[0]; if(logged_step(a,4,2)!=37 || a[0]!=1) throw \"logged call value\";\n"
            " local expected=0; for(local i=0;i<20;i++) expected+=(i*33+1)%97;\n"
            " if(call_loop(20)!=expected || volatile_caller(7)!=12) throw \"loop call value\";\n"
            " if(call_mixed(true,3)!=3 || call_mixed(false,3)!=true) throw \"mixed return fallback\";\n"
            "}\n")), "define and warm scalar calls");
        SQJitLeafPlan plan;
        CHECK(plan.Build(prototype(v, _SC("choose")), {SQ_JIT_SLOT_UNKNOWN,SQ_JIT_SLOT_INT,SQ_JIT_SLOT_INT,SQ_JIT_SLOT_BOOL}) &&
            plan.return_kind == SQ_JIT_SLOT_INT, "analysis merges scalar branch definitions");
        CHECK(!plan.Build(prototype(v, _SC("mixed")), {SQ_JIT_SLOT_UNKNOWN,SQ_JIT_SLOT_BOOL,SQ_JIT_SLOT_INT}), "mixed return tags rejected");
        CHECK(!plan.Build(prototype(v, _SC("mixed_join")), {SQ_JIT_SLOT_UNKNOWN,SQ_JIT_SLOT_BOOL}), "mixed live join tags rejected");
        CHECK(!plan.Build(prototype(v, _SC("bump")), {SQ_JIT_SLOT_UNKNOWN,SQ_JIT_SLOT_BOOL}), "boolean arithmetic rejected");
        for(const SQChar *name : {_SC("impure"),_SC("receiver"),_SC("recursive"),_SC("default_arg"),
            _SC("closed"),_SC("varying"),_SC("has_loop")})
            CHECK(!SQJitLeafPlan::Eligible(prototype(v,name)), "unsupported effects/function shapes rejected");
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            for(const SQChar *name : {_SC("call_step"),_SC("nested_calls"),_SC("isolated"),_SC("call_choose"),
                _SC("call_blend"),_SC("call_less"),_SC("call_equal"),_SC("call_bool_equal"),_SC("call_early_return"),
                _SC("logged_division"),_SC("logged_step"),_SC("volatile_caller")}) {
                SQJitObservation o = observe(v,name);
                if(!o.compilation.compiled || o.compilation.backend != SQ_JIT_BACKEND_X64 || !o.frame.successes || !o.direct.successes) {
                    scprintf(_SC("FAIL: native caller routes: %s\n"),name); ++failures;
                }
            }
            CHECK(observe(v,_SC("call_loop")).loop.successes > 0 && !observe(v,_SC("call_loop")).loop.guard_failures,
                "native loop contains leaf call");
        }
#endif
        CHECK(run(v, _SC(
            "for(local n=0;n<3;n++) { local original=step; local expected=(9*33+2)%97;\n"
            " if(prep_mutation(2)!=expected || step!=9) throw \"prepared callee survives argument mutation\"; step=original; }\n"
            "if(call_blend(4.0,0.5)!=6.5 || call_equal(true,true)!=true || call_equal(true,false)!=false) throw \"argument type fallback\";\n"
            "foreach(y in [-3,0]) { local a=[0]; local caught=false; local value=0; try { value=logged_division(a,9,y) } catch(e) { caught=true };\n"
            " if(a[0]!=1 || (y==0 && !caught) || (y==-3 && (caught || value!=-3))) throw \"callee guard rollback\"; }\n"
            "local original=step; step=function(x,y) { return x-y };\n"
            "if(call_step(4,2)!=3) throw \"callee rebinding\"; local a=[0]; if(logged_step(a,4,2)!=2 || a[0]!=1) throw \"rebound callee rollback\";\n"
            "step=original.bindenv({}); if(call_step(4,2)!=38) throw \"bound callee fallback\"; step=original;\n")), "fallback, parameter binding and rollback");
        SQObjectPtr weak(prototype(v,_SC("volatile_leaf"))->GetWeakRef(OT_FUNCPROTO));
        CHECK(run(v,_SC("volatile_leaf=function(x) { return x+20 }; collectgarbage(); if(volatile_caller(7)!=27) throw \"expired callee\";")), "expired callee falls back");
        CHECK(sq_type(_weakref(weak)->_obj)==OT_NULL, "native dependency does not keep obsolete prototype alive");
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            CHECK(observe(v,_SC("logged_division")).direct.guard_failures > 0, "inlined arithmetic guard observed");
            CHECK(observe(v,_SC("logged_step")).direct.guard_failures > 0, "callee guard observed after mutation");
            CHECK(observe(v,_SC("volatile_caller")).direct.guard_failures > 0, "expired prototype guard observed");
            SQJitObservation before = observe(v,_SC("call_step"));
            sq_setnativedebughook(v,debug_hook);
            CHECK(run(v,_SC("if(call_step(4,2)!=38) throw \"debugger\";")), "debugger preserves leaf calls");
            SQJitObservation after = observe(v,_SC("call_step"));
            CHECK(before.direct.successes==after.direct.successes && before.frame.successes==after.frame.successes,
                "debugger suspends caller artifact");
            sq_setnativedebughook(v,NULL);
        }
#endif
        sq_close(v);
    }
    return failures ? 1 : 0;
}
