#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqstdmath.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include <stdio.h>
#include <initializer_list>
#include <limits>
#include <string>
#include <cmath>
#include <cstring>

#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
static SQInteger fake_sqrt(HSQUIRRELVM v) { sq_pushfloat(v, 123.0f); return 1; }
static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("intrinsics"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) {
        sq_getlasterror(v); const SQChar *message = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &message))) scprintf(_SC("FAIL: %s\n"), message);
    }
    sq_settop(v, top); return ok;
}
static SQJitObservation observe(SQVM *v, const SQChar *name)
{
    SQJitObservation o = {};
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT value; sq_getstackobj(v, -1, &value);
        if(sq_type(value) == OT_CLOSURE) sqjit_observe_proto(_closure(value)->_function, o);
        sq_pop(v, 1);
    }
    sq_pop(v, 1); return o;
}
static bool call_numeric(SQVM *v, const SQChar *name, SQFloat first, SQFloat second,
    SQFloat &out, const SQInteger *integer = NULL)
{
    SQInteger top = sq_gettop(v);
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    bool ok = SQ_SUCCEEDED(sq_get(v, -2));
    if(ok) {
        sq_pushroottable(v);
        if(integer) sq_pushinteger(v, *integer); else sq_pushfloat(v, first);
        sq_pushfloat(v, second);
        ok = SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQTrue)) && sq_gettype(v, -1) == OT_FLOAT &&
            SQ_SUCCEEDED(sq_getfloat(v, -1, &out));
    }
    sq_settop(v, top);
    return ok;
}

static int floating_contracts(SQVM *v, bool enabled)
{
    int rc = 0;
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    const SQChar *names[] = {_SC("sqrt"), _SC("sin"), _SC("cos"), _SC("asin"), _SC("acos"),
        _SC("log"), _SC("log10"), _SC("tan"), _SC("atan"), _SC("floor"), _SC("ceil"),
        _SC("exp"), _SC("fabs"), _SC("atan2"), _SC("pow")};
    for(int n = 0; n < 15; ++n) {
        std::basic_string<SQChar> source = _SC("function checked_math(x,y) { return ");
        source += names[n]; source += n < 13 ? _SC("(x) }") : _SC("(x,y) }");
        CHECK(run(v, source.c_str()), "define floating contract");
        const SQFloat values[] = {(SQFloat)0.25, (SQFloat)-0.0, (SQFloat)-3.5,
            std::numeric_limits<SQFloat>::infinity(), std::numeric_limits<SQFloat>::quiet_NaN()};
        for(SQFloat arg : values) {
            SQFloat expected = 0, actual = 0;
            ctx.enabled = false;
            CHECK(call_numeric(v, _SC("checked_math"), arg, (SQFloat)2.5, expected), "interpreter floating reference");
            ctx.enabled = enabled;
            CHECK(call_numeric(v, _SC("checked_math"), arg, (SQFloat)2.5, actual), "native floating result");
            CHECK((std::isnan(expected) && std::isnan(actual)) || !std::memcmp(&expected, &actual, sizeof(SQFloat)),
                "all audited evaluators preserve results, signed zero and exceptional values");
        }
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v, _SC("checked_math")).frame.successes > 0,
            "floating contracts exercise native evaluation");
#endif
    }
    CHECK(run(v, _SC("function checked_conversion(x,y) { local value=x+0; return value.tofloat() }")),
        "define signed conversion contract");
    const SQInteger integers[] = {0, 1, -1, 16777215, 16777217, -16777217,
        9007199254740991LL, 9007199254740993LL, -9007199254740993LL,
        std::numeric_limits<SQInteger>::max(), std::numeric_limits<SQInteger>::min()};
    for(SQInteger value : integers) {
        SQFloat actual = 0, expected = (SQFloat)value;
        CHECK(call_numeric(v, _SC("checked_conversion"), 0, 0, actual, &value), "native signed conversion result");
        CHECK(!std::memcmp(&expected, &actual, sizeof(SQFloat)), "conversion preserves sign and rounding at precision boundaries");
    }
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) CHECK(observe(v, _SC("checked_conversion")).frame.successes > 0,
        "signed conversion executes natively");
