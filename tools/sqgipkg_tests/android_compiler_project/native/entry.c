#include <sqgi_android_entry.h>
#include <sqgi_vm.h>
#include <glib.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int sqgi_android_main(const SqgiAndroidEntryContext *context) {
    char *path=g_build_filename(context->data_directory,"compiler-trace.log",NULL);
    if (!freopen(path,"w",stderr)) { g_free(path); return 2; }
    g_free(path); setvbuf(stderr,NULL,_IONBF,0);
    if(dup2(fileno(stderr),STDOUT_FILENO)<0)return 4;
    setvbuf(stdout,NULL,_IONBF,0);
    char *disable=g_build_filename(context->data_directory,"jit-disabled",NULL);
    setenv("SQGI_JIT_TRACE","1",1);
    setenv("SQGI_JIT",g_file_test(disable,G_FILE_TEST_EXISTS)?"0":"1",1);
    g_free(disable);
    HSQUIRRELVM vm=sqgi_vm_new(); if(!vm)return 3;
    SQRESULT result=sqgi_vm_dofile(vm,context->entry_script);
    sqgi_vm_free(vm); return SQ_SUCCEEDED(result)?0:1;
}
