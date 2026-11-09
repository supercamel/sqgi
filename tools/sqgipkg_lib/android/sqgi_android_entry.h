#pragma once
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SQGI_ANDROID_ENTRY_ABI_VERSION 1u

/* Borrowed, immutable context. Strings remain valid until process exit; argv
 * remains valid until entry and shutdown return. Do not free these values.
 * Called once per process on the GTK thread after GDK Android initialization.
 * Create/run a GtkApplication here; Activity recreation does not call entry
 * again. The app owns its VM, GObjects and main loop. Return zero on success.
 * Android may kill the process without calling shutdown. No native hot reload.
 */
typedef struct SqgiAndroidEntryContext {
    uint32_t abi_version;
    uint32_t struct_size;
    const char *application_id;
    const char *source_directory;
    const char *entry_script; /* NULL when no optional script was declared. */
    const char *data_directory;
    const char *config_directory;
    const char *cache_directory;
    int argc;
    const char *const *argv;
} SqgiAndroidEntryContext;

typedef int (*SqgiAndroidEntryFunction)(const SqgiAndroidEntryContext *context);
/* Optional hook, invoked on the same GTK thread after entry returns. Libraries
 * remain loaded: GTK/GType teardown can still call their registered functions.
 */
typedef void (*SqgiAndroidShutdownFunction)(const SqgiAndroidEntryContext *context,
                                          int exit_code);

#ifdef __cplusplus
}
#endif
