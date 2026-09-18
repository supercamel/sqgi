#include "kernel/kernel.h"
#include <cmath>
#include <cstring>
#include <iostream>
#include <limits>
#include <random>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif
using namespace sqkernel;
static int failures=0;
static void check(bool ok,const std::string &message) { if(!ok) {std::cerr<<"FAIL: "<<message<<"\n";++failures;} }
static uint64_t bits(double d) {uint64_t b;memcpy(&b,&d,8);return b;}
static double real(uint64_t b) {double d;memcpy(&d,&b,8);return d;}
static size_t index(const Module &m,const std::string &name) {
    for(size_t n=0;n<m.functions.size();++n) if(m.functions[n].name==name) return n;
    throw std::runtime_error("missing function " + name);
}
static Call run(const Module &m,const std::string &name,std::vector<uint64_t> args,Status expected=Success,uint64_t fuel=10000) {
    Call call{args.data(),0,fuel,0};
    check(execute(m,index(m,name),call)==expected,name+" status");
    return call;
}
static void reject(const std::string &source,const std::string &diagnostic) {
    try {compile(source,"rejected.sqk");check(false,"accepted invalid: "+source);}
    catch(const std::exception &e) {check(std::string(e.what()).find(diagnostic)!=std::string::npos,"diagnostic: "+std::string(e.what()));}
}
int main() {
    if(!supported()) return 77;
    try {
        auto m=compile(R"(
            struct Point { f64 x; f64 y; };
            i64 helper(i64 x) { if (x < 0) { return -x; } else { return x + 1; } }
            export i64 arithmetic(i64 a, i64 b) { return (a + b) * 3 - b; }
            export i64 divide(i64 a, i64 b) { return a / b; }
            export i64 remainder(i64 a, i64 b) { return a % b; }
            export i64 rem_assign(i64 a, i64 b) { a %= b; return a; }
            export i64 rem_precedence() { return 3 + 20 % 6 * 2 - 20 / 3 % 4; }
            export bool rem_short(i64 a) { return a == 0 || 7 % a == 1; }
            export void rem_store(inout i64 output[8],i64 d) {
                output[0] = 17; output[0] %= d; output[1] = 99;
            }
            export f64 floating(f64 a, f64 b) { return (a + b) * 0.5 - b / 2.0; }
            export bool equal(f64 a, f64 b) { return a == b; }
            export bool unequal(f64 a, f64 b) { return a != b; }
            export bool less(f64 a, f64 b) { return a < b; }
            export bool lesseq(f64 a, f64 b) { return a <= b; }
            export bool greater(f64 a, f64 b) { return a > b; }
            export bool greatereq(f64 a, f64 b) { return a >= b; }
            export f64 negative(f64 x) { return -x; }
            export f64 unfused(f64 a, f64 b, f64 c) { return a * b + c; }
            export bool shortcircuit(i64 a) { return a == 0 || 10 / a > 1; }
            export bool andshort(i64 a) { return a != 0 && 10 / a > 1; }
            export i64 calls(i64 x) { return helper(x) + helper(x - 2); }
            export i64 loops(i64 count) {
                i64 value = 0;
                for (i64 i = 0; i < count; i += 1) { value += helper(i); }
                return value;
            }
            export void transform(in Point source[8], inout Point output[8], i64 count, f64 scale) {
                require(count >= 0 && count <= 8);
                for (i64 i = 0; i < count; i += 1) {
                    output[i].x = source[i].x * scale;
                    output[i].y = source[i].y * scale + 1.0;
                }
            }
            export i64 read(in i64 input[8], i64 i) { return input[i]; }
            export void partial(inout i64 output[8], i64 index) {
                output[0] = 42;
                output[index] = 99;
            }
            export void forever() { while (true) { i64 x = 1; } }
            export bool boolean(bool flag) { return !flag; }
            export i64 scope(i64 x) { { i64 x = 99; x += 1; } return x; }
        )","native.sqk");
        check(run(*m,"arithmetic",{4,2}).result==16,"integer expected result");
        check(run(*m,"arithmetic",{uint64_t(INT64_MAX),1}).result==uint64_t(INT64_MAX),"defined integer wrapping");
        check((int64_t)run(*m,"divide",{uint64_t(-7),3}).result==-2,"division truncation");
        run(*m,"divide",{1,0},ArithmeticError);
        run(*m,"divide",{uint64_t(INT64_MIN),uint64_t(-1)},ArithmeticError);
        for(const char *name:{"remainder","rem_assign"}) {
            for(int64_t a:{INT64_MIN,INT64_MIN+1,int64_t(-7),int64_t(0),int64_t(7),INT64_MAX}) {
                for(int64_t b:{INT64_MIN,int64_t(-3),int64_t(-1),int64_t(1),int64_t(3),INT64_MAX}) {
                    int64_t expected=b==-1?0:a%b;
                    check(run(*m,name,{uint64_t(a),uint64_t(b)}).result==uint64_t(expected),"signed remainder edges");
                }
            }
            check(run(*m,name,{17,0},ArithmeticError).error_line!=0,"remainder zero source line");
        }
        check(run(*m,"rem_precedence",{}).result==5,"remainder multiplicative precedence and left associativity");
        check(run(*m,"rem_short",{0}).result==1,"short circuit avoids remainder by zero");
        reject("export f64 f(f64 a,f64 b){return a%b;}","remainder requires i64");
        reject("export bool f(bool a,bool b){return a%b;}","remainder requires i64");
        reject("export f64 f(f64 a){a%=2.0;return a;}","remainder requires i64");
        reject("export i64 f(i64 a){return a%2.0;}","type mismatch");
        check(real(run(*m,"floating",{bits(8),bits(2)}).result)==4.0,"floating expected result");
        check(run(*m,"shortcircuit",{0}).result==1,"OR skips failing RHS");
        check(run(*m,"andshort",{0}).result==0,"AND skips failing RHS");
        check(run(*m,"calls",{uint64_t(-2)}).result==6,"inlined early returns");
        check(run(*m,"loops",{10}).result==55,"loop-carried locals and helper calls");
        check(run(*m,"boolean",{0}).result==1,"Boolean ABI");
        check(run(*m,"scope",{17}).result==17,"lexical scope");
        check(run(*m,"negative",{bits(0.0)}).result==bits(-0.0),"negative zero");
        check(run(*m,"unfused",{bits(1.0+std::ldexp(1.0,-27)),bits(1.0-std::ldexp(1.0,-27)),bits(-1.0)}).result==bits(0.0),"floating multiply/add must not contract");
        run(*m,"forever",{},BudgetError,20);
        std::vector<uint64_t> input(16),output(16,bits(-1.0));
        for(size_t n=0;n<input.size();++n) input[n]=bits((double)n);
        run(*m,"transform",{(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)output.data(),5,bits(2)});
        for(size_t n=0;n<5;++n) {check(real(output[n*2])==n*4,"struct x stride");check(real(output[n*2+1])==n*4+3,"struct y stride");}
        check(real(output[10])==-1,"partial batch leaves tail unchanged");
        auto before=output;
        run(*m,"transform",{(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)output.data(),9,bits(2)},RequirementError);
        check(output==before,"precondition before writes");
        std::vector<uint64_t> integers(8,0);
        auto pointer=(uint64_t)(uintptr_t)integers.data();
        run(*m,"rem_store",{pointer,0},ArithmeticError);
        check(integers[0]==17 && integers[1]==0,"failed remainder retains prior writes without storing result");
        run(*m,"rem_store",{pointer,5});
        check(integers[0]==2 && integers[1]==99,"compound array remainder stores result");
        std::fill(integers.begin(),integers.end(),0);
        run(*m,"read",{pointer,uint64_t(-1)},BoundsError);
        run(*m,"read",{pointer,8},BoundsError);
        run(*m,"read",{pointer,uint64_t(INT64_MAX)},BoundsError);
        check(run(*m,"partial",{pointer,8},BoundsError).error_line!=0,"runtime source location");
        check(integers[0]==42 && integers[1]==0,"writes before error are retained");
        run(*m,"partial",{pointer,7});check(integers[7]==99,"last valid index");

        // Deterministic differential corpus, including NaN ordering and full i64 bits.
        std::mt19937_64 random(0x5a17);
        for(const char *name:{"arithmetic","divide","remainder","rem_assign","floating","equal","unequal","less","lesseq","greater","greatereq","calls","loops"}) {
            size_t n=index(*m,name); const auto &f=m->functions[n];
            for(int trial=0;trial<150;++trial) {
                std::vector<uint64_t> args;
                for(auto &p:f.parameters) {
                    uint64_t v=random();
                    if(std::string(name)=="loops") v%=30;
                    if(p.type==Type::F64 && trial<4) v=trial==0?bits(std::numeric_limits<double>::quiet_NaN()):trial==1?bits(-0.0):trial==2?bits(INFINITY):bits(-INFINITY);
                    args.push_back(v);
                }
                Call native{args.data(),0,10000,0}, reference=native;
                auto a=execute(*m,n,native),b=interpret(*m,n,reference);
                bool equal=native.result==reference.result;
                if(f.result==Type::F64 && std::isnan(real(native.result)) && std::isnan(real(reference.result))) equal=true;
                check(a==b && native.error_line==reference.error_line && native.fuel==reference.fuel && equal,std::string("differential ")+name);
            }
        }
        // Compare memory and failure prefixes using separate allocations.
        for(int count=-1;count<=10;++count) {
            std::vector<uint64_t> a(16,bits(9)),b=a;
            uint64_t aa[]={(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)a.data(),(uint64_t)count,bits(1.5)};
            uint64_t bb[]={(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)b.data(),(uint64_t)count,bits(1.5)};
            Call ca{aa,0,10000,0},cb{bb,0,10000,0};size_t n=index(*m,"transform");
            check(execute(*m,n,ca)==interpret(*m,n,cb) && a==b && ca.error_line==cb.error_line,"differential array effects");
        }
        // Exercise vectorizable loops and their scalar/error tails. Compare
        // every output cell, exact fuel and the first failure location.
        auto maps=compile(R"(
            export void map(in f64 input[1024], inout f64 output[1024], i64 count) {
                for (i64 i = 0; i < count; i += 1) { output[i] = input[i] * 1.5 + 1.0; }
            }
            export void late(in f64 input[1024], inout f64 output[1024], i64 count) {
                for (i64 i = 0; i < count; i += 1) {
                    output[i] = input[i] * 1.5 + 1.0;
                    require(i < 17);
                }
            }
            export void fill(in f64 input[1024], inout f64 output[1024], i64 count) {
                for (i64 i = 0; i < count; i += 1) { output[i] = 0.0; }
            }
            export void copy(in f64 input[1024], inout f64 output[1024], i64 count) {
                for (i64 i = 0; i < count; i += 1) { output[i] = input[i]; }
            }
        )","vector-errors.sqk");
        std::vector<uint64_t> big_input(1024);
        for(size_t n=0;n<big_input.size();++n) big_input[n]=bits(double(n));
        for(size_t function=0;function<maps->functions.size();++function)
            for(int count:{-1,0,1,3,17,31,255,1023,1024,1025})
                for(uint64_t fuel:{0u,1u,2u,16u,1024u,1025u,2000u}) {
                    std::vector<uint64_t> a(1024,bits(-1)),b=a;
                    uint64_t aa[]={(uint64_t)(uintptr_t)big_input.data(),(uint64_t)(uintptr_t)a.data(),(uint64_t)count};
                    uint64_t bb[]={(uint64_t)(uintptr_t)big_input.data(),(uint64_t)(uintptr_t)b.data(),(uint64_t)count};
                    Call ca{aa,0,fuel,0},cb{bb,0,fuel,0};
                    auto status=execute(*maps,function,ca),reference=interpret(*maps,function,cb);
                    check(status==reference && a==b && ca.fuel==cb.fuel && ca.error_line==cb.error_line,"optimized loop preserves partial effects/bounds/budget");
                }
#if defined(__x86_64__) || defined(_M_X64)
        unsigned saved=_mm_getcsr(); _mm_setcsr(saved|0xe040);
        check(real(run(*m,"floating",{bits(8),bits(2)}).result)==4,"FP control normalized");
        check(_mm_getcsr()==(saved|0xe040),"FP control restored");_mm_setcsr(saved);
#endif
        reject("export i64 f() { return 1.0; }","type mismatch");
        reject("export i64 f() { i64 x = 1; }","return on every path");
        reject("export i64 f() { return missing; }","unknown variable");
        reject("export i64 f() { return f(); }","recursion");
        reject("export void f(in i64 a[4]) { a[0] = 1; }","cannot write");
        reject("export void f(i64 a[4]) {}","require in/inout");
        reject("export void f(in i64 a[0]) {}","array extent");
        reject("export void f(in i64 a[","missing array extent");
        reject("export void f(in i64 a[999999999999999999999]) {}","array extent");
        reject("export i64 f() { return 9223372036854775808; }","out of range");
        reject("export i64 f(i64 x, i64 x) { return x; }","duplicate variable");
        reject("export bool f() { return true + false; }","Boolean operator");
        reject("export i64 f() { if (1) { return 1; } return 0; }","type mismatch");
        reject("struct S { f64 x; i64 x; };","duplicate field");
        reject("/* missing", "unterminated comment");
        reject("export i64 f() { return "+std::string(80,'(')+"1"+std::string(80,')')+"; }","nesting limit");
        reject(std::string(1024*1024+1,' '),"source exceeds");
        // Truncation and token mutation exercise parser failure paths under ASan.
        const std::string seed="struct S { f64 x; }; export void f(inout S a[4], i64 n) { for (i64 i = 0; i < n; i += 1) { a[i].x = 1.0; } }";
        for(size_t n=0;n<seed.size();++n) {
            try { compile(seed.substr(0,n),"truncated.sqk"); } catch(const std::exception &) {}
        }
        for(int n=0;n<1000;++n) {
            std::string mutated=seed;
            for(int j=0;j<3;++j) mutated[random()%mutated.size()]="{}[]();/012ab_\n"[random()%14];
            try { compile(mutated,"mutated.sqk"); } catch(const std::exception &) {}
        }
        // Exercise independent allocation/protection/unmapping repeatedly.
        for(int n=0;n<100;++n) {auto small=compile("export i64 f(i64 x) { return x * 2; }","lifetime.sqk");check(run(*small,"f",{(uint64_t)n}).result==(uint64_t)n*2,"module lifetime");}
    } catch(const std::exception &e) {check(false,std::string("unexpected exception: ")+e.what());}
    if(failures) std::cerr<<failures<<" failures\n";
    else std::cout<<"kernel native/reference tests passed\n";
    return failures?1:0;
}
