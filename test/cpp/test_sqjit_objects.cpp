#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include <stdio.h>

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,scstrlen(source),_SC("jit-objects"),SQTrue));
    if(ok) { sq_pushroottable(v); ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQTrue)); }
    if(!ok) { sq_getlasterror(v); const SQChar *error=NULL; if(SQ_SUCCEEDED(sq_getstring(v,-1,&error))) scprintf(_SC("FAIL: %s\n"),error); }
    sq_settop(v,top); return ok;
}
static SQJitObservation observe(SQVM *v, const SQChar *name)
{
    SQJitObservation o={}; SQInteger top=sq_gettop(v);
    sq_pushroottable(v); sq_pushstring(v,name,-1);
    if(SQ_SUCCEEDED(sq_get(v,-2))) { HSQOBJECT value; sq_getstackobj(v,-1,&value); sqjit_observe_proto(_closure(value)->_function,o); }
    sq_settop(v,top); return o;
}
static SQInteger fake_length(HSQUIRRELVM v) { sq_pushinteger(v,9); return 1; }
int main()
{
    int failures=0;
#define CHECK(c,m) do { if(!(c)) { puts("FAIL: " m); ++failures; } } while(0)
    for(int enabled=0; enabled<2; ++enabled) {
        SQVM *v=sq_open(64); SQJitContext &ctx=sqjit_context(v->_sharedstate);
        ctx.enabled=enabled!=0; ctx.threshold=1; sqjit_observe_enable(v);
        CHECK(run(v,_SC(
            "function marker(x) { return typeof x }\n"
            "function transfer(t,a,n) { marker(0); local sum=0; for(local i=0;i<n;i++) { local previous=t.active; t.active=t.spare; t.spare=previous; t.label=i%2==0?\"even\":\"odd\"; sum+=t.active[0]+t.label.len()+a[i]*2 }; return sum }\n"
            "function numeric(t,n) { local sum=0; for(local i=0;i<n;i++) { t.value=t.value+1; sum+=t.value }; return sum }\n"
            "class Fields { active=null; spare=null; label=\"init\"; value=0; constructor(){ active=[1];spare=[2] } }\n"
            "for(local j=0;j<3;j++) { foreach(t in [{active=[1],spare=[2],label=\"init\"},Fields()]) {\n"
            " local a=t.active.weakref(), b=t.spare.weakref(); if(transfer(t,[10,20,30,40],4)!=220 || t.active!=a.ref() || t.spare!=b.ref() || t.label!=\"odd\") throw \"object transfers\";\n"
            " if(transfer(t,[1,1,1,1],0)!=0 || t.active!=a.ref()) throw \"zero trip\";\n"
            "}\n"
            "local f=Fields(); if(numeric(f,20)!=210 || f.value!=20) throw \"instance scalar fields\"; }\n"
            "local t={active=[1],spare=[2],label=\"init\"}; local a=t.active.weakref(), b=t.spare.weakref();\n"
            "local caught=false;try { transfer(t,[10,20,\"bad\",40],4) } catch(e) {caught=true};\n"
            "if(!caught || t.active!=b.ref() || t.spare!=a.ref() || t.label!=\"even\") throw \"late guard partial replay\";\n"
            "t={active=[1],spare=[2],label=\"init\"}; t.spare=t.active; if(transfer(t,[1,1,1,1],4)!=26 || t.active!=t.spare) throw \"aliased owners\";\n"
        )),"object values, aliases, tags and rollback");
        CHECK(run(v,_SC(
            "class ArrayVector { values=null; constructor(x,y,z){values=[x,y,z]} }\n"
            "function array_dot(a,b) { return a.values[0]*b.values[0]+a.values[1]*b.values[1]+a.values[2]*b.values[2] }\n"
            "function array_update(a,b) { a.values[0]=a.values[0]+b.values[0]; a.values[1]=a.values[1]+b.values[1]; a.values[2]=a.values[2]+b.values[2]; return a.values[2] }\n"
            "function nested_read(a) { local row=a.values[1]; return row[0]+row[1] }\n"
            "function array_zero(a) { a.values[0]=0.25 }\n"
            "function borrowed_after_write(a) {local old=a.values;a.values=0;return old[0]+old[1]}\n"
            "for(local j=0;j<3;j++) { local a=ArrayVector(1.25,2.5,3.75),b=ArrayVector(4.25,5.5,6.75);\n"
            " if(array_dot(a,b)!=44.375) throw \"array member dot\";\n"
            " if(array_update(a,b)!=10.5 || a.values[0]!=5.5 || a.values[1]!=8.0) throw \"array member update\";\n"
            " if(array_zero(a)!=null || a.values[0]!=0.25) throw \"implicit null mutation return\";\n"
            " local owner=ArrayVector(1.25,2.5,3.75);if(borrowed_after_write(owner)!=3.75 || owner.values!=0) throw \"displaced array owner\";\n"
            " if(nested_read({values=[[9],[1.25,2.5]]})!=3.75) throw \"nested borrowed array\"; }\n"
            "local a=ArrayVector(1.25,2.5,3.75),b=ArrayVector(4.25,5.5,6.75);\n"
            "b.values=[4.25,null,6.75]; local caught=false; try{array_update(a,b)}catch(e){caught=true};\n"
            "if(!caught || a.values[0]!=5.5 || a.values[1]!=2.5 || a.values[2]!=3.75) throw \"array update fallback replay\";\n"
            "b.values=[4.25]; caught=false;try{array_dot(a,b)}catch(e){caught=true};if(!caught) throw \"short member array\";\n"
            "a=ArrayVector(1.25,2.5,3.75);if(array_update(a,a)!=7.5 || a.values[0]!=2.5 || a.values[1]!=5.0) throw \"aliased member arrays\";\n"
            "local owner={values=[1.25,null]};caught=false;try{borrowed_after_write(owner)}catch(e){caught=true};if(!caught || owner.values!=0) throw \"displaced owner fallback\";\n"
        )),"native array-backed methods and fallback");
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            CHECK(observe(v,_SC("array_dot")).frame.successes>0 && observe(v,_SC("array_dot")).direct.successes>0,"array member dot executes natively");
            CHECK(observe(v,_SC("array_update")).frame.successes>0 && observe(v,_SC("array_update")).direct.successes>0,"array member mutation executes natively");
            CHECK(observe(v,_SC("array_update")).direct.guard_failures>0,"member mutation guard triggers rollback");
            CHECK(observe(v,_SC("nested_read")).direct.successes>0,"nested array reads execute natively");
            CHECK(observe(v,_SC("array_zero")).direct.successes>0,"implicit null mutator executes natively");
            CHECK(observe(v,_SC("borrowed_after_write")).direct.successes>0 && observe(v,_SC("borrowed_after_write")).direct.guard_failures>0,
                "displaced array owners survive native reads and guard rollback");
            CHECK(observe(v,_SC("transfer")).loop.successes>0,"object transfers execute natively");
            CHECK(observe(v,_SC("transfer")).loop.guard_failures>0,"late guard actually uses native rollback");
            CHECK(observe(v,_SC("numeric")).frame.successes>0,"instance field arithmetic executes natively");
        }
#endif
        // A replaced default delegate must remain observable after compilation.
        sq_getdefaultdelegate(v,OT_STRING); sq_pushstring(v,_SC("len"),-1); sq_newclosure(v,fake_length,0); sq_rawset(v,-3); sq_pop(v,1);
        CHECK(run(v,_SC("local t={active=[1],spare=[2],label=\"init\"}; if(transfer(t,[1,1,1,1],4)!=50) throw \"rebound string delegate\";")),"string length identity guard");
        sq_close(v);
    }
    return failures?1:0;
}
