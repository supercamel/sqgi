// Algorithm ports of test/test_jit_perf_correctness.nut. No fast-math or BLAS.
#include <array>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <iostream>
#include <iomanip>
#include <limits>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>
#include <atomic>

using Int = std::int64_t;
static_assert(sizeof(Int)==8 && sizeof(double)==8, "64-bit benchmark values required");
#if defined(__GNUC__) || defined(__clang__)
#define BENCH_NOINLINE __attribute__((noinline))
#elif defined(_MSC_VER)
#define BENCH_NOINLINE __declspec(noinline)
#else
#define BENCH_NOINLINE
#endif
#ifndef SQGI_CPP_BENCH_FLAGS
#define SQGI_CPP_BENCH_FLAGS "unspecified (manual build)"
#endif

Int scalar_step(Int acc, Int a, Int b) { return (acc*33+a*17-b*9+97)%1000003; }
BENCH_NOINLINE Int direct_call(Int n) {
    Int acc=7; for(Int i=0;i<n;++i) acc=scalar_step(acc,i%251,i%127); return acc;
}
Int scalar_branch_step(Int acc, Int i) {
    Int delta=i%2==0?i%17:-(i%13); return (acc+delta+97)%1000003;
}
BENCH_NOINLINE Int branch_call(Int n) {
    Int acc=7; for(Int i=0;i<n;++i) acc=scalar_branch_step(acc,i); return acc;
}
double scalar_float_step(double x, double y) { return x*0.5+y; }
BENCH_NOINLINE double float_call(Int n) {
    double value=0; for(Int i=0;i<n;++i) value=scalar_float_step(value,double(i%7)); return value;
}
BENCH_NOINLINE Int numeric_loop(Int n) {
    Int acc=13;
    for(Int i=0;i<n;++i) acc=(acc+(i%997)*31+(acc%17)*7+11)%1000000007;
    return acc;
}
struct Vec3 {
    std::array<double,3> values;
    Vec3(double x,double y,double z):values{{x,y,z}} {}
    double get(Int i) const { return values[i]; }
    void set(Int i,double v) { values[i]=v; }
    Vec3 operator+(const Vec3 &o) const { return {values[0]+o.values[0],values[1]+o.values[1],values[2]+o.values[2]}; }
    Vec3 operator-(const Vec3 &o) const { return {values[0]-o.values[0],values[1]-o.values[1],values[2]-o.values[2]}; }
    Vec3 operator*(double s) const { return {values[0]*s,values[1]*s,values[2]*s}; }
    double dot(const Vec3 &o) const { return values[0]*o.values[0]+values[1]*o.values[1]+values[2]*o.values[2]; }
    Vec3 cross(const Vec3 &o) const {
        return {values[1]*o.values[2]-values[2]*o.values[1],values[2]*o.values[0]-values[0]*o.values[2],values[0]*o.values[1]-values[1]*o.values[0]};
    }
};
BENCH_NOINLINE double vector_kernel(Int n) {
    Vec3 pos(1,-2,0.5),vel(0.125,-0.250,0.375),axis(0.25,0.5,-0.75);
    double checksum=0;
    for(Int i=0;i<n;++i) {
        Vec3 wind(((i%11)-5.0)*0.01,((i%7)-3.0)*0.02,((i%5)-2.0)*0.015);
        Vec3 force=vel.cross(axis)+wind-pos*0.0125;
        pos=pos+force*0.05;
        vel=vel+pos.cross(force)*0.0025;
        Int idx=i%3,next=(idx+1)%3;
        pos.set(next,pos.get(next)*0.75+pos.get(idx)*0.125);
        checksum=checksum+pos.dot(vel)*0.0001;
    }
    return pos.dot(vel)+checksum;
}
using Payload = std::array<Int,3>;
struct PayloadBox {
    Payload *payload;
    std::string label;
    Int swap_with(PayloadBox &other,const std::string &next_label) {
        auto previous=payload;payload=other.payload;label=next_label;other.payload=previous;
        return (*payload)[0]+(*other.payload)[1];
    }
};
BENCH_NOINLINE Int dynamic_member(Int n) {
    const std::array<std::string,3> keys={{"x","y","z"}};
    struct State {
        std::unordered_map<std::string,Int> fields{{"x",3},{"y",5},{"z",7}};
        PayloadBox *active=nullptr;
        std::string label="init";
    } state;
    Payload a={{1,2,3}},b={{4,5,6}};
    PayloadBox boxes[]={{&a,"a"},{&b,"b"}};
    Int sum=0;
    for(Int i=0;i<n;++i) {
        const auto &key=keys[i%3];Int old=state.fields.at(key);
        state.fields.at(key)=old+i%17;state.active=&boxes[i%2];state.label=key;
        auto &box=*state.active;
        sum=(sum+box.swap_with(boxes[(i+1)%2],key))%1000003;
        (*box.payload)[i%3]=((*box.payload)[i%3]+state.fields.at(key)+i)%997;
        sum=(sum+(*box.payload)[(i+2)%3]+state.fields.at(key))%1000003;
    }
    return sum+state.fields.at("x")*3+state.fields.at("y")*5+state.fields.at("z")*7+(*boxes[0].payload)[0]*11+(*boxes[1].payload)[2]*13;
}
BENCH_NOINLINE Int dynamic_key_get_set(Int n) {
    const std::array<std::string,4> keys={{"a","b","c","d"}};
    std::unordered_map<std::string,Int> state{{"a",1},{"b",2},{"c",3},{"d",4}};
    Int acc=0;
    for(Int i=0;i<n;++i) {
        const auto &key=keys[i%4],&next_key=keys[(i+1)%4];Int current=state.at(key);
        Int next_value=(current+i*3+7)%1000003;
        state.at(key)=next_value;acc=(acc+state.at(next_key)+next_value)%1000003;
    }
    return acc+state.at("a")*3+state.at("b")*5+state.at("c")*7+state.at("d")*11;
}
BENCH_NOINLINE Int object_member_write_fallback(Int n) {
    Payload a={{1,2,3}},b={{4,5,6}};
    struct State {Payload *active,*spare;std::string label;} state{&a,&b,"init"};
    Int sum=0;
    for(Int i=0;i<n;++i) {
        auto previous=state.active;state.active=state.spare;state.spare=previous;
        state.label=i%2==0?"even":"odd";
        (*state.active)[i%3]=((*state.active)[i%3]+i+Int(state.label.size()))%997;
        sum=(sum+(*state.active)[(i+1)%3]+(*state.spare)[(i+2)%3])%1000003;
    }
    return sum+(*state.active)[0]*3+(*state.active)[1]*5+(*state.spare)[2]*7+Int(state.label.size());
}
BENCH_NOINLINE Int array_append(Int n) {
    std::vector<Int> values; // Deliberately grow as the other runtimes do; no reserve.
    for(Int i=0;i<n;++i) values.push_back(i%251);
    Int sum=0;for(Int i=0;i<n;++i) sum=(sum+values[i]*((i%7)+1))%1000003;
    return sum+Int(values.size())*13;
}
BENCH_NOINLINE Int array_write(Int n) {
    std::array<Int,8> values{};
    for(Int i=0;i<n;++i) {Int slot=i%8;values[slot]=(values[slot]+i*5+slot)%1000003;}
    Int sum=0;for(Int i=0;i<8;++i) sum=(sum+values[i]*(i+3))%1000003;
    return sum;
}
BENCH_NOINLINE Int array_read(Int n) {
    const std::array<Int,4> a={{1,2,3,4}};Int sum=0;
    for(Int i=0;i<n;++i) sum+=a[i%4];
    return sum;
}
BENCH_NOINLINE double array_float(Int n) {
    const std::array<double,4> a={{0.5,1.5,2.5,3.5}};double sum=0;
    for(Int i=0;i<n;++i) sum+=a[i%4];
    return sum;
}
BENCH_NOINLINE double math_intrinsic(Int n) {
    double total=0;
    for(Int i=0;i<n;++i) {
        double x=double(i%97+1);
        total+=std::sqrt(x)+std::sin(0.0)+std::cos(0.0);
        total+=std::fabs(-3.5)+std::floor(1.75)+std::ceil(1.25);
        total+=std::pow(1.0001,double(i%5));
    }
    return total;
}
BENCH_NOINLINE double math_variable(Int n) {
    double total=0;
    for(Int i=0;i<n;++i) {
        double x=double(i%97+1)*0.01;
        total+=std::sqrt(x)+std::sin(x)+std::cos(x)+std::log(x)+std::atan2(x,0.75)+std::pow(x,1.125);
    }
    return total;
}
BENCH_NOINLINE double matrix(Int n) {
    double a[3][3]={{1,0.5,-0.25},{-0.75,1.25,0.375},{0.625,-0.5,1.5}},v[]={1,-2,0.75};
    double checksum=0;
    for(Int i=0;i<n;++i) {
        double x=a[0][0]*v[0]+a[0][1]*v[1]+a[0][2]*v[2];
        double y=a[1][0]*v[0]+a[1][1]*v[1]+a[1][2]*v[2];
        double z=a[2][0]*v[0]+a[2][1]*v[1]+a[2][2]*v[2];
        v[0]=x*0.125+((i%5)-2.0)*0.01;
        v[1]=y*0.125-((i%7)-3.0)*0.015;
        v[2]=z*0.125+((i%11)-5.0)*0.005;
        a[i%3][(i+1)%3]=a[i%3][(i+1)%3]*0.99+v[i%3]*0.001;
        checksum=checksum+v[0]*0.25+v[1]*0.5-v[2]*0.125;
    }
    return checksum+v[0]*3+v[1]*5+v[2]*7;
}

