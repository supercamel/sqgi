#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqarray.h"
#include "sqstring.h"
#include "sqstdmath.h"
#include "jit/sqjit.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_input_plan.h"
#include "jit/sqjit_observe.h"
#include <cstdio>
#include <string>
#include <vector>

static int failures=0,releases=0;
#define CHECK(c) do {if(!(c)){std::fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#c);++failures;}}while(0)
static bool run(SQVM *v,const char *source) {
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,scstrlen(source),"input-plan",SQTrue));
    if(ok){sq_pushroottable(v);ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQFalse));}
    if(!ok){sq_getlasterror(v);const SQChar *error=nullptr;if(SQ_SUCCEEDED(sq_getstring(v,-1,&error)))std::fprintf(stderr,"%s\n",error);}
    sq_settop(v,top);return ok;
}
static SQObjectPtr named(SQVM *v,const char *name) {
    SQObjectPtr out;_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,name)),out);return out;
}
static SQInteger release_hook(SQUserPointer,SQInteger){++releases;return 0;}
static SQInteger other_length(HSQUIRRELVM v){sq_pushinteger(v,99);return 1;}

// These deliberately differ from vector reductions: a Horner recurrence with
// a live numeric argument, a nested configuration table, and an inlined caller.
// Each shape gets a fresh VM so native coverage cannot be hidden by fallback
// from an artifact compiled for an earlier array length.
static void general_cases() {
    std::vector<SQFloat> reference;
    for(bool enabled:{false,true}) {
        size_t sample=0;
        for(int width:{0,1,4,8,16,17}) {
            SQVM *v=sq_open(128);auto &ctx=sqjit_context(v->_sharedstate);
            ctx.enabled=enabled;ctx.threshold=2;ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
            std::string source="width <- "+std::to_string(width)+";\n"+R"(
class PricingRule {
    coefficients=null;factor=0.5;settings=null;
    constructor(c){coefficients=c;settings={offset=1.25}}
    function polynomial(x){local r=0.0;foreach(c in coefficients)r=r*x+c;return r}
    function quote(x){return polynomial(x)*factor+settings.offset}
}
rule <- PricingRule(array(width,0.5));
poly <- PricingRule.polynomial; quote <- PricingRule.quote;
samples <- [];
for(local n=0;n<20;n++){rule.polynomial(1.125);rule.quote(1.125);}
foreach(x in [0.0,0.5,1.125,-2.0])samples.append(rule.quote(x));
if(width>0)rule.coefficients[0]=0.75;
rule.factor=1.5;rule.settings={offset=7.25};
for(local n=0;n<200;n++)rule.settings["extra"+n]<-n;
foreach(x in [0.0,0.5,1.125,-2.0])samples.append(rule.quote(x));
delete rule.settings.offset;
local missing=false;try{rule.quote(0.5);}catch(e){missing=true;}
if(!missing)throw "missing nested input";
rule.settings.offset<-7.25;
)";
            bool ok=run(v,source.c_str());CHECK(ok);
            if(ok) {
                {
                    SQObjectPtr values=named(v,"samples");
                    for(SQInteger n=0;n<_array(values)->Size();++n) {
                        const auto &value=_array(values)->_values[n];CHECK(sq_type(value)==OT_FLOAT);
                        if(!enabled)reference.push_back(_float(value));
                        else {CHECK(sample<reference.size());if(sample<reference.size())CHECK(_float(value)==reference[sample]);}
                        ++sample;
                    }
                }
                if(enabled && width<=16)for(const char *name:{"poly","quote"}) {
                    SQJitObservation o={};sqjit_observe_proto(_closure(named(v,name))->_function,o);
                    CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                    CHECK(o.direct.successes+o.frame.successes>0);
                }
            }
            sq_close(v);
        }
    }
}

