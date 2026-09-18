#include "kernel/kernel.h"
#include <iostream>
#include <stdexcept>
#include <vector>
using namespace sqkernel;
static void check(bool value,const char *message) { if(!value) throw std::runtime_error(message); }
static size_t find(const Module &m,const std::string &name) {
    for(size_t i=0;i<m.functions.size();++i) if(m.functions[i].name==name) return i;
    throw std::runtime_error("missing function");
}
int main() {
    if(!supported()) return 77;
    try {
        auto m=compile(R"(
            void store(inout i64 a[], i64 i, i64 v) { a[i]=v; }
            class State {
                i64 total;
                bool active;
                void add(i64 n) { if (this.active) { this.total+=n; } }
                i64 process(in i64 a[], inout i64 b[]) {
                    require(a.len()==b.len());
                    for (i64 i=0; i<a.len(); i+=1) {
                        this.add(a[i]); store(b,i,this.total);
                    }
                    return this.total;
                }
            };
            export i64 run(inout State s, in i64 a[], inout i64 b[]) { return s.process(a,b); }
            export void fail(inout State s, inout i64 a[], i64 index) { s.add(7); store(a,index,99); }
        )","typed-native.sqk");
        size_t cases=0;
        for(size_t length: {size_t(0),size_t(1),size_t(2),size_t(7),size_t(31),size_t(257)}) {
            std::vector<uint64_t> input(length);
            for(size_t i=0;i<length;++i) input[i]=(uint64_t)((int64_t)(i%9)-4);
            for(bool active: {false,true}) for(uint64_t fuel: {uint64_t(0),uint64_t(1),uint64_t(7),uint64_t(1000)}) {
                uint64_t state[]={3,(uint64_t)active}, oracle[]={3,(uint64_t)active};
                std::vector<uint64_t> out(length+2,0x12345678), expected=out;
                uint64_t args[]={(uint64_t)(uintptr_t)state,(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)(out.data()+1),length,length};
                uint64_t ref[]={(uint64_t)(uintptr_t)oracle,(uint64_t)(uintptr_t)input.data(),(uint64_t)(uintptr_t)(expected.data()+1),length,length};
                Call a{args,0,fuel,0},b{ref,0,fuel,0};
                size_t index=find(*m,"run");
                auto status=execute(*m,index,a), reference=interpret(*m,index,b);
                check(status==reference && a.result==b.result && a.fuel==b.fuel && a.error_line==b.error_line,"native/interpreter status mismatch");
                check(state[0]==oracle[0] && state[1]==oracle[1] && out==expected,"native/interpreter effects mismatch");
                check(out.front()==0x12345678 && out.back()==0x12345678,"array canary overwritten");
                if(fuel>=length+1) {
                    uint64_t total=3;
                    for(size_t i=0;i<length;++i) { if(active) total+=input[i]; check(out[i+1]==total,"independent prefix model mismatch"); }
                    check(status==Success && a.result==total && state[0]==total,"independent state model mismatch");
                } else check(status==BudgetError,"missing budget error");
                ++cases;
            }
            for(uint64_t index: {uint64_t(-1),(uint64_t)length,uint64_t(INT64_MAX)}) {
                uint64_t state[]={4,1}; std::vector<uint64_t> data(length+2,17);
                uint64_t args[]={(uint64_t)(uintptr_t)state,(uint64_t)(uintptr_t)(data.data()+1),index,length};
                Call call{args,0,1000,0};
                check(execute(*m,find(*m,"fail"),call)==BoundsError,"runtime bounds not enforced");
                check(state[0]==11,"method mutation lost or replayed on failure");
                for(auto value:data) check(value==17,"out-of-bounds write escaped");
                ++cases;
            }
        }
        auto locals=compile(R"(
            class Acc {
                i64 value;
                i64 add(i64 n) {this.value+=n;return this.value;}
            };
            i64 work(i64 n) {i64 a[3]; a[0]=n; a[2]=2; Acc c; return c.add(a[0]+a[1]+a[2]);}
            export i64 run(inout i64 out[1],i64 n,i64 index) {
                Acc total;
                for(i64 i=0;i<n;i+=1) {
                    Acc fresh; i64 scratch[4];
                    require(fresh.value==0 && scratch[3]==0);
                    fresh.add(work(i)); total.add(fresh.value);
                    scratch[3]=total.value; out[0]=scratch[index];
                }
                return total.value;
            }
        )","local-state.sqk");
        for(uint64_t n: {0,1,2,7,21}) for(int64_t index: {-1,0,3,4}) for(uint64_t fuel: {0,1,7,100}) {
            uint64_t output[]={123,19,456}, reference[]={123,19,456};
            uint64_t args[]={(uint64_t)(uintptr_t)&output[1],n,(uint64_t)index};
            uint64_t ref[]={(uint64_t)(uintptr_t)&reference[1],n,(uint64_t)index};
            Call a{args,0,fuel,0}, b{ref,0,fuel,0};
            size_t fn=find(*locals,"run");
            auto status=execute(*locals,fn,a), expected=interpret(*locals,fn,b);
            check(status==expected && a.result==b.result && a.fuel==b.fuel && a.error_line==b.error_line,"local storage execution mismatch");
            for(size_t i=0;i<3;++i) check(output[i]==reference[i],"local storage external effects mismatch");
            check(output[0]==123 && output[2]==456,"local storage escaped output bounds");
            if(fuel>=n+1 && (n==0 || index==0 || index==3)) {
                uint64_t sum=n*(n+3)/2;
                check(status==Success && a.result==sum,"independent local-state model");
                check(output[1]==(n==0?19:index==0?0:sum),"independent local-array model");
            }
            ++cases;
        }
        // Exercise the entire public parameter limit plus hidden runtime lengths.
        std::string source="export i64 many(";
        for(size_t i=0;i<MaxParameters;++i) { if(i) source+=","; source+="in i64 a"+std::to_string(i)+"[]"; }
        source+=") { return ";
        for(size_t i=0;i<MaxParameters;++i) { if(i) source+="+"; source+="a"+std::to_string(i)+".len()"; }
        source+="; }";
        auto many=compile(source,"many-lengths.sqk");
        std::vector<uint64_t> args(MaxParameters*2,0);
        uint64_t total=0;
        for(size_t i=0;i<MaxParameters;++i) { args[MaxParameters+i]=i; total+=i; }
        Call call{args.data(),0,1000,0};
        check(execute(*many,0,call)==Success && call.result==total,"hidden ABI length slots truncated");
        std::cout<<"typed modules: "<<cases<<" state/array cases and maximum hidden ABI passed\n";
        return 0;
    } catch(const std::exception &e) { std::cerr<<e.what()<<"\n"; return 1; }
}
