#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqstdmath.h"
#include "jit/sqjit_scalar_inline.h"
#include "jit/sqjit_local_array.h"
#include "jit/sqjit_local_graph.h"
#include "jit/sqjit_write_log.h"
#include <cstdint>
#include <cstring>
#include <limits>
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit.h"
#include <cstdio>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#elif defined(__aarch64__) && defined(__linux__)
#include <fpu_control.h>
#endif

static bool run(SQVM *v, const SQChar *source) {
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("llvm-test"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) {
        sq_getlasterror(v); const SQChar *error = nullptr;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("%s\n"), error);
    }
    sq_settop(v, top); return ok;
}
static SQJitObservation observation(SQVM *v, const SQChar *name) {
    SQJitObservation result = {};
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT object; sq_getstackobj(v, -1, &object);
        if(sq_type(object) == OT_CLOSURE) sqjit_observe_proto(_closure(object)->_function, result);
        sq_pop(v, 1);
    }
    sq_pop(v, 1); return result;
}
static SQInteger release_count(SQUserPointer pointer, SQInteger) { ++**static_cast<int **>(pointer); return 0; }
static void hook(HSQUIRRELVM, SQInteger, const SQChar *, SQInteger, const SQChar *) {}
static SQInteger invalid_loop_exit(SQObjectPtr *stack,SQInteger *next,SQClosure *) {
    SQObjectPtr key,value;
    _table(stack[1])->Next(false,SQObjectPtr(),key,value);
    auto slot=_table(stack[1])->GetRawSlot(key);*slot=(SQInteger)100;
    *next=-1;return SQ_JIT_NATIVE_SIDE_EXIT;
}

struct ReleaseProbe {SQObjectPtr state,key;int calls;SQInteger seen;};
static SQInteger release_probe(SQUserPointer data,SQInteger){
    auto probe=*static_cast<ReleaseProbe **>(data);++probe->calls;
    auto slot=_table(probe->state)->GetRawSlot(probe->key);probe->seen=_integer(*slot);*slot=(SQInteger)100;return 0;
}