#endif
    CHECK(run(v, _SC("function checked_precision(x,y) { return x*1.0000000000009094947017729282379150390625+y-1.0 }")),
        "define binary64 literal and arithmetic contract");
    for(SQFloat input : {1.0, 16777217.0, 1.0e150, -1.0e150}) {
        SQFloat expected = 0, actual = 0;
        ctx.enabled = false;
        CHECK(call_numeric(v, _SC("checked_precision"), input, 0.0000000000009094947017729282379150390625, expected),
            "interpreter binary64 arithmetic reference");
        ctx.enabled = enabled;
        CHECK(call_numeric(v, _SC("checked_precision"), input, 0.0000000000009094947017729282379150390625, actual),
            "native binary64 arithmetic result");
        CHECK(!std::memcmp(&expected, &actual, sizeof(SQFloat)), "native literals and arithmetic preserve binary64 precision");
    }
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
    if(enabled) {
        SQJitObservation o = observe(v, _SC("checked_precision"));
        if(!o.frame.successes) fprintf(stderr, "binary64 native rejection at %lld: %s\n",
            (long long)o.compilation.ip, o.compilation.reason ? o.compilation.reason : "none");
        CHECK(o.frame.successes > 0, "binary64 arithmetic executes natively");
    }
#endif
    return rc;
}

