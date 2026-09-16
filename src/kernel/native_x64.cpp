// Leaf-only x64 code generator. Every operation is native, with no interpreter
// dispatch or helper calls. Stack-backed temporaries prioritize auditability;
// use the LLVM backend for optimized code generation.
#include "kernel.h"
#include <cstring>
#include <climits>
#include <cstddef>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif
#ifdef _WIN32
#define NOMINMAX
#include <windows.h>
#else
#include <sys/mman.h>
#include <unistd.h>
#endif

namespace sqkernel {
class Executable {
    void *memory = nullptr;
    size_t length = 0;
public:
    explicit Executable(const std::vector<unsigned char> &bytes) {
        length=bytes.size();
#ifdef _WIN32
        memory=VirtualAlloc(nullptr,length,MEM_COMMIT|MEM_RESERVE,PAGE_READWRITE);
        if(!memory) throw std::runtime_error("kernel executable allocation failed");
        memcpy(memory,bytes.data(),length);
        DWORD old;
        if(!VirtualProtect(memory,length,PAGE_EXECUTE_READ,&old) || !FlushInstructionCache(GetCurrentProcess(),memory,length)) {
            VirtualFree(memory,0,MEM_RELEASE); memory=nullptr;
            throw std::runtime_error("kernel executable protection failed");
        }
#else
        memory=mmap(nullptr,length,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
        if(memory==MAP_FAILED) { memory=nullptr; throw std::runtime_error("kernel executable allocation failed"); }
        memcpy(memory,bytes.data(),length);
        __builtin___clear_cache((char*)memory,(char*)memory+length);
        if(mprotect(memory,length,PROT_READ|PROT_EXEC)!=0) {
            munmap(memory,length); memory=nullptr;
            throw std::runtime_error("kernel executable protection failed");
        }
#endif
    }
    ~Executable() {
#ifdef _WIN32
        if(memory) VirtualFree(memory,0,MEM_RELEASE);
#else
        if(memory) munmap(memory,length);
#endif
    }
    Executable(const Executable &)=delete;
    Executable &operator=(const Executable &)=delete;
    Status run(Call &call) const { return (Status)((int(*)(Call*))memory)(&call); }
};
bool supported() {
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(_WIN32) || defined(__unix__))
    return true;
#else
    return false;
#endif
}
const char *backend_name() { return "native"; }
namespace {
class Emitter {
public:
    std::vector<unsigned char> bytes;
    struct Fix { size_t offset; size_t target; };
    std::vector<Fix> branches;
    std::vector<size_t> labels;
    void b(unsigned v) { bytes.push_back((unsigned char)v); }
    void raw(std::initializer_list<unsigned> list) { for(auto v:list) b(v); }
    void word(uint32_t v) { for(int n=0;n<4;++n) b(v>>(n*8)); }
    void quad(uint64_t v) { for(int n=0;n<8;++n) b((unsigned)(v>>(n*8))); }
    void imm(uint64_t v) { raw({0x48,0xb8}); quad(v); } // rax
    void load(int s,int reg=0) { raw({0x48,0x8b,(unsigned)(0x85|(reg<<3))}); word((uint32_t)(-16-s*8)); }
    void store(int s) { raw({0x48,0x89,0x85}); word((uint32_t)(-16-s*8)); }
    void fp_load(int s,int reg=0) { raw({0xf2,0x0f,0x10,(unsigned)(0x85|(reg<<3))}); word((uint32_t)(-16-s*8)); }
    void fp_store(int s) { raw({0xf2,0x0f,0x11,0x85}); word((uint32_t)(-16-s*8)); }
    size_t branch(unsigned condition=0) {
        if(condition) raw({0x0f,condition}); else b(0xe9);
        size_t p=bytes.size(); word(0); return p;
    }
    void patch(size_t p,size_t target) {
        int64_t delta=(int64_t)target-(int64_t)(p+4);
        if(delta<INT32_MIN || delta>INT32_MAX) throw std::runtime_error("kernel jump out of range");
        uint32_t d=(uint32_t)delta;
        for(int i=0;i<4;++i) bytes[p+i]=(unsigned char)(d>>(8*i));
    }
    void epilogue() { raw({0x48,0x8d,0x65,0xf8,0x41,0x5c,0x5d,0xc3}); }
    void error(Status status,int line) {
        imm((uint64_t)line); raw({0x49,0x89,0x44,0x24,0x18});
        raw({0xb8}); word(status); epilogue();
    }
    void guard(unsigned success,Status status,int line) {
        size_t skip=branch(success); error(status,line); patch(skip,bytes.size());
    }
};
}
std::shared_ptr<Executable> lower(const Function &f) {
    static_assert(offsetof(Call,result)==8 && offsetof(Call,fuel)==16 && offsetof(Call,error_line)==24,"kernel ABI requires 64-bit pointers");
    Emitter e;
    e.raw({0x55,0x48,0x89,0xe5,0x41,0x54}); // rbp, r12 preserved
#ifdef _WIN32
    e.raw({0x49,0x89,0xcc}); // r12 = rcx
#else
    e.raw({0x49,0x89,0xfc}); // r12 = rdi
#endif
    e.raw({0x48,0x81,0xec}); e.word((uint32_t)(f.slots*8+8));
    e.raw({0x49,0x8b,0x14,0x24}); // rdx = arguments
    for(size_t i=0;i<f.parameters.size();++i) {
        e.raw({0x48,0x8b,0x82}); e.word((uint32_t)i*8); e.store((int)i);
    }
    for(const auto &i:f.code) {
        e.labels.push_back(e.bytes.size());
        switch(i.op) {
        case Op::Constant: e.imm(i.immediate); e.store(i.dst); break;
        case Op::Copy: e.load(i.a); e.store(i.dst); break;
        case Op::Add: case Op::Sub: case Op::Mul: case Op::Div:
            if(i.type==Type::F64) {
                e.fp_load(i.a); e.fp_load(i.b,1);
                unsigned op=i.op==Op::Add?0x58:i.op==Op::Sub?0x5c:i.op==Op::Mul?0x59:0x5e;
                e.raw({0xf2,0x0f,op,0xc1}); e.fp_store(i.dst);
            } else {
                e.load(i.a); e.load(i.b,1);
                if(i.op==Op::Add) e.raw({0x48,0x01,0xc8});
                else if(i.op==Op::Sub) e.raw({0x48,0x29,0xc8});
                else if(i.op==Op::Mul) e.raw({0x48,0x0f,0xaf,0xc1});
                else {
                    e.raw({0x48,0x85,0xc9}); e.guard(0x85,ArithmeticError,i.line);
                    // Check INT64_MIN / -1 before idiv, which would trap.
                    e.raw({0x48,0x83,0xf9,0xff}); size_t okay=e.branch(0x85);
                    e.raw({0x48,0xba}); e.quad(uint64_t(1)<<63); e.raw({0x48,0x39,0xd0});
                    e.guard(0x85,ArithmeticError,i.line); e.patch(okay,e.bytes.size());
                    e.raw({0x48,0x99,0x48,0xf7,0xf9});
                }
                e.store(i.dst);
            }
            break;
        case Op::Neg:
            e.load(i.a);
            if(i.type==Type::F64) { e.raw({0x48,0xb9}); e.quad(uint64_t(1)<<63); e.raw({0x48,0x31,0xc8}); }
            else e.raw({0x48,0xf7,0xd8});
            e.store(i.dst); break;
        case Op::Eq: case Op::Ne: case Op::Lt: case Op::Le: case Op::Gt: case Op::Ge: {
            unsigned cc;
            if(i.type==Type::F64) {
                e.fp_load(i.a); e.fp_load(i.b,1); e.raw({0x66,0x0f,0x2e,0xc1});
                cc=i.op==Op::Eq?0x94:i.op==Op::Ne?0x95:i.op==Op::Lt?0x92:i.op==Op::Le?0x96:i.op==Op::Gt?0x97:0x93;
                e.raw({0x0f,cc,0xc0});
                if(i.op==Op::Ne) e.raw({0x0f,0x9a,0xc1,0x08,0xc8}); // unordered OR !=
                else if(i.op==Op::Eq || i.op==Op::Lt || i.op==Op::Le) e.raw({0x0f,0x9b,0xc1,0x20,0xc8});
            } else {
                e.load(i.a); e.load(i.b,1); e.raw({0x48,0x39,0xc8});
                cc=i.op==Op::Eq?0x94:i.op==Op::Ne?0x95:i.op==Op::Lt?0x9c:i.op==Op::Le?0x9e:i.op==Op::Gt?0x9f:0x9d;
                e.raw({0x0f,cc,0xc0});
            }
            e.raw({0x48,0x0f,0xb6,0xc0}); e.store(i.dst); break;
        }
        case Op::Load:
            e.load(i.a); e.load(i.b,1); e.raw({0x48,0x8b,0x04,0xc8}); e.store(i.dst); break;
        case Op::Store:
            e.load(i.a); e.load(i.b,1); e.load(i.dst,2); e.raw({0x48,0x89,0x14,0xc8}); break;
        case Op::Bounds:
            e.load(i.a); e.raw({0x48,0xb9}); e.quad(i.immediate); e.raw({0x48,0x39,0xc8});
            e.guard(0x82,BoundsError,i.line); break; // unsigned < rejects negatives
        case Op::Require:
            e.load(i.a); e.raw({0x48,0x85,0xc0}); e.guard(0x85,RequirementError,i.line); break;
        case Op::Tick:
            e.raw({0x49,0x83,0x7c,0x24,0x10,0x00}); e.guard(0x85,BudgetError,i.line);
            e.raw({0x49,0xff,0x4c,0x24,0x10}); break;
        case Op::Jump: e.branches.push_back({e.branch(),(size_t)i.immediate}); break;
        case Op::JumpFalse:
            e.load(i.a); e.raw({0x48,0x85,0xc0}); e.branches.push_back({e.branch(0x84),(size_t)i.immediate}); break;
        case Op::Return:
            if(i.type!=Type::Void) { e.load(i.a); e.raw({0x49,0x89,0x44,0x24,0x08}); }
            e.raw({0x31,0xc0}); e.epilogue(); break;
        }
        if(e.bytes.size()>1024*1024) throw std::runtime_error("kernel code size limit exceeded");
    }
    e.labels.push_back(e.bytes.size());
    // Unreachable terminal guards protect against an accidentally malformed IR.
    e.error(RequirementError,0);
    for(auto &f:e.branches) e.patch(f.offset,e.labels.at(f.target));
    return std::make_shared<Executable>(e.bytes);
}
Status execute(const Module &m,size_t index,Call &call) {
#if defined(__x86_64__) || defined(_M_X64)
    const auto &native=m.native.at(index);
    unsigned old=_mm_getcsr();
    // Mask hardware FP exceptions, use nearest-even and gradual underflow.
    _mm_setcsr((old & ~unsigned(0xe040)) | 0x1f80);
    Status result=native->run(call);
    _mm_setcsr(old);
    return result;
#else
    (void)m; (void)index; (void)call;
    throw std::runtime_error("kernel native backend unavailable");
#endif
}
}
