#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqclass.h"
#include "jit/sqjit.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit_context.h"
#include <cstdio>

static int failures=0, releases=0;
#define CHECK(c) do { if(!(c)) { std::fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#c); ++failures; } } while(0)

static bool run(SQVM *v,const char *source) {
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,scstrlen(source),"checked-accessors",SQTrue));
    if(ok) {sq_pushroottable(v);ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQFalse));}
    if(!ok) {sq_getlasterror(v);const SQChar *message=nullptr;if(SQ_SUCCEEDED(sq_getstring(v,-1,&message)))std::fprintf(stderr,"%s\n",message);}
    sq_settop(v,top);return ok;
}

static SQObjectPtr named(SQVM *v,const char *name) {
    SQObjectPtr value;
    _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,name)),value);
    return value;
}

static SQInteger short_length(HSQUIRRELVM v) {sq_pushinteger(v,1);return 1;}
static SQInteger release_hook(SQUserPointer,SQInteger) {++releases;return 0;}

int main() {
    for(bool enabled:{false,true}) {
        SQVM *v=sq_open(1024);
        sq_enabledebuginfo(v,SQTrue);
        SQJitContext &ctx=sqjit_context(v->_sharedstate);
        ctx.enabled=enabled;ctx.threshold=2;
        bool setup=run(v,R"(
error_count <- 0;
class Container {
    items=null;
    constructor(a){items=a}
    function first(){return items[0]}
    function _get(i){
        if(typeof i!="integer")throw null;
        if(i<0 || i>=items.len()){::error_count++;throw "bounds";}
        return items[i];
    }
    function positive(i){
        if(typeof i=="integer" && i>=0 && i<items.len())return items[i];
        throw "bounds";
    }
    function nonzero(i){if(i<1 || i>=items.len())throw "nonzero";return items[i]}
    function effect(i){::error_count++;return items[i]}
}
box <- Container([11,22,33]);
positive <- Container.positive; first <- Container.first;
nonzero <- Container.nonzero; effect <- Container.effect;
for(local n=0;n<20;n++) {
    if(box[1]!=22 || box.positive(2)!=33 || box.first()!=11)throw "read";
    if(box.nonzero(1)!=22 || box.effect(0)!=11)throw "other";
}
error_count=0;
foreach(i in [-1,3,9223372036854775807]) {
    local failed=false;try{local x=box[i];}catch(e){failed=e=="bounds";}
    if(!failed)throw "lost bounds error";
}
if(error_count!=3)throw "error path replayed or skipped";
foreach(i in [null,1.5,"missing"]) {
    local failed=false;try{local x=box[i];}catch(e){failed=true;}
    if(!failed)throw "lost type error";
}
local failed=false;try{box.nonzero(0);}catch(e){failed=e=="nonzero";}
if(!failed)throw "extra guard skipped";
box.items[1]=44;if(box[1]!=44)throw "cached element";
box.items=[55,66];if(box[1]!=66 || box.first()!=55)throw "cached field";
box.items=[];failed=false;try{local x=box[0];}catch(e){failed=e=="bounds";}
if(!failed)throw "empty array";
local shared={value=7};box.items=[shared];if(box[0]!=shared)throw "managed identity";
class Custom {
    calls=0;
    function len(){calls++;return 2}
    function _get(i){calls++;return 70+i}
}
local custom=Custom();box.items=custom;
if(box[1]!=71 || custom.calls!=2)throw "callbacks skipped or replayed";
box.items=[11,22,33];
)" );
        CHECK(setup);
        if(!setup) {sq_close(v);continue;}
        if(enabled) {
            SQObjectPtr getter=_class(named(v,"Container"))->_metamethods[MT_GET];
            SQObjectPtr positive=named(v,"positive"),first=named(v,"first");
            auto p=_closure(getter)->_function;
            CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_native_kind==SQ_JIT_NATIVE_FIELD_ARRAY_CHECKED_ACCESSOR);
            auto q=_closure(positive)->_function,r=_closure(first)->_function;
            CHECK(q->_jit && q->_jit->_entry && q->_jit->_entry->_native_kind==SQ_JIT_NATIVE_FIELD_ARRAY_CHECKED_ACCESSOR);
            CHECK(r->_jit && r->_jit->_entry && r->_jit->_entry->_native_kind==SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR);
            for(const char *name:{"nonzero","effect"}) {
                auto q=_closure(named(v,name))->_function;
                CHECK(!q->_jit || !q->_jit->_entry || q->_jit->_entry->_native_kind!=SQ_JIT_NATIVE_FIELD_ARRAY_CHECKED_ACCESSOR);
            }
            if(p->_jit && p->_jit->_entry) {
                auto entry=(SQJitNativeObjectFn)p->_jit->_entry->_code.Entry();
                SQObjectPtr args[]={named(v,"box"),SQObjectPtr(SQInteger(1))},out;
                SQJitExecutionScope scope(ctx,v);
                CHECK(entry(args,&out,_closure(getter))==SQ_JIT_NATIVE_RETURNED && _integer(out)==22);
                // A changed builtin must preserve the original length call.
                SQObjectPtr original=v->_sharedstate->_array_len_closure;
                sq_newclosure(v,short_length,0);HSQOBJECT replacement;sq_getstackobj(v,-1,&replacement);
                v->_sharedstate->_array_len_closure=replacement;sq_pop(v,1);
                CHECK(entry(args,&out,_closure(getter))==SQ_JIT_NATIVE_GUARD_FAILED);
                CHECK(run(v,"local caught=false;try{local x=box[1];}catch(e){caught=e==\"bounds\";}if(!caught)throw \"length override\";"));
                v->_sharedstate->_array_len_closure=original;
                // Do not suppress an observable drop of the VM scratch value.
                for(const SQObjectPtr &callable:{getter,first}) {
                    auto method=(SQJitNativeObjectFn)_closure(callable)->_function->_jit->_entry->_code.Entry();
                    int previous=releases;
                    sq_newuserdata(v,1);sq_setreleasehook(v,-1,release_hook);HSQOBJECT witness;sq_getstackobj(v,-1,&witness);
                    v->temp_reg=witness;sq_pop(v,1);
                    CHECK(method(args,&out,_closure(callable))==SQ_JIT_NATIVE_GUARD_FAILED && releases==previous);
                    v->temp_reg.Null();CHECK(releases==previous+1);
                }
            }
        }
        sq_close(v);
    }
    if(!failures)std::puts("checked accessor JIT tests passed");
    return failures?1:0;
}
