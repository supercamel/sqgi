#pragma once
// Shared data and independently written C++ models. Kernel source is always
// loaded from the runnable demos; benchmarks do not maintain a second copy.
#include "kernel/kernel.h"
#include <algorithm>
#include <cmath>
#include <cstring>
#include <fstream>
#include <queue>
#include <random>
#include <sstream>

namespace kernel_workloads {
inline uint64_t bits(double x) { uint64_t b; std::memcpy(&b,&x,8); return b; }
inline double real(uint64_t b) { double x; std::memcpy(&x,&b,8); return x; }
inline int64_t integer(uint64_t b) { int64_t x; std::memcpy(&x,&b,8); return x; }
struct Workload { const char *name, *file, *function; int capacity; bool floating_result; };
inline std::vector<Workload> workloads() {
    return {{"geometry","geometry","transform",256,false},
        {"sum","reductions","sum",1024,true},{"dot","reductions","dot",1024,true},
        {"prefix","reductions","prefix",1024,false},{"particles","particles","step",128,false},
        {"image","image","threshold",1024,false},{"matrix","matrix","multiply",16,false},
        {"routing","routing","overlaps",256,false},{"histogram","histogram","histogram",1024,false},
        {"stencil","stencil","diffuse",32,false},{"astar","astar","search",256,false}};
}
inline std::string source(const std::string &root,const Workload &w) {
    std::string path=root+"/demo/kernels/"+w.file+".sqk";
    std::ifstream file(path.c_str(),std::ios::binary);
    if(!file) throw std::runtime_error("cannot read "+path);
    std::ostringstream text; text<<file.rdbuf(); return text.str();
}
inline size_t function_index(const sqkernel::Module &m,const Workload &w) {
    for(size_t i=0;i<m.functions.size();++i) if(m.functions[i].name==w.function) return i;
    throw std::runtime_error("missing export "+std::string(w.function));
}
struct Argument { int buffer; uint64_t value; };
struct Fixture {
    std::vector<std::vector<uint64_t>> buffers;
    std::vector<Argument> arguments;
    int count=0;
    std::string pattern;
    void buffer(size_t cells) {
        buffers.push_back(std::vector<uint64_t>(cells+2,bits(-777.0)));
        buffers.back().front()=0x13579bdf2468ace0ULL;
        buffers.back().back()=0xfedcba9876543210ULL;
        arguments.push_back({(int)buffers.size()-1,0});
    }
    void scalar(uint64_t value) { arguments.push_back({-1,value}); }
    uint64_t *data(size_t i) {return buffers.at(i).data()+1;}
    const uint64_t *data(size_t i) const {return buffers.at(i).data()+1;}
    std::vector<uint64_t> args() {
        std::vector<uint64_t> result;
        for(auto a:arguments) result.push_back(a.buffer<0?a.value:(uint64_t)(uintptr_t)data(a.buffer));
        return result;
    }
};
inline Fixture make(const Workload &w,int count,uint64_t seed=42,const std::string &pattern="mixed") {
    Fixture f; f.count=count;f.pattern=pattern;std::mt19937_64 random(seed);
    auto number=[&](){return double(int(random()%65)-32)/8.0;};
    std::string name=w.name;
    if(name=="geometry") {
        f.buffer(256*3);f.buffer(256*3);f.scalar(count);f.scalar(bits(1.5));
        f.scalar(bits(2));f.scalar(bits(-1));f.scalar(bits(0.5));
        for(int i=0;i<256*3;++i) f.data(0)[i]=bits(number());
    } else if(name=="sum" || name=="dot" || name=="prefix") {
        f.buffer(1024);if(name!="sum") f.buffer(1024);f.scalar(count);
        for(int i=0;i<1024;++i) {f.data(0)[i]=bits(number());if(name=="dot") f.data(1)[i]=bits(number());}
    } else if(name=="particles") {
        f.buffer(128*5);f.scalar(count);f.scalar(bits(0.125));
        for(int i=0;i<128;++i) {
            f.data(0)[5*i]=bits(double(random()%81)/8);f.data(0)[5*i+1]=bits(double(random()%17)/8);
            f.data(0)[5*i+2]=bits(number());f.data(0)[5*i+3]=bits(number());f.data(0)[5*i+4]=random()%4?1:0;
        }
    } else if(name=="image") {
        f.buffer(1024);f.buffer(1024);f.scalar(count);f.scalar(16);f.scalar(128);
        for(int i=0;i<1024;++i) f.data(0)[i]=pattern=="low"?0:pattern=="high"?255:random()%256;
    } else if(name=="matrix") {
        f.buffer(256);f.buffer(256);f.buffer(256);f.scalar(count);
        for(int i=0;i<256;++i) {f.data(0)[i]=bits(number());f.data(1)[i]=bits(number());}
    } else if(name=="routing") {
        f.buffer(256*4);f.buffer(256);f.scalar(count);
        f.scalar(bits(4));f.scalar(bits(4));f.scalar(bits(8));f.scalar(bits(8));
        for(int i=0;i<256;++i) {
            double x=pattern=="low"?20:pattern=="high"?5:double(random()%128)/8;
            double y=pattern=="low"?20:pattern=="high"?5:double(random()%128)/8;
            f.data(0)[4*i]=bits(x);f.data(0)[4*i+1]=bits(y);f.data(0)[4*i+2]=bits(x+0.75);f.data(0)[4*i+3]=bits(y+0.75);
        }
    } else if(name=="histogram") {
        f.buffer(1024);f.buffer(16);f.scalar(count);
        for(int i=0;i<1024;++i) f.data(0)[i]=pattern=="low"?0:random()%16;
    } else if(name=="stencil") {
        f.buffer(1024);f.buffer(1024);f.scalar(count);
        for(int i=0;i<1024;++i) f.data(0)[i]=bits(number());
    } else if(name=="astar") {
        f.buffer(256);f.buffer(256*4);f.buffer(256);f.scalar(0);f.scalar(pattern=="same"?0:255);
        for(int i=0;i<256;++i) {
            int row=i/16,col=i%16;
            bool blocked=pattern=="maze"?((col==5&&row!=12)||(col==10&&row!=3)):
                pattern=="unreachable"?row==8:pattern=="random"?random()%100<(seed%5)*15:false;
            f.data(0)[i]=blocked?1:0;
        }
        f.data(0)[0]=0;f.data(0)[255]=0;
        if(pattern=="blocked-start") f.data(0)[0]=1;
        if(pattern=="blocked-goal") f.data(0)[255]=1;
    } else throw std::runtime_error("unknown workload");
    return f;
}
#if defined(_MSC_VER)
#define KERNEL_NOINLINE __declspec(noinline)
#else
#define KERNEL_NOINLINE __attribute__((noinline))
#endif
// No aliasing casts between double and integer storage; all bits are copied.
KERNEL_NOINLINE inline uint64_t model(const Workload &w,Fixture &f) {
    const int n=f.count;std::string name=w.name;
    auto get=[&](int buffer,int i){return real(f.data(buffer)[i]);};
    auto put=[&](int buffer,int i,double x){f.data(buffer)[i]=bits(x);};
    if(name=="geometry") {
        for(int i=0;i<n;++i) {put(1,3*i,get(0,3*i)*1.5+2);put(1,3*i+1,get(0,3*i+1)*1.5-1);put(1,3*i+2,get(0,3*i+2)*1.5+0.5);}
    } else if(name=="sum" || name=="dot" || name=="prefix") {
        double sum=0;for(int i=0;i<n;++i) {sum+=name=="dot"?get(0,i)*get(1,i):get(0,i);if(name=="prefix")put(1,i,sum);}
        if(name!="prefix")return bits(sum);
    } else if(name=="particles") {
        for(int i=0;i<n;++i) if(f.data(0)[5*i+4]) {
            double x=get(0,5*i),y=get(0,5*i+1),vx=get(0,5*i+2),vy=get(0,5*i+3);
            vy-=9.0*0.125;x+=vx*0.125;y+=vy*0.125;
            if(x<0){x=0;vx=-vx;}if(x>10){x=10;vx=-vx;}if(y<0){y=0;vy=-vy*0.8;}
            put(0,5*i,x);put(0,5*i+1,y);put(0,5*i+2,vx);put(0,5*i+3,vy);
        }
    } else if(name=="image") {
        for(int i=0;i<n;++i) f.data(1)[i]=std::min<int64_t>(255,integer(f.data(0)[i])+16)>=128?255:0;
    } else if(name=="matrix") {
        for(int r=0;r<n;++r) for(int c=0;c<n;++c) {double sum=0;for(int k=0;k<n;++k)sum+=get(0,r*16+k)*get(1,k*16+c);put(2,r*16+c,sum);}
    } else if(name=="routing") {
        uint64_t total=0;for(int i=0;i<n;++i) {bool hit=get(0,4*i+2)>=4&&get(0,4*i)<=8&&get(0,4*i+3)>=4&&get(0,4*i+1)<=8;f.data(1)[i]=hit?1:0;total+=hit?1:0;}return total;
    } else if(name=="histogram") {
        std::fill(f.data(1),f.data(1)+16,0);for(int i=0;i<n;++i)++f.data(1)[f.data(0)[i]];
    } else if(name=="stencil") {
        std::copy(f.data(0),f.data(0)+n*n,f.data(1));
        for(int r=1;r<n-1;++r)for(int c=1;c<n-1;++c){int i=r*n+c;put(1,i,(get(0,i-1)+get(0,i+1)+get(0,i-n)+get(0,i+n))*0.25);}
    } else if(name=="astar") {
        auto grid=f.data(0),state=f.data(1),path=f.data(2);
        int start=(int)f.arguments[3].value,goal=(int)f.arguments[4].value;
        auto distance=[&](int a){return std::abs(a/16-goal/16)+std::abs(a%16-goal%16);};
        for(int i=0;i<256;++i){state[4*i]=1000000;state[4*i+1]=1000000;state[4*i+2]=UINT64_MAX;state[4*i+3]=0;path[i]=UINT64_MAX;}
        if(grid[start]||grid[goal])return UINT64_MAX;
        state[start*4]=0;state[start*4+1]=distance(start);state[start*4+3]=1;
        for(;;) {
            int current=-1;uint64_t best=1000000;
            for(int i=0;i<256;++i)if(state[4*i+3]==1&&state[4*i+1]<best){best=state[4*i+1];current=i;}
            if(current<0)return UINT64_MAX;
            if(current==goal){uint64_t length=0;while(current!=-1){path[length++]=current;current=(int)integer(state[4*current+2]);}return length;}
            state[4*current+3]=2;
            const int dr[]={-1,1,0,0},dc[]={0,0,-1,1};
            for(int dir=0;dir<4;++dir) {
                int r=current/16+dr[dir],c=current%16+dc[dir];
                if(r<0||r>=16||c<0||c>=16)continue;
                int next=r*16+c;
                if(grid[next]||state[4*next+3]==2)continue;
                uint64_t candidate=state[4*current]+1;
                if(candidate<state[4*next]){state[4*next]=candidate;state[4*next+1]=candidate+distance(next);state[4*next+2]=current;state[4*next+3]=1;}
            }
        }
    }
    return 0;
}
inline int bfs_distance(const Fixture &f) {
    const auto grid=f.data(0);int start=(int)f.arguments[3].value,goal=(int)f.arguments[4].value;
    if(grid[start]||grid[goal])return -1;
    std::vector<int> distances(256,-1);std::queue<int> queue;queue.push(start);distances[start]=0;
    const int dr[]={-1,1,0,0},dc[]={0,0,-1,1};
    while(!queue.empty()) {
        int cell=queue.front();queue.pop();if(cell==goal)return distances[cell];
        for(int dir=0;dir<4;++dir){int r=cell/16+dr[dir],c=cell%16+dc[dir];if(r<0||r>=16||c<0||c>=16)continue;
                int next=r*16+c;
            if(!grid[next]&&distances[next]<0){distances[next]=distances[cell]+1;queue.push(next);}}
    }
    return -1;
}
inline uint64_t checksum(const Fixture &f,uint64_t result) {
    uint64_t hash=result;for(auto &buffer:f.buffers)for(auto value:buffer)hash=(hash^value)*1099511628211ULL;return hash;
}
}