int main() {
    int failures = 0;
#define CHECK(c) do { if(!(c)) { std::printf("FAIL line %d: %s\n", __LINE__, #c); ++failures; } } while(0)
    // Repeat teardown to exercise ORC artifact ownership, not just execution.
    for(int pass = 0; pass < 3; ++pass) {
        SQVM *v = sq_open(64);
        sq_pushroottable(v);sqstd_register_mathlib(v);sq_pop(v,1);
        auto &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = pass != 0; ctx.threshold = 1;
        ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
        CHECK(run(v, _SC(R"NUT(
function table_alive(entity) { return entity != null && entity.alive && entity.hp > 0.0; }
function table_ready(entity) { return entity == null || entity.ready; }
function table_hp(entity) { if(entity.hp <= 0.0) return 0; return entity.hp; }
function table_pair(entity, limit) { return entity.hp > limit && entity.hp < 100.0; }
function table_not(entity) { return !entity.alive; }
function table_receiver() { return this.alive && this.hp > 0.0; }
local predicate_receiver={alive=true,hp=1,check=table_receiver};
for(local n=0;n<40;n++) {
    if(!table_alive({alive=true,hp=20.0}) || table_alive({alive=true,hp=0.0}) ||
       table_alive(null) || table_alive({alive=false})) throw "table predicate";
    if(!table_ready(null) || table_ready({ready=false}) || table_ready({ready=0})!=0 ||
       table_ready({ready=7})!=7) throw "short circuit values";
    if(table_hp({hp=1.5})!=1.5 || table_hp({hp=-2})!=0 ||
       !table_pair({hp=7},3.0) || table_pair({hp=2.0},3)) throw "numeric fields";
    if(!table_not({alive=0}) || !table_not({alive=-0.0}) || table_not({alive=5})) throw "field truth";
    if(!predicate_receiver.check()) throw "receiver fields";
}
// Structural changes, missing fields and non-scalar values must never reuse
// stale addresses or suppress the interpreter's fallback behavior.
local t={alive=true,hp=10.0};
for(local n=0;n<100;n++)t["extra"+n]<-n;
if(!table_alive(t))throw "table rehash";
delete t.hp;
local threw=false;try{table_alive(t);}catch(e){threw=true;}
if(!threw)throw "missing-field error";
t.hp<-0.0;if(table_alive(t))throw "replacement field";
local gets=0;
local delegated={alive=true}.setdelegate({_get=function(key){gets++;return 3.0;}});
if(!table_alive(delegated) || gets!=1)throw "delegated fallback exactly once";
local order=[];
local compared={}.setdelegate({_cmp=function(other){order.append("cmp");return -1;}});
if(table_pair({hp=compared},{}) || order.len()!=1)throw "comparison fallback";
local alive_owner={};
if(!table_alive({alive=alive_owner,hp=1.0}))throw "reference-valued field fallback";
if(table_ready({ready=alive_owner})!=alive_owner)throw "reference return fallback";
local weak=alive_owner.weakref();
if(!table_alive({alive=weak,hp=1.0}))throw "weak field fallback";
)NUT")));
        if(ctx.enabled) for(auto name : {_SC("table_alive"),_SC("table_ready"),_SC("table_hp"),_SC("table_pair"),_SC("table_not"),_SC("table_receiver")}) {
            auto o=observation(v,name);
            if(!o.compilation.compiled || o.direct.successes+o.frame.successes==0)
                scprintf(_SC("table predicate coverage: %s (%s)\n"),name,o.compilation.reason?o.compilation.reason:"none");
            CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
            CHECK(o.direct.successes+o.frame.successes>0);
        }
        if(ctx.enabled) {
            SQObjectPtr callable;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("table_alive"))),callable));
            auto closure=_closure(callable);
            SQObjectPtr entity(SQTable::Create(v->_sharedstate,0));
            _table(entity)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("alive"))),SQObjectPtr(true));
            SQObjectPtr hp(SQString::Create(v->_sharedstate,_SC("hp")));
            _table(entity)->NewSlot(hp,SQObjectPtr((SQFloat)0.0));
            SQObjectPtr args[]={v->_roottable,entity},out((SQInteger)71);
            ReleaseProbe probe{entity,hp,0,-1};
            auto payload=static_cast<ReleaseProbe **>(sq_newuserdata(v,sizeof(ReleaseProbe *)));
            *payload=&probe;sq_setreleasehook(v,-1,release_probe);
            v->temp_reg=v->GetUp(-1);sq_pop(v,1);
            auto entry=(SQJitNativeObjectFn)closure->_function->_jit->_entry->_code.Entry();
            SQInteger status;
            {SQJitExecutionScope scope(ctx,v);status=entry(args,&out,closure);}
            CHECK(status==SQ_JIT_NATIVE_GUARD_FAILED && sq_type(out)==OT_INTEGER && _integer(out)==71);
            CHECK(probe.calls==0 && sq_type(v->temp_reg)==OT_USERDATA);
            // A program owner makes the temporary release non-final; native
            // success may drop it, without invoking the hook during the read.
            SQObjectPtr owner=v->temp_reg;
            {SQJitExecutionScope scope(ctx,v);status=entry(args,&out,closure);}
            CHECK(status==SQ_JIT_NATIVE_RETURNED && sq_type(out)==OT_BOOL && !_integer(out));
            CHECK(probe.calls==0 && sq_type(v->temp_reg)==OT_NULL);
            owner.Null();CHECK(probe.calls==1);
            // A missing second field must leave the VM temporary and output
            // unchanged even after the first field lookup succeeded.
            _table(entity)->Remove(hp);v->temp_reg=(SQInteger)39;out=(SQInteger)71;
            {SQJitExecutionScope scope(ctx,v);status=entry(args,&out,closure);}
            CHECK(status==SQ_JIT_NATIVE_GUARD_FAILED && _integer(out)==71 && _integer(v->temp_reg)==39);
            v->temp_reg.Null();
        }
        {
            // Compare interpreter and native results without spelling IEEE
            // expectations: Squirrel ObjCmp deliberately has different NaN
            // and signed-zero semantics. Exercise CMP and fused JCMP, with
            // each numeric argument signature compiled separately.
            const bool enabled = ctx.enabled;
            auto invoke = [&](const SQChar *name, const SQObjectPtr &a, const SQObjectPtr &b) {
                SQInteger top = sq_gettop(v);
                sq_pushroottable(v); sq_pushstring(v, name, -1);
                CHECK(SQ_SUCCEEDED(sq_get(v, -2)));
                sq_pushroottable(v); sq_pushobject(v, a); sq_pushobject(v, b);
                CHECK(SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQTrue)));
                SQObjectPtr result = v->GetUp(-1);
                sq_settop(v, top);
                return result;
            };
            const uint64_t nan_bits[] = {UINT64_C(0x7ff8000000000001), UINT64_C(0x7ff8000000000002)};
            SQFloat nan1, nan2;
            std::memcpy(&nan1, &nan_bits[0], sizeof(nan1));
            std::memcpy(&nan2, &nan_bits[1], sizeof(nan2));
            std::vector<SQObjectPtr> floats, integers;
            for(SQFloat x : {-std::numeric_limits<SQFloat>::infinity(), -1.5, -0.0, 0.0, 1.5,
                            9007199254740992.0, std::numeric_limits<SQFloat>::infinity(), nan1, nan2})
                floats.emplace_back(x);
            for(SQInteger x : {INT64_MIN, INT64_C(-1), INT64_C(0), INT64_C(1),
                              INT64_C(9007199254740993), INT64_MAX}) integers.emplace_back(x);
            const char *operators[] = {"<", "<=", ">", ">="};
            for(int signature = 0; signature < 3; ++signature) {
                const auto &left = signature == 1 ? integers : floats;
                const auto &right = signature == 2 ? integers : floats;
                for(int op = 0; op < 4; ++op) for(int branch = 0; branch < 2; ++branch) for(int field=0;field<2;++field) {
                    char name[64], source[192];
                    std::snprintf(name, sizeof(name), "float_cmp_%d_%d_%d_%d", signature, op, branch, field);
                    std::snprintf(source, sizeof(source), branch ?
                        "function %s(x,y) { if(%s%s y) return 7; return -9; }" :
                        "function %s(x,y) { return %s%s y; }", name, field?"x.value":"x", operators[op]);
                    CHECK(run(v, source));
                    for(const auto &a : left) for(const auto &b : right) {
                        SQObjectPtr input=a;
                        if(field) {
                            input=SQTable::Create(v->_sharedstate,0);
                            _table(input)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("value"))),a);
                        }
                        ctx.enabled = false;
                        SQObjectPtr expected = invoke(name, input, b);
                        ctx.enabled = enabled;
                        SQObjectPtr actual = invoke(name, input, b);
                        CHECK(sq_type(actual) == sq_type(expected) && _rawval(actual) == _rawval(expected));
                    }
                    if(enabled) {
                        auto o = observation(v, name);
                        CHECK(o.compilation.compiled && o.compilation.backend == SQ_JIT_BACKEND_LLVM);
                        CHECK(o.frame.successes + o.direct.successes > 0);
                    }
                }
            }
            CHECK(run(v, _SC(R"NUT(
function float_clamp(value, low, high) {
    if(value < low) return low;
    if(value > high) return high;
    return value;
}
function float_clamp_mixed(value, low, high) {
    if(value < low) return low;
    if(value > high) return high;
    return value;
}
for(local n=0;n<30;n++) {
    if(float_clamp(-1.0,0.0,1.0)!=0.0 || float_clamp(0.5,0.0,1.0)!=0.5 ||
       float_clamp(2.0,0.0,1.0)!=1.0) throw "float clamp";
    local lo=float_clamp_mixed(-1.0,0,1.0), mid=float_clamp_mixed(0.5,0,1.0), hi=float_clamp_mixed(2.0,0,1.0);
    if(lo!=0 || typeof lo!="integer" || mid!=0.5 || typeof mid!="float" || hi!=1.0 || typeof hi!="float")
        throw "mixed clamp return types";
}
// Different argument tags must still take the existing guarded fallback.
if(float_clamp(2,0,1)!=1 || typeof float_clamp(2,0,1)!="integer") throw "clamp fallback";
)NUT")));
            if(enabled) for(auto name : {_SC("float_clamp"), _SC("float_clamp_mixed")}) {
                auto o = observation(v, name);
                CHECK(o.compilation.compiled && o.direct.successes + o.frame.successes > 0);
            }
        }
        {
            // DMOVE is sequential: its second source can be the first
            // destination. Symbolic keys must not lose their provenance.
            SQObjectPtr owner(SQFunctionProto::Create(v->_sharedstate,6,1,1,0,0,0,0,0));
            auto p=_funcproto(owner);p->_stacksize=5;p->_bgenerator=false;p->_varparams=0;
            p->_literals[0]=SQString::Create(v->_sharedstate,_SC("key"));
            SQInstruction code[]={SQInstruction(_OP_NEWOBJ,1,0,0,NOT_ARRAY),
                SQInstruction(_OP_APPENDARRAY,1,0,AAT_LITERAL),SQInstruction(_OP_LOADINT,2,0),
                SQInstruction(_OP_GET,3,1,2),SQInstruction(_OP_DMOVE,2,3,4,2),SQInstruction(_OP_RETURN,1,4)};
            for(int i=0;i<6;++i)p->_instructions[i]=code[i];
            SQJitLocalArrayPlan local;
            CHECK(!local.Build(p)); // Would return an encoded integer if accepted.
            p->_instructions[1]._arg1=1;
            CHECK(!local.Build(p)); // Invalid literal rejected before lookup.
        }
        CHECK(run(v, _SC(
            "function local_read(n) { local a=[1,2,3,4],r=0; for(local i=0;i<n;i++) r+=a[i%4]; return r; }\n"
            "function array_calls(n) { local a=[1,2,3,4],r=0; for(local i=0;i<n;i++) r+=step(a[i%4],i); return r; }\n"
            "function local_float(n) { local a=[0.5,1.5,2.5,3.5],r=0.0; for(local i=0;i<n;i++) r+=a[i%4]; return r; }\n"
            "function local_write(n) { local a=[0,0,0,0]; for(local i=0;i<n;i++) a[i%4]=a[i%4]+i; return a[0]+a[1]+a[2]+a[3]; }\n"
            "function local_write_float(n) { local a=[0.5,1.5]; for(local i=0;i<n;i++) a[i%2]=a[i%2]+0.25; return a[0]+a[1]; }\n"
            "function array_at(i) { local a=[3,5,7]; return a[i]; }\n"
            "function array_set(i,x) { local a=[3,5,7]; local r=(a[i]=x); return r+a[i]; }\n"
            "function array_param(x) { local a=[x,x+1]; return a[0]+a[1]; }\n"
            "function escaped_array(n) { local a=[1,2]; return a; }\n"
            "function alias_array(n) { local a=[1,2]; local b=a; b[0]=n; return a[0]; }\n"
            "function nested_array(n) { local a=[[1,2],[3,4]]; return a[n][0]; }\n"
            "function rebuilt_array(n) { local r=0; for(local i=0;i<n;i++) { local a=[i,i+1]; r+=a[0]; } return r; }\n"
            "function eq_leaf(x) { return x==17; }\n"
            "function eq_caller(x) { return eq_leaf(x); }\n"
            "function protected_div(x,y,b) { local r=1.0; if(b) r=x/y; return r; }\n"
            "function float_step(x,y) { return x*0.5+y; }\n"
            "function float_loop(n) { local r=0.0; for(local i=0;i<n;i++) r=float_step(r,i%7); return r; }\n"
            "function float_choice(x,b) { local r=0.0; if(b) r=x+0.25; else r=x*0.5; return r; }\n"
            "function float_div(x,y) { return x/y; }\n"
            "function float_add(x,y) { return x+y; }\n"
            "function mixed_constants() { local x=1.5,y=2; return x; }\n"
            "function sum(n) { local r=0; for(local i=0;i<n;i++) r+=i; return r; }\n"
            "function recurrence(n) { local r=7; for(local i=0;i<n;i++) r=(r*33+i)%97; return r; }\n"
            "function temp_call(x) { return step(x,1); }\n"
            "function call_loop(n) { local r=7; for(local i=0;i<n;i++) r=step(r,i); return r; }\n"
            "function branch_loop(n,b) { local r=0; for(local i=0;i<n;i++) r+=choose(i,2,b); return r; }\n"
            "function nested(x) { return step(step(x,1),step(x,2)); }\n"
            "function bump(x) { x=x+7; return x; }\n"
            "function isolated(x) { local y=bump(x); return x*100+y; }\n"
            "function tail(x) { return bump(x); }\n"
            "function discard(x) { divi(100,x); return 9; }\n"
            "function early_call(x) { return magnitude(x)+1; }\n"
            "function divisor_loop(n,flag) { local d=7,r=0; for(local i=0;i<n;i++) { r+=100/d; if(flag) d=11; } return r; }\n"
            "function step(x,y) { return (x*33+y)%97; }\n"
            "function choose(x,y,b) { local r=0; if(b) r=x+3; else r=y+2; return r; }\n"
            "function divi(x,y) { return x/y; }\n"
            "function rem(x,y) { return x%y; }\n"
            "function less(x,y) { return x<y; }\n"
            "function equal(x,y) { return x==y; }\n"
            "function negate(x) { return -x; }\n"
            "function wrap(x) { return x+1; }\n"
            "function magnitude(x) { if(x<0) return -x; return x; }\n"
            "for(local n=0;n<30;n++) {\n"
            " if(array_calls(3)!=104 || local_read(100)!=250 || local_float(100)!=200.0 || local_write(100)!=4950 || local_write(0)!=0 || local_write_float(100)!=27.0) throw \"local arrays\";\n"
            " if(array_at(2)!=7 || array_set(1,9)!=18 || array_param(3)!=7) throw \"array values\";\n"
            " if(escaped_array(1)[1]!=2 || alias_array(9)!=9 || nested_array(1)!=3 || rebuilt_array(10)!=45) throw \"array fallback\";\n"
            " if(protected_div(0.0,0.0,false)!=1.0) throw \"nonexecuted FP branch\";\n"
            " if(float_loop(3)!=2.5 || float_step(4.0,2)!=4.0 || float_choice(3.0,true)!=3.25 || float_choice(3.0,false)!=1.5) throw \"floating scalar calls\";\n"
            " if(float_add(9007199254740993,0.0)!=9007199254740992.0 || typeof float_add(1,0.0)!=\"float\") throw \"mixed conversion\";\n"
            " local nan=float_div(0.0,0.0); if(nan==nan || float_div(1.0,0.0)<=1.0 || float_div(1.0,-0.0)>=-1.0) throw \"floating special values\";\n"
            " if(call_loop(3)!=73 || call_loop(0)!=7 || branch_loop(4,true)!=18 || branch_loop(4,false)!=16) throw \"inlined loops\";\n"
            " if(temp_call(3)!=3 || nested(2)!=48 || isolated(3)!=310 || tail(3)!=10 || discard(2)!=9 || early_call(-8)!=9 || early_call(8)!=9) throw \"inlined call forms\";\n"
            " if(mixed_constants()!=1.5) throw \"floating fallback\";\n"
            " if(sum(100)!=4950 || sum(0)!=0 || recurrence(3)!=73 || divisor_loop(3,true)!=32 || divisor_loop(3,false)!=42) throw \"loops\";\n"
            " if(step(4,2)!=37 || choose(4,8,true)!=7 || choose(4,8,false)!=10) throw \"arithmetic/branch\";\n"
            " if(divi(-100,7)!=-14 || divi(100,-7)!=-14 || rem(-100,7)!=-2 || rem(100,-7)!=2) throw \"signed division\";\n"
            " if(less(4,5)!=true || typeof less(4,5)!=\"bool\" || equal(true,false)!=false || equal(true,true)!=true) throw \"booleans\";\n"
            " if(negate(7)!=-7 || magnitude(-7)!=7 || magnitude(8)!=8) throw \"early return\";\n"
            " if(wrap(9223372036854775807)!=(-9223372036854775807-1)) throw \"wrapping\";\n"
            "}\n")));
        CHECK(run(v, _SC(
            "function table_loop(n) { local keys=[\"a\",\"b\",\"c\"]; local t={a=1,b=2,c=3}; for(local i=0;i<n;i++) { local k=keys[i%3]; t[k]=t[k]+i; } return t.a+t.b+t.c; }\n"
            "function table_layouts(n) { local keys=[\"x\",\"y\"]; local a={x=1,y=2},b={y=20,x=10}; for(local i=0;i<n;i++) { local k=keys[i%2]; a[k]=a[k]+1; b[k]=b[k]+2; } return a.x+a.y+b.x+b.y; }\n"
            "function table_float(x,n) { local t={x=x,y=0.5}; for(local i=0;i<n;i++) t.x=t.x*0.5+t.y; return t.x; }\n"
            "function table_missing(b) { local keys=[\"x\",\"absent\"],t={x=7}; local i=0;if(b)i=1;return t[keys[i]]; }\n"
            "function table_mixed(b) { local t={x=7},k=\"x\";if(b)k=0;return t[k]; }\n"
            "function table_escape(n) { local t={x=n};return t; }\n"
            "function table_alias(n) { local t={x=1};local u=t;u.x=n;return t.x; }\n"
            "function table_string() { local t={x=\"x\"};return t.x; }\n"
            "function table_string_store() { local t={x=1},k=\"x\";t[k]=k;return t.x; }\n"
            "function key_escape(n) { local a=[\"x\",\"y\"];return a[n]; }\n"
            "function key_arithmetic(n) { local a=[\"x\",\"y\"];return a[n]+\"!\"; }\n"
            "function key_mixed_array(n) { local a=[\"x\",0];local t={x=3};return t[a[n]]; }\n"
            "function table_delete() { local t={x=3};delete t.x;t.x<-9;return t.x; }\n"
            "function table_shared(t) {t.x=t.x+1;return t.x;}\n"
            "function table_replay(n,b) { local t={x=1};for(local i=0;i<n;i++) {t.x=t.x+1;local d=1;if(b){if(i==n-1)d=0;}t.x=t.x+10/d;}return t.x; }\n"
            "for(local j=0;j<30;j++) {\n"
            " if(table_loop(100)!=4956 || table_loop(0)!=6 || table_loop(-1)!=6 || table_layouts(100)!=333)throw \"table loops\";\n"
            " if(table_float(2.0,2)!=1.25 || table_float(2.0,0)!=2.0 || table_missing(false)!=7 || table_mixed(false)!=7)throw \"table values\";\n"
            " if(table_escape(11).x!=11 || table_alias(13)!=13 || table_string()!=\"x\" || table_string_store()!=\"x\" || key_escape(1)!=\"y\" || key_arithmetic(0)!=\"x!\" || key_mixed_array(0)!=3 || table_delete()!=9)throw \"table escape/string fallback\";\n"
            " local t={x=5};if(table_shared(t)!=6 || t.x!=6)throw \"shared table writes\";\n"
            " if(table_replay(4,false)!=45)throw \"table replay warm\";\n"
            " local errors=0;try{table_missing(true);}catch(e){errors++;}try{table_mixed(true);}catch(e){errors++;}try{key_mixed_array(1);}catch(e){errors++;}try{table_replay(4,true);}catch(e){errors++;}\n"
            " if(errors!=4 || table_missing(false)!=7 || table_replay(4,false)!=45)throw \"table guard replay\";\n"
            "}\n")));
        if(ctx.enabled) {
            for(auto name : {_SC("table_loop"),_SC("table_layouts"),_SC("table_float"),_SC("table_missing"),_SC("table_replay")}) {
                auto o=observation(v,name);
                if(!o.compilation.compiled) scprintf(_SC("not compiled: %s\n"),name);
                CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes+o.frame.successes>0);
            }
            for(auto name : {_SC("table_mixed"),_SC("table_escape"),_SC("table_alias"),_SC("table_string"),_SC("table_string_store"),_SC("key_escape"),_SC("key_arithmetic"),_SC("key_mixed_array"),_SC("table_delete"),_SC("table_shared")}) {
                auto o=observation(v,name);
                CHECK(o.direct.successes+o.frame.successes==0);
            }
        }

        CHECK(run(v,_SC(R"graph(
function object_member_write_fallback_kernel(n) {
    local state = {
        active = [1, 2, 3],
        spare = [4, 5, 6],
        label = "init"
    }
    local sum = 0

    for (local i = 0; i < n; i++) {
        local previous = state.active
        state.active = state.spare
        state.spare = previous
        state.label = (i % 2) == 0 ? "even" : "odd"
        state.active[i % 3] =
            (state.active[i % 3] + i + state.label.len()) % 997
        sum = (sum + state.active[(i + 1) % 3] +
            state.spare[(i + 2) % 3]) % 1000003
    }

    return sum + state.active[0] * 3 + state.active[1] * 5 +
        state.spare[2] * 7 + state.label.len()
}


function graph_float(x,n) {local t={a=[x,0.5],b=[1.5,2.5]};for(local i=0;i<n;i++){local p=t.a;t.a=t.b;t.b=p;}return t.a[0]+t.b[1];}
function graph_alias(n) { local a=[1,2],t={a=a,b=[3,4]};local alias=t.a;for(local i=0;i<n;i++){t.a=t.b;alias[0]=alias[0]+1;}return alias[0]+t.a[0]; }
function graph_layouts(n) { local t={a={x=1,y=2},b={y=20,x=10}};for(local i=0;i<n;i++){local p=t.a;t.a=t.b;t.b=p;t.a.x=t.a.x+i;}return t.a.x+t.b.x+t.a.y+t.b.y; }
function graph_array_len(n) {local a=[1,2],t={a=a,b=[3,4,5]};for(local i=0;i<n;i++){local p=t.a;t.a=t.b;t.b=p;}return t.a.len()+t.b.len();}
function graph_labels(n) {local t={a=[1],label="abc"};for(local i=0;i<n;i++)t.label=(i%2)==0 ? "abc" : "z";return t.label.len()+t.a[0];}
function graph_direct_len() {local a=[1,2],t={a=a};local length=a.len();return length;}
function graph_access(i) {local t={a=[10,20,30]};t.a[0]=11;return t.a[i];}
function graph_key(b) {local t={a=[3],b=[7]},key="a";if(b)key="b";return t[key][0];}
function graph_missing(b) {local t={a=[3]},key="a";if(b)key="missing";return t[key][0];}
function graph_escape(n) {local t={a=[1,2],b=[3,4]};t.a[0]=n;return t;}
function graph_identity() {local t={a=[1],b=[2]};return t.a==t.b;}
function graph_string_escape() {local t={a=[1],label="odd"};return t.label;}
function graph_token_arithmetic() {local t={a=[1],label="odd"};return t.label+"!";}
function graph_observe(f) {local t={a=[3]};f(t);return t.a[0];}
function graph_shared(t) {local a={a=[1]};t.a=a.a;return t.a[0];}
function graph_mixed(b) {local t={a=[3]},a=t.a;if(b)a=64;return a[0];}
function graph_cycle(n) {local t={a={x=1}};local a=t.a;for(local i=0;i<n;i++){t.a=t;a.x=a.x+1;}return a.x;}
for(local j=0;j<20;j++) {
    if(object_member_write_fallback_kernel(120)!=82710 || object_member_write_fallback_kernel(0)!=59)throw "graph benchmark";
    if(graph_float(2.0,3)!=2.0 || graph_float(2.0,0)!=4.5 || graph_alias(5)!=9 || graph_alias(0)!=2 || graph_layouts(8)!=61 || graph_layouts(0)!=33)throw "graph aliases/layouts";
    if(graph_labels(0)!=4 || graph_labels(3)!=4 || graph_labels(4)!=2 || graph_array_len(5)!=5 || graph_direct_len()!=2 || graph_key(false)!=3 || graph_key(true)!=7 || graph_missing(false)!=3)throw "graph keys/lengths";
    if(graph_access(0)!=11 || graph_access(2)!=30 || graph_access(1.5)!=20)throw "graph index fallback";
    local errors=0;try{graph_access(-1);}catch(e){errors++;}try{graph_access(3);}catch(e){errors++;}try{graph_access(true);}catch(e){errors++;}try{graph_missing(true);}catch(e){errors++;}try{graph_mixed(true);}catch(e){errors++;}
    if(errors!=5 || graph_mixed(false)!=3)throw "graph guard replay";
    if(graph_escape(12).a[0]!=12 || graph_identity()!=false || graph_string_escape()!="odd" || graph_token_arithmetic()!="odd!")throw "graph escapes";
    local calls=0;if(graph_observe(function(t){calls++;t.a[0]=9;})!=9 || calls!=1)throw "graph callback escape";
    local shared={a=null};if(graph_shared(shared)!=1 || shared.a[0]!=1)throw "graph shared escape";
    if(graph_cycle(5)!=6)throw "graph cycles";
}
)graph")));
        if(ctx.enabled) {
            for(auto name:{_SC("object_member_write_fallback_kernel"),_SC("graph_alias"),_SC("graph_float"),_SC("graph_layouts"),_SC("graph_array_len"),_SC("graph_labels"),_SC("graph_direct_len"),_SC("graph_access"),_SC("graph_key"),_SC("graph_missing"),_SC("graph_cycle")}) {
                auto o=observation(v,name);
                if(!o.compilation.compiled)scprintf(_SC("graph not compiled: %s\n"),name);
                CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes+o.frame.successes>0);
            }
            for(auto name:{_SC("graph_escape"),_SC("graph_identity"),_SC("graph_string_escape"),_SC("graph_token_arithmetic"),_SC("graph_observe"),_SC("graph_shared"),_SC("graph_mixed")}) {
                auto o=observation(v,name);CHECK(o.direct.successes+o.frame.successes==0);
            }
        }
        {
            SQObjectPtr fn;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("object_member_write_fallback_kernel"))),fn));
            auto proto=_closure(fn)->_function;SQJitLocalGraphPlan plan;
            CHECK(plan.Build(proto));
            bool checked_literal=false,checked_branch=false,checked_length=false;
            for(SQInteger ip=0;ip<proto->_ninstructions;++ip){
                auto saved=proto->_instructions[ip];
                if(!checked_literal && saved.op==_OP_LOAD){checked_literal=true;proto->_instructions[ip]._arg1=proto->_nliterals;CHECK(!plan.Build(proto));}
                if(!checked_branch && saved.op==_OP_JMP){checked_branch=true;proto->_instructions[ip]._arg1=proto->_ninstructions-ip-1;CHECK(!plan.Build(proto));}
                if(!checked_length && saved.op==_OP_PREPCALLK){
                    checked_length=true;SQObjectPtr original=proto->_literals[saved._arg1];
                    const SQChar key[]={_SC('l'),_SC('e'),_SC('n'),0,_SC('x')};
                    proto->_literals[saved._arg1]=SQString::Create(v->_sharedstate,key,5);
                    CHECK(!plan.Build(proto));proto->_literals[saved._arg1]=original;
                }
                proto->_instructions[ip]=saved;
            }
            CHECK(checked_literal && checked_branch && checked_length && plan.Build(proto));
        }
        _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("graph_string_delegate"))),v->_sharedstate->_string_default_delegate);
        _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("graph_array_delegate"))),v->_sharedstate->_array_default_delegate);
        CHECK(run(v,_SC(R"graph(
local saved=graph_string_delegate.len,calls=0;
graph_string_delegate.len=function(){calls++;return 41;};
local value=graph_labels(3);graph_string_delegate.len=saved;
if(value!=42 || calls!=1 || graph_labels(3)!=4)throw "graph string binding guard";
saved=graph_array_delegate.len;calls=0;
graph_array_delegate.len=function(){calls++;return 41;};
value=graph_direct_len();graph_array_delegate.len=saved;
if(value!=2 || calls!=0)throw "graph array length shortcut";
)graph")));
        if(ctx.enabled) {
            SQObjectPtr fn;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("graph_direct_len"))),fn));
            auto closure=_closure(fn);
            auto entry=(SQJitNativeObjectFn)closure->_function->_jit->_entry->_code.Entry();
            SQObjectPtr args[]={v->_roottable},out;
            int count=0;
            auto payload=static_cast<int **>(sq_newuserdata(v,sizeof(int *)));*payload=&count;sq_setreleasehook(v,-1,release_count);
            v->temp_reg=v->GetUp(-1);sq_pop(v,1);
            SQInteger status;
            {SQJitExecutionScope scope(ctx,v);status=entry(args,&out,closure);}
            CHECK(status==SQ_JIT_NATIVE_RETURNED && sq_type(out)==OT_INTEGER && _integer(out)==2);
            CHECK(sq_type(v->temp_reg)==OT_USERDATA && count==0);
            v->temp_reg.Null();CHECK(count==1);
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("graph_access"))),fn));
            closure=_closure(fn);entry=(SQJitNativeObjectFn)closure->_function->_jit->_entry->_code.Entry();
            SQObjectPtr indexed[]={v->_roottable,SQObjectPtr((SQInteger)0)};
            count=0;payload=static_cast<int **>(sq_newuserdata(v,sizeof(int *)));*payload=&count;sq_setreleasehook(v,-1,release_count);
            v->temp_reg=v->GetUp(-1);sq_pop(v,1);out=(SQInteger)99;
            {SQJitExecutionScope scope(ctx,v);status=entry(indexed,&out,closure);}
            CHECK(status==SQ_JIT_NATIVE_GUARD_FAILED && _integer(out)==99 && count==0);
            v->temp_reg.Null();CHECK(count==1);
        }
        CHECK(run(v,_SC(R"numeric(
function numeric_math(n) {local total=0.0;for(local i=0;i<n;i++)total+=sqrt((i%13+1).tofloat())+sin(0.0)+cos(0.0);return total;}
function numeric_convert(x) {local value=x.tofloat();return value;}
function numeric_graph(n) {local a=[[1.0,2.0],[3.0,4.0]];local sum=0.0;for(local i=0;i<n;i++){a[i%2][0]=a[i%2][0]+(i%3).tofloat();sum+=a[0][0]+a[1][0];}return sum;}
function numeric_pow(x,y) {local value=pow(x,y);return value;}
for(local i=0;i<20;i++) {
    local x=numeric_math(3);if(x<7.146264369940 || x>7.146264369944 || numeric_math(0)!=0.0)throw "numeric math";
    if(numeric_convert(7)!=7.0 || numeric_convert(true)!=1.0 || numeric_convert(false)!=0.0 || numeric_convert(0.25)!=0.25)throw "numeric conversion";
    if(numeric_graph(3)!=16.0 || numeric_graph(0)!=0.0 || numeric_pow(2.0,3.0)!=8.0)throw "numeric graph";
}
local saved=sqrt,calls=0;sqrt=function(x){calls++;return x+10;};
local changed=numeric_math(3);sqrt=saved;
if(changed!=39.0 || calls!=3)throw "numeric binding replacement";
local caught=false;try{numeric_math.call({sqrt=function(x){throw "replacement";},sin=sin,cos=cos},3);}catch(e){caught=true;}
if(!caught)throw "numeric receiver binding";
if(numeric_convert("7.25")!=7.25)throw "numeric conversion receiver fallback";
if(numeric_pow(-1.0,0.5)==numeric_pow(-1.0,0.5))throw "numeric NaN";
)numeric")));
        if(ctx.enabled){
            for(auto name:{_SC("numeric_math"),_SC("numeric_convert"),_SC("numeric_graph"),_SC("numeric_pow")}){
                auto o=observation(v,name);CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes+o.frame.successes>0);
            }
        }
        {
            bool enabled=ctx.enabled;ctx.enabled=false;
            CHECK(run(v,_SC(R"mathall(
function numeric_all(n){local sum=0.0;for(local i=0;i<n;i++){
    local x=(i%11+1).tofloat()*0.05;
    sum+=sqrt(x)+sin(x)+cos(x)+asin(x)+acos(x)+log(x)+log10(x)+tan(x)+atan(x)+floor(x)+ceil(x)+exp(x)+fabs(x)+atan2(x,0.25)+pow(x,1.5);
}return sum;}
math_expected<-numeric_all(40);
)mathall")));
            ctx.enabled=enabled;
            CHECK(run(v,_SC("for(local i=0;i<20;i++)if(fabs(numeric_all(40)-math_expected)>1e-12)throw \"all numeric intrinsics\";")));
            if(ctx.enabled){auto o=observation(v,_SC("numeric_all"));CHECK(o.compilation.compiled && o.direct.successes+o.frame.successes>0);}
        }
        _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("numeric_delegate"))),v->_sharedstate->_number_default_delegate);
        CHECK(run(v,_SC(R"numeric(
local saved=numeric_delegate.tofloat,calls=0;
numeric_delegate.tofloat=function(){calls++;return 5.0;};
local value=numeric_math(3);numeric_delegate.tofloat=saved;
if(calls!=3 || value<9.70820393249 || value>9.70820393251 || numeric_convert(4)!=4.0)throw "numeric delegate replacement";
)numeric")));
        CHECK(run(v,_SC(R"dynamic(
function dynamic_build(n) {local a=[];for(local i=0;i<n;i++)a.append(i%7);local sum=0;for(local i=0;i<n;i++)sum+=a[i];return sum+a.len()*13;}
function dynamic_bound(i) {local a=[];for(local k=0;k<4;k++)a.push(k*3);return a[i];}
function dynamic_escape(n) {local a=[];for(local i=0;i<n;i++)a.append(i);return a;}
function dynamic_alias() {local a=[],b=a;b.append(7);return a[0];}
function dynamic_append_result() {local a=[];local b=a.append(7);return b[0];}
function dynamic_shared(a,x,n) {for(local i=0;i<n;i++){a.append(x);a[0]=a[0];}return a.len();}
for(local j=0;j<20;j++) {
    if(dynamic_build(10)!=154 || dynamic_build(0)!=0 || dynamic_build(-1)!=0 || dynamic_bound(2)!=6 || dynamic_bound(1.5)!=3)throw "dynamic private array";
    if(dynamic_escape(10)[9]!=9 || dynamic_alias()!=7 || dynamic_append_result()!=7)throw "dynamic escape";
    local errors=0;try{dynamic_bound(-1);}catch(e){errors++;}try{dynamic_bound(4);}catch(e){errors++;}
    if(errors!=2 || dynamic_bound(0)!=0)throw "dynamic bounds replay";
    local a=[],x=[7];if(dynamic_shared(a,x,100)!=100 || a[99]!=x || a[0]!=x)throw "shared append growth";
}
local saved=graph_array_delegate.append,calls=0;graph_array_delegate.append=function(x){calls++;throw "replacement";};
local value=dynamic_build(10);graph_array_delegate.append=saved;
if(value!=154 || calls!=0)throw "dynamic append VM shortcut";
)dynamic")));
        if(ctx.enabled){
            for(auto name:{_SC("dynamic_build"),_SC("dynamic_bound")}){
                auto o=observation(v,name);CHECK(o.compilation.compiled && o.compilation.backend==SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes+o.frame.successes>0);
            }
            for(auto name:{_SC("dynamic_escape"),_SC("dynamic_alias"),_SC("dynamic_append_result")}){
                auto o=observation(v,name);CHECK(o.direct.successes+o.frame.successes==0);
            }
            auto o=observation(v,_SC("dynamic_shared"));CHECK(o.loop_compilation.compiled && o.loop.successes>0);
        }
        CHECK(run(v,_SC(R"classes(
class LocalBox {
    payload=null;
    bias=3;
    constructor(p) {this.payload=p;}
    function exchange(other) {local old=this.payload;this.payload=other.payload;other.payload=old;return this.payload[0]+other.payload[1]+this.bias;}
}
function class_graph(n) {
    local boxes=[LocalBox([1,2]),LocalBox([4,5])];local sum=0;
    for(local i=0;i<n;i++)sum+=boxes[0].exchange(boxes[1]);
    return sum+boxes[0].payload[0];
}
function class_escape() {local boxes=[LocalBox([1,2]),LocalBox([4,5])];return boxes[0];}
for(local j=0;j<20;j++) {
    if(class_graph(10)!=91 || class_graph(1)!=13 || class_graph(0)!=1)throw "class graph";
    if(class_escape().payload[1]!=2)throw "class escape";
}
local method=LocalBox.exchange;
LocalBox.rawset("exchange",function(other){return 100;});
if(class_graph(10)!=1001)throw "method mutation guard";
LocalBox.rawset("exchange",method);
LocalBox.rawnewmember("bias",7,null,true);
if(class_graph(10)!=131)throw "default field mutation guard";
LocalBox.rawnewmember("bias",3,null,true);
local original=LocalBox;
LocalBox=class {
    payload=null;bias=3;
    constructor(p){payload=p;}
    function exchange(other){return 200;}
};
if(class_graph(10)!=2001)throw "class identity guard";
LocalBox=original;
if(class_graph(10)!=91)throw "class restored";
)classes")));
        if(ctx.enabled){
            auto o=observation(v,_SC("class_graph"));
            CHECK(o.compilation.compiled && o.direct.successes+o.frame.successes>0);
            o=observation(v,_SC("class_escape"));CHECK(o.direct.successes+o.frame.successes==0);
        }
        CHECK(run(v,_SC(R"repeated(
class RootValue {
    values=null;
    constructor(x){values=[x];}
    function advance(x){return RootValue(values[0]+x);}
    function _add(other){return RootValue(values[0]+other.values[0]);}
}
function repeated_class(n){local value=RootValue(1);for(local i=0;i<n;i++)value=value.advance(i);return value.values[0];}
function aliased_class(n){local value=RootValue(1),old=value;for(local i=0;i<n;i++){old=value;value=value.advance(i);}return old.values[0]*100+value.values[0];}
function arithmetic_class(n){local value=RootValue(1),step=RootValue(2);for(local i=0;i<n;i++)value=value+step;return value.values[0];}
for(local j=0;j<20;j++){
    if(repeated_class(10)!=46 || repeated_class(0)!=1 || repeated_class(1)!=1)throw "repeated allocation";
    if(aliased_class(4)!=407 || aliased_class(0)!=101)throw "live previous allocation";
    if(arithmetic_class(10)!=21 || arithmetic_class(0)!=1)throw "arithmetic allocation";
}
local root=RootValue.advance.getroot();
RootValue.advance.setroot({RootValue=function(x){throw "changed method root";}});
local caught=false;try{repeated_class(3);}catch(e){caught=true;}
RootValue.advance.setroot(root);
if(!caught || repeated_class(10)!=46)throw "method root guard";
RootValue._add<-function(other){return RootValue(100);};
if(arithmetic_class(10)!=100)throw "metamethod mutation guard";
class_weak<-RootValue.weakref();RootValue=null;
)repeated")));
        // Isolate artifact ownership from the VM's conservatively marked
        // scratch slots after calls and exception handling.
        v->temp_reg.Null();
        for(SQUnsignedInteger slot=v->_top;slot<v->_stack.size();++slot)v->_stack[slot].Null();
        // Interpreter member caches intentionally own class layouts. Clear
        // those independent owners while keeping native artifacts alive.
        for(auto name:{_SC("repeated_class"),_SC("aliased_class"),_SC("arithmetic_class")}){
            SQObjectPtr fn;CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,name)),fn));
            auto proto=_closure(fn)->_function;
            for(SQUnsignedInteger n=0;n<proto->_membercache.size();++n)proto->_membercache[n].Clear();
        }
        sq_collectgarbage(v);
        CHECK(run(v,_SC("if(class_weak!=null)throw \"native artifact retained class\";")));
        if(ctx.enabled){
            for(auto name:{_SC("repeated_class"),_SC("arithmetic_class")}){
                auto o=observation(v,name);CHECK(o.compilation.compiled && o.direct.successes+o.frame.successes>0);
            }
        }
        if(ctx.enabled) {
            for(auto name : {_SC("array_calls"), _SC("local_read"), _SC("local_float"), _SC("local_write"), _SC("local_write_float"), _SC("array_at"), _SC("array_set"), _SC("array_param"), _SC("protected_div"), _SC("float_step"), _SC("float_loop"), _SC("float_choice"), _SC("float_div"), _SC("float_add"), _SC("mixed_constants"), _SC("temp_call"), _SC("call_loop"), _SC("branch_loop"), _SC("nested"), _SC("isolated"), _SC("tail"), _SC("discard"), _SC("early_call"), _SC("sum"), _SC("recurrence"), _SC("divisor_loop"), _SC("step"), _SC("choose"), _SC("divi"), _SC("rem"), _SC("less"), _SC("equal"), _SC("negate"), _SC("wrap"), _SC("magnitude")}) {
                auto o = observation(v, name);
                CHECK(o.compilation.compiled && o.compilation.backend == SQ_JIT_BACKEND_LLVM);
                CHECK(o.direct.successes + o.frame.successes > 0);
            }
        }
        if(ctx.enabled) {
            SQObjectPtr callable;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("call_loop"))), callable));
            auto closure = _closure(callable); auto proto = closure->_function;
            SQObjectPtr args[] = {v->_roottable, SQObjectPtr((SQInteger)3)};
            SQJitScalarInlinePlan plan;
            bool bad_branch_tested = false, bad_literal_tested = false;
            for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) if(proto->_instructions[ip].op == _OP_JMP) {
                bad_branch_tested = true;
                SQInstruction saved = proto->_instructions[ip];
                proto->_instructions[ip]._arg1 = proto->_ninstructions-ip-1;
                CHECK(!plan.Build(proto, args, closure)); // Target one past bytecode.
                proto->_instructions[ip] = saved; break;
            }
            SQObjectPtr leaf;
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("eq_caller"))), callable));
            CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("eq_leaf"))), leaf));
            closure = _closure(callable); proto = _closure(leaf)->_function;
            for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) if(proto->_instructions[ip].op == _OP_EQ) {
                bad_literal_tested = true;
                SQInstruction saved = proto->_instructions[ip];
                proto->_instructions[ip]._arg3 = 1; proto->_instructions[ip]._arg1 = INT32_MAX;
                CHECK(!plan.Build(closure->_function, args, closure)); // Invalid literal before remapping.
                proto->_instructions[ip] = saved; break;
            }
            CHECK(bad_branch_tested && bad_literal_tested);
        }
        CHECK(run(v, _SC(
            "foreach(i in [-1,3,9223372036854775807]) { local caught=false; try { array_at(i); } catch(e) { caught=true; } if(!caught) throw \"array bounds\"; }\n"
            "for(local n=0;n<100;n++) { local r=n%4; if(local_read(n)!=(n/4)*10+r*(r+1)/2 || local_float(n)!=(n/4)*8.0+r*r*0.5 || local_write(n)!=n*(n-1)/2 || local_write_float(n)!=2.0+n*0.25) throw \"array trip-count differential\"; }\n"
            "if(local_read(-1)!=0 || local_write(-1)!=0 || local_float(-1)!=0.0 || array_set(1,0.5)!=1.0) throw \"array zero-trip/type fallback\";\n"
            "local bound_error=false; try { array_set(3,9); } catch(e) { bound_error=true; } if(!bound_error) throw \"write bounds\";\n"
            "if(array_param(1.5)!=4.0) throw \"array changed element type\";\n"
            "local discard_error=false; try { discard(0); } catch(e) { discard_error=true; } if(!discard_error) throw \"discarded call lost error\";\n"
            "local saved=step; step=function(x,y) { return x+y; }; if(call_loop(3)!=10) throw \"callee replacement\";\n"
            "step=saved; if(call_loop(3)!=73) throw \"callee restoration\";\n"
            "local other={step=function(x,y) { return x-y; }}; if(call_loop.call(other,3)!=4) throw \"receiver binding\";\n"
            "local bound=call_loop.bindenv(other); if(bound(3)!=4) throw \"bound caller environment\";\n"
            "local saved_bump=bump; local bump_weak=bump.weakref(); bump=function(x) { return x+20; }; saved_bump=null; collectgarbage();\n"
            "if(bump_weak.ref()!=null || tail(3)!=23 || isolated(3)!=323) throw \"weak callee lifetime\";\n"
            "local effects=[0]; step=function(x,y) { effects[0]++; return x+y; }; if(call_loop(3)!=10 || effects[0]!=3) throw \"effectful replacement replay\"; step=saved;\n"
            "local caught=false; try { divi(7,0); } catch(e) { caught=true; } if(!caught) throw \"zero divisor\";\n"
            "caught=false; try { rem(7,0); } catch(e) { caught=true; } if(!caught) throw \"zero remainder\";\n"
            "caught=false; try { divi(-9223372036854775807-1,-1); } catch(e) { caught=true; } if(!caught) throw \"division overflow\";\n"
            "if(rem(-9223372036854775807-1,-1)!=0) throw \"minimum remainder\";\n"
            "if(divi(7.0,2.0)!=3.5 || wrap(1.5)!=2.5) throw \"changed type fallback\";\n"
            "if(divi(20,2)!=10 || rem(20,3)!=2) throw \"guard recovery\";\n")));
        if(ctx.enabled) {
            auto o = observation(v, _SC("divi"));
            CHECK(o.direct.guard_failures + o.frame.guard_failures > 0);
            auto before = observation(v, _SC("step"));
            sq_setnativedebughook(v, hook);
            CHECK(run(v, _SC("if(step(4,2)!=37) throw \"debug result\";")));
            sq_setnativedebughook(v, nullptr);
            auto after = observation(v, _SC("step"));
            CHECK(before.direct.successes == after.direct.successes && before.frame.successes == after.frame.successes);
        }
