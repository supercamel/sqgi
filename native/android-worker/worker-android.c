#define _GNU_SOURCE
#include "worker-private.h"
#include <sqgi_vm.h>
#include <sqgi_import.h>
#include <girepository.h>
#include <jni.h>
#include <dlfcn.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

typedef struct { JavaVM *vm; JNIEnv *env; jclass bridge; jobject application; gboolean attached; } Bridge;
static gchar *utf8(JNIEnv *env,jstring value) {
    if(!value)return NULL;
    const jchar *text=(*env)->GetStringChars(env,value,NULL); if(!text)return NULL;
    gchar *result=g_utf16_to_utf8((const gunichar2 *)text,(*env)->GetStringLength(env,value),NULL,NULL,NULL);
    (*env)->ReleaseStringChars(env,value,text); return result;
}
static jstring string(JNIEnv *env,const char *value) {
    if(!value)return NULL;
    glong length=0; gunichar2 *text=g_utf8_to_utf16(value,-1,NULL,&length,NULL); if(!text)return NULL;
    jstring result=(*env)->NewString(env,(const jchar *)text,(jsize)length); g_free(text); return result;
}
static void fail(GError **error,const char *message) { g_set_error_literal(error,G_IO_ERROR,G_IO_ERROR_FAILED,message); }
static gboolean exception(Bridge *bridge,GError **error) {
    JNIEnv *env=bridge->env; jthrowable thrown=(*env)->ExceptionOccurred(env); if(!thrown)return FALSE;
    (*env)->ExceptionClear(env);
    jclass type=(*env)->GetObjectClass(env,thrown);
    jmethodID method=type?(*env)->GetMethodID(env,type,"toString","()Ljava/lang/String;"):NULL;
    jstring text=method?(*env)->CallObjectMethod(env,thrown,method):NULL;
    g_autofree char *message=(!(*env)->ExceptionCheck(env) && text)?utf8(env,text):NULL;
    (*env)->ExceptionClear(env); fail(error,message?message:"Android worker service failed"); return TRUE;
}
static void bridge_end(Bridge *bridge) {
    if(bridge->env)(*bridge->env)->PopLocalFrame(bridge->env,NULL);
    if(bridge->attached)(*bridge->vm)->DetachCurrentThread(bridge->vm);
}
static gboolean bridge_begin(Bridge *bridge,GError **error) {
    void *platform=dlopen("libsqgi-platform.so",RTLD_NOW|RTLD_LOCAL);
    JavaVM *(*vm)(void)=platform?dlsym(platform,"sqgi_android_get_java_vm"):NULL;
    jobject (*loader)(void)=platform?dlsym(platform,"sqgi_android_get_application_class_loader"):NULL;
    jobject (*application)(void)=platform?dlsym(platform,"sqgi_android_get_application_context"):NULL;
    bridge->vm=vm?vm():NULL; bridge->application=application?application():NULL;
    jobject class_loader=loader?loader():NULL;
    if(platform)dlclose(platform);
    if(!bridge->vm || !class_loader || !bridge->application) { fail(error,"SQGI Android application services are unavailable"); return FALSE; }
    if((*bridge->vm)->GetEnv(bridge->vm,(void **)&bridge->env,JNI_VERSION_1_6)!=JNI_OK) {
        if((*bridge->vm)->AttachCurrentThread(bridge->vm,&bridge->env,NULL)!=JNI_OK) { fail(error,"Cannot attach Android worker launcher"); return FALSE; }
        bridge->attached=TRUE;
    }
    if((*bridge->env)->PushLocalFrame(bridge->env,32)!=JNI_OK) {
        (*bridge->env)->ExceptionClear(bridge->env); bridge->env=NULL; bridge_end(bridge);
        fail(error,"Cannot allocate Android worker JNI frame"); return FALSE;
    }
    JNIEnv *env=bridge->env; jclass type=(*env)->GetObjectClass(env,class_loader);
    jmethodID load=type?(*env)->GetMethodID(env,type,"loadClass","(Ljava/lang/String;)Ljava/lang/Class;"):NULL;
    jstring name=(*env)->NewStringUTF(env,"org.sqgi.worker.WorkerBridge");
    if(load && name)bridge->bridge=(*env)->CallObjectMethod(env,class_loader,load,name);
    if(exception(bridge,error) || !bridge->bridge) { if(error && !*error)fail(error,"Android worker Java bridge is missing"); bridge_end(bridge); return FALSE; }
    return TRUE;
}
static jobjectArray strings(JNIEnv *env,const char *const *values) {
    jclass type=(*env)->FindClass(env,"java/lang/String"); if(!type)return NULL;
    jsize length=values?(jsize)g_strv_length((char **)values):0;
    jobjectArray result=(*env)->NewObjectArray(env,length,type,NULL); if(!result)return NULL;
    for(jsize i=0;i<length;i++) {
        jstring value=string(env,values[i]); if(!value)return NULL;
        (*env)->SetObjectArrayElement(env,result,i,value); (*env)->DeleteLocalRef(env,value);
        if((*env)->ExceptionCheck(env))return NULL;
    }
    return result;
}
gboolean sq_worker_android_start(const char *token,const char *directory,const char *const *arguments,
    const char *const *environment,const char *const *unset,const int descriptors[4],GError **error) {
    Bridge bridge={0}; if(!bridge_begin(&bridge,error))return FALSE;
    JNIEnv *env=bridge.env;
    jmethodID start=(*env)->GetStaticMethodID(env,bridge.bridge,"start",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[I)V");
    jstring id=string(env,token),cwd=string(env,directory);
    jobjectArray args=strings(env,arguments),vars=strings(env,environment),removed=strings(env,unset);
    jintArray fds=(*env)->NewIntArray(env,4);
    if(start && id && args && vars && removed && fds && !(*env)->ExceptionCheck(env)) {
        jint values[4]={descriptors[0],descriptors[1],descriptors[2],descriptors[3]};
        (*env)->SetIntArrayRegion(env,fds,0,4,values);
        (*env)->CallStaticVoidMethod(env,bridge.bridge,start,bridge.application,id,cwd,args,vars,removed,fds);
    }
    gboolean failed=exception(&bridge,error);
    if(!failed && (!start || !id || !args || !vars || !removed || !fds)) { fail(error,"Invalid UTF-8 or allocation failure in worker request"); failed=TRUE; }
    bridge_end(&bridge); return !failed;
}
void sq_worker_android_release(const char *token) {
    Bridge bridge={0}; GError *error=NULL;
    if(bridge_begin(&bridge,&error)) {
        JNIEnv *env=bridge.env;
        jmethodID release=(*env)->GetStaticMethodID(env,bridge.bridge,"release","(Ljava/lang/String;)V");
        jstring id=string(env,token);
        if(release && id)(*env)->CallStaticVoidMethod(env,bridge.bridge,release,id);
        exception(&bridge,&error); bridge_end(&bridge);
    }
    if(error) { g_warning("Cannot reap Android worker: %s",error->message); g_error_free(error); }
}
JNIEXPORT void JNICALL Java_org_sqgi_android_GtkApplication_configureWorker(JNIEnv *env,jclass klass,
    jstring runtime,jstring libraries,jstring cache,jstring source) {
    (void)klass;
    g_autofree char *root=utf8(env,runtime),*lib=utf8(env,libraries),*temp=utf8(env,cache),*app=utf8(env,source);
    if(!root || !lib || !temp || !app)return;
    g_autofree char *files=g_path_get_dirname(root),*share=g_build_filename(root,"share",NULL);
    g_autofree char *config=g_build_filename(files,"config",NULL),*data=g_build_filename(files,"data",NULL);
    g_autofree char *typelibs=g_build_filename(root,"typelib",NULL),*fonts=g_build_filename(root,"fonts.conf",NULL);
    g_setenv("XDG_CONFIG_HOME",config,TRUE); g_setenv("XDG_CONFIG_DIRS",config,TRUE);
    g_setenv("XDG_DATA_HOME",data,TRUE); g_setenv("XDG_DATA_DIRS",share,TRUE);
    g_setenv("XDG_CACHE_HOME",temp,TRUE); g_setenv("TMPDIR",temp,TRUE);
    g_setenv("FONTCONFIG_FILE",fonts,TRUE); g_setenv("GSETTINGS_BACKEND","keyfile",TRUE);
    g_irepository_prepend_search_path(typelibs); g_irepository_prepend_library_path(lib);
    if(chdir(app)<0) {
        jclass error=(*env)->FindClass(env,"java/lang/IllegalStateException");
        if(error)(*env)->ThrowNew(env,error,"Cannot enter SQGI worker source directory");
    }
}
static char **read_strings(JNIEnv *env,jobjectArray values) {
    if(!values)return g_new0(char *,1);
    jsize count=(*env)->GetArrayLength(env,values); char **result=g_new0(char *,count+1);
    for(jsize i=0;i<count;i++) {
        jstring item=(*env)->GetObjectArrayElement(env,values,i); result[i]=utf8(env,item);
        if(item)(*env)->DeleteLocalRef(env,item);
        if(!result[i]) { g_strfreev(result); return NULL; }
    }
    return result;
}
static gpointer watch_parent(gpointer data) {
    int descriptor=GPOINTER_TO_INT(data); char command;
    for(;;) {
        ssize_t count=recv(descriptor,&command,1,0);
        if(count<0 && errno==EINTR)continue;
        // Cancellation and lost parent both end this dedicated process.
        _exit(137);
    }
    return NULL;
}
static gboolean send_status(int fd,int kind,int status) {
    SqWorkerStatus value={kind,status}; size_t offset=0;
    while(offset<sizeof(value)) {
        ssize_t count=send(fd,(char *)&value+offset,sizeof(value)-offset,MSG_NOSIGNAL);
        if(count<0 && errno==EINTR)continue;
        if(count<=0)return FALSE;
        offset+=(size_t)count;
    }
    return TRUE;
}
JNIEXPORT void JNICALL Java_org_sqgi_worker_WorkerService_run(JNIEnv *env,jclass klass,jstring directory,
    jobjectArray arguments,jobjectArray environment,jobjectArray unset,jintArray descriptors) {
    (void)klass;
    if(!descriptors || (*env)->GetArrayLength(env,descriptors)!=4)_exit(127);
    jint fds[4]; (*env)->GetIntArrayRegion(env,descriptors,0,4,fds);
    if((*env)->ExceptionCheck(env))_exit(127);
    for(int i=0;i<3;i++) { if(dup2(fds[i],i)<0)_exit(127); if(fds[i]!=i)close(fds[i]); }
    int control=fds[3];
    g_thread_unref(g_thread_new("sqgi-parent-watch",watch_parent,GINT_TO_POINTER(control)));
    if(!send_status(control,SQ_WORKER_STARTED,0))_exit(127);
    g_auto(GStrv) args=read_strings(env,arguments),vars=read_strings(env,environment),removed=read_strings(env,unset);
    g_autofree char *cwd=utf8(env,directory);
    int code=1;
    if(!args || !args[0] || !args[1] || !vars || !removed || (*env)->ExceptionCheck(env))goto finish;
    if(cwd && chdir(cwd)<0) { fprintf(stderr,"Cannot enter worker directory: %s\n",g_strerror(errno)); goto finish; }
    if(!g_file_test(args[1],G_FILE_TEST_IS_REGULAR)) { fprintf(stderr,"Worker script is not a regular file: %s\n",args[1]); goto finish; }
    for(char **item=removed;*item;item++)g_unsetenv(*item);
    for(char **item=vars;*item;item++) {
        char *separator=strchr(*item,'='); if(!separator)goto finish;
        *separator=0; if(!g_setenv(*item,separator+1,TRUE))goto finish;
    }
    HSQUIRRELVM vm=sqgi_vm_new(); if(!vm)goto finish;
    sq_pushroottable(vm); sq_pushstring(vm,"vargv",-1); sq_newarray(vm,0);
    for(char **item=args+2;*item;item++) { sq_pushstring(vm,*item,-1); sq_arrayappend(vm,-2); }
    sq_newslot(vm,-3,SQFalse); sq_pop(vm,1);
    sq_pushroottable(vm);
    if(SQ_SUCCEEDED(sqstd_loadfile(vm,args[1],SQTrue))) {
        sq_pushroottable(vm); int parameters=1;
        for(char **item=args+2;*item;item++) { sq_pushstring(vm,*item,-1); parameters++; }
        if(sqgi_import_push_file(vm,args[1])) {
            SQRESULT result=sq_call(vm,parameters,SQTrue,SQTrue); sqgi_import_pop_file(vm);
            if(SQ_SUCCEEDED(result)) { SQInteger value=0; sq_getinteger(vm,-1,&value); code=(int)value; }
        }
    }
    sqgi_vm_free(vm);
finish:
    fflush(stdout); fflush(stderr); send_status(control,SQ_WORKER_EXITED,code);
    _exit(code);
}
