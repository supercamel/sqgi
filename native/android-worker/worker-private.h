#pragma once
#include <gio/gio.h>
#define SQ_WORKER_STARTED 0x53514753
#define SQ_WORKER_EXITED 0x53514745
typedef struct { gint32 kind, status; } SqWorkerStatus;
gboolean sq_worker_android_start(const char *token, const char *directory,
    const char *const *arguments, const char *const *environment,
    const char *const *unset, const int descriptors[4], GError **error);
void sq_worker_android_release(const char *token);
