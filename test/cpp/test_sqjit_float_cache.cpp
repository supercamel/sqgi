#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqstdmath.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#if SQJIT_HAS_X64_NATIVE
#include "jit/sqjit_backend_x64_emit.h"
#endif
#include <algorithm>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <limits>
#include <vector>

static int failures = 0;
#define CHECK(c,m) do { if(!(c)) { puts("FAIL: " m); ++failures; } } while(0)
static bool run(SQVM *v, const char *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("float-cache"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) { sq_getlasterror(v); const SQChar *message = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &message))) printf("FAIL: %s\n", message); }
    sq_settop(v, top); return ok;
}
static SQClosure *closure(SQVM *v, const char *name)
{
    SQInteger top = sq_gettop(v); SQClosure *result = NULL;
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) { HSQOBJECT obj; sq_getstackobj(v, -1, &obj);
        if(sq_type(obj) == OT_CLOSURE) result = _closure(obj); }
    sq_settop(v, top); return result;
}
static SQJitObservation observe(SQVM *v, const char *name)
{ SQJitObservation o = {}; SQClosure *c = closure(v, name); if(c) sqjit_observe_proto(c->_function, o); return o; }
static bool call(SQVM *v, const char *name, SQInteger n, SQFloat x, SQFloat y, SQFloat &out)
{
    SQInteger top = sq_gettop(v); SQClosure *c = closure(v, name);
    if(!c) return false;
    sq_pushobject(v, SQObjectPtr(c)); sq_pushroottable(v);
    sq_pushinteger(v, n); sq_pushfloat(v, x); sq_pushfloat(v, y);
    bool ok = SQ_SUCCEEDED(sq_call(v, 4, SQTrue, SQTrue)) && sq_gettype(v, -1) == OT_FLOAT &&
        SQ_SUCCEEDED(sq_getfloat(v, -1, &out));
    sq_settop(v, top); return ok;
}

#if SQJIT_HAS_X64_NATIVE
static void register_copies()
{
    // Execute parallel copies, including cycles, shared sources and memory
    // sources. Raw bits must survive even for signed zero and NaN payloads.
    const uint64_t raw[] = {UINT64_C(0x3ff4000000000000), UINT64_C(0x8000000000000000),
        UINT64_C(0x7ff8000000000042), UINT64_C(0x7ff0000000000000)};
    for(int mode=0; mode<3; ++mode) {
        int permutation[] = {0,1,2,3};
        do {
            for(int output=0; output<4; ++output) {
                SQJitNativeCodeBuffer buf; buf.cache_floats = true;
                for(int n=0; n<3; ++n) buf.pinned_slots[n] = -1;
                CHECK(sqjit_native_emit_push_rbp(&buf) && sqjit_native_emit_mov_rbp_rsp(&buf) &&
                    sqjit_native_emit_sub_rsp_i32(&buf, 512), "floating probe frame");
                for(int n=0; n<4; ++n) {
                    SQFloat value; memcpy(&value, &raw[n], sizeof(value));
                    CHECK(sqjit_native_emit_mov_local_float_const(&buf, 8+n, value), "seed floating registers");
                }
                if(mode == 1) {
                    CHECK(sqjit_native_emit_copy_float(&buf, 12, 8) &&
                        sqjit_native_emit_mov_mem_imm32(&buf, 8, 123) &&
                        sqjit_native_emit_copy_float(&buf, 8, 12), "integer overwrite detaches one floating alias");
                    CHECK(sqjit_native_emit_copy_float(&buf, 10, 8), "shared source during parallel copy");
                }
                if(mode == 2) CHECK(sqjit_native_flush_float_cache(&buf, 9), "mixed register and memory input");
                std::vector<SQInteger> slots;
                for(int n : permutation) slots.push_back(8+n);
                CHECK(sqjit_native_reconcile_float_registers(&buf, slots), "parallel register reconciliation");
                CHECK(sqjit_native_emit_mov_xmm0_local_float(&buf, 8+output) &&
                    sqjit_native_emit_mov_rsp_rbp(&buf) && sqjit_native_emit_pop_rbp(&buf) &&
                    sqjit_native_emit_ret(&buf), "return floating bits");
                SQJitCode code; CHECK(code.Install(buf.bytes, buf.size), "install register probe");
                if(code) {
                    SQFloat value = ((SQFloat (*)())code.Entry())(); uint64_t bits;
                    memcpy(&bits, &value, sizeof(bits));
                    CHECK(bits == raw[mode == 1 && output == 2 ? 0 : output], "parallel copies preserve raw values and aliases");
                }
            }
        } while(std::next_permutation(permutation, permutation+4));
    }
}
#endif