struct Kernel {
    const char *name;
    Int (*integer)(Int);
    double (*floating)(Int);
    Int scale,check_n;
    double expected,epsilon;
};
static const Kernel kernels[]={
    {"direct_call",direct_call,nullptr,20,400,193938,0},
    {"branch_call",branch_call,nullptr,20,400,39196,0},
    {"float_call",nullptr,float_call,20,400,5.0551181102362204,1e-12},
    {"numeric_loop",numeric_loop,nullptr,20,400,2500508,0},
    {"vector",nullptr,vector_kernel,1,120,0.021712587807413163,1e-12},
    {"dynamic_member",dynamic_member,nullptr,1,160,186190,0},
    {"dynamic_key_get_set",dynamic_key_get_set,nullptr,1,200,470622,0},
    {"object_member_write_fallback",object_member_write_fallback,nullptr,1,120,82710,0},
    {"array_append",array_append,nullptr,1,300,134408,0},
    {"array_write",array_write,nullptr,1,300,461837,0},
    {"array_read",array_read,nullptr,20,200,500,0},
    {"array_float",nullptr,array_float,20,200,400,0.0005},
    {"math_intrinsic",nullptr,math_intrinsic,1,80,1161.3127449959120,1e-9},
    {"math_variable",nullptr,math_variable,1,80,122.66761111643609,1e-9},
    {"matrix",nullptr,matrix,1,200,-0.31467322972993278,1e-12},
};
volatile double sink=0;
// Opaque call boundary prevents reuse/hoisting of a pure kernel across warmups
// and timing. Inner helpers remain inlineable; no volatile accesses in the loops.
Int invoke(const Kernel &k,Int n) {
    Int (*volatile fn)(Int)=k.integer;return fn(n);
}
double invoke_float(const Kernel &k,Int n) {
    double (*volatile fn)(Int)=k.floating;return fn(n);
}
Int number(const char *text,bool allow_zero) {
    std::string input(text);std::size_t used=0;
    Int n=std::stoll(input,&used);
    if(used!=input.size() || n<(allow_zero?0:1) || n>std::numeric_limits<Int>::max()/1000)
        throw std::runtime_error("iterations must be positive and warmups nonnegative, within int64 benchmark bounds");
    return n;
}
int main(int argc,char **argv) {
    try {
        if(argc==2 && std::string(argv[1])=="--metadata") {
            std::cout<<"compiler\t";
#if defined(_MSC_VER) && !defined(__clang__)
            std::cout<<"MSVC "<<_MSC_FULL_VER;
#elif defined(__clang__)
            std::cout<<"Clang "<<__clang_version__;
#else
            std::cout<<"GCC "<<__VERSION__;
#endif
            std::cout<<"\nflags\t"<<SQGI_CPP_BENCH_FLAGS
                <<"\ninteger_bytes\t"<<sizeof(Int)<<"\nfloat_bytes\t"<<sizeof(double)<<'\n';
            return 0;
        }
        const bool check_only=argc==2 && std::string(argv[1])=="--check";
        if(argc>3) throw std::runtime_error("usage: cpp_jit_kernels [iterations [warmups]] | --check | --metadata");
        Int iterations=check_only?1:argc>1?number(argv[1],false):80000;
        Int warmups=argc>2?number(argv[2],true):5;
        for(const auto &k:kernels) {
            double actual=k.integer?double(invoke(k,k.check_n)):invoke_float(k,k.check_n);
            if(!std::isfinite(actual) || std::fabs(actual-k.expected)>k.epsilon)
                throw std::runtime_error(std::string(k.name)+": known checksum failed");
        }
        if(check_only) {std::cout<<"All 15 known checksums passed\n";return 0;}
        for(const auto &k:kernels) {
            Int n=iterations*k.scale;
            for(Int w=0;w<warmups;++w) sink=sink+(k.integer?double(invoke(k,n)):invoke_float(k,n));
            std::atomic_signal_fence(std::memory_order_seq_cst);
            auto start=std::chrono::steady_clock::now();
            Int integer=0;double floating=0;
            if(k.integer) integer=invoke(k,n);else floating=invoke_float(k,n);
            std::atomic_signal_fence(std::memory_order_seq_cst);
            auto end=std::chrono::steady_clock::now();
            double us=std::chrono::duration<double,std::micro>(end-start).count();
            std::cout<<"BENCH\t"<<k.name<<'\t'<<n<<'\t'<<std::fixed<<std::setprecision(9)<<us/n<<'\t';
            if(k.integer) std::cout<<integer;else std::cout<<std::defaultfloat<<std::setprecision(17)<<floating;
            std::cout<<'\n';
        }
        std::cout<<"SINK\t"<<std::defaultfloat<<std::setprecision(17)<<sink<<'\n';
    } catch(const std::exception &e) {std::cerr<<e.what()<<'\n';return 1;}
}
