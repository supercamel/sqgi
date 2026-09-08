/* Executable memory ownership for supported native backends. */
#include "sqpcheader.h"
#include "sqjit_code.h"
#include <limits>
#include <string.h>
#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#else
#include <sys/mman.h>
#include <unistd.h>
#endif
static void *sqjit_code_allocate(const unsigned char *code, SQInteger size, SQInteger *mapped_size)
{
#if defined(_WIN32)
    SYSTEM_INFO info;
    GetSystemInfo(&info);
    SQInteger page_size = info.dwPageSize > 0 ? (SQInteger)info.dwPageSize : 4096;
    if(size > std::numeric_limits<SQInteger>::max() - (page_size - 1)) return NULL;
    SQInteger alloc_size = ((size + page_size - 1) / page_size) * page_size;
    void *mem = VirtualAlloc(NULL, (SIZE_T)alloc_size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if(!mem) {
        return NULL;
    }

    memcpy(mem, code, (size_t)size);
    DWORD old_protect = 0;
    if(!VirtualProtect(mem, (SIZE_T)alloc_size, PAGE_EXECUTE_READ, &old_protect)) {
        VirtualFree(mem, 0, MEM_RELEASE);
        return NULL;
    }
    FlushInstructionCache(GetCurrentProcess(), mem, (SIZE_T)size);

    *mapped_size = alloc_size;
    return mem;
#else
    long page_size = sysconf(_SC_PAGESIZE);
    if(page_size <= 0) {
        page_size = 4096;
    }

    if(size > std::numeric_limits<SQInteger>::max() - (page_size - 1)) return NULL;
    SQInteger alloc_size = ((size + page_size - 1) / page_size) * page_size;
    void *mem = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if(mem == MAP_FAILED) {
        return NULL;
    }

    memcpy(mem, code, size);
    __builtin___clear_cache((char *)mem, (char *)mem + size);
    if(mprotect(mem, alloc_size, PROT_READ | PROT_EXEC) != 0) {
        munmap(mem, alloc_size);
        return NULL;
    }

    *mapped_size = alloc_size;
    return mem;
#endif
}

static void sqjit_code_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
#if defined(_WIN32)
        VirtualFree(entry, 0, MEM_RELEASE);
#else
        munmap(entry, size);
#endif
    }
}


SQJitCode::~SQJitCode() { Reset(); }

void SQJitCode::Reset()
{
    sqjit_code_free(entry, size);
    entry = NULL;
    size = 0;
    for(SQWeakRef *reference : weak_references) { __ObjRelease(reference); }
    weak_references.clear();
}

void SQJitCode::RetainWeakReference(SQWeakRef *reference)
{
    assert(reference);
    for(SQWeakRef *existing : weak_references) if(existing == reference) return;
    weak_references.push_back(reference);
    __ObjAddRef(reference);
}

bool SQJitCode::Install(const unsigned char *bytes, SQInteger length)
{
    if(!bytes || length <= 0) return false;
    SQInteger mapped_size = 0;
    void *mapped = sqjit_code_allocate(bytes, length, &mapped_size);
    if(!mapped) return false;
    Reset();
    entry = mapped;
    size = mapped_size;
    return true;
}

void SQJitCode::SetStub(void *stub)
{
    Reset();
    entry = stub;
}
