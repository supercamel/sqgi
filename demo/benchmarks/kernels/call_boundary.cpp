// Direct engine boundary, matched to compiled_workflow_node.nut's workload.
// This retains execute()'s floating environment, fuel and status handling.
#include "kernel/kernel.h"
#include <cstdio>
#include <ctime>
#include <cstring>
#include <fstream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>
using namespace sqkernel;
static uint64_t bits(double x){uint64_t b;std::memcpy(&b,&x,8);return b;}
static double real(uint64_t b){double x;std::memcpy(&x,&b,8);return x;}
static double reference(int steps,double dt){
    double x=1,v=0,recent[4]={0,0,0,0};
    for(int i=0;i<steps;++i){v-=x*dt;x+=v*dt;recent[i%4]=x;}
    return (recent[0]+recent[1]+recent[2]+recent[3])*0.25;
}
int main(int argc,char **argv){
    if(!supported())return 77;
    try{
        const std::string root=argc>1?argv[1]:".";
        std::ifstream file(root+"/demo/kernels/compiled_workflow.sqk");
        if(!file)throw std::runtime_error("cannot read workflow source");
        auto module=compile(std::string(std::istreambuf_iterator<char>(file),{}),"compiled_workflow.sqk");
        size_t function=0;
        while(function<module->functions.size() && module->functions[function].name!="simulate")++function;
        if(function==module->functions.size())throw std::runtime_error("simulate missing");
        std::printf("{\"backend\":\"%s\",\"cases\":[",backend_name());
        bool first=true;
        for(int steps: {1,16,256,4096}){
            const int repeats=4000000/steps;
            double expected[2],checksums[2]={0,0};
            for(int k=0;k<2;++k){expected[k]=reference(steps,k?0.0625:0.125);for(int i=0;i<repeats;++i)checksums[k]+=expected[k];}
            std::vector<double> times;
            for(int sample=-1;sample<9;++sample){
                const int k=sample<0?0:sample%2;
                uint64_t arguments[]={(uint64_t)steps,bits(k?0.0625:0.125)};
                double sum=0,result=0;
                const auto started=std::clock();
                for(int i=0;i<repeats;++i){
                    Call call{arguments,0,1000000,0};
                    if(execute(*module,function,call)!=Success)throw std::runtime_error("kernel failed");
                    result=real(call.result);sum+=result;
                }
                const double elapsed=double(std::clock()-started)*1e9/CLOCKS_PER_SEC/repeats;
                if(result!=expected[k] || sum!=checksums[k])throw std::runtime_error("result/checksum mismatch");
                if(sample>=0)times.push_back(elapsed);
            }
            if(!first)std::printf(",");first=false;
            std::printf("{\"size\":%d,\"repeats\":%d,\"output\":[%.17g,%.17g],\"checksums\":[%.17g,%.17g],\"timings_ns\":[",
                steps,repeats,expected[0],expected[1],checksums[0],checksums[1]);
            for(size_t i=0;i<times.size();++i)std::printf("%s%.17g",i?",":"",times[i]);
            std::printf("]}");
        }
        std::printf("]}\n");return 0;
    }catch(const std::exception &e){std::fprintf(stderr,"%s\n",e.what());return 1;}
}
