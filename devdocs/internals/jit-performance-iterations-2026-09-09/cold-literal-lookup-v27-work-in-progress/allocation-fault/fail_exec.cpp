#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <cerrno>
#include <cstdio>
static unsigned calls=0,failures=0;
extern "C" int mprotect(void *p,size_t size,int prot) {
    if(prot&PROT_EXEC) {
        ++calls;
        if(!failures) {++failures;errno=ENOMEM;return -1;}
    }
    return (int)syscall(SYS_mprotect,p,size,prot);
}
__attribute__((destructor)) static void report() { fprintf(stderr,"EXEC_FAILURES=%u EXEC_ATTEMPTS=%u\n",failures,calls); }
