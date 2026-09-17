#include "workloads.h"
#include <chrono>
#include <iomanip>
#include <iostream>
#include <map>
using namespace kernel_workloads;
using namespace sqkernel;
using Clock=std::chrono::steady_clock;
static volatile uint64_t sink=0;
static double elapsed(Clock::time_point start){return std::chrono::duration<double,std::nano>(Clock::now()-start).count();}
static double measure(const Module &m,size_t index,const Workload &w,const Fixture &initial,bool native,size_t repetitions) {
    Fixture f=initial;auto args=f.args();uint64_t result=0;auto start=Clock::now();
    for(size_t i=0;i<repetitions;++i) {
        if(native){Call call{args.data(),0,1000000,0};if(execute(m,index,call)!=Success)throw std::runtime_error("benchmark kernel failed");result=call.result;}
        else result=model(w,f);
        // Observable output per call, without a full-buffer hash in the timed region.
        sink=result^f.buffers.back()[1];
    }
    double ns=elapsed(start);sink=checksum(f,result);return ns/repetitions;
}
static double quantile(std::vector<double> values,double q){std::sort(values.begin(),values.end());return values[size_t(q*(values.size()-1))];}
// JSON numeric fixtures for cross-runtime benchmarks. Integer output sentinels
// can exceed JS's exact range; active integer inputs/results are all small.
static void print_buffers(const Module &m,const Function &fn,const Fixture &f) {
    std::cout<<"[";size_t buffer=0;
    for(const auto &p:fn.parameters) if(p.extent) {
        if(buffer)std::cout<<",";
        std::vector<Type> types;
        if(p.record.empty())types.push_back(p.type);
        else for(const auto &record:m.records)if(record.name==p.record)for(const auto &field:record.fields)types.push_back(field.type);
        std::cout<<"[";
        for(size_t i=0;i<p.extent*p.stride;++i){if(i)std::cout<<",";
            if(types.at(i%p.stride)==Type::F64)std::cout<<real(f.data(buffer)[i]);
            else std::cout<<integer(f.data(buffer)[i]);
        }
        std::cout<<"]";++buffer;
    }
    std::cout<<"]";
}
int main(int argc,char **argv) {
    if(!supported())return 77;
    try {
        std::string root=".";bool quick=false,fixtures=false;int samples=7;double target_ms=5;
        for(int i=1;i<argc;++i){std::string arg=argv[i];
            if(arg=="--fixtures")fixtures=true;
            else if(arg=="--quick"){quick=true;samples=3;target_ms=0.1;}
            else if(arg=="--root"&&i+1<argc)root=argv[++i];
            else if(arg=="--samples"&&i+1<argc)samples=std::stoi(argv[++i]);
            else if(arg=="--target-ms"&&i+1<argc)target_ms=std::stod(argv[++i]);
            else throw std::runtime_error("usage: suite [--root repo] [--quick] [--fixtures] [--samples N] [--target-ms N]");
        }
        if(samples<3||samples>101||!std::isfinite(target_ms)||target_ms<=0||target_ms>1000)throw std::runtime_error("invalid sampling options");
        std::map<std::string,std::shared_ptr<Module>> modules;std::map<std::string,double> compilation;
        std::cout<<std::setprecision(10)<<"{\"schema\":1,\"backend\":\""<<backend_name()<<"\",\"samples\":"<<samples<<",\"seed\":42,\"cases\":[\n";bool first=true;
        for(auto w:workloads()) {
            auto &m=modules[w.file];if(!m){auto text=source(root,w);auto start=Clock::now();m=compile(text,std::string(w.file)+".sqk");compilation[w.file]=elapsed(start)/1e6;}
            size_t index=function_index(*m,w);std::vector<int> sizes=quick?std::vector<int>{0,w.capacity}:std::vector<int>{0,1,7,w.capacity-1,w.capacity};
            std::vector<std::string> patterns={"mixed"};std::string name=w.name;
            if(name=="astar"){sizes={256};patterns={"open","maze","unreachable","same","random"};}
            else if(!quick&&(name=="image"||name=="routing"||name=="histogram"))patterns={"mixed","low","high"};
            for(int size:sizes)for(auto pattern:patterns) {
                auto initial=make(w,size,42,pattern),native=initial,cpp=initial;auto args=native.args();Call call{args.data(),0,1000000,0};
                if(execute(*m,index,call)!=Success)throw std::runtime_error(name+" validation status");
                uint64_t expected=model(w,cpp);
                if(call.result!=expected||native.buffers!=cpp.buffers)throw std::runtime_error(name+" validation mismatch");
                if(fixtures) {
                    if(!first)std::cout<<",\n";first=false;
                    std::cout<<std::setprecision(17)<<"{\"workload\":\""<<name<<"\",\"size\":"<<size<<",\"pattern\":\""<<pattern<<"\",\"initial\":";
                    print_buffers(*m,m->functions[index],initial);
                    std::cout<<",\"expected\":";print_buffers(*m,m->functions[index],native);
                    std::cout<<",\"result\":";
                    if(w.floating_result)std::cout<<real(call.result);else std::cout<<integer(call.result);
                    std::cout<<",\"repetitions\":100,\"repeated_expected\":";
                    for(int repeat=1;repeat<100;++repeat) {
                        call={args.data(),0,1000000,0};
                        if(execute(*m,index,call)!=Success)throw std::runtime_error("repeated fixture failure");
                    }
                    print_buffers(*m,m->functions[index],native);
                    std::cout<<"}";continue;
                }
                // Warm both paths, then calibrate against the slower one. Every
                // sample starts from identical input, outside its timed region.
                double pilot=std::max(measure(*m,index,w,initial,true,3),measure(*m,index,w,initial,false,3));
                size_t repetitions=(size_t)std::max(1.0,std::min(100000.0,target_ms*1e6/std::max(1.0,pilot)));
                std::vector<double> kernel_times,cpp_times;
                for(int sample=0;sample<samples;++sample){
                    if(sample%2==0){kernel_times.push_back(measure(*m,index,w,initial,true,repetitions));cpp_times.push_back(measure(*m,index,w,initial,false,repetitions));}
                    else {cpp_times.push_back(measure(*m,index,w,initial,false,repetitions));kernel_times.push_back(measure(*m,index,w,initial,true,repetitions));}
                }
                double kernel=quantile(kernel_times,.5),baseline=quantile(cpp_times,.5);
                if(!first)std::cout<<",\n";first=false;
                std::cout<<"{\"workload\":\""<<name<<"\",\"size\":"<<size<<",\"pattern\":\""<<pattern
                    <<"\",\"repetitions\":"<<repetitions<<",\"module_compile_ms\":"<<compilation[w.file]
                    <<",\"kernel_ns\":"<<kernel<<",\"kernel_min_ns\":"<<quantile(kernel_times,0)<<",\"kernel_max_ns\":"<<quantile(kernel_times,1)
                    <<",\"cpp_ns\":"<<baseline<<",\"cpp_min_ns\":"<<quantile(cpp_times,0)<<",\"cpp_max_ns\":"<<quantile(cpp_times,1)
                    <<",\"cpp_over_kernel\":"<<baseline/kernel<<",\"checksum\":\""<<checksum(native,call.result)<<"\"}";
            }
        }
        std::cout<<"\n]}\n";return 0;
    }catch(const std::exception &e){std::cerr<<e.what()<<"\n";return 1;}
}
