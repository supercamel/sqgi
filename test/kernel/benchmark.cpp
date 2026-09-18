// Informational benchmark, deliberately not a pass/fail performance test.
#include "kernel/kernel.h"
#include <chrono>
#include <cstring>
#include <iostream>
#include <vector>
#if defined(_MSC_VER)
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE __attribute__((noinline))
#endif
using Clock=std::chrono::steady_clock;
static NOINLINE void baseline(const double *in,double *out,int64_t count,double scale) {
    if(count<0 || count>1024) return;
    for(int64_t i=0;i<count;++i) out[i]=in[i]*scale+1.0;
}
int main() {
    if(!sqkernel::supported()) return 77;
    auto start=Clock::now();
    auto m=sqkernel::compile(R"(
export void transform(in f64 input[1024], inout f64 output[1024], i64 count, f64 scale) {
    require(count >= 0 && count <= 1024);
    for (i64 i = 0; i < count; i += 1) { output[i] = input[i] * scale + 1.0; }
})","benchmark.sqk");
    double compile_ms=std::chrono::duration<double,std::milli>(Clock::now()-start).count();
    std::vector<double> input(1024),output(1024);
    for(size_t i=0;i<input.size();++i) input[i]=(double)i;
    double scale=1.5; uint64_t scale_bits; memcpy(&scale_bits,&scale,8);
    uint64_t args[]={(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)output.data(),1024,scale_bits};
    const int repetitions=20000;
    volatile double checksum=0;
    start=Clock::now();
    for(int i=0;i<repetitions;++i) {
        sqkernel::Call call{args,0,10000,0};
        if(sqkernel::execute(*m,0,call)!=sqkernel::Success) return 1;
        checksum+=output[i%1024];
    }
    double native_ns=std::chrono::duration<double,std::nano>(Clock::now()-start).count()/repetitions;
    start=Clock::now();
    for(int i=0;i<repetitions;++i) {baseline(input.data(),output.data(),1024,scale);checksum+=output[i%1024];}
    double cpp_ns=std::chrono::duration<double,std::nano>(Clock::now()-start).count()/repetitions;
    std::cout<<"backend="<<sqkernel::backend_name()<<" compile_ms="<<compile_ms<<" kernel_batch_ns="<<native_ns<<" cpp_batch_ns="<<cpp_ns
             <<" kernel_over_cpp="<<native_ns/cpp_ns<<" checksum="<<checksum<<"\n";
}
