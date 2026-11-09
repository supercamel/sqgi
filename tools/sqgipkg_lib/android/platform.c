/* The loaded library identifies the process ABI, including native translation. */
#include <jni.h>
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

JNIEXPORT jstring JNICALL
Java_org_sqgi_android_GtkApplication_runtimeAbi(JNIEnv *env, jclass klass)
{
    (void)klass;
#if defined(__aarch64__)
    return (*env)->NewStringUTF(env, "arm64-v8a");
#elif defined(__x86_64__)
    return (*env)->NewStringUTF(env, "x86_64");
#else
#error Unsupported SQGI Android ABI
#endif
}

JNIEXPORT void JNICALL
Java_org_sqgi_android_GtkApplication_configurePaths(JNIEnv *env, jclass klass,
                                                  jstring home, jstring source,
                                                  jstring runtime, jstring libraries)
{
    (void)klass;
    /* These paths contain only Android's package ID, numeric user ID and our
     * fixed payload names/hash. They do not contain Java surrogate characters.
     * Set the loaded ABI's libc environment: Java's Os.setenv can update only
     * the host libc when Android is translating a different native ABI. */
    const char *home_path = (*env)->GetStringUTFChars(env, home, NULL);
    if (!home_path) return;
    const char *source_path = (*env)->GetStringUTFChars(env, source, NULL);
    if (!source_path) {
        (*env)->ReleaseStringUTFChars(env, home, home_path);
        return;
    }
    int failed = setenv("HOME", home_path, 1) ||
                 setenv("SQGI_APP_SHARE", source_path, 1) ||
                 setenv("SQGI_APP_RESOURCES", source_path, 1);
    (*env)->ReleaseStringUTFChars(env, source, source_path);
    (*env)->ReleaseStringUTFChars(env, home, home_path);
    const char *runtime_path = (*env)->GetStringUTFChars(env, runtime, NULL);
    if (!runtime_path) return;
    const char *library_path = (*env)->GetStringUTFChars(env, libraries, NULL);
    if (!library_path) {
        (*env)->ReleaseStringUTFChars(env, runtime, runtime_path);
        return;
    }
    failed |= setenv("SQGI_ANDROID_RUNTIME", runtime_path, 1) ||
              setenv("SQGI_ANDROID_NATIVE_LIB_DIR", library_path, 1);
    char *path = NULL;
    if (asprintf(&path, "%s/share/proj", runtime_path) < 0) failed = 1;
    else { failed |= setenv("PROJ_DATA", path, 1); free(path); }
    if (asprintf(&path, "%s/share/gdal", runtime_path) < 0) failed = 1;
    else { failed |= setenv("GDAL_DATA", path, 1); free(path); }
    (*env)->ReleaseStringUTFChars(env, libraries, library_path);
    (*env)->ReleaseStringUTFChars(env, runtime, runtime_path);
    if (failed) {
        jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
        if (error) (*env)->ThrowNew(env, error, "Cannot configure SQGI application paths");
    }
}

JNIEXPORT void JNICALL
Java_org_sqgi_android_GtkApplication_loadGioModule(JNIEnv *env, jclass klass, jstring filename)
{
    (void)klass;
    const char *path = (*env)->GetStringUTFChars(env, filename, NULL);
    if (!path) return;
    // Explicit registration works under Android's AT_SECURE environment, where
    // GIO ignores module-search environment variables. Retain these process-wide
    // type modules and their loader handles for the application's lifetime.
    void *gio = dlopen("libgio-2.0.so", RTLD_NOW | RTLD_LOCAL);
    void *gobject = dlopen("libgobject-2.0.so", RTLD_NOW | RTLD_LOCAL);
    // Initialize GIO's built-in extension points before a module implements
    // them. Selecting the local VFS does this without caching a TLS backend.
    void *(*vfs_default)(void) = gio ? dlsym(gio, "g_vfs_get_default") : NULL;
    if (vfs_default) vfs_default();
    void *(*module_new)(const char *) = gio ? dlsym(gio, "g_io_module_new") : NULL;
    int (*module_use)(void *) = gobject ? dlsym(gobject, "g_type_module_use") : NULL;
    void *module = module_new ? module_new(path) : NULL;
    int ok = vfs_default && module && module_use && module_use(module);
    (*env)->ReleaseStringUTFChars(env, filename, path);
    if (!ok) {
        jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
        if (error) (*env)->ThrowNew(env, error, "Cannot load packaged GIO module");
    }
}
