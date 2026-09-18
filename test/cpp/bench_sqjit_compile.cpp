/* Standalone compile/teardown cost probe; deliberately not a CTest test.
 * Measures the backend directly, excluding parser, hotness and VM dispatch.
 */
#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_backend.h"
#include <algorithm>
#include <chrono>
#include <cstdio>
#include <vector>

using Clock = std::chrono::steady_clock;
static double micros(Clock::time_point begin, Clock::time_point end) {
    return std::chrono::duration<double, std::micro>(end - begin).count();
}
static double median(std::vector<double> values) {
    std::sort(values.begin(), values.end()); return values[values.size()/2];
}
int main() {
    SQVM *v = sq_open(128);
    sqjit_context(v->_sharedstate).enabled = false;
    const SQChar *source = _SC(
        "function step(x,i) { return (x*33+i*17+97)%1000003; }\n"
        "function branch(x,i) { if(i%2==0) return x+i%17; return x-i%13; }\n"
        "function floating(x,i) { return x*0.5+i; }\n"
        "function numeric(n) { local r=13; for(local i=0;i<n;i++) r=(r+(i%997)*31+(r%17)*7+11)%1000000007; return r; }\n"
        "function calls(n) { local r=7; for(local i=0;i<n;i++) r=step(r,i); return r; }\n"
        "function branches(n) { local r=0; for(local i=0;i<n;i++) r=branch(r,i); return r; }\n"
        "function array_read(n) { local a=[1,2,3,4],r=0; for(local i=0;i<n;i++) r+=a[i%4]; return r; }\n"
        "function array_float(n) { local a=[0.5,1.5,2.5,3.5],r=0.0; for(local i=0;i<n;i++) r+=a[i%4]; return r; }\n"
        "function array_write(n) { local a=[0,0,0,0]; for(local i=0;i<n;i++) a[i%4]=a[i%4]+i; return a[0]+a[1]+a[2]+a[3]; }\n"
        "function floats(n) { local r=0.0; for(local i=0;i<n;i++) r=floating(r,i%7); return r; }\n");
    if(SQ_FAILED(sq_compilebuffer(v, source, scstrlen(source), _SC("compile-bench"), SQTrue))) return 1;
    sq_pushroottable(v);
    if(SQ_FAILED(sq_call(v, 1, SQFalse, SQTrue))) return 1;
    sq_settop(v, 0);
    std::puts("case\tcompile_us\tfirst_native_us\twarm_ns_per_iteration\trelease_us");
    for(auto name : {_SC("numeric"), _SC("calls"), _SC("branches"), _SC("floats"), _SC("array_read"), _SC("array_float"), _SC("array_write")}) {
        SQObjectPtr callable;
        if(!_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, name)), callable)) return 1;
        SQClosure *closure = _closure(callable);
        SQObjectPtr args[] = {v->_roottable, SQObjectPtr((SQInteger)40000)};
        SQObjectPtr expected;
        sq_pushobject(v, callable); sq_pushroottable(v); sq_pushinteger(v, 40000);
        if(SQ_FAILED(sq_call(v, 2, SQTrue, SQTrue))) return 1;
        HSQOBJECT value; sq_getstackobj(v, -1, &value); expected = value; sq_settop(v, 0);
        auto matches = [&](const SQObjectPtr &out) {
            return sq_type(out) == sq_type(expected) &&
                (sq_type(out) == OT_FLOAT ? _float(out) == _float(expected) : _integer(out) == _integer(expected));
        };
        std::vector<double> compile, first, warm, release;
        for(unsigned sample = 0; sample < 9; ++sample) {
            auto start = Clock::now();
            SQJitNative *native = new SQJitNative;
            auto result = sqjit_backend_compile_proto(closure->_function, args, closure, native);
            auto compiled = Clock::now();
            if(!result.compiled || result.backend != SQ_JIT_BACKEND_LLVM) {
                std::fprintf(stderr, "compile failed: %s\n", result.reason); return 1;
            }
            auto entry = (SQJitNativeObjectFn)native->_code.Entry();
            SQObjectPtr out;
            if(entry(args, &out, closure) != SQ_JIT_NATIVE_RETURNED || !matches(out)) return 1;
            auto entered = Clock::now();
            for(unsigned iteration = 0; iteration < 25; ++iteration)
                if(entry(args, &out, closure) != SQ_JIT_NATIVE_RETURNED || !matches(out)) return 1;
            auto warmed = Clock::now();
            delete native;
            auto freed = Clock::now();
            compile.push_back(micros(start, compiled)); first.push_back(micros(compiled, entered));
            warm.push_back(micros(entered, warmed) * 1000 / (25 * 40000));
            release.push_back(micros(warmed, freed));
        }
        scprintf(_SC("%s\t%.3f\t%.3f\t%.3f\t%.3f\n"), name,
            median(compile), median(first), median(warm), median(release));
    }
    sq_close(v);
    return 0;
}