#if defined(__x86_64__) || defined(_M_X64)
        if(ctx.enabled) {
            unsigned saved = _mm_getcsr();
            // Non-default rounding and FTZ/DAZ must use the interpreter without
            // changing the host's control bits. Do not count a fallback as JIT.
            for(unsigned mode : {0x2000u, 0x4000u, 0x8040u, 0x10000u}) {
                unsigned hostile = mode == 0x10000u ? (saved & ~0xbfu) : (saved & ~0xe040u) | mode;
                _mm_setcsr(hostile);
                ctx.enabled = false;
                CHECK(run(v, _SC("fp_expected <- float_loop(100);")));
                ctx.enabled = true;
                auto before = observation(v, _SC("float_loop"));
                CHECK(run(v, _SC("if(float_loop(100)!=fp_expected || protected_div(0.0,0.0,false)!=1.0) throw \"host FP environment\";")));
                auto after = observation(v, _SC("float_loop"));
                CHECK(before.frame.successes + before.direct.successes == after.frame.successes + after.direct.successes);
                CHECK((_mm_getcsr() & ~0x3fu) == (hostile & ~0x3fu));
                _mm_setcsr(saved);
            }
        }
#elif defined(__aarch64__) && defined(__linux__)
        if(ctx.enabled) {
            struct Restore {
                fpu_control_t control; fpu_fpsr_t status;
                Restore() { _FPU_GETCW(control); _FPU_GETFPSR(status); }
                ~Restore() { _FPU_SETCW(control); _FPU_SETFPSR(status); }
            } restore;
            _FPU_SETCW(0);
            // Sticky status flags must not prevent native floating execution.
            _FPU_SETFPSR(0x11);
            auto before = observation(v, _SC("float_loop"));
            CHECK(run(v, _SC("if(float_loop(3)!=2.5) throw \"ARM64 native float\";")));
            auto after = observation(v, _SC("float_loop"));
            CHECK(after.direct.successes + after.frame.successes > before.direct.successes + before.frame.successes);
            // Rounding, flush-to-zero, default NaNs, and implemented exception
            // enables must fall back without changing the caller's FPCR. Three
            // iterations are exact, so the interpreter cannot trip inexact traps.
            for(unsigned mode : {0x400000u, 0x800000u, 0xc00000u,
                                 0x1000000u, 0x2000000u, 0x80000u,
                                 0x100u, 0x200u, 0x400u, 0x800u, 0x1000u, 0x8000u}) {
                _FPU_SETCW(mode);
                fpu_control_t actual; _FPU_GETCW(actual);
                if(actual == 0) continue; // Some CPUs do not implement traps/FZ16.
                ctx.enabled = false;
                CHECK(run(v, _SC("fp_expected <- float_loop(3);")));
                ctx.enabled = true;
                before = observation(v, _SC("float_loop"));
                CHECK(run(v, _SC("if(float_loop(3)!=fp_expected || protected_div(0.0,0.0,false)!=1.0) throw \"ARM64 host FP environment\";")));
                after = observation(v, _SC("float_loop"));
                CHECK(before.direct.successes + before.frame.successes == after.direct.successes + after.frame.successes);
                CHECK(after.direct.guard_failures + after.frame.guard_failures > before.direct.guard_failures + before.frame.guard_failures);
                fpu_control_t current; _FPU_GETCW(current);
                CHECK(current == actual);
                _FPU_SETCW(0);
                // Allow any guard-failure backoff to expire before testing the
                // next control mode, and prove native execution resumes.
                before = observation(v, _SC("float_loop"));
                CHECK(run(v, _SC("for(local i=0;i<1000;i++) if(float_loop(3)!=2.5) throw \"ARM64 FP recovery\";")));
                after = observation(v, _SC("float_loop"));
                CHECK(after.direct.successes + after.frame.successes > before.direct.successes + before.frame.successes);
            }
        }
