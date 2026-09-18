#include "kernel/kernel.h"
#include <cstring>
#include <iostream>
#include <stdexcept>
#include <vector>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif
using namespace sqkernel;
static void check(bool ok,const char *why) {if(!ok) throw std::runtime_error(why);}
static size_t find(const Module &m,const std::string &name) {
    for(size_t n=0;n<m.functions.size();++n) if(m.functions[n].name==name) return n;
    throw std::runtime_error("function not found");
}
static void reject(const std::string &source,const char *expected) {
    try {compile(source,"rejected.sqk");}
    catch(const std::exception &e) {check(std::string(e.what()).find(expected)!=std::string::npos,"wrong rejection");return;}
    throw std::runtime_error("invalid program accepted");
}
int main() {
    if(!supported()) return 77;
    try {
        const bool llvm=std::string(backend_name())=="llvm";
        auto m=compile(R"(
            i64 leaf(inout i64 a[], i64 n, i64 divisor) {
                i64 local[3];
                for(i64 i=0;i<n;i+=1) {local[1]+=i; a[0]+=1;}
                require(n>=0);
                return local[1]/divisor;
            }
            i64 middle(inout i64 a[], i64 n, i64 d) {return leaf(a,n,d)+leaf(a,1,1);}
            export i64 run(inout i64 a[], i64 n, i64 d) {
                a[0]=7; i64 value=middle(a,n,d); a[0]+=100; return value;
            }
            f64 floating(f64 x) {return x/2.0;}
            export i64 indirect(inout f64 a[1]) {a[0]=floating(a[0]);return 9;}
            export i64 other(i64 x) {return x+3;}
        )","calls.sqk");
        size_t run=find(*m,"run");
        check(m->functions[run].calls.size()==1,"frontend still expands helpers");
        check(m->functions[run].slots<32,"callee slots copied into caller");
        check(prepare(*m,find(*m,"indirect")).floating,"transitive floating effect lost");
        size_t cases=0;
        for(int64_t n: {-1,0,1,3,7}) for(int64_t divisor: {0,1,2}) for(uint64_t fuel: {0,1,2,4,32}) {
            uint64_t a[]={55},b[]={55};
            uint64_t args[]={(uint64_t)(uintptr_t)a,(uint64_t)n,(uint64_t)divisor,1};
            uint64_t refs[]={(uint64_t)(uintptr_t)b,(uint64_t)n,(uint64_t)divisor,1};
            Call x{args,123,fuel,0,99},y{refs,123,fuel,0,99};
            auto actual=execute(*m,run,x),expected=interpret(*m,run,y);
            check(actual==expected && x.result==y.result && x.fuel==y.fuel,"call status/result/fuel mismatch");
            check(a[0]==b[0] && x.error_line==y.error_line && x.error_function==y.error_function,"call effects/error provenance mismatch");
            if(actual!=Success) check(x.result==123 && a[0]<107,"failure continued or published a result");
            if(n>=0 && divisor!=0 && fuel==32) check(actual==Success && x.result==(uint64_t)(n*(n-1)/2/divisor) && a[0]==(uint64_t)(108+n),"independent call model");
            ++cases;
        }
#if defined(__x86_64__) || defined(_M_X64)
        unsigned old=_mm_getcsr(); _mm_setcsr(old|0xe040);
        uint64_t value=0x0010000000000000ULL;
        uint64_t pointer=(uint64_t)(uintptr_t)&value;
        Call fp{&pointer,0,100,0,0};
        auto status=execute(*m,find(*m,"indirect"),fp);
        unsigned restored=_mm_getcsr(); _mm_setcsr(old);
        check(status==Success && value==0x0008000000000000ULL,"nested helper FP normalization");
        check(restored==(old|0xe040),"nested helper FP restoration");
#endif
        // Different modules with identical names must retain separate code and constants.
        auto one=compile("i64 h(i64 x){return x+1;} export i64 f(i64 x){return h(x);}","same.sqk");
        auto two=compile("i64 h(i64 x){return x+2;} export i64 f(i64 x){return h(x);}","same.sqk");
        auto entry=prepare(*two,1); one.reset(); uint64_t arg=40; Call call{&arg,0,100,0,0};
        check(execute(entry,call)==Success && call.result==42,"shared module code lifetime");
        reject("export i64 f(){return f();}","recursion");
        reject("void h(inout i64 a[],in i64 b[]){} export void f(inout i64 a[]){h(a,a);}","overlapping");
        reject("export void f(){i64 a[8193];}","storage limit");
        reject("export void f(){i64 a[4097];i64 b[4096];}","storage limit");
        // Many call sites exceed the old expanded frame while canonical IR stays small.
        std::string large="i64 helper(i64 x){return x*2+1;} export i64 run(i64 x){i64 total=0;";
        for(int i=0;i<100;++i) large+="total+=helper(x);";
        large+="return total;}";
        if(llvm) {
            auto big=compile(large,"many-calls.sqk");
            check(big->functions[1].calls.size()==100 && big->functions[1].code.size()<700,"frontend call growth");
            uint64_t x=7;Call c{&x,0,10,0,0};
            check(execute(*big,1,c)==Success && c.result==1500,"many native calls");
            check(big->stats.object_bytes>0 && big->stats.llvm_instructions>0 && big->stats.compile_ms>0,"compilation telemetry missing");
            std::string chain="i64 f0(i64 x){return x;}";
            for(int n=1;n<=32;++n) chain+="i64 f"+std::to_string(n)+"(i64 x){return f"+std::to_string(n-1)+"(x);}";
            reject(chain,"call depth");
            std::string storage_chain="i64 f0(){i64 a[8192];return a[0];}";
            for(int n=1;n<=4;++n) storage_chain+="i64 f"+std::to_string(n)+"(){i64 a[8192];return a[0]+f"+std::to_string(n-1)+"();}";
            reject(storage_chain,"active source-local storage");
            // Exercise >384 temporary IDs independently of helper calls.
            std::string temps="export i64 run(i64 x){";
            for(int i=0;i<600;++i) temps+="x+=1;";
            temps+="return x;}";
            auto values=compile(temps,"many-values.sqk");
            check(values->functions[0].slots>384,"temporary stress fixture too small");
            check(execute(*values,0,c)==Success && c.result==607,"large temporary function");
            auto storage=compile("export i64 f(i64 index){i64 a[8192];a[8191]=42;return a[index];}","large-storage.sqk");
            x=8191;check(execute(*storage,0,c)==Success && c.result==42,"large local storage");
            x=0;check(execute(*storage,0,c)==Success && c.result==0,"large storage reset");
            x=8192;check(execute(*storage,0,c)==BoundsError,"large storage bounds");
        } else reject(large,"native backend frame limit");
        // Generated acyclic graphs; exact independent arithmetic, overflow included.
        uint64_t seed=0x12345678;
        for(int trial=0;trial<16;++trial) {
            seed=seed*6364136223846793005ULL+1;
            uint64_t factor=seed%17+1;
            std::string source="i64 a(i64 x){return x*"+std::to_string(factor)+"+3;} i64 b(i64 x){return a(x)+a(x+1);} export i64 c(i64 x){return b(x)+a(x);}";
            auto graph=compile(source,"graph.sqk");
            for(uint64_t x: {uint64_t(0),uint64_t(1),uint64_t(-1),seed}) {
                Call c{&x,0,100,0,0},r=c;
                check(execute(*graph,2,c)==interpret(*graph,2,r) && c.result==r.result,"generated graph differential");
                check(c.result==3*x*factor+factor+9,"generated graph independent model"); ++cases;
            }
        }
        // The verifier must reject a corrupted call graph before lowering.
        auto invalid=*two; invalid.functions[0].calls.push_back({1,{0}});
        bool rejected=false;try{verify(invalid);}catch(const std::exception &){rejected=true;}
        check(rejected,"IR graph verification missing");
        invalid=*two;invalid.functions[1].slot_types[0]=Type::F64;
        rejected=false;try{verify(invalid);}catch(const std::exception &){rejected=true;}
        check(rejected,"IR type verification missing");
        invalid=*two;
        // Replacing the initialization of a live temporary with a branch must
        // not allow an undefined scalar to reach code generation.
        auto &body=invalid.functions[0].code;
        for(size_t pc=0;pc<body.size();++pc) if(body[pc].op==Op::Constant) {
            body[pc]={Op::Jump,Type::Void,-1,-1,-1,pc+1,1,0};break;
        }
        rejected=false;try{verify(invalid);}catch(const std::exception &){rejected=true;}
        check(rejected,"IR definite assignment verification missing");
        invalid=*two;auto &unterminated=invalid.functions[0].code;
        unterminated.back()={Op::Jump,Type::Void,-1,-1,-1,unterminated.size(),1,0};
        rejected=false;try{verify(invalid);}catch(const std::exception &){rejected=true;}
        check(rejected,"IR return-path verification missing");
        std::cout<<"module calls: "<<cases<<" differential cases, limits, FP and lifetime passed\n";
        return 0;
    } catch(const std::exception &e) {std::cerr<<e.what()<<"\n";return 1;}
}