static int mutating_builtin_contracts(SQVM *v, bool enabled)
{
    int rc = 0;
    // Make the actual delegate tables available to aliasing tests. A store
    // through an ordinary argument can name the same object as a built-in.
    sq_pushroottable(v);
    sq_pushstring(v, _SC("number_methods"), -1); sq_getdefaultdelegate(v, OT_INTEGER);
    CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "expose number delegate");
    sq_pushstring(v, _SC("string_methods"), -1); sq_getdefaultdelegate(v, OT_STRING);
    CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "expose string delegate");
    sq_pop(v, 1);
    CHECK(run(v, _SC(R"SQ(
        function transform(a,n) {
            local sum=0.0;
            for(local i=0;i<n;i++) {
                a[i%5]=(i%17).tofloat()+(i%7).tofloat(); sum+=a[i%5];
            }
            return sum;
        }
        function rotate_labels(t,n) {
            marker(0); local sum=0;
            for(local i=0;i<n;i++) {
                local old=t.front; t.front=t.back; t.back=old;
                t.tag=i%2==0 ? "ready" : "waiting";
                sum+=t.tag.len();
            }
            return marker(sum);
        }
        function count_labels(t,n) {
            marker(0); local sum=0;
            for(local i=0;i<n;i++) { t.count=i; sum+=t.text.len(); }
            return marker(sum);
        }
        function invalidate_number(t,n) {
            marker(0); local sum=0.0;
            for(local i=0;i<n;i++) { sum+=(i+1).tofloat(); t.tofloat=17; }
            return marker(sum);
        }
        function invalidate_string(t,n) {
            marker(0); local sum=0;
            for(local i=0;i<n;i++) { sum+=t.text.len(); t.len="changed"; }
            return marker(sum);
        }
        function invalidate_dynamic(t,keys,n) {
            marker(0); local sum=0.0;
            for(local i=0;i<n;i++) {
                sum+=(i+1).tofloat(); local k=keys[i%2]; t[k]=17;
            }
            return marker(sum);
        }
        for(local j=0;j<3;j++) {
            if(transform([0.0,0.0,0.0,0.0,0.0],20)!=196.0) throw "mutating numeric conversions";
            if(rotate_labels({front=[0],back=[1],tag="initial"},20)!=120) throw "mutating string lengths";
            if(count_labels({count=0,text="ready"},20)!=100) throw "invariant length with member writes";
            if(invalidate_number({tofloat=0},3)!=6.0) throw "number alias warmup";
            if(invalidate_string({text="hello",len=""},3)!=15) throw "string alias warmup";
            if(invalidate_dynamic({a=0,b=0},["a","b"],3)!=6.0) throw "dynamic alias warmup";
        }
        if(transform([],0)!=0.0 || rotate_labels({},0)!=0) throw "zero trip entry guards";
    )SQ")), "mutating regions preserve numeric and string built-ins");
#if SQJIT_HAS_X64_NATIVE
    if(enabled) {
        CHECK(observe(v, _SC("transform")).frame.successes > 0, "array mutations execute native conversions");
        for(const SQChar *name : {_SC("rotate_labels"), _SC("count_labels"), _SC("invalidate_number"),
            _SC("invalidate_string"), _SC("invalidate_dynamic")})
            CHECK(observe(v, name).loop.successes > 0, "member mutation alias tests execute native loops");
    }
#endif
    CHECK(run(v, _SC(R"SQ(
        local original_number=number_methods.tofloat, original_string=string_methods.len;
        local caught=false;
        try { invalidate_number(number_methods,3) } catch(e) { caught=true }
        local replaced=number_methods.tofloat==17;
        number_methods.tofloat=original_number;
        if(!caught || !replaced) throw "conversion guard crossed an aliased delegate write";
        string_methods.text <- "hello";
        caught=false; try { invalidate_string(string_methods,3) } catch(e) { caught=true }
        replaced=string_methods.len=="changed";
        string_methods.len=original_string; delete string_methods.text;
        if(!caught || !replaced) throw "length guard crossed an aliased delegate write";
        number_methods.unrelated <- 0;
        caught=false;
        try { invalidate_dynamic(number_methods,["unrelated","tofloat"],3) } catch(e) { caught=true }
        replaced=number_methods.tofloat==17 && number_methods.unrelated==17;
        number_methods.tofloat=original_number; delete number_methods.unrelated;
        if(!caught || !replaced) throw "conversion guard crossed a dynamic delegate write";
        number_methods.tofloat=function() { return 100.0 };
        if(transform([0.0,0.0,0.0,0.0,0.0],20)!=4000.0) throw "conversion entry rebinding";
        number_methods.tofloat=original_number;
        string_methods.len=function() { return 99 };
        if(count_labels({count=0,text="ready"},20)!=1980) throw "hoisted length entry rebinding";
        if(rotate_labels({front=[0],back=[1],tag="initial"},20)!=1980) throw "length entry rebinding";
        string_methods.len=original_string;
    )SQ")), "delegate aliases, dynamic keys and rebinding keep guard placement sound");
    return rc;
}

int main()
{
    int rc = 0;
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(64);
        sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v, 1);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1; ctx.trace = ctx.trace_stats = false;
        sqjit_observe_enable(v);
        CHECK(run(v, _SC(
            "function kernel(n) { local sum=0.0; for(local i=0;i<n;i++) { local x=((i%9)+1).tofloat(); sum+=sqrt(x*x)+cos(0.0); }; return sum }\n"
            "function marker(x) { return x }\n"
            "function region(n) { marker(0); local sum=0.0; for(local i=0;i<n;i++) { local x=((i%9)+1).tofloat(); sum+=sqrt(x*x)+cos(0.0); }; return marker(sum) }\n"
            "function simple(x) { return sqrt(x) }\n"
            "function guarded(a,x) { a[0]=a[0]+1; return sqrt(x) }\n"
            "function binary(x,y) { return pow(x,y) }\n"
            "if(kernel(9)!=54.0 || kernel(18)!=108.0 || region(9)!=54.0 || region(0)!=0.0) throw \"native math loop\";\n"
            "if(simple(4)!=2.0 || simple(9)!=3.0 || simple(9.0)!=3.0 || binary(2,3)!=8.0 || binary(3,2)!=9.0 || binary(3.0,2.0)!=9.0) throw \"numeric arguments\";\n"
            "local a=[0]; if(guarded(a,4)!=2.0 || guarded(a,9)!=3.0 || a[0]!=2) throw \"logged math warmup\";\n"
            "local caught=false; try { simple(true) } catch(e) { caught=true }; if(!caught) throw \"math boolean argument accepted\";\n"
        )), "pure math preserves values and argument checks");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) {
            for(const SQChar *name : {_SC("kernel"), _SC("simple"), _SC("binary"), _SC("guarded")}) {
                SQJitObservation o = observe(v, name);
                if(!o.compilation.compiled || !o.frame.successes || !o.direct.successes)
                    scprintf(_SC("route failure: %s, ip=%lld, reason=%s\n"), name,
                        (long long)o.compilation.ip, o.compilation.reason ? o.compilation.reason : "-");
                CHECK(o.frame.successes && o.direct.successes && o.compilation.compiled,
                    "math whole-function frame/direct routes execute");
            }
            CHECK(observe(v, _SC("region")).loop.successes > 0, "math loop region executes");
        }
#endif
        rc += floating_contracts(v, enabled != 0);
        rc += mutating_builtin_contracts(v, enabled != 0);
        {
            sq_getdefaultdelegate(v, OT_INTEGER);
            sq_pushstring(v, _SC("tofloat"), -1);
            CHECK(SQ_SUCCEEDED(sq_get(v, -2)), "save number conversion delegate");
            HSQOBJECT object; sq_getstackobj(v, -1, &object);
            SQObjectPtr saved(object);
            sq_pop(v, 1);
            sq_pushstring(v, _SC("tofloat"), -1);
            sq_newclosure(v, fake_sqrt, 0);
            CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "replace number conversion delegate");
            CHECK(run(v, _SC("if(checked_conversion(7,0)!=123.0) throw \"hoisted conversion identity\";")),
                "conversion checks delegate rebinding at native entry");
#if SQJIT_HAS_X64_NATIVE
            if(enabled) CHECK(observe(v, _SC("checked_conversion")).frame.guard_failures +
                observe(v, _SC("checked_conversion")).direct.guard_failures > 0,
                "rebound numeric conversion fails its native guard");
#endif
            sq_pushobject(v, saved); sq_pushroottable(v);
            CHECK(SQ_SUCCEEDED(sq_bindenv(v, -2)), "bind original conversion to a table receiver");
            sq_getstackobj(v, -1, &object); SQObjectPtr bound(object);
            sq_pop(v, 2);
            sq_pushstring(v, _SC("tofloat"), -1); sq_pushobject(v, bound);
            CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "install conversion with bound environment");
            CHECK(run(v, _SC("if(checked_conversion(7,0)!=null) throw \"conversion bound receiver\";")),
                "same native function with a bound receiver preserves interpreter semantics");
            sq_pushstring(v, _SC("tofloat"), -1); sq_pushobject(v, saved);
            CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "restore number conversion delegate");
            sq_pop(v, 1);
        }
        CHECK(run(v, _SC(
            "function overwrite_math(value) { local before=sqrt(4.0); this.sqrt=value; return sqrt(4.0) }\n"
            "local caught=false; try { overwrite_math(1) } catch(e) { caught=true };\n"
            "if(!caught || typeof ::sqrt!=\"integer\") throw \"guard moved across root mutation\";\n"
        )), "callee guards remain after mutations with interpreter-equivalent errors");
