#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_object_plan.h"
#include "jit/sqjit_platform.h"
#include <sqstdmath.h>
#include <cmath>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <vector>

static bool run(SQVM *v,const char *source)
{
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,scstrlen(source),_SC("object-plan"),SQTrue));
    if(ok) { sq_pushroottable(v); ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQTrue)); }
    if(!ok) { sq_getlasterror(v); const SQChar *message=NULL; if(SQ_SUCCEEDED(sq_getstring(v,-1,&message))) printf("FAIL: %s\n",message); }
    sq_settop(v,top); return ok;
}
static SQClosure *closure(SQVM *v,const char *name)
{
    sq_pushroottable(v); sq_pushstring(v,name,-1);
    SQClosure *result=NULL;
    if(SQ_SUCCEEDED(sq_get(v,-2))) {
        HSQOBJECT object; sq_getstackobj(v,-1,&object);
        if(sq_type(object)==OT_CLOSURE) result=_closure(object);
        sq_pop(v,1);
    }
    sq_pop(v,1); return result;
}
static bool call(SQVM *v,const char *name,SQInteger n,SQFloat &result)
{
    SQInteger top=sq_gettop(v); sq_pushroottable(v); sq_pushstring(v,name,-1);
    bool ok=SQ_SUCCEEDED(sq_get(v,-2));
    if(ok) { sq_pushroottable(v); sq_pushinteger(v,n); ok=SQ_SUCCEEDED(sq_call(v,2,SQTrue,SQTrue)); }
    if(ok) ok=SQ_SUCCEEDED(sq_getfloat(v,-1,&result));
    sq_settop(v,top); return ok;
}
static SQJitObservation observe(SQVM *v,const char *name)
{ SQJitObservation o={}; SQClosure *c=closure(v,name); if(c) sqjit_observe_proto(c->_function,o); return o; }
static SQJitObjectPlan *plan(SQVM *v,const char *name)
{
    SQClosure *c=closure(v,name);
    return c && c->_function->_jit && c->_function->_jit->_entry ? c->_function->_jit->_entry->_object_plan : NULL;
}

