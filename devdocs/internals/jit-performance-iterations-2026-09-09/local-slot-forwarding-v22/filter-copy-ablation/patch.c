#define _GNU_SOURCE
#include <sys/mman.h>
#include <sys/syscall.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include "spec.h"
// Diagnostic only: exact normalized full-code match, then restore only the
// captured V21 copy instructions. Both modes use this same library/binary.
static uint32_t norm(uint32_t w) {
 if((w&0x1f800000u)==0x12800000u)return w&~(0xffffu<<5);
 if((w&0x7c000000u)==0x14000000u)return w&~0x3ffffffu;
 if((w&0xff000010u)==0x54000000u || (w&0x7e000000u)==0x34000000u)return w&~(0x7ffffu<<5);
 if((w&0x7e000000u)==0x36000000u)return w&~(0x3fffu<<5);
 return w;
}
int mprotect(void *address,size_t length,int prot) {
 int result=(int)syscall(SYS_mprotect,address,length,prot),saved=errno;
 if(!result && prot==(PROT_READ|PROT_EXEC) && length>=sizeof(expected)) {
  uint32_t *words=address;size_t i;
  for(i=0;i<sizeof(expected)/sizeof(*expected);++i)if(norm(words[i])!=expected[i])break;
  if(i==sizeof(expected)/sizeof(*expected)) {
   const char *mode=getenv("SQGI_DIAG_COPY_MODE");int gp=mode && mode[0]=='g';
   if(syscall(SYS_mprotect,address,length,PROT_READ|PROT_WRITE))_exit(111);
   if(gp)for(i=0;i<sizeof(positions)/sizeof(*positions);++i)words[positions[i]]=replacements[i];
   __builtin___clear_cache(address,(char *)address+length);
   if(syscall(SYS_mprotect,address,length,prot))_exit(112);
   fprintf(stderr,"[copy-ablation] exact code matched; mode=%s; changed=%zu\n",gp?"gp":"fp",gp?sizeof(positions)/sizeof(*positions):0);
  }
 }
 errno=saved;return result;
}
