#include "kernel/kernel.h"
#include "kernel/math.h"
#include <cmath>
#include <cstring>
#include <iostream>
#include <limits>
#include <sstream>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif
using namespace sqkernel;
static int failures=0;
static void check(bool ok,const std::string &label) {if(!ok){std::cerr<<"FAIL: "<<label<<"\n";++failures;}}
static uint64_t bits(double x){uint64_t b;std::memcpy(&b,&x,8);return b;}
static double real(uint64_t b){double x;std::memcpy(&x,&b,8);return x;}
static bool same(double a,double b) {
    if(std::isnan(b))return std::isnan(a);
    if(a==0.0 || b==0.0 || !std::isfinite(b))return bits(a)==bits(b);
    return std::isfinite(a) && std::fabs(a-b)<=2e-14*std::fabs(b);
}
static size_t find(const Module &m,const std::string &name) {
    for(size_t i=0;i<m.functions.size();++i)if(m.functions[i].name==name)return i;
    throw std::runtime_error("missing "+name);
}
static uint64_t run(const Module &m,const std::string &name,std::vector<uint64_t> args,Status expected=Success) {
    Call c{args.data(),0,10000,0};check(execute(m,find(m,name),c)==expected,name+" status");return c.result;
}
static void reject(const std::string &text) {
    try {compile(text,"invalid-math.sqk");check(false,"invalid math accepted: "+text);}
    catch(const std::exception &) {}
}
int main() {
    if(!supported())return 77;
    try {
        size_t count; const auto *catalog=math_builtins(count);
        std::ostringstream source;
        for(size_t i=0;i<count;++i) {
            const auto &s=catalog[i];
            source<<"export "<<(s.predicate?"bool":"f64")<<" test_"<<s.name<<"(f64 x";
            if(s.binary)source<<",f64 y";
            source<<"){return "<<s.name<<"(x"<<(s.binary?",y":"")<<");}\n";
        }
        source<<R"(
            f64 helper(f64 x){return sin(x)+cos(x);}
            export f64 live(f64 a,f64 b){return helper(a)*b+atan2(a,b);}
            export f64 alignment(f64 a,f64 unused){return sin(a);}
            export void memory(inout f64 out[4],f64 x) {
                out[0]=sqrt(x); out[1]=pow(out[0],2.0);
                require(isfinite(out[0])); out[2]=sin(out[1]);
            }
            export f64 loop(f64 x,i64 n){for(i64 i=0;i<n;i+=1){x=sin(x)+0.25;}return x;}
            export f64 literals(){return sqrt(4.0)+cos(0.0)+sin(0.0)+fabs(-2.0)+floor(1.75)+ceil(1.25)+round(-1.5);}
            export bool classify(){return isnan(sqrt(-1.0)) && isinf(log(0.0)) && !isfinite(pow(1.0e300,2.0));}
            export bool shorted(){return true || isnan(sqrt(-1.0));}
            export void discard(f64 x){sin(x);}
            f64 sin(f64 x){return x+10.0;}
            export f64 shadow(f64 x){return sin(x);}
        )";
        auto m=compile(source.str(),"math.sqk");
        const double inf=std::numeric_limits<double>::infinity(),nan=std::numeric_limits<double>::quiet_NaN();
        std::vector<double> values={-inf,-1000.0,-10.5,-2.0,-1.0,-0.5,-0.0,0.0,
            std::numeric_limits<double>::denorm_min(),0.25,0.5,1.0,1.5,2.0,10.5,1000.0,inf,nan};
        for(size_t i=0;i<count;++i) {
            const auto &s=catalog[i]; const std::string name="test_"+std::string(s.name);
            for(double x:values) for(size_t j=0;j<(s.binary?values.size():1);++j) {
                double y=values[j];std::vector<uint64_t> args={bits(x)};if(s.binary)args.push_back(bits(y));
                uint64_t actual=run(*m,name,args);
                if(s.predicate)check(actual==uint64_t(s.predicate(x)),name+" predicate");
                else check(same(real(actual),s.binary?s.binary(x,y):s.unary(x)),name+" libm result");
                Call native{args.data(),0,10000,0},reference=native;size_t f=find(*m,name);
                check(execute(*m,f,native)==interpret(m->functions[f],reference),name+" reference status");
                check(s.predicate?native.result==reference.result:same(real(native.result),real(reference.result)),name+" reference value");
                check(native.fuel==reference.fuel && native.error_line==reference.error_line,name+" reference metadata");
            }
        }
        check(real(run(*m,"literals",{}))==6.0,"constant math arithmetic");
        check(run(*m,"classify",{})==1 && run(*m,"shorted",{})==1,"domain values and short circuit");
        check(real(run(*m,"shadow",{bits(2)}))==12.0,"previously declared helper shadows builtin");
        check(same(real(run(*m,"live",{bits(0.5),bits(7)})),(std::sin(0.5)+std::cos(0.5))*7+std::atan2(0.5,7)),"live values across nested calls");
        check(same(real(run(*m,"alignment",{bits(0.5),bits(7)})),std::sin(0.5)),"alternate frame alignment");
        run(*m,"discard",{bits(0.5)});
        double x=0.5;for(int i=0;i<100;++i)x=std::sin(x)+0.25;
        check(same(real(run(*m,"loop",{bits(0.5),100})),x),"math in loop");
        uint64_t out[]={bits(7),bits(7),bits(7),bits(7)};
        run(*m,"memory",{(uint64_t)(uintptr_t)out,bits(-1)},RequirementError);
        check(std::isnan(real(out[0])) && std::isnan(real(out[1])) && real(out[2])==7,"math domain value followed by guarded partial write");
        run(*m,"memory",{(uint64_t)(uintptr_t)out,bits(4)});
        check(real(out[0])==2 && real(out[1])==4 && same(real(out[2]),std::sin(4.0)) && real(out[3])==7,"math stores and untouched tail");
#if defined(__x86_64__) || defined(_M_X64)
        unsigned saved=_mm_getcsr(),hostile=(saved|0x8040|0x6000)&~0x80u;
        _mm_setcsr(hostile);
        uint64_t value=run(*m,"test_sqrt",{bits(-1)});
        unsigned restored=_mm_getcsr();_mm_setcsr(saved);
        check(std::isnan(real(value)) && restored==hostile,"masked domain operation and exact caller FP restoration");
#endif
        for(const char *bad:{"export f64 f(){return sqrt(1);}","export f64 f(){return sin(true);}",
            "export f64 f(){return sqrt();}","export f64 f(){return sqrt(1.0,2.0);}",
            "export f64 f(){return atan2(1.0);}","export f64 f(){return pow(1.0,2.0,3.0);}",
            "export f64 f(){return isfinite(1.0);}","export bool f(){return sqrt(1.0);}",
            "export f64 sin(f64 x){return sin(x);}"})reject(bad);
        std::cout<<"checked "<<count<<" kernel math builtins\n";
    } catch(const std::exception &e) {std::cerr<<e.what()<<"\n";return 1;}
    return failures?1:0;
}