int main()
{
    int failures=0;
#define CHECK(c,m) do { if(!(c)) { puts("FAIL: " m); ++failures; } } while(0)
    std::ifstream file("test/bench_vec3.nut"); std::ostringstream text; text<<file.rdbuf();
    std::string definitions=text.str(); size_t marker=definitions.find("// The observer loads");
    if(marker==std::string::npos) { puts("FAIL: benchmark definitions missing"); return 1; }
    definitions.resize(marker);
    const char *names[]={"arrays_operators","arrays_methods","reuse_methods"};
    const SQInteger counts[]={120,1,0,2,3,11,119,1000,4000,-1};
    std::vector<SQFloat> expected;
    for(int enabled=0;enabled<2;++enabled) {
        SQVM *v=sq_open(1024); SQJitContext &ctx=sqjit_context(v->_sharedstate);
        ctx.enabled=enabled!=0; ctx.threshold=1; ctx.trace=ctx.trace_stats=false; sqjit_observe_enable(v);
        sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v,1);
        CHECK(run(v,definitions.c_str()),"load real Vec3 kernels");
        size_t sample=0;
        for(const char *name:names) {
            for(SQInteger n:counts) {
                SQFloat value=0;
                CHECK(call(v,name,n,value),"Vec3 call succeeds");
                if(!enabled) expected.push_back(value);
                else CHECK(std::isfinite(value) && std::fabs(value-expected[sample])<1e-12,"original Vec3 agrees with interpreter");
                ++sample;
            }
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
            if(enabled) {
                SQJitObjectPlan *p=plan(v,name);
                CHECK(p && p->allocations_removed>0 && p->calls_inlined>0,"original object program is scalar-replaced");
                CHECK(observe(v,name).frame.successes>0,"scalar-replaced frame executes");
                // Invoke the artifact without VM rescue; virtual object slots
                // must remain untouched, proving this is real elimination.
                if(p) {
                    printf("scalarized %s: %lld instructions, %lld slots, %lld allocations, %lld calls\n",name,
                        (long long)p->Lowered()->_ninstructions,(long long)p->Lowered()->_stacksize,
                        (long long)p->allocations_removed,(long long)p->calls_inlined);
                    SQObjectPtr stack[MAX_FUNC_STACKSIZE],out;
                    sq_pushroottable(v); HSQOBJECT root; sq_getstackobj(v,-1,&root); stack[0]=root; sq_pop(v,1);
                    stack[1]=SQObjectPtr((SQInteger)120);
                    SQInteger status=sqjit_object_plan_entry(stack,&out,closure(v,name));
                    CHECK(status==SQ_JIT_NATIVE_RETURNED && sq_type(out)==OT_FLOAT &&
                        std::fabs(_float(out)-0.021712587807413163)<1e-12,"direct scalar artifact checksum");
                    for(SQInteger n=2;n<MAX_FUNC_STACKSIZE;++n) CHECK(sq_type(stack[n])==OT_NULL,"no virtual object reaches VM stack");
                }
            }
#endif
        }
        CHECK(run(v,"for(local i=0;i<3;i++) { if(fabs(arrays_operators(5.5)-arrays_operators(6))>1e-12) throw \"numeric parameter guard\"; }\n"
            "class ScalarBox { value=null; constructor(x=1.25){value=x} }\n"
            "function boxed(n) { local b=ScalarBox(n); return b.value*2 }\n"
            "function default_box(n) { local b=ScalarBox(); return b.value+n }\n"
            "function escaping(n) { local b=ScalarBox(n); return b }\n"
            "function aliases(n) { local a=Vec_arrays_operators(1.0,2.0,3.0),b=a; for(local i=0;i<n;i++){ b.set(0,a.get(0)+0.5) };return a.dot(b) }\n"
            "function changing_alias(n) { local a=Vec_arrays_operators(1.0,2.0,3.0),b=Vec_arrays_operators(2.0,3.0,4.0);for(local i=0;i<n;i++){b=a;b.set(0,a.get(0)+0.5)};return a.dot(b) }\n"
            "function rotating(n) {local a=Vec_arrays_operators(1.0,2.0,3.0),b=Vec_arrays_operators(4.0,5.0,6.0);for(local i=0;i<n;i++){local t=a;a=b;b=t;a.set(0,a.get(0)+n)};return a.dot(b)}\n"
            "function indexed(i) { local a=Vec_arrays_operators(1.25,2.5,3.75);a.set(i,7.5);return a.dot(a) }\n"
            "hits<-0;class EffectBox { value=null;constructor(x){hits=hits+1;value=x} }\n"
            "function effect(n) {local b=EffectBox(n);return b.value}\n"
            "class LateBox {value=null;constructor(){}}\n"
            "function late_field(n) {local b=LateBox();for(local i=0;i<n;i++){b.value=i};return b.value+1}\n"
            "for(local j=0;j<4;j++){\n"
            " if(boxed(4.25)!=8.5 || default_box(2)!=3.25 || escaping(7).value!=7 || aliases(4)!=22 || changing_alias(4)!=22) throw \"object values and aliases\";\n"
            " if(indexed(0)!=76.5625 || indexed(1)!=71.875 || indexed(2)!=64.0625) throw \"virtual dynamic store\";\n"
            " if(effect(j)!=j) throw \"constructor effects\";\n"
            " if(late_field(3)!=3) throw \"loop initializes field\";\n"
            " if(rotating(3)!=68 || rotating(4)!=136 || rotating(0)!=32) throw \"parallel object copies at backedge\";\n"
            "}\n"
            "local caught=false;try{late_field(0)}catch(e){caught=true};if(!caught) throw \"zero-trip null field\";\n"
            "if(indexed(1.9)!=71.875 || indexed(-0.5)!=76.5625) throw \"fractional array indices\";\n"
            "if(hits!=4) throw \"constructor effects replayed\";\n"
            "foreach(i in [-1,3,100]) { local caught=false;try{indexed(i)}catch(e){caught=true};if(!caught) throw \"virtual bounds exception\"; }\n"
        ),"aliases, default constructors, escapes, effects and bounds");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) {
#if SQJIT_HAS_X64_NATIVE
            CHECK(plan(v,"boxed") && plan(v,"default_box") && plan(v,"aliases") && plan(v,"indexed"),"generic record kernels scalarize");
            CHECK(plan(v,"rotating"),"loop object swaps scalarize");
#endif
            CHECK(!plan(v,"escaping") && !plan(v,"effect") && !plan(v,"changing_alias"),"observable escapes/effects and changing aliases are rejected");
            CHECK(!plan(v,"late_field"),"loop cannot change incoming field layout");
            CHECK(observe(v,"aliases").direct.successes>0,"inlined methods run on direct-call route");
            CHECK(observe(v,"indexed").direct.guard_failures>0,"virtual bounds guard falls back");
        }
