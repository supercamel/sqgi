#include <squirrel.h>
#include "sqgi_kernel.h"
#include <cstdio>
#include <cstring>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#elif defined(__aarch64__) && defined(__linux__)
#include <fpu_control.h>
#endif
struct FloatingState {
    unsigned control=0,status=0;
    FloatingState() {
#if defined(__x86_64__) || defined(_M_X64)
        control=_mm_getcsr();
#elif defined(__aarch64__) && defined(__linux__)
        _FPU_GETCW(control);_FPU_GETFPSR(status);
#endif
    }
    void restore() const {
#if defined(__x86_64__) || defined(_M_X64)
        _mm_setcsr(control);
#elif defined(__aarch64__) && defined(__linux__)
        _FPU_SETCW(control);_FPU_SETFPSR(status);
#endif
    }
    bool operator==(const FloatingState &other) const {
        return control==other.control && status==other.status;
    }
};
static bool run(HSQUIRRELVM v,const char *source,SQObject *result=nullptr) {
    const SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,std::strlen(source),"method-environment",SQTrue));
    if(ok){sq_pushroottable(v);ok=SQ_SUCCEEDED(sq_call(v,1,result?SQTrue:SQFalse,SQFalse));}
    if(ok && result)sq_getstackobj(v,-1,result); // Tests return only scalar values.
    if(!ok){sq_getlasterror(v);const SQChar *message=nullptr;sq_getstring(v,-1,&message);std::fprintf(stderr,"%s\n",message?message:"script failure");}
    sq_settop(v,top);return ok;
}
int main(){
    auto v=sq_open(256);sq_pushroottable(v);sq_pushstring(v,"sqgi",-1);sq_newtable(v);sq_newslot(v,-3,SQFalse);sq_pop(v,1);
    sqgi_kernel_register(v);
    bool ok=run(v,R"SQ(
        module <- sqgi.kernel.compile(@"
            class State {
                i64 count;
                f64 half(f64 x){this.count+=1;return x*0.5;}
                f64 fail(f64 x){this.count+=1;require(x>0.0);return x;}
            };");
        state <- module.State();
        loop <- sqgi.llvm.compile(function(c,n,x){local r=0.0;for(local i=0;i<n;i++)r=c.half(x);return r;});
        fail <- sqgi.llvm.compile(function(c,n,x){local r=0.0;for(local i=0;i<n;i++)r=c.fail(x);return r;});
        for(local i=0;i<3;i++){loop(state,100,2.0);fail(state,100,2.0);}
        if(sqgi.llvm.info(loop).prepared_calls==0 || sqgi.llvm.info(fail).prepared_calls==0)throw "not prepared";
        state.count=0;
    )SQ");
    const FloatingState saved;
    FloatingState hostile=saved;
#if defined(__x86_64__) || defined(_M_X64)
    hostile.control=(saved.control & ~0x6000u)|0x6000u|0x8040u|0x1f80u|0x21u;
#elif defined(__aarch64__) && defined(__linux__)
    hostile.control=0x3c00000u;hostile.status=0x8000011u;
#endif
    // Passing the smallest normal value must produce a subnormal, even with FTZ.
    sq_pushroottable(v);sq_pushstring(v,"input",-1);
    uint64_t bits=0x0010000000000000ull;SQFloat value;std::memcpy(&value,&bits,8);sq_pushfloat(v,value);sq_newslot(v,-3,SQFalse);sq_pop(v,1);
    SQObject result{};hostile.restore();
    ok=run(v,"return loop(state,10,input);",&result) && ok;
    const FloatingState after;saved.restore();
    uint64_t output=0;std::memcpy(&output,&result._unVal,8);
    ok=ok && result._type==OT_FLOAT && output==0x0008000000000000ull && after==hostile;
    hostile.restore();
    bool failed=!run(v,"fail(state,10,-1.0);");
    const FloatingState after_failure;saved.restore();
    ok=ok && failed && after_failure==hostile;
    ok=run(v,"if(state.count!=11)throw \"failed method replayed\";") && ok;
    // Changing native signature metadata must disable the prevalidated path.
    sq_pushroottable(v);sq_pushstring(v,"state",-1);sq_get(v,-2);sq_getdelegate(v,-1);
    sq_pushstring(v,"half",-1);sq_get(v,-2);sq_setparamscheck(v,3,nullptr);sq_settop(v,0);
    ok=!run(v,"loop(state,10,2.0);") && ok;
    ok=run(v,"if(state.count!=11)throw \"signature guard bypassed\";") && ok;
    sq_close(v);std::puts(ok?"prepared method floating environment and signature guards passed":"FAIL: prepared method environment/guards");return ok?0:1;
}