int main() {
    for(bool enabled:{false,true}) {
        SQVM *v=sq_open(256);sq_enabledebuginfo(v,SQTrue);
        sq_pushroottable(v);sqstd_register_mathlib(v);sq_pop(v,1);
        auto &ctx=sqjit_context(v->_sharedstate);ctx.enabled=enabled;ctx.threshold=2;
        ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
        bool ok=run(v,R"(
class Vector {
    data=null;
    constructor(a){data=a}
    function n(){return data.len()}
    function _get(i){if(typeof i!="integer")throw null;if(i<0 || i>=data.len())throw "index";return data[i]}
    function dot(b){if(n()!=b.n())throw "dimensions";local r=0.0;foreach(i,x in data)r+=x*b[i];return r}
    function squared_norm(){return dot(this)}
    function magnitude(){return sqrt(squared_norm())}
    function scaled_sum(scale){return data[0]*scale+data[1]}
    function total(){local r=0;foreach(x in data)r+=x;return r}
}
class Quaternion {
    w=1.0;x=2.0;y=2.0;z=0.0;
    function magnitude(){return sqrt(w*w+x*x+y*y+z*z)}
}
class Integers {x=7;function ratio(d){return x/d}}
integers <- Integers(); ratio <- Integers.ratio;
a <- Vector([1.0,2.0,3.0]); b <- Vector([4.0,5.0,6.0]); q <- Quaternion();
dot <- Vector.dot; norm <- Vector.squared_norm; scaled <- Vector.scaled_sum;
mag <- Quaternion.magnitude; total <- Vector.total;
vecmag <- Vector.magnitude;
for(local i=0;i<20;i++) {
    if(a.dot(b)!=32.0 || a.squared_norm()!=14.0 || a.scaled_sum(5.0)!=7.0 ||
       q.magnitude()!=3.0 || a.total()!=6.0 || a.magnitude()!=sqrt(14.0) || integers.ratio(2)!=3)throw "warm values";
}
)" );
        CHECK(ok);if(!ok){sq_close(v);continue;}
        {
            // A well-formed instruction stream can still read an uninitialized
            // local. Its previous VM value must never be assumed to be null.
            auto p=SQFunctionProto::Create(v->_sharedstate,6,1,1,0,0,0,0,0);
            SQObjectPtr owner(p);p->_stacksize=3;p->_bgenerator=false;p->_varparams=0;
            p->_literals[0]=SQObjectPtr(SQString::Create(v->_sharedstate,"data"));
            p->_instructions[0]=SQInstruction(_OP_GETK,2,0,0);
            p->_instructions[1]=SQInstruction(_OP_JZ,1,2);
            p->_instructions[2]=SQInstruction(_OP_LOADINT,1,9);
            p->_instructions[3]=SQInstruction(_OP_RETURN,1,1);
            p->_instructions[4]=SQInstruction(_OP_LOADINT,1,7);
            p->_instructions[5]=SQInstruction(_OP_RETURN,1,1);
            SQObjectPtr closure(SQClosure::Create(v->_sharedstate,p,_table(v->_roottable)->GetWeakRef(OT_TABLE)));
            SQObjectPtr args[]={named(v,"a")};SQJitInputPlan plan;
            CHECK(!plan.Build(p,args,_closure(closure)));
        }
        if(enabled) {
            for(const char *name:{"dot","norm","scaled","mag","total","vecmag","ratio"}) {
                auto p=_closure(named(v,name))->_function;SQJitObservation o={};sqjit_observe_proto(p,o);
                if(!o.compilation.compiled)std::fprintf(stderr,"%s rejected: %s\n",name,o.compilation.reason?o.compilation.reason:"unknown");
                CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes+o.frame.successes>0);
            }
            auto closure=_closure(named(v,"dot"));auto native=closure->_function->_jit->_entry;
            if(native) {
                CHECK(native->_stack_storage_slots>=2);
                auto entry=(SQJitNativeObjectFn)native->_code.Entry();
                SQObjectPtr args[MAX_FUNC_STACKSIZE],out(SQInteger(123));args[0]=named(v,"a");args[1]=named(v,"b");
                SQObjectPtr sentinel(SQArray::Create(v->_sharedstate,1));
                for(SQInteger n=2;n<MAX_FUNC_STACKSIZE;++n)args[n]=sentinel;
                SQJitExecutionScope scope(ctx,v);
                CHECK(entry(args,&out,closure)==SQ_JIT_NATIVE_RETURNED && sq_type(out)==OT_FLOAT && _float(out)==32.0);
                for(SQInteger n=2;n<MAX_FUNC_STACKSIZE;++n)CHECK(sq_type(args[n])==OT_ARRAY && _array(args[n])==_array(sentinel));
                CHECK(entry(args,&args[1],closure)==SQ_JIT_NATIVE_RETURNED && sq_type(args[1])==OT_FLOAT && _float(args[1])==32.0);
                args[1]=named(v,"b");
                SQObjectPtr original=v->_sharedstate->_array_len_closure;
                sq_newclosure(v,other_length,0);v->_sharedstate->_array_len_closure=v->GetUp(-1);sq_pop(v,1);
                CHECK(entry(args,&out,closure)==SQ_JIT_NATIVE_GUARD_FAILED);
                v->_sharedstate->_array_len_closure=original;
                sq_newuserdata(v,1);sq_setreleasehook(v,-1,release_hook);v->temp_reg=v->GetUp(-1);sq_pop(v,1);
                int previous=releases;out=SQInteger(123);
                CHECK(entry(args,&out,closure)==SQ_JIT_NATIVE_GUARD_FAILED && releases==previous && _integer(out)==123);
                v->temp_reg.Null();CHECK(releases==previous+1);
            }
        }
        // Root fallback must respect both a changed _get and the instance
        // default delegate, including when the old getter declined strings.
        {
            SQObjectPtr vector_class=named(v,"Vector");
            SQObjectPtr original_get=_class(vector_class)->_metamethods[MT_GET];
        CHECK(run(v,R"(
hits<-0;
Vector._get<-function(i){if(typeof i=="string"){::hits++;return function(x){return 41.0}};return data[i]};
if(a.magnitude()!=41.0 || hits!=1)throw "lookup metamethod changed";
)"));
            _class(vector_class)->_metamethods[MT_GET]=original_get;
        }
        sq_getdefaultdelegate(v,OT_INSTANCE);sq_pushstring(v,"sqrt",-1);sq_newclosure(v,other_length,0);
        CHECK(SQ_SUCCEEDED(sq_rawset(v,-3)));sq_pop(v,1);
        CHECK(run(v,"if(a.magnitude()!=99 || q.magnitude()!=99)throw \"default delegate shadows root\";"));
        sq_getdefaultdelegate(v,OT_INSTANCE);sq_pushstring(v,"sqrt",-1);
        CHECK(SQ_SUCCEEDED(sq_deleteslot(v,-2,SQFalse)));sq_pop(v,1);
        CHECK(run(v,R"(
a.data[0]=2.0;if(a.dot(b)!=36.0 || a.squared_norm()!=17.0)throw "live element";
a.data=[3.0,2.0,1.0];if(a.dot(b)!=28.0 || a.scaled_sum(5.0)!=17.0)throw "live field";
q.w=2.0;q.z=1.0;if(q.magnitude()!=sqrt(13.0))throw "live scalar fields";
q.w=0.0/0.0;local nan=q.magnitude();if(nan==nan)throw "NaN propagation";q.w=2.0;
local zero=false;try{integers.ratio(0);}catch(e){zero=true;}if(!zero)throw "division guard";
if(integers.ratio(2.0)!=3.5)throw "numeric argument type change";
local caught=false;b.data=[1.0];try{a.dot(b);}catch(e){caught=e=="dimensions";}if(!caught)throw "lost dimension error";
a.data=[];b.data=[];if(a.dot(b)!=0.0 || a.total()!=0)throw "empty arrays";
a.data=[9007199254740993,2];if(a.total()!=9007199254740995 || typeof a.total()!="integer")throw "int64 values";
a.data=array(17,1);b.data=array(17,2);if(a.dot(b)!=34.0 || a.total()!=17)throw "large shape fallback";
a.data=[1.0,2.0,3.0];b.data=[4.0,5.0,6.0];
hits <- 0;
local original_n=Vector.n;
Vector.n<-function(){::hits++;return data.len()};
if(a.dot(b)!=32.0 || hits!=2)throw "replaced method effects";
Vector.n<-original_n;
class Custom {
    function len(){::hits++;return 3}
    function _get(i){::hits++;return i+1.0}
}
b.data=Custom();hits=0;if(a.dot(b)!=14.0 || hits!=7)throw "custom callbacks";
b.data=[4.0,5.0,6.0];
local original_sqrt=::sqrt;
::sqrt=function(x){::hits++;return 91.0};hits=0;
if(q.magnitude()!=91.0 || hits!=1)throw "root binding effects";
::sqrt=original_sqrt;
local alternate_root={sqrt=function(x){return 77.0}};
Quaternion.magnitude.setroot(alternate_root);
if(q.magnitude()!=77.0)throw "method root changed";
Quaternion.magnitude.setroot(getroottable());
if(q.magnitude()!=sqrt(13.0))throw "restored root";
class Child extends Vector {
    function _get(i){::hits++;return data[i]+1}
}
local child=Child([4.0,5.0,6.0]);hits=0;
if(a.dot(child)!=38.0 || hits!=3)throw "different receiver class";
Quaternion.sqrt<-function(x){::hits++;return 66.0};hits=0;
if(q.magnitude()!=66.0 || hits!=1)throw "member shadows root";
function ephemeral() {
    local C=class {x=3.0;y=4.0;function sum(){return x+y}};
    local object=C();
    for(local i=0;i<20;i++)if(object.sum()!=7.0)throw "ephemeral sum";
    ::class_weak<-C.weakref();::instance_weak<-object.weakref();::saved_method<-C.sum;
}
ephemeral();
)"));
        // Isolate artifact ownership from interpreter caches and scratch slots.
        v->temp_reg.Null();
        for(SQUnsignedInteger n=v->_top;n<v->_stack.size();++n)v->_stack[n].Null();
        for(const char *name:{"ephemeral","saved_method"}) {
            auto p=_closure(named(v,name))->_function;
            for(SQUnsignedInteger n=0;n<p->_membercache.size();++n)p->_membercache[n].Clear();
        }
        sq_collectgarbage(v);
        CHECK(run(v,"if(class_weak!=null || instance_weak!=null)throw \"artifact retained input objects\";"));
        sq_close(v);
    }
    general_cases();
    if(!failures)std::puts("read-only input method JIT tests passed");
    return failures?1:0;
}