#endif
        sq_collectgarbage(v);
        CHECK(run(v,"offset<-2; class RootReader {function read(n){typeof n;local total=0;for(local i=0;i<n;i++){total=total+offset};return total}}\n"
            "reader<-RootReader();reader_loop<-RootReader.read;\n"
            "for(local i=0;i<4;i++){if(reader.read(10)!=20) throw \"initial loop root\";}\n"
            "loop_root<-{offset=3};RootReader.read.setroot(loop_root);\n"
            "if(reader.read(10)!=30) throw \"changed loop root\";\n"
        ),"loop root identity and embedded weak-reference lifetime");
#if SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v,"reader_loop").loop.successes>0 && observe(v,"reader_loop").loop.guard_failures>0,
            "loop root mutation actually guards native code");
#endif
        CHECK(run(v,"class GuardBox {value=1;constructor(x){value=x}function make(x){return GuardBox(x)}function read(){return value}}\n"
            "function factory(n){local a=GuardBox(n);local b=a.make(n+1);return b.read()}\n"
            "for(local i=0;i<4;i++) {if(factory(4)!=5) throw \"initial factory\";}\n"
            "alternate_root<-{GuardBox=class {value=0;constructor(x){value=x+10}function read(){return value}}};\n"
            "GuardBox.make.setroot(alternate_root);\n"
            "if(factory(4)!=15) throw \"method root mutation\";\n"
            "GuardBox.make.setroot(getroottable());\n"
            "if(factory(4)!=5) throw \"method root restoration\";\n"
            "GuardBox._get<-function(key){if(key==\"GuardBox\") return function(x){return ::GuardBox(x+30)};throw key};\n"
            "if(factory(4)!=35) throw \"new lookup metamethod\";\n"
            "GuardBox.GuardBox<-function(x){return ::GuardBox(x+20)};\n"
            "if(factory(4)!=25) throw \"new member shadows root class\";\n"
            "if(boxed(4503599627370497)!=9007199254740994 || typeof boxed(4503599627370497)!=\"integer\") throw \"int64 object arithmetic\";\n"
        ),"root lookup guards and full-width numeric values");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v,"factory").direct.guard_failures>=3,
            "mutated lookup dependencies invalidate scalarized calls");
#endif
        // An instance's default delegate is searched before root fallback.
        sq_getdefaultdelegate(v,OT_INSTANCE); sq_pushstring(v,"Vec_arrays_operators",-1);
        sq_pushroottable(v); sq_pushstring(v,"ScalarBox",-1); sq_get(v,-2); sq_remove(v,-2);
        CHECK(SQ_SUCCEEDED(sq_rawset(v,-3)),"replace instance default delegate lookup");
        sq_pop(v,1);
        CHECK(run(v,"local caught=false;try{arrays_operators(5)}catch(e){caught=true};if(!caught) throw \"default delegate shadow\";"),
            "new default delegate member precedes root class");
        sq_getdefaultdelegate(v,OT_INSTANCE); sq_pushstring(v,"Vec_arrays_operators",-1);
        sq_deleteslot(v,-2,SQFalse); sq_pop(v,1);
        CHECK(run(v,"if(fabs(arrays_operators(120)-0.021712587807413163)>1e-12 || boxed(4.25)!=8.5) throw \"code dependencies after GC\";\n"
            "ScalarBox.constructor<-function(x=1.25){value=x+2};\n"
            "if(boxed(4.25)!=12.5 || default_box(2)!=5.25) throw \"same-class constructor replacement\";\n"
            "ScalarBox<-class {value=null;constructor(x=2.0){value=x+1}};\n"
            "if(boxed(4.25)!=10.5 || default_box(2)!=5.0) throw \"class/constructor rebinding\";\n"
            "Vec_arrays_operators.dot<-function(o){return 4.5};\n"
            "if(fabs(arrays_operators(1000)-4.95)>1e-10) throw \"method rebinding\";\n"
        ),"class/method identity guards and dependency lifetime");
        sq_collectgarbage(v);
        CHECK(run(v,"if(boxed(5)!=12 || fabs(arrays_operators(1000)-4.95)>1e-10) throw \"collected dependencies\";"),"collected dependencies invalidate native assumptions");
        sq_close(v);
    }
    return failures?1:0;
}