#if SQJIT_HAS_X64_NATIVE
        if(enabled) CHECK(observe(v, _SC("overwrite_math")).frame.guard_failures +
            observe(v, _SC("overwrite_math")).direct.guard_failures > 0,
            "mutating math function guard-fails after changing the callee");
#endif
        sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v, 1);
        sq_pushroottable(v); sq_pushstring(v, _SC("sqrt"), -1);
        sq_newclosure(v, fake_sqrt, 0); sq_setparamscheck(v, 2, _SC(".n"));
        sq_setnativeclosurename(v, -1, _SC("sqrt"));
        CHECK(SQ_SUCCEEDED(sq_newslot(v, -3, SQFalse)), "replace sqrt with same-named native closure");
        sq_pop(v, 1);
        CHECK(run(v, _SC(
            "local a=[0]; if(simple(4)!=123.0 || guarded(a,4)!=123.0 || a[0]!=1) throw \"callee identity/rollback\";\n"
            "if(kernel(9)!=1116.0 || region(9)!=1116.0) throw \"hoisted intrinsic identity\";\n"
            "function lookalike(x) { return sqrt(x) } if(lookalike(4)!=123.0) throw \"name-based intrinsic recognition\";\n"
        )), "callee replacement falls back with exact side effects");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        if(enabled) CHECK(observe(v, _SC("guarded")).direct.guard_failures > 0,
            "rebound intrinsic guard fails after logged mutation");
#endif
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            CHECK(observe(v, _SC("kernel")).direct.guard_failures > 0,
                "hoisted whole-function guard checks rebinding at every entry");
            CHECK(observe(v, _SC("region")).loop.guard_failures > 0,
                "hoisted loop guard checks rebinding at every entry");
        }
#endif
        sq_close(v);
    }
    return rc ? 1 : 0;
}
