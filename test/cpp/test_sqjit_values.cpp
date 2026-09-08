#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include <stdio.h>
#include <initializer_list>

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("jit-values"), SQTrue));
    if(ok) {
        sq_pushroottable(v);
        ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue));
    }
    if(!ok) {
        sq_getlasterror(v);
        const SQChar *message = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &message))) scprintf(_SC("FAIL: %s\n"), message);
    }
    sq_settop(v, top);
    return ok;
}

static SQJitObservation observe(SQVM *v, const SQChar *name)
{
    SQJitObservation result = {};
    sq_pushroottable(v);
    sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT obj;
        sq_getstackobj(v, -1, &obj);
        if(sq_type(obj) == OT_CLOSURE) sqjit_observe_proto(_closure(obj)->_function, result);
        sq_pop(v, 1);
    }
    sq_pop(v, 1);
    return result;
}

int main()
{
    int failures = 0;
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(64);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0;
        ctx.threshold = 1;
        ctx.trace = ctx.trace_stats = false;
        sqjit_observe_enable(v);
        const SQChar *source = _SC(
            "function eq(x) { return x == 1 }\n"
            "function ne(x) { return x != 1 }\n"
            "function moved(x) { local b=x==1; local c=b; return c }\n"
            "function marker(x) { return x }\n"
            "function region(n) { marker(0); local b=false; for(local i=0;i<n;i++) b=i==3; return marker(b) }\n"
            "function stores(a,t,x) { a[0]=x==1; t.value=x!=1; return a[0] }\n"
            "function arithmetic(x) { return (x==1)+2 }\n"
            "function arithmetic_float(x) { return (x==1)+2.0 }\n"
            "function negated(x) { return -(x==1) }\n"
            "function mixed(flag) { local x=0; if(flag) x=true; return x }\n"
            "function mixed_float(flag) { local x=0; if(flag) x=1.5; return x }\n"
            "function index(flag,a) { local x=0; if(flag) x=1; return a[x] }\n"
            "function diamond(flag) { local x=0; if(flag) x=7; else x=2; return x+10 }\n"
            "function verify(b, expected) { if(typeof b!=\"bool\" || b!=expected) throw \"boolean result tag/value\" }\n"
            "for(local i=0;i<3;i++) { verify(eq(1),true); verify(eq(2),false); verify(ne(1),false); verify(ne(2),true); verify(moved(1),true); verify(moved(2),false); }\n"
            "verify(region(4),true); verify(region(5),false); verify(region(0),false);\n"
            "local a=[0], t={value=0}; stores(a,t,1); verify(a[0],true); verify(t.value,false); stores(a,t,2); verify(a[0],false); verify(t.value,true);\n"
            "local threw=false; try { arithmetic(1) } catch(e) { threw=true } if(!threw) throw \"boolean accepted as integer\";\n");
        if(!run(v, source)) ++failures;
        if(!run(v, _SC("foreach(f in [arithmetic_float,negated]) { for(local n=0;n<3;n++) { local caught=false; try { f(1) } catch(e) { caught=true }; if(!caught) throw \"boolean numeric coercion\"; } }"))) ++failures;
        if(!run(v, _SC("if(typeof mixed(0)!=\"integer\" || mixed(0)!=0 || mixed(1)!=true) throw \"branch result tag\";"
            "if(typeof mixed_float(0)!=\"integer\" || mixed_float(0)!=0 || mixed_float(1)!=1.5) throw \"branch numeric tag\";"))) ++failures;
        if(!run(v, _SC("for(local n=0;n<3;n++) { if(index(0,[10,20])!=10 || index(1,[10,20])!=20 || diamond(0)!=12 || diamond(1)!=17) throw \"branch constant value\"; }"))) ++failures;
        // A parameter first read inside one arm must also be available when
        // execution skips that arm. Exercise frame entry, direct calls,
        // changed values and both scalar tags, with observable field writes.
        if(!run(v, _SC(
            "function choose_set(t,i,value) { if(i==0) t.x=value; else if(i==1) t.y=value; else t.z=value; return value }\n"
            "function choose_add(i,value) { if(i==0) return value+1; else if(i==1) return value+2; return value+3 }\n"
            "class BranchFields { x=0; y=0; z=0 }\n"
            "foreach(t in [{x=0,y=0,z=0},BranchFields()]) {\n"
            " foreach(value in [20.5,30.75,4294967297,-123.125,17]) {\n"
            "  foreach(i in [1,2,0,2,1]) {\n"
            "   t.x=0; t.y=0; t.z=0; local r=choose_set(t,i,value);\n"
            "   if(r!=value || typeof r!=typeof value || t.x!=(i==0?value:0) || t.y!=(i==1?value:0) || t.z!=(i==2?value:0)) throw \"branch parameter store\";\n"
            "   if(choose_add(i,value)!=value+i+1) throw \"branch parameter arithmetic\";\n"
            "  }\n"
            " }\n"
            "}\n"
        ))) ++failures;
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) {
            for(const SQChar *name : {_SC("choose_set"), _SC("choose_add")}) {
                SQJitObservation o = observe(v, name);
                if(!o.frame.successes || !o.direct.successes) {
                    scprintf(_SC("FAIL: native branch parameter routes for %s\n"), name);
                    ++failures;
                }
            }
            for(const SQChar *name : {_SC("eq"), _SC("ne"), _SC("moved")}) {
                SQJitObservation o = observe(v, name);
                if(!o.compilation.compiled || o.compilation.backend == SQ_JIT_BACKEND_CPP ||
                    !o.frame.successes || !o.direct.successes) {
                    scprintf(_SC("FAIL: native frame/direct routes for %s\n"), name);
                    ++failures;
                }
            }
            if(!observe(v, _SC("region")).loop.successes) {
                puts("FAIL: native boolean loop exit");
                ++failures;
            }
        }
#endif
        sq_close(v);
    }
    return failures ? 1 : 0;
}
