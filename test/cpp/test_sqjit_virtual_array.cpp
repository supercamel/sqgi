#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqstring.h"
#include "jit/sqjit_virtual_array.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include <stdio.h>
#include <initializer_list>

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,scstrlen(source),_SC("virtual-array"),SQTrue));
    if(ok) { sq_pushroottable(v); ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQTrue)); }
    if(!ok) { sq_getlasterror(v); const SQChar *error=NULL; if(SQ_SUCCEEDED(sq_getstring(v,-1,&error))) scprintf(_SC("FAIL: %s\n"),error); }
    sq_settop(v,top); return ok;
}
static SQClosure *closure(SQVM *v, const SQChar *name)
{
    sq_pushroottable(v); sq_pushstring(v,name,-1); sq_get(v,-2);
    HSQOBJECT o; sq_getstackobj(v,-1,&o); sq_pop(v,2); return _closure(o);
}
int main()
{
    int failures=0;
#define CHECK(c,m) do { if(!(c)) { puts("FAIL: " m); ++failures; } } while(0)
    for(int enabled=0; enabled<2; ++enabled) {
        SQVM *v=sq_open(64); SQJitContext &ctx=sqjit_context(v->_sharedstate);
        ctx.enabled=enabled!=0; ctx.threshold=1; sqjit_observe_enable(v);
        CHECK(run(v,_SC(
            "function projection(x,y) { local p=[x,y]; return p[0]*p[1] }\n"
            "function capture(x,y) { local p=[x,y]; x=8; y=9; return p[0]*p[1] }\n"
            "function temporary_arrays(n) { local sum=0.0; for(local i=0;i<n;i++){local p=[i*0.5,i*0.25];sum+=p[0]+p[1]}; return sum }\n"
            "function returned(x) { local p=[x]; return p }\n"
            "function aliased(x) { local p=[x]; local q=p; return q[0] }\n"
            "function changed(x) { local p=[x]; p[0]=2; return p[0] }\n"
            "function callback(x,f) { local p=[x]; f(p); return p[0] }\n"
            "function branched(x,b) { local p=[x]; if(b) return p[0]; return 0 }\n"
            "function mixed(x,y) { local z=x*y; return z+x-y }\n"
            "for(local j=0;j<4;j++) {\n"
            " if(projection(3,4)!=12 || capture(3,4)!=12 || temporary_arrays(100)!=3712.5) throw \"scalar arrays\";\n"
            " if(returned(4)[0]!=4 || aliased(4)!=4 || changed(4)!=2 || callback(4,function(p){p[0]=9})!=9 || branched(4,true)!=4) throw \"escaping arrays\";\n"
            " if(mixed(3,2.5)!=8.0 || mixed(2.5,3)!=7.0) throw \"mixed arithmetic\";\n"
            "}\n"
            "if(temporary_arrays(0)!=0.0 || projection(1.5,2.5)!=3.75 || capture(1.5,2.5)!=3.75) throw \"floating arrays\";\n"
            "local caught=false; try { projection(1,\"bad\") } catch(e) { caught=true }; if(!caught) throw \"element guard\";\n"
        )),"virtual arrays and conservative fallback");
        for(const SQChar *name : {_SC("projection"),_SC("capture"),_SC("temporary_arrays"),
            _SC("returned"),_SC("aliased"),_SC("changed"),_SC("callback"),_SC("branched")}) {
            SQClosure *c=closure(v,name); SQFunctionProto *p=c->_function;
            SQBytecodeAnalysis analysis; CHECK(analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize),"bytecode analysis");
            SQJitVirtualArrayPlan plan; plan.Build(p,analysis,0,p->_ninstructions-1);
            bool eligible=scstrcmp(name,_SC("projection"))==0 || scstrcmp(name,_SC("capture"))==0 || scstrcmp(name,_SC("temporary_arrays"))==0;
            CHECK((plan.slots>0)==eligible,"escape analysis accepts only bounded scalar uses");
#if SQJIT_HAS_X64_NATIVE
            if(enabled && eligible) {
                SQJitObservation o={}; sqjit_observe_proto(p,o);
                CHECK(o.frame.successes>0,"virtual arrays actually execute natively");
                // Direct artifact execution cannot be rescued by interpreter
                // replay. Real allocation writes the destination VM stack slot;
                // scalar replacement must leave it null throughout this call.
                SQObjectPtr stack[MAX_FUNC_STACKSIZE],out;
                stack[1]=SQObjectPtr((SQInteger)100); stack[2]=SQObjectPtr((SQInteger)4);
                SQJitNative native;
                SQJitCompileResult result=sqjit_backend_compile_proto(p,stack,c,&native);
                CHECK(result.compiled,"compile scalar replacement artifact");
                if(result) {
                    SQInteger status=((SQJitNativeObjectFn)native._code.Entry())(stack,&out,c);
                    CHECK(status==SQ_JIT_NATIVE_RETURNED,"execute scalar replacement artifact");
                    for(const auto &a:plan.arrays) CHECK(sq_type(stack[a.reg])==OT_NULL,"no VM array is allocated");
                    if(scstrcmp(name,_SC("temporary_arrays"))==0) CHECK(sq_type(out)==OT_FLOAT && _float(out)==3712.5,"native floating loop result");
                    else CHECK(sq_type(out)==OT_INTEGER && _integer(out)==400,"native scalar projection result");
                }
            }
#endif
        }
        sq_close(v);
    }
    return failures?1:0;
}