int main()
{
#if SQJIT_HAS_X64_NATIVE
    register_copies();
#endif
    std::vector<SQFloat> reference;
    for(int enabled=0; enabled<2; ++enabled) {
        SQVM *v = sq_open(1024); auto &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1; sqjit_observe_enable(v);
        sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v, 1);
        CHECK(run(v, R"SQ(
            function identity(x) { return x }
            function blend(x,y) { return x*0.75+y }
            function divided(x,y) { return (x-y)/(y+1.0) }
            function choose(x,y,flag) { if(flag) { x=x-y; return x*0.5 } return y+x*0.25 }
            function barrier(x) { return typeof x }
            function chain(n,x,y) { for(local i=0;i<n;i++) x=blend(x,i%11)+y; return x }
            function region(n,x,y) { barrier(0); for(local i=0;i<n;i++) x=blend(x,i%11)+y; return x }
            function swap(n,x,y) { for(local i=0;i<n;i++) { local old=x; x=identity(y); y=old; } return x }
            function rotate(n,x,y) {
                local z=0.125;
                for(local i=0;i<n;i++) { local old=x; x=identity(y); y=z; z=old; }
                return x+y*0.5+z*0.25;
            }
            function original(n,x,y) {
                local sum=0.0;
                for(local i=0;i<n;i++) { local old=x; local copy=divided(x,y); sum+=x+old+copy; x=blend(x,0.125); }
                return sum+x;
            }
            function branches(n,x,y) {
                for(local i=0;i<n;i++) { if(i%3==0) x=choose(x,y,true); else x=choose(x,y,false); }
                return x;
            }
            function pressure(n,x,y) {
                local a=x,b=y,c=0.125,d=0.25,e=0.375,f=0.5,g=0.625,h=0.75;
                for(local i=0;i<n;i++) {
                    a=blend(a,b); b=blend(b,c); c=blend(c,d); d=blend(d,e);
                    e=blend(e,f); f=blend(f,g); g=blend(g,h); h=blend(h,a)*0.25;
                }
                return a+b*0.5+c*0.25+d*0.125+e*0.0625+f*0.03125+g*0.015625+h;
            }
            function helpers(n,x,y) { for(local i=0;i<n;i++) x=blend(x,y)+cos(y); return x }
            function nested(n,x,y) { for(local i=0;i<n;i++) for(local j=0;j<3;j++) x=blend(x,y); return x }
            function continuing(n,x,y) {
                for(local i=0;i<n;i++) { if(i%3==0) {x=blend(x,y); continue;} x=blend(y,x); }
                return x;
            }
            function breaking(n,x,y) { for(local i=0;i<n;i++) { if(i==9) break; x=blend(x,y); } return x }
            function early(n,x,y) { for(local i=0;i<n;i++) {x=blend(x,y); if(i==9) return x;} return y }
            function sequential(n,x,y) {
                for(local i=0;i<n;i++) x=blend(x,y);
                for(local i=0;i<n;i++) y=blend(y,x);
                return x+y;
            }
            function float_limit(n,x,y) {
                for(local remaining=n*0.5;remaining>0.0;remaining-=0.5) x=blend(x,y);
                return x;
            }
            function late(a,n) { local x=0.125; for(local i=0;i<n;i++) x=blend(x,a[i]); return x }
            for(local j=0;j<3;j++) if(late([1.0,2.0,3.0,4.0],4)!=7.83642578125) throw "late warmup";
            local caught=false; try { late([1.0,2.0,"bad",4.0],4) } catch(e) {caught=true}
            if(!caught) throw "late guard failure lost";
        )SQ"), "define floating loops, calls and late guard");
        size_t sample=0;
        const SQFloat values[] = {0.0, -0.0, 0.125, -3.75, 1.0e150,
            std::numeric_limits<SQFloat>::denorm_min(), std::numeric_limits<SQFloat>::infinity(),
            std::numeric_limits<SQFloat>::quiet_NaN()};
        for(const char *name : {"chain","region","swap","rotate","original","branches","pressure","helpers",
            "nested","continuing","breaking","early","sequential","float_limit"})
            for(SQInteger n : {31,0,1,2,7,127}) for(SQFloat x : values) {
                SQFloat actual = 0;
                CHECK(call(v, name, n, x, -0.25, actual), "floating workload returns a double");
                if(!enabled) reference.push_back(actual);
                else CHECK((std::isnan(actual) && std::isnan(reference[sample])) ||
                    !memcmp(&actual, &reference[sample], sizeof(actual)),
                    "native floating values match interpreter including signed zero and exceptional values");
                ++sample;
            }
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            for(const char *name : {"chain","swap","rotate","original","branches","pressure","helpers","nested",
                "continuing","breaking","early","sequential","float_limit"})
                CHECK(observe(v, name).frame.successes > 0, "floating cases execute native whole functions");
            CHECK(observe(v, "region").loop.successes > 0, "floating loop region executes natively");
            CHECK(observe(v, "late").frame.successes > 0 && observe(v, "late").direct.guard_failures > 0,
                "floating guard test exercises native success and rollback");
        }
#endif
        // Rebinding invalidates the hoisted identity guard without exposing
        // stale register contents or changing argument/return semantics.
        CHECK(run(v, "blend=function(x,y){return x-y;}; if(chain(3,1.0,0.25)!=-1.25) throw \"rebound leaf\";"),
            "floating call guard sees replacement");
        sq_close(v);
    }
    return failures ? 1 : 0;
}