#endif
        if(ctx.enabled) {
            for(auto name : {_SC("local_read"), _SC("temp_call")}) {
                SQObjectPtr callable;
                CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, name)), callable));
                SQObjectPtr args[] = {v->_roottable, SQObjectPtr((SQInteger)3)}, out;
                int count = 0;
                int **payload = static_cast<int **>(sq_newuserdata(v, sizeof(int *))); *payload = &count;
                sq_setreleasehook(v, -1, release_count);
                v->temp_reg = v->GetUp(-1); sq_pop(v, 1);
                auto before = observation(v, name);
                CHECK(!sqjit_try_execute_closure(v, _closure(callable), args, 2, out));
                auto after = observation(v, name);
                CHECK(after.direct.guard_failures == before.direct.guard_failures + 1);
                CHECK(count == 0);
                v->temp_reg.Null();
                CHECK(count == 1);
            }
        }
        if(ctx.enabled) {
            // A separate owner makes the temporary drop safe. Commit it only
            // after an actual read/call and successful completion, never on a
            // zero-trip loop or a bounds guard exit.
            for(int mode=0; mode<3; ++mode) {
                SQObjectPtr callable;
                const SQChar *name = mode==2 ? _SC("array_at") : _SC("local_read");
                CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, name)), callable));
                auto closure = _closure(callable);
                auto entry = (SQJitNativeObjectFn)closure->_function->_jit->_entry->_code.Entry();
                SQObjectPtr args[] = {v->_roottable, SQObjectPtr((SQInteger)(mode==0 ? 0 : mode==1 ? 3 : 9))}, out((SQInteger)42);
                int count=0;
                int **payload=static_cast<int **>(sq_newuserdata(v,sizeof(int *))); *payload=&count;
                sq_setreleasehook(v,-1,release_count);
                v->temp_reg=v->GetUp(-1); sq_pop(v,1);
                SQObjectPtr owner=v->temp_reg;
                SQInteger status;
                { SQJitExecutionScope scope(ctx,v); status=entry(args,&out,closure); }
                CHECK(status==(mode==2 ? SQ_JIT_NATIVE_GUARD_FAILED : SQ_JIT_NATIVE_RETURNED));
                CHECK(sq_type(v->temp_reg)==(mode==1 ? OT_NULL : OT_USERDATA));
                CHECK(_integer(out)==(mode==0 ? 0 : mode==1 ? 6 : 42));
                owner.Null(); CHECK(count==(mode==1 ? 1 : 0));
                v->temp_reg.Null(); CHECK(count==1);
            }
        }
        CHECK(run(v,_SC(
            "class RefBox {payload=null;constructor(p){payload=p;}}\n"
            "function shared_swap(a,b,n){for(local i=0;i<n;i++){local old=a.payload;a.payload=b.payload;b.payload=old;a.payload[i%2]=a.payload[i%2]+i;}return a.payload[0]+a.payload[1]+b.payload[0]+b.payload[1];}\n"
            "function changing_owner(owners,n){local t=owners[0];for(local i=0;i<n;i++){t=owners[i%2];t.x=t.x+1;}return owners[0].x+owners[1].x;}\n"
            "function release_loop(t,n){for(local i=0;i<n;i++){t.count=t.count+1;t.value=null;t.marker=t.count;}return t.marker;}\n"
            "function bounds_after(t,n){for(local i=0;i<n;i++){t.count=t.count+1;t.a[i]=i+10;}return t.count;}\n"
            "function division_after(t,n,d){for(local i=0;i<n;i++){t.count=t.count+1;t.x=10/d;}return t.count;}\n"
            "function borrowed_weak(t,n){for(local i=0;i<n;i++){local a=t.weak;t.x=a[0]+i;}return t.x;}\n"
            "function boxed_transfers(t,x,condition,n){for(local i=0;i<n;i++){t.count=t.count+1;local a=x;t.label=condition ? \"odd\" : \"even\";t.equal=a==t.key;t.unequal=a!=t.key;}return t.count;}\n"
            "for(local j=0;j<20;j++){\n"
            " local a={payload=[1,2]},b=RefBox([3,4]);if(shared_swap(a,b,10)!=55)throw \"shared swaps\";\n"
            " a={payload=[1,2]};b={payload=[3,4]};if(shared_swap(a,b,0)!=10 || shared_swap(a,b,3)!=13)throw \"table swaps\";\n"
            " a=RefBox([1,2]);b=RefBox([3,4]);if(shared_swap(a,b,7)!=31)throw \"instance swaps\";\n"
            " local owners=[{x=1},{x=2}];if(changing_owner(owners,20)!=23 || owners[0].x!=11 || owners[1].x!=12)throw \"changing cache receiver\";\n"
            " local t={count=0,value=0,marker=0};if(release_loop(t,3)!=3)throw \"release warmup\";\n"
            " t={count=0,a=[0,0,0]};if(bounds_after(t,3)!=3 || t.a[2]!=12)throw \"array warmup\";\n"
            " t={count=0,a=[0]};local caught=false;try{bounds_after(t,3);}catch(e){caught=true;}if(!caught || t.count!=2 || t.a[0]!=10)throw \"side exit replayed stores\";\n"
            " t={count=0,x=0};if(division_after(t,3,2)!=3 || t.x!=5)throw \"division warmup\";\n"
            " t={count=0,x=0};caught=false;try{division_after(t,3,0);}catch(e){caught=true;}if(!caught || t.count!=1 || t.x!=0)throw \"division partial effects\";\n"
            " t={count=0,x=0};if(division_after(t,3.5,2.0)!=4 || t.count!=4)throw \"header guard progress\";\n"
            " foreach(c in [true,false,1,0,0.0,-0.0,0.25,-1.0,null,\"\",[]]){t={count=0,key=7,label=null,equal=false,unequal=true};if(boxed_transfers(t,7,c,3)!=3 || !t.equal || t.unequal || t.label!=(c ? \"odd\" : \"even\"))throw \"boxed branch transfer\";}\n"
            " foreach(x in [7.0,8.0,\"seven\"]){t={count=0,key=x,label=null,equal=false,unequal=true};if(boxed_transfers(t,x,true,3)!=3 || !t.equal || t.unequal)throw \"equality exit replay\";}\n"
            " local referent=[17];t={weak=referent.weakref(),x=0};if(borrowed_weak(t,3)!=19)throw \"weak member read\";referent=null;\n"
            "}\n")));
        if(ctx.enabled)for(auto name:{_SC("shared_swap"),_SC("changing_owner"),_SC("release_loop"),_SC("bounds_after"),_SC("division_after"),_SC("borrowed_weak"),_SC("boxed_transfers")}) {
            auto o=observation(v,name);
            if(!o.loop_compilation.compiled)scprintf(_SC("loop not compiled: %s\n"),name);
            CHECK(o.loop_compilation.compiled && o.loop_compilation.backend==SQ_JIT_BACKEND_LLVM);
            CHECK(o.loop.successes>0);
        }
        if(ctx.enabled){
            auto before=observation(v,_SC("boxed_transfers"));
            CHECK(run(v,_SC("local t={count=0,key=7,label=null,equal=false,unequal=true};if(boxed_transfers(t,7.0,-0.0,10)!=10 || !t.equal || t.unequal || t.label!=\"even\")throw \"mixed numeric transfer\";")));
            auto after=observation(v,_SC("boxed_transfers"));
            CHECK(after.loop.successes>before.loop.successes);
        }
        CHECK(run(v,_SC("release_state <- {count=0,value=null,marker=0};")));
        {
            SQObjectPtr key(SQString::Create(v->_sharedstate,_SC("release_state"))),state;
            CHECK(_table(v->_roottable)->Get(key,state));
            ReleaseProbe probe{state,SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),0,-1};
            auto payload=static_cast<ReleaseProbe **>(sq_newuserdata(v,sizeof(ReleaseProbe *)));*payload=&probe;
            sq_setreleasehook(v,-1,release_probe);
            _table(state)->Set(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("value"))),v->GetUp(-1));sq_pop(v,1);
            CHECK(run(v,_SC("if(release_loop(release_state,3)!=102 || release_state.count!=102)throw \"release timing or duplicated write\";")));
            CHECK(probe.calls==1 && probe.seen==1);
        }
        _table(v->_roottable)->NewSlot(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("string_delegate"))),v->_sharedstate->_string_default_delegate);
        CHECK(run(v,_SC(
            "class MissingWrite {count=0;calls=0;function _set(k,x){calls++;}}\n"
            "function meta_loop(t,n){for(local i=0;i<n;i++){t.count=t.count+1;t.missing=i;}return t.count;}\n"
            "local t=MissingWrite();if(meta_loop(t,5)!=5 || t.calls!=5)throw \"metamethod side exit\";\n"
            "function len_loop(t,n){for(local i=0;i<n;i++){t.count=t.count+1;t.x=t.text.len();}return t.x;}\n"
            "t={count=0,text=\"abc\",x=0};if(len_loop(t,5)!=3)throw \"length warmup\";\n"
            "local delegate=string_delegate,saved=delegate.len,calls=0;delegate.len=function(){calls++;return 41;};\n"
            "t.count=0;local result=len_loop(t,5);delegate.len=saved;if(result!=41 || t.count!=5 || calls!=5)throw \"replaced length continuation\";\n")));
        if(ctx.enabled){
            SQObjectPtr state,key(SQString::Create(v->_sharedstate,_SC("release_state")));
            CHECK(_table(v->_roottable)->Get(key,state));
            ReleaseProbe probe{state,SQObjectPtr(SQString::Create(v->_sharedstate,_SC("count"))),0,-1};
            *_table(state)->GetRawSlot(probe.key)=(SQInteger)0;
            auto payload=static_cast<ReleaseProbe **>(sq_newuserdata(v,sizeof(ReleaseProbe *)));*payload=&probe;sq_setreleasehook(v,-1,release_probe);
            _table(state)->Set(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("value"))),v->GetUp(-1));
            {
                SQJitWriteLog ancestor(65536,sq_vm_malloc,&ctx);
                CHECK(ancestor.RetainValue(v->GetUp(-1)));sq_pop(v,1);
                auto before=observation(v,_SC("release_loop"));
                CHECK(run(v,_SC("if(release_loop(release_state,3)!=3)throw \"ancestor pin effects\";")));
                auto after=observation(v,_SC("release_loop"));
                CHECK(after.loop.guard_failures>before.loop.guard_failures);
                CHECK(probe.calls==0);
            }
            CHECK(probe.calls==1 && probe.seen==3);
        }
        if(ctx.enabled){
            // Short frame entries remain opt-in while their overhead is tuned.
            ctx.precise_exits=true;
            CHECK(run(v,_SC("function boxed_replace(t,x){local old=t.value;t.value=x;return old;}local a=[1],b=[2],t={value=a};for(local i=0;i<10;i++){if(boxed_replace(t,b)!=a || t.value!=b)throw \"boxed reference return\";t.value=a;}")));
            auto o=observation(v,_SC("boxed_replace"));CHECK(o.compilation.compiled && o.frame.successes>0 && o.direct.successes==0);
            ctx.precise_exits=false;
        }
        if(ctx.enabled){
            CHECK(run(v,_SC("function invalid_loop(t,n){for(local i=0;i<n;i++)t.count=t.count+1;return t.count;}invalid_state <- {count=0};invalid_loop(invalid_state,3);")));
            SQObjectPtr f;CHECK(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("invalid_loop"))),f));
            auto jit=_closure(f)->_function->_jit;CHECK(jit && jit->_loop_code.Entry());
            if(jit && jit->_loop_code.Entry()) {
                jit->_loop_code.SetStub((void*)&invalid_loop_exit);
                CHECK(run(v,_SC("local caught=false;try{invalid_loop(invalid_state,3);}catch(e){caught=true;}if(!caught || invalid_state.count!=100)throw \"invalid continuation replayed effects\";")));
            }
        }
        sq_close(v);
    }
    return failures ? 1 : 0;
}
