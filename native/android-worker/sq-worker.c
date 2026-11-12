#define _GNU_SOURCE
#include "sq-worker.h"
#include "worker-private.h"
#include <gio/gunixinputstream.h>
#include <gio/gunixoutputstream.h>
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <signal.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

struct _SqWorkerLauncher {
    GObject parent_instance;
    GSubprocessFlags flags;
    char *directory;
    GHashTable *environment, *unset;
};
struct _SqWorkerProcess {
    GObject parent_instance;
    GMutex mutex;
    GCond condition;
    char *token;
    int control;
    gboolean complete, normal, forced;
    int status;
    GOutputStream *input;
    GInputStream *output, *errors;
};
G_DEFINE_TYPE(SqWorkerLauncher, sq_worker_launcher, G_TYPE_OBJECT)
G_DEFINE_TYPE(SqWorkerProcess, sq_worker_process, G_TYPE_OBJECT)

static void launcher_finalize(GObject *object) {
    SqWorkerLauncher *self=SQ_WORKER_LAUNCHER(object);
    g_free(self->directory); g_hash_table_unref(self->environment); g_hash_table_unref(self->unset);
    G_OBJECT_CLASS(sq_worker_launcher_parent_class)->finalize(object);
}
static void sq_worker_launcher_class_init(SqWorkerLauncherClass *klass) {
    G_OBJECT_CLASS(klass)->finalize=launcher_finalize;
}
static void sq_worker_launcher_init(SqWorkerLauncher *self) {
    self->environment=g_hash_table_new_full(g_str_hash,g_str_equal,g_free,g_free);
    self->unset=g_hash_table_new_full(g_str_hash,g_str_equal,g_free,NULL);
}
static void process_finalize(GObject *object) {
    SqWorkerProcess *self=SQ_WORKER_PROCESS(object);
    if(self->control>=0)close(self->control);
    g_clear_object(&self->input); g_clear_object(&self->output); g_clear_object(&self->errors);
    g_free(self->token); g_mutex_clear(&self->mutex); g_cond_clear(&self->condition);
    G_OBJECT_CLASS(sq_worker_process_parent_class)->finalize(object);
}
static void sq_worker_process_class_init(SqWorkerProcessClass *klass) {
    G_OBJECT_CLASS(klass)->finalize=process_finalize;
}
static void sq_worker_process_init(SqWorkerProcess *self) {
    self->control=-1; self->status=-1;
    g_mutex_init(&self->mutex); g_cond_init(&self->condition);
}
SqWorkerLauncher *sq_worker_launcher_new(GSubprocessFlags flags) {
    SqWorkerLauncher *self=g_object_new(SQ_WORKER_TYPE_LAUNCHER,NULL); self->flags=flags; return self;
}
void sq_worker_launcher_set_cwd(SqWorkerLauncher *self,const char *directory) {
    g_return_if_fail(SQ_WORKER_IS_LAUNCHER(self)); g_free(self->directory); self->directory=g_strdup(directory);
}
void sq_worker_launcher_setenv(SqWorkerLauncher *self,const char *name,const char *value,gboolean overwrite) {
    g_return_if_fail(SQ_WORKER_IS_LAUNCHER(self));
    g_return_if_fail(name && *name && !strchr(name,'=') && value);
    if(!overwrite && (g_hash_table_contains(self->environment,name) ||
        (!g_hash_table_contains(self->unset,name) && g_getenv(name))))return;
    g_hash_table_remove(self->unset,name); g_hash_table_replace(self->environment,g_strdup(name),g_strdup(value));
}
void sq_worker_launcher_unsetenv(SqWorkerLauncher *self,const char *name) {
    g_return_if_fail(SQ_WORKER_IS_LAUNCHER(self)); g_return_if_fail(name && *name && !strchr(name,'='));
    g_hash_table_remove(self->environment,name); g_hash_table_add(self->unset,g_strdup(name));
}
static gboolean system_error(GError **error,const char *operation) {
    int saved=errno; g_set_error(error,G_IO_ERROR,g_io_error_from_errno(saved),"%s: %s",operation,g_strerror(saved)); return FALSE;
}
static gpointer monitor_worker(gpointer data) {
    SqWorkerProcess *self=data;
    SqWorkerStatus record={0}; size_t offset=0;
    gboolean started=FALSE,normal=FALSE;
    gint64 deadline=g_get_monotonic_time()+45*G_TIME_SPAN_SECOND;
    for(;;) {
        int timeout=-1;
        if(!started) {
            gint64 remaining=deadline-g_get_monotonic_time();
            if(remaining<=0)break;
            timeout=(int)((remaining+999)/1000);
        }
        struct pollfd fd={self->control,POLLIN,0};
        int result=poll(&fd,1,timeout);
        if(result<0 && errno==EINTR)continue;
        if(result<=0)break;
        ssize_t count=read(self->control,(char *)&record+offset,sizeof(record)-offset);
        if(count<0 && errno==EINTR)continue;
        if(count<=0)break;
        offset+=(size_t)count;
        if(offset!=sizeof(record))continue;
        offset=0;
        if(record.kind==SQ_WORKER_STARTED && !started) { started=TRUE; continue; }
        if(record.kind==SQ_WORKER_EXITED && started)normal=TRUE;
        break;
    }
    // Unbinding reaps a worker which failed during bootstrap as well. Slots
    // remain reserved until Binder observes the old process dying.
    sq_worker_android_release(self->token);
    g_mutex_lock(&self->mutex);
    close(self->control); self->control=-1;
    self->normal=normal; self->status=normal?record.status:-1; self->complete=TRUE;
    g_cond_broadcast(&self->condition); g_mutex_unlock(&self->mutex);
    g_object_unref(self); return NULL;
}
static gboolean make_stream(SqWorkerProcess *process,int number,GSubprocessFlags flags,int *child,GError **error) {
    gboolean piped=(number==0 && (flags&G_SUBPROCESS_FLAGS_STDIN_PIPE)) ||
        (number==1 && (flags&G_SUBPROCESS_FLAGS_STDOUT_PIPE)) || (number==2 && (flags&G_SUBPROCESS_FLAGS_STDERR_PIPE));
    if(piped) {
        int fds[2]; if(pipe2(fds,O_CLOEXEC)<0)return system_error(error,"Cannot create worker pipe");
        if(number==0) { *child=fds[0]; process->input=g_unix_output_stream_new(fds[1],TRUE); }
        else { *child=fds[1]; GInputStream *stream=g_unix_input_stream_new(fds[0],TRUE);
            if(number==1)process->output=stream; else process->errors=stream; }
    } else if(number==0 || (number==1 && (flags&G_SUBPROCESS_FLAGS_STDOUT_SILENCE)) ||
                          (number==2 && (flags&G_SUBPROCESS_FLAGS_STDERR_SILENCE))) {
        *child=open("/dev/null",(number==0?O_RDONLY:O_WRONLY)|O_CLOEXEC);
    } else *child=fcntl(number,F_DUPFD_CLOEXEC,3);
    return *child>=0 || system_error(error,"Cannot prepare worker standard stream");
}
SqWorkerProcess *sq_worker_launcher_spawnv(SqWorkerLauncher *self,const char *const *argv,GError **error) {
    g_return_val_if_fail(SQ_WORKER_IS_LAUNCHER(self),NULL);
    const GSubprocessFlags supported=G_SUBPROCESS_FLAGS_STDIN_PIPE|G_SUBPROCESS_FLAGS_STDOUT_PIPE|
        G_SUBPROCESS_FLAGS_STDOUT_SILENCE|G_SUBPROCESS_FLAGS_STDERR_PIPE|G_SUBPROCESS_FLAGS_STDERR_SILENCE|G_SUBPROCESS_FLAGS_STDERR_MERGE;
    if((self->flags&~supported) || !argv || !argv[0] || !argv[1] || !*argv[1] ||
        ((self->flags&G_SUBPROCESS_FLAGS_STDOUT_PIPE) && (self->flags&G_SUBPROCESS_FLAGS_STDOUT_SILENCE)) ||
        ((self->flags&G_SUBPROCESS_FLAGS_STDERR_PIPE) && (self->flags&(G_SUBPROCESS_FLAGS_STDERR_SILENCE|G_SUBPROCESS_FLAGS_STDERR_MERGE))) ||
        ((self->flags&G_SUBPROCESS_FLAGS_STDERR_SILENCE) && (self->flags&G_SUBPROCESS_FLAGS_STDERR_MERGE))) {
        g_set_error_literal(error,G_IO_ERROR,G_IO_ERROR_INVALID_ARGUMENT,"Invalid SQGI worker flags or script arguments"); return NULL;
    }
    size_t bytes=0,count=0;
    for(;argv[count];count++) {
        bytes+=strlen(argv[count]);
        if(count>=256 || bytes>65536 || !g_utf8_validate(argv[count],-1,NULL)) {
            g_set_error_literal(error,G_IO_ERROR,G_IO_ERROR_INVALID_ARGUMENT,"SQGI worker arguments exceed UTF-8 or size limits"); return NULL;
        }
    }
    g_autoptr(SqWorkerProcess) process=g_object_new(SQ_WORKER_TYPE_PROCESS,NULL);
    int child[4]={-1,-1,-1,-1},pair[2]; gboolean launched=FALSE;
    if(socketpair(AF_UNIX,SOCK_STREAM|SOCK_CLOEXEC,0,pair)<0) { system_error(error,"Cannot create worker control socket"); return NULL; }
    process->control=pair[0]; child[3]=pair[1]; process->token=g_uuid_string_random();
    for(int i=0;i<3;i++) {
        if(i==2 && (self->flags&G_SUBPROCESS_FLAGS_STDERR_MERGE)) {
            child[i]=fcntl(child[1],F_DUPFD_CLOEXEC,3);
            if(child[i]<0) { system_error(error,"Cannot merge worker output"); goto done; }
        } else if(!make_stream(process,i,self->flags,&child[i],error))goto done;
    }
    GPtrArray *environment=g_ptr_array_new_with_free_func(g_free), *unset=g_ptr_array_new_with_free_func(g_free);
    GHashTableIter it; gpointer key,value;
    g_hash_table_iter_init(&it,self->environment);
    while(g_hash_table_iter_next(&it,&key,&value))g_ptr_array_add(environment,g_strdup_printf("%s=%s",(char *)key,(char *)value));
    g_hash_table_iter_init(&it,self->unset);
    while(g_hash_table_iter_next(&it,&key,NULL))g_ptr_array_add(unset,g_strdup(key));
    g_ptr_array_add(environment,NULL); g_ptr_array_add(unset,NULL);
    launched=sq_worker_android_start(process->token,self->directory,argv,
        (const char *const *)environment->pdata,(const char *const *)unset->pdata,child,error);
    g_ptr_array_unref(environment); g_ptr_array_unref(unset);
done:
    for(int i=0;i<4;i++)if(child[i]>=0)close(child[i]);
    if(!launched)return NULL;
    g_thread_unref(g_thread_new("sqgi-worker-watch",monitor_worker,g_object_ref(process)));
    return g_steal_pointer(&process);
}
GOutputStream *sq_worker_process_get_stdin_pipe(SqWorkerProcess *self) { return self->input; }
GInputStream *sq_worker_process_get_stdout_pipe(SqWorkerProcess *self) { return self->output; }
GInputStream *sq_worker_process_get_stderr_pipe(SqWorkerProcess *self) { return self->errors; }
gboolean sq_worker_process_wait(SqWorkerProcess *self,GCancellable *cancellable,GError **error) {
    g_return_val_if_fail(SQ_WORKER_IS_PROCESS(self),FALSE);
    g_mutex_lock(&self->mutex);
    while(!self->complete) {
        if(g_cancellable_set_error_if_cancelled(cancellable,error)) { g_mutex_unlock(&self->mutex); return FALSE; }
        g_cond_wait_until(&self->condition,&self->mutex,g_get_monotonic_time()+100000);
    }
    g_mutex_unlock(&self->mutex); return TRUE;
}
static void wait_task(GTask *task,gpointer source,gpointer unused,GCancellable *cancellable) {
    (void)unused; GError *error=NULL;
    if(sq_worker_process_wait(source,cancellable,&error))g_task_return_boolean(task,TRUE);
    else g_task_return_error(task,error);
}
void sq_worker_process_wait_async(SqWorkerProcess *self,GCancellable *cancellable,GAsyncReadyCallback callback,gpointer data) {
    g_return_if_fail(SQ_WORKER_IS_PROCESS(self));
    GTask *task=g_task_new(self,cancellable,callback,data); g_task_set_source_tag(task,sq_worker_process_wait_async);
    g_task_run_in_thread(task,wait_task); g_object_unref(task);
}
gboolean sq_worker_process_wait_finish(SqWorkerProcess *self,GAsyncResult *result,GError **error) {
    g_return_val_if_fail(g_task_is_valid(result,self),FALSE);
    g_return_val_if_fail(g_async_result_is_tagged(result,sq_worker_process_wait_async),FALSE);
    return g_task_propagate_boolean(G_TASK(result),error);
}
void sq_worker_process_force_exit(SqWorkerProcess *self) {
    g_return_if_fail(SQ_WORKER_IS_PROCESS(self)); g_mutex_lock(&self->mutex);
    if(!self->complete && self->control>=0) { self->forced=TRUE; char stop=1; (void)send(self->control,&stop,1,MSG_NOSIGNAL|MSG_DONTWAIT); }
    g_mutex_unlock(&self->mutex);
}
gboolean sq_worker_process_get_if_exited(SqWorkerProcess *self) {
    g_mutex_lock(&self->mutex); gboolean value=self->complete && self->normal; g_mutex_unlock(&self->mutex); return value;
}
gint sq_worker_process_get_exit_status(SqWorkerProcess *self) {
    g_mutex_lock(&self->mutex); int value=self->complete && self->normal?self->status:-1; g_mutex_unlock(&self->mutex); return value;
}
gint sq_worker_process_get_term_sig(SqWorkerProcess *self) {
    g_mutex_lock(&self->mutex); int value=self->complete && !self->normal && self->forced?SIGKILL:0; g_mutex_unlock(&self->mutex); return value;
}
gboolean sq_worker_process_get_successful(SqWorkerProcess *self) { return sq_worker_process_get_exit_status(self)==0; }
