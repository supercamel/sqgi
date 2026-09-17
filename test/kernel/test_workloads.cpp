#include "workloads.h"
#include <iostream>
#include <map>
using namespace kernel_workloads;
using namespace sqkernel;
static unsigned cases=0;
static void check(bool ok,const std::string &why) {if(!ok)throw std::runtime_error(why);}
static void validate_path(const Fixture &f,uint64_t result) {
    int distance=bfs_distance(f);
    check(integer(result)==(distance<0?-1:distance+1),"A* shortest distance differs from BFS");
    if(distance<0)return;
    const auto path=f.data(2);std::vector<bool> seen(256,false);
    check(path[0]==f.arguments[4].value && path[result-1]==f.arguments[3].value,"A* endpoints");
    for(size_t i=0;i<result;++i) {
        check(path[i]<256,"A* path range");int cell=(int)path[i];
        check(!seen[cell]&&!f.data(0)[cell],"A* blocked cell or cycle");seen[cell]=true;
        if(i) {int previous=(int)path[i-1];check(std::abs(cell/16-previous/16)+std::abs(cell%16-previous%16)==1,"A* nonadjacent step");}
    }
}
static void compare(const Module &m,const Workload &w,Fixture fixture,Status expected=Success,uint64_t fuel=1000000) {
    Fixture oracle=fixture,cpp=fixture;auto args=fixture.args(),oracle_args=oracle.args();
    Call native{args.data(),0,fuel,0},reference{oracle_args.data(),0,fuel,0};size_t index=function_index(m,w);
    Status actual=execute(m,index,native),wanted=interpret(m.functions[index],reference);
    std::string label=std::string(w.name)+" n="+std::to_string(fixture.count)+" "+fixture.pattern;
    check(actual==expected && actual==wanted,label+" status");
    check(native.result==reference.result && native.fuel==reference.fuel && native.error_line==reference.error_line,label+" result/fuel/error line");
    check(fixture.buffers==oracle.buffers,label+" interpreter memory mismatch");
    if(actual==Success) {
        uint64_t result=model(w,cpp);
        check(native.result==result && fixture.buffers==cpp.buffers,label+" independent C++ mismatch");
        if(std::string(w.name)=="astar")validate_path(fixture,native.result);
    }
    ++cases;
}
int main(int argc,char **argv) {
    if(!supported())return 77;
    try {
        std::string root=argc>1?argv[1]:".";std::map<std::string,std::shared_ptr<Module>> modules;
        for(auto w:workloads()) {
            auto &m=modules[w.file];if(!m)m=compile(source(root,w),std::string(w.file)+".sqk");
            if(std::string(w.name)=="astar") {
                for(auto pattern:{"open","maze","unreachable","same","blocked-start","blocked-goal"})compare(*m,w,make(w,256,42,pattern));
                for(unsigned seed=0;seed<40;++seed)compare(*m,w,make(w,256,seed,"random"));
                // Adjacent linear indices 15/16 are on different rows.
                auto row=make(w,256,1,"open");row.arguments[3].value=15;row.arguments[4].value=16;compare(*m,w,row);
                for(uint64_t fuel:{0,1,255,256,257,1000,10000})compare(*m,w,make(w,256,42,"maze"),BudgetError,fuel);
                auto bad=make(w,256);bad.arguments[3].value=256;compare(*m,w,bad,RequirementError);
                bad=make(w,256);bad.data(0)[127]=2;compare(*m,w,bad,RequirementError);
            } else {
                for(int n:{0,1,2,7,w.capacity-1,w.capacity})for(unsigned seed=0;seed<4;++seed)compare(*m,w,make(w,n,seed));
                for(int n:{-1,w.capacity+1})compare(*m,w,make(w,n),RequirementError);
                for(uint64_t fuel:{0,1,3})compare(*m,w,make(w,w.capacity),BudgetError,fuel);
                std::string name=w.name;
                if(name=="image"||name=="routing"||name=="histogram")for(auto pattern:{"low","high"})compare(*m,w,make(w,w.capacity,42,pattern));
                if(name=="image"||name=="histogram")for(int index:{0,7,1023}) {
                    auto bad=make(w,w.capacity);bad.data(0)[index]=name=="image"?256:16;compare(*m,w,bad,RequirementError);
                }
                if(name=="particles"||name=="stencil") {
                    auto f=make(w,w.capacity);
                    for(int step=0;step<30;++step){compare(*m,w,f);model(w,f);if(name=="stencil")std::swap(f.buffers[0],f.buffers[1]);}
                }
            }
        }
        std::cout<<cases<<" workload cases passed ("<<backend_name()<<")\n";return 0;
    } catch(const std::exception &e){std::cerr<<e.what()<<"\n";return 1;}
}
