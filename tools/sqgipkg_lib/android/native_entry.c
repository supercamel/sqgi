#include "sqgi_android_entry.h"
#include <jni.h>
#include <dlfcn.h>
#include <unistd.h>
#include <gio/gio.h>
#include <girepository.h>

static SqgiAndroidEntryContext context = {
    .abi_version = SQGI_ANDROID_ENTRY_ABI_VERSION,
    .struct_size = sizeof(SqgiAndroidEntryContext)
};
static char *runtime_root, *library_path, *entry_symbol, *shutdown_symbol;

static char *utf8(JNIEnv *env, jstring value)
{
    if (!value) return NULL;
    const jchar *chars = (*env)->GetStringChars(env, value, NULL);
    if (!chars) return NULL;
    char *result = g_utf16_to_utf8((const gunichar2 *)chars,
        (*env)->GetStringLength(env, value), NULL, NULL, NULL);
    (*env)->ReleaseStringChars(env, value, chars);
    return result;
}

JNIEXPORT void JNICALL
Java_org_sqgi_android_GtkApplication_configureNative(JNIEnv *env, jclass klass,
    jstring runtime, jstring libraries, jstring cache, jstring source,
    jstring script, jstring application_id, jstring library, jstring symbol,
    jstring shutdown)
{
    (void)klass;
    g_autofree char *lib = utf8(env, libraries);
    g_autofree char *name = utf8(env, library);
    runtime_root = utf8(env, runtime);
    context.application_id = utf8(env, application_id);
    context.cache_directory = utf8(env, cache);
    context.source_directory = utf8(env, source);
    context.entry_script = utf8(env, script);
    entry_symbol = utf8(env, symbol);
    shutdown_symbol = utf8(env, shutdown);
    if (!runtime_root || !lib || !name || !context.application_id ||
        !context.cache_directory || !context.source_directory || !entry_symbol)
    {
        if (!(*env)->ExceptionCheck(env)) {
            jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
            (*env)->ThrowNew(env, error, "Invalid SQGI native entry context");
            (*env)->DeleteLocalRef(env, error);
        }
        return;
    }
    library_path = g_build_filename(lib, name, NULL);
    g_autofree char *files = g_path_get_dirname(runtime_root);
    g_autofree char *share = g_build_filename(runtime_root, "share", NULL);
    g_autofree char *fonts = g_build_filename(runtime_root, "fonts.conf", NULL);
    g_autofree char *typelibs = g_build_filename(runtime_root, "typelib", NULL);
    context.config_directory = g_build_filename(files, "config", NULL);
    context.data_directory = g_build_filename(files, "data", NULL);
    g_mkdir_with_parents(context.config_directory, 0700);
    g_mkdir_with_parents(context.data_directory, 0700);
    g_setenv("XDG_CONFIG_HOME", context.config_directory, TRUE);
    g_setenv("XDG_CONFIG_DIRS", context.config_directory, TRUE);
    g_setenv("XDG_DATA_HOME", context.data_directory, TRUE);
    g_setenv("XDG_DATA_DIRS", share, TRUE);
    g_setenv("XDG_CACHE_HOME", context.cache_directory, TRUE);
    g_setenv("TMPDIR", context.cache_directory, TRUE);
    g_setenv("FONTCONFIG_FILE", fonts, TRUE);
    g_setenv("GSETTINGS_BACKEND", "keyfile", TRUE);
    g_setenv("GSK_RENDERER", "cairo", TRUE);
    g_setenv("GTK_A11Y", "none", TRUE);
    g_irepository_prepend_search_path(typelibs);
    g_irepository_prepend_library_path(lib);
}

/* GTK's pinned glue owns thread startup, Activity attachment and process exit. */
int main(int argc, char **argv, char **envp)
{
    (void)envp;
    if (!library_path || chdir(context.source_directory) != 0)
        g_error("Cannot initialize Android native entry working directory");
    void *library = dlopen(library_path, RTLD_NOW | RTLD_LOCAL);
    if (!library) g_error("Cannot load Android entry library: %s", dlerror());
    SqgiAndroidEntryFunction entry = (SqgiAndroidEntryFunction)dlsym(library, entry_symbol);
    if (!entry) g_error("Cannot resolve Android entry symbol: %s", dlerror());
    SqgiAndroidShutdownFunction shutdown = NULL;
    if (shutdown_symbol) {
        shutdown = (SqgiAndroidShutdownFunction)dlsym(library, shutdown_symbol);
        if (!shutdown) g_error("Cannot resolve Android shutdown symbol: %s", dlerror());
    }
    context.argc = argc;
    context.argv = (const char *const *)argv;
    g_autofree char *status = g_build_filename(runtime_root, "status.txt", NULL);
    g_file_set_contents(status, "running\n", -1, NULL);
    int result = entry(&context);
    if (shutdown) shutdown(&context, result);
    g_file_set_contents(status, result == 0 ? "exited\n" : "failed\n", -1, NULL);
    /* Do not dlclose: registered GTypes can be referenced by GDK finalization. */
    return result;
}
