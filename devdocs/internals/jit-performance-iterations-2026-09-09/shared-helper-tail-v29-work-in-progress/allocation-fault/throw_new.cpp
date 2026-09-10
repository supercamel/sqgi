#include <new>
#include <dlfcn.h>
#include <cstdio>
#include <cstdlib>
extern "C" {
volatile unsigned sqgi_fail_next_new = 0;
volatile unsigned sqgi_new_faults = 0;
}
void *operator new(std::size_t size)
{
    if(sqgi_fail_next_new) {
        sqgi_fail_next_new = 0;
        ++sqgi_new_faults;
        throw std::bad_alloc();
    }
    typedef void *(*Allocate)(std::size_t);
    static Allocate original = reinterpret_cast<Allocate>(dlsym(RTLD_NEXT,"_Znwm"));
    if(!original) std::abort();
    return original(size);
}
__attribute__((destructor)) static void report()
{
    std::fprintf(stderr,"SQGI_NEW_FAULTS=%u\n",unsigned(sqgi_new_faults));
}
