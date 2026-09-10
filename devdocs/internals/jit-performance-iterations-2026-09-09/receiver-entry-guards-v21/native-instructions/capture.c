#define _GNU_SOURCE
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <errno.h>
#include <string.h>
// Diagnostic-only Linux preload. Preserve syscall result/errno. No runtime code
// changes: snapshot RX mappings and their lifetimes in the sampled process.
static __thread int busy;
static unsigned long sequence;
static uint64_t now(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC,&t); return (uint64_t)t.tv_sec*1000000000+t.tv_nsec; }
static int all(int fd,const void *p,size_t n) {
    while(n) { ssize_t k=write(fd,p,n); if(k<0 && errno==EINTR) continue; if(k<=0)return 0; p=(const char *)p+k;n-=k; } return 1;
}
static void record(const char *kind,void *address,size_t length,uint64_t timestamp,int snapshot) {
    const char *dir=getenv("SQGI_PROFILE_MAP_DIR");if(!dir || !*dir || busy)return;
    busy=1;
    char path[4096],file[96],line[512];int ok=1;unsigned long id=__atomic_add_fetch(&sequence,1,__ATOMIC_RELAXED);long pid=(long)getpid();
    snprintf(file,sizeof(file),"%ld-%lu.bin",pid,id);
    if(snapshot) {
        int n=snprintf(path,sizeof(path),"%s/%s",dir,file);int fd=n>0 && n<(int)sizeof(path) ? open(path,O_WRONLY|O_CREAT|O_EXCL|O_CLOEXEC,0600) : -1;
        if(fd<0)ok=0;else { ok=all(fd,address,length);if(close(fd))ok=0; }
    }
    int n=snprintf(path,sizeof(path),"%s/events.jsonl",dir);int fd=n>0 && n<(int)sizeof(path) ? open(path,O_WRONLY|O_CREAT|O_APPEND|O_CLOEXEC,0600) : -1;
    if(fd>=0) {
        n=snprintf(line,sizeof(line),"{\"event\":\"%s\",\"pid\":%ld,\"tid\":%ld,\"ns\":%llu,\"address\":%llu,\"size\":%zu,\"file\":\"%s\",\"ok\":%d}\n",kind,pid,(long)syscall(SYS_gettid),(unsigned long long)timestamp,(unsigned long long)(uintptr_t)address,length,snapshot?file:"",ok);
        if(n>0 && n<(int)sizeof(line)) all(fd,line,(size_t)n);close(fd);
    }
    busy=0;
}
int mprotect(void *address,size_t length,int prot) {
    uint64_t t=now();int result=(int)syscall(SYS_mprotect,address,length,prot);int saved=errno;
    if(!result && (prot&(PROT_READ|PROT_EXEC))==(PROT_READ|PROT_EXEC))record("load",address,length,t,1);
    errno=saved;return result;
}
int munmap(void *address,size_t length) {
    uint64_t t=now();int result=(int)syscall(SYS_munmap,address,length);int saved=errno;
    if(!result)record("unload",address,length,t,0);
    errno=saved;return result;
}
