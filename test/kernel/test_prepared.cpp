#include "kernel/kernel.h"
#include <iostream>
#include <stdexcept>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#elif defined(__aarch64__) && defined(__linux__)
#include <fpu_control.h>
#endif
using namespace sqkernel;
static void check(bool ok,const char *message){if(!ok)throw std::runtime_error(message);}
int main(){
    if(!supported())return 77;
    try {
        auto m=compile(R"(
            export i64 integer(i64 x){return x+1;}
            export f64 half(f64 x){return x*0.5;}
            bool helper(f64 x){return x>0.0;}
            export bool compare(f64 x){return helper(x);}
            export f64 fail(f64 x){require(x>0.0);return x;}
            export i64 integer_fail(i64 x){require(x>0);return x;}
            export f64 third(f64 x){return x/3.0;}
        )","prepared.sqk");
        auto integer=prepare(*m,0),half=prepare(*m,1),compare=prepare(*m,3),fail=prepare(*m,4),integer_fail=prepare(*m,5);
        check(!integer.floating && !integer_fail.floating,"integer entry unnecessarily changes floating environment");
        check(half.floating && compare.floating && fail.floating,"floating entry lacks environment guard");
#if defined(__x86_64__) || defined(_M_X64)
        struct Restore {unsigned old=_mm_getcsr();~Restore(){_mm_setcsr(old);}} restore;
        const unsigned hostile=(_mm_getcsr() & ~0x6000u)|0x6000u|0x8040u|0x1f80u|0x21u;
        _mm_setcsr(hostile);
        uint64_t arg=41;Call call{&arg,0,1000,0};
        check(execute(integer,call)==Success && call.result==42,"prepared integer result");
        check(_mm_getcsr()==hostile,"integer changed MXCSR");
        arg=0x0010000000000000ull;call={&arg,0,1000,0};
        check(execute(half,call)==Success && call.result==0x0008000000000000ull,"gradual underflow lost");
        check(_mm_getcsr()==hostile,"floating success failed to restore MXCSR");
        arg=1;call={&arg,0,1000,0}; // Smallest subnormal must survive DAZ.
        check(execute(compare,call)==Success && call.result==1,"inlined float comparison lacked environment guard");
        check(_mm_getcsr()==hostile,"comparison changed MXCSR");
        arg=0xbff0000000000000ull;call={&arg,0,1000,0};
        check(execute(fail,call)==RequirementError && call.error_line!=0,"floating failure status");
        check(_mm_getcsr()==hostile,"floating error failed to restore MXCSR");
        arg=0;call={&arg,0,1000,0};
        check(execute(integer_fail,call)==RequirementError,"integer failure status");
        check(_mm_getcsr()==hostile,"integer error changed MXCSR");
#elif defined(__aarch64__) && defined(__linux__)
        struct Restore {
            fpu_control_t control; fpu_fpsr_t status;
            Restore(){_FPU_GETCW(control);_FPU_GETFPSR(status);}
            ~Restore(){_FPU_SETCW(control);_FPU_SETFPSR(status);}
        } restore;
        // Rounding toward zero, flushing subnormals, default NaNs, and sticky
        // status (including SIMD saturation) must survive every exit path.
        _FPU_SETCW(0x3c00000u);
        _FPU_SETFPSR(0x8000011u);
        fpu_control_t hostile; fpu_fpsr_t sticky;
        _FPU_GETCW(hostile);_FPU_GETFPSR(sticky);
        auto restored=[&](){
            fpu_control_t control;fpu_fpsr_t status;
            _FPU_GETCW(control);_FPU_GETFPSR(status);
            check(control==hostile && status==sticky,"kernel changed caller FPCR/FPSR");
        };
        uint64_t arg=41;Call call{&arg,0,1000,0};
        check(execute(integer,call)==Success && call.result==42,"prepared ARM64 integer result");restored();
        arg=0x0010000000000000ull;call={&arg,0,1000,0};
        check(execute(half,call)==Success && call.result==0x0008000000000000ull,"ARM64 gradual underflow lost");restored();
        arg=1;call={&arg,0,1000,0};
        check(execute(compare,call)==Success && call.result==1,"ARM64 subnormal input lost");restored();
        arg=0xbff0000000000000ull;call={&arg,0,1000,0};
        check(execute(fail,call)==RequirementError && call.error_line!=0,"ARM64 floating failure status");restored();
        arg=0;call={&arg,0,1000,0};
        check(execute(integer_fail,call)==RequirementError,"ARM64 integer failure status");restored();
        // Nearest rounding must be used even under a directed host mode and
        // enabled traps (where implemented). Inexact status must not leak.
        _FPU_SETCW(0x400000u | _FPU_FPCR_IEEE);
        _FPU_GETCW(hostile);
        arg=0x3ff0000000000000ull;call={&arg,0,1000,0};
        check(execute(prepare(*m,6),call)==Success && call.result==0x3fd5555555555555ull,"ARM64 kernel rounding mode");restored();
#endif
        std::cout<<"prepared entries and floating environment passed\n";
        return 0;
    }catch(const std::exception &e){std::cerr<<e.what()<<"\n";return 1;}
}
