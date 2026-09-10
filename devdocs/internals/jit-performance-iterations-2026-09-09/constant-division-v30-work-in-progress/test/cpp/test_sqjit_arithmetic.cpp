#include "sqpcheader.h"
#include "jit/sqjit_backend_x64_emit.h"
#include "jit/sqjit_backend_aarch64_emit.h"
#include "jit/sqjit_code.h"
#include "jit/sqjit_platform.h"
#include <stdint.h>
#include <stdio.h>
#include <limits>
#include <vector>
#include <string.h>

int main()
{
#if SQJIT_HAS_X64_NATIVE
    // More live doubles than cache registers exercises eviction. Raw reads
    // must reconcile cached values without changing NaN payloads or -0 bits.
    const uint64_t float_bits[] = {UINT64_C(0x8000000000000000),UINT64_C(0x7ff8000000001234),
        UINT64_C(0x3ff8000000000000),UINT64_C(0x7ff0000000000000),
        UINT64_C(0xfff0000000000000),UINT64_C(0x0000000000000001)};
    for(int wanted=0; wanted<6; ++wanted) {
        SQJitNativeCodeBuffer b; b.cache_floats=true;
        if(!sqjit_native_emit_push_rbp(&b) || !sqjit_native_emit_mov_rbp_rsp(&b) ||
            !sqjit_native_emit_sub_rsp_i32(&b,128)) return 1;
        for(int n=0;n<6;++n) {
            SQFloat value; memcpy(&value,&float_bits[n],sizeof(value));
            if(!sqjit_native_emit_mov_local_float_const(&b,n+4,value)) return 1;
        }
        if(!sqjit_native_emit_mov_rax_local_mem(&b,wanted+4) ||
            !sqjit_native_emit_mov_rsp_rbp(&b) || !sqjit_native_emit_pop_rbp(&b) ||
            !sqjit_native_emit_ret(&b)) return 1;
        SQJitCode code; if(!code.Install(b.bytes,b.size)) return 1;
        typedef uint64_t (*ReadBits)();
        if(reinterpret_cast<ReadBits>(code.Entry())()!=float_bits[wanted]) {
            puts("FAIL: floating register cache changed value bits"); return 1;
        }
    }
    {
        SQJitNativeCodeBuffer b; b.cache_floats=true;
        SQInteger taken,end;
        if(!sqjit_native_emit_push_rbp(&b) || !sqjit_native_emit_mov_rbp_rsp(&b) ||
            !sqjit_native_emit_sub_rsp_i32(&b,128) ||
            !sqjit_native_emit_mov_local_float_const(&b,4,1.5) ||
            !sqjit_native_emit_mov_rax_arg3(&b) || !sqjit_native_emit_test_rax_rax(&b) ||
            !sqjit_native_emit_jcc_placeholder(&b,SQ_JIT_JCC_E,&taken) ||
            !sqjit_native_emit_mov_local_float_const(&b,4,2.5) ||
            !sqjit_native_emit_jmp_placeholder(&b,&end)) return 1;
        SQInteger label=b.size;
        if(!sqjit_native_patch_i32(&b,taken,label-taken-4) ||
            !sqjit_native_patch_i32(&b,end,label-end-4) ||
            !sqjit_native_emit_mov_xmm0_local_float(&b,4) ||
            !sqjit_native_emit_mov_rsp_rbp(&b) || !sqjit_native_emit_pop_rbp(&b) ||
            !sqjit_native_emit_ret(&b)) return 1;
        SQJitCode code; if(!code.Install(b.bytes,b.size)) return 1;
        typedef SQFloat (*Branch)(void *,void *,SQInteger);
        Branch f=reinterpret_cast<Branch>(code.Entry());
        if(f(NULL,NULL,0)!=1.5 || f(NULL,NULL,1)!=2.5) {
            puts("FAIL: floating cache at control-flow joins"); return 1;
        }
    }
#endif
#if SQJIT_HAS_X64_NATIVE || (defined(__aarch64__) && defined(__linux__))
    std::vector<SQInteger> divisors = {1,2,3,4,5,7,8,11,17,31,63,64,65,97,127,251,997,
        1000003,1000000007,2147483647,2147483648LL,4294967297LL,
        4611686018427387904LL,9223372036854775807LL};
    uint64_t random = UINT64_C(0x84954218deb32761);
    auto next = [&]() { random ^= random << 13; random ^= random >> 7; random ^= random << 17; return random; };
    for(int i=0; i<150; ++i) divisors.push_back((next() >> 1) | 1);
    for(SQInteger d : divisors) for(int remainder=0; remainder<2; ++remainder) {
#if SQJIT_HAS_X64_NATIVE
        SQJitNativeCodeBuffer buf;
        if(!sqjit_native_emit_mov_rax_arg3(&buf) ||
            !sqjit_native_emit_divmod_constant(&buf,d,remainder != 0) ||
            !sqjit_native_emit_ret(&buf)) return 1;
#else
        SQJitA64Buffer buf={};
        if(!sqjit_a64_emit_mov_reg(&buf,9,2) ||
            !sqjit_a64_emit_divmod_constant(&buf,d,remainder != 0) ||
            !sqjit_a64_emit_mov_reg(&buf,0,9) ||
            !sqjit_a64_emit_u32(&buf,0xd65f03c0u)) return 1;
        for(SQInteger offset=0;offset<buf.size;offset+=4) {
            uint32_t word; memcpy(&word,buf.bytes+offset,4);
            if((word&0xffe0fc00u)==0x9ac00c00u) {
                puts("FAIL: constant lowering retained hardware division"); return 1;
            }
        }
#endif
        SQJitCode code;
        if(!code.Install(buf.bytes,buf.size)) return 1;
        typedef SQInteger (*Function)(void *,void *,SQInteger);
        Function f = reinterpret_cast<Function>(code.Entry());
        std::vector<SQInteger> values = {0,1,-1,d-1,d,-d,-d+1,
            std::numeric_limits<SQInteger>::min(),std::numeric_limits<SQInteger>::min()+1,
            std::numeric_limits<SQInteger>::max()-1,std::numeric_limits<SQInteger>::max()};
        // Adjacent multiples catch incorrect reciprocal rounding, including signs.
        for(SQInteger k=2; k<20 && d<=std::numeric_limits<SQInteger>::max()/k; ++k)
            for(SQInteger offset=-1; offset<=1; ++offset) {
                if(offset == 1 && d*k == std::numeric_limits<SQInteger>::max()) continue;
                values.push_back(d*k+offset); values.push_back(-(d*k+offset));
            }
        for(int i=0; i<2000; ++i) {
            uint64_t bits=next(); SQInteger n; memcpy(&n,&bits,sizeof(n)); values.push_back(n);
        }
        for(SQInteger n : values) {
            SQInteger want = remainder ? n%d : n/d;
            SQInteger got=f(NULL,NULL,n);
            if(got!=want) {
                fprintf(stderr,"FAIL: %lld %s %lld: %lld != %lld\n",(long long)n,
                    remainder?"%":"/",(long long)d,(long long)got,(long long)want);
                return 1;
            }
        }
    }
#if SQJIT_HAS_X64_NATIVE
    SQJitNativeCodeBuffer buf;
    if(sqjit_native_emit_divmod_constant(&buf,0,false) ||
        sqjit_native_emit_divmod_constant(&buf,-1,true) || buf.size) return 1;
#else
    SQJitA64Buffer buf={};
    if(sqjit_a64_emit_divmod_constant(&buf,0,false) ||
        sqjit_a64_emit_divmod_constant(&buf,-1,true) ||
        sqjit_a64_emit_divmod_constant(&buf,-7,false) || buf.size) return 1;
#endif
    puts("[OK] emitted int64 division/remainder: boundaries, multiples and random inputs");
#endif
    return 0;
}
