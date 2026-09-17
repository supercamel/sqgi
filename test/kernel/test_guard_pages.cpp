// Generated machine code is not instrumented by ASan. Guard pages ensure an
// invalid load/store cannot touch either side of the declared array.
#include "kernel/kernel.h"
#include <iostream>
#ifdef _WIN32
#include <windows.h>
#else
#include <sys/mman.h>
#include <unistd.h>
#endif
using namespace sqkernel;
struct Guarded {
    size_t page;void *base;
    Guarded() {
#ifdef _WIN32
        SYSTEM_INFO info;GetSystemInfo(&info);page=info.dwPageSize;
        base=VirtualAlloc(nullptr,page*3,MEM_RESERVE|MEM_COMMIT,PAGE_NOACCESS);
        DWORD old;if(!base||!VirtualProtect((char*)base+page,page,PAGE_READWRITE,&old))throw std::runtime_error("VirtualAlloc/Protect");
#else
        page=(size_t)sysconf(_SC_PAGESIZE);base=mmap(nullptr,page*3,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
        if(base==MAP_FAILED||mprotect((char*)base+page,page,PROT_READ|PROT_WRITE))throw std::runtime_error("mmap/mprotect");
#endif
    }
    ~Guarded(){
#ifdef _WIN32
        VirtualFree(base,0,MEM_RELEASE);
#else
        munmap(base,page*3);
#endif
    }
    uint64_t *data(){return (uint64_t*)((char*)base+page);}
};
int main() {
    if(!supported())return 77;
    try {
        Guarded memory;size_t n=memory.page/8;
        auto module=compile("export i64 read(in i64 a["+std::to_string(n)+"], i64 i) { return a[i]; }\n"
            "export void write(inout i64 a["+std::to_string(n)+"], i64 i) { a[i] = 42; }\n"
            "export i64 dynamic_read(in i64 a[], i64 i) { return a[i]; }\n"
            "export void dynamic_write(inout i64 a[], i64 i) { a[i] = 42; }","guard-pages.sqk");
        for(size_t fn=0;fn<4;++fn) {
            for(size_t i=0;i<n;++i)memory.data()[i]=19;
            for(int64_t index:{int64_t(-1),int64_t(n),INT64_MIN,INT64_MAX,int64_t(0),int64_t(n-1)}) {
                uint64_t args[]={(uint64_t)(uintptr_t)memory.data(),(uint64_t)index,n};Call call{args,0,100,0};
                bool valid=index>=0&&uint64_t(index)<n;
                if(execute(*module,fn,call)!=(valid?Success:BoundsError))throw std::runtime_error("guard status");
                if(valid && (fn%2==0?call.result!=19:memory.data()[index]!=42))throw std::runtime_error("guard result");
            }
            for(size_t i=1;i+1<n;++i)if(memory.data()[i]!=19)throw std::runtime_error("unexpected write");
        }
        // Even a pointer into inaccessible memory is safe for an empty view:
        // bounds must fail before any generated load or store executes.
        for(size_t fn=2;fn<4;++fn) {
            uint64_t args[]={(uint64_t)(uintptr_t)memory.base,0,0}; Call call{args,0,100,0};
            if(execute(*module,fn,call)!=BoundsError) throw std::runtime_error("empty dynamic guard status");
        }
        std::cout<<"26 protected-page fixed/dynamic read/write cases passed\n";
    }catch(const std::exception &e){std::cerr<<e.what()<<"\n";return 1;}
}
