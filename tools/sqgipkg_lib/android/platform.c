/* The loaded library identifies the process ABI, including native translation. */
#include <jni.h>
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include <unistd.h>
#include <android/log.h>

static JavaVM *application_vm;
static jobject application_class_loader;
static jobject application_context;
static const char *(*gst_message_text)(void *);
static void gst_log(void *category, int level, const char *file, const char *function,
                    int line, void *object, void *message, void *data)
{
    (void)category; (void)object; (void)data;
    if (gst_message_text)
        __android_log_print(level == 1 ? ANDROID_LOG_ERROR : ANDROID_LOG_WARN, "GStreamer",
                            "%s:%d %s: %s", file, line, function, gst_message_text(message));
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved)
{
    (void)reserved;
    application_vm = vm;
    return JNI_VERSION_1_6;
}

/* Public JNI hooks for Android native modules and GStreamer's androidmedia. */
JNIEXPORT JavaVM *sqgi_android_get_java_vm(void) { return application_vm; }
JNIEXPORT jobject sqgi_android_get_application_class_loader(void) { return application_class_loader; }
JNIEXPORT jobject sqgi_android_get_application_context(void) { return application_context; }
JNIEXPORT JavaVM *gst_android_get_java_vm(void) { return application_vm; }
JNIEXPORT jobject gst_android_get_application_class_loader(void) { return application_class_loader; }
JNIEXPORT jobject gst_android_get_application_context(void) { return application_context; }

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
                                                  jobject application, jstring home, jstring source,
                                                  jstring runtime, jstring libraries)
{
    /* These paths contain only Android's package ID, numeric user ID and our
     * fixed payload names/hash. They do not contain Java surrogate characters.
     * Set the loaded ABI's libc environment: Java's Os.setenv can update only
     * the host libc when Android is translating a different native ABI. */
    if (application_context) (*env)->DeleteGlobalRef(env, application_context);
    application_context = (*env)->NewGlobalRef(env, application);
    if (!application_context) return;
    jclass class_type = (*env)->FindClass(env, "java/lang/Class");
    jmethodID get_loader = class_type ? (*env)->GetMethodID(env, class_type, "getClassLoader", "()Ljava/lang/ClassLoader;") : NULL;
    jobject loader = get_loader ? (*env)->CallObjectMethod(env, klass, get_loader) : NULL;
    if ((*env)->ExceptionCheck(env) || !loader) return;
    if (application_class_loader) (*env)->DeleteGlobalRef(env, application_class_loader);
    application_class_loader = (*env)->NewGlobalRef(env, loader);
    (*env)->DeleteLocalRef(env, loader);
    (*env)->DeleteLocalRef(env, class_type);
    /* Make standard GStreamer JNI hooks visible to dynamically loaded plugins. */
    if (!dlopen("libsqgi-platform.so", RTLD_NOW | RTLD_GLOBAL)) {
        jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
        if (error) (*env)->ThrowNew(env, error, "Cannot expose Android native module hooks");
        return;
    }
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
    if (asprintf(&path, "%s/pixbuf-loaders.cache", runtime_path) < 0) failed = 1;
    else {
        if (access(path, R_OK) == 0) failed |= setenv("GDK_PIXBUF_MODULE_FILE", path, 1);
        free(path);
    }
    (*env)->ReleaseStringUTFChars(env, libraries, library_path);
    (*env)->ReleaseStringUTFChars(env, runtime, runtime_path);
    if (failed) {
        jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
        if (error) (*env)->ThrowNew(env, error, "Cannot configure SQGI application paths");
    }
}

JNIEXPORT void JNICALL
Java_org_sqgi_android_GtkApplication_loadGStreamerPlugin(JNIEnv *env, jclass klass,
                                                        jstring filename, jstring cache)
{
    (void)klass;
    const char *path = (*env)->GetStringUTFChars(env, filename, NULL);
    if (!path) return;
    const char *cache_path = (*env)->GetStringUTFChars(env, cache, NULL);
    if (!cache_path) { (*env)->ReleaseStringUTFChars(env, filename, path); return; }
    /* Use only the inventoried plugins, inside this process. */
    setenv("GST_PLUGIN_SYSTEM_PATH_1_0", "", 1);
    setenv("GST_PLUGIN_PATH_1_0", "", 1);
    setenv("GST_REGISTRY_FORK", "no", 1);
    setenv("TMP", cache_path, 1);
    setenv("XDG_CACHE_HOME", cache_path, 1);
    void *gst = dlopen("libgstreamer-1.0.so", RTLD_NOW | RTLD_GLOBAL);
    int (*initialize)(void *, void *, void **) = gst ? dlsym(gst, "gst_init_check") : NULL;
    void *(*load)(const char *, void **) = gst ? dlsym(gst, "gst_plugin_load_file") : NULL;
    void (*unref)(void *) = gst ? dlsym(gst, "gst_object_unref") : NULL;
    if (gst && !gst_message_text) {
        gst_message_text = dlsym(gst, "gst_debug_message_get");
        void (*add_log)(void *, void *, void *) = dlsym(gst, "gst_debug_add_log_function");
        void (*threshold)(int) = dlsym(gst, "gst_debug_set_default_threshold");
        if (gst_message_text && add_log) add_log(gst_log, NULL, NULL);
        if (threshold && !getenv("GST_DEBUG")) threshold(2);
    }
    void *error = NULL, *plugin = NULL;
    if (initialize && load && unref && initialize(NULL, NULL, &error)) plugin = load(path, &error);
    if (plugin) unref(plugin);
    if (!plugin) {
        struct { unsigned int domain; int code; char *message; } *detail = error;
        char *message = NULL;
        if (asprintf(&message, "Cannot load GStreamer plugin %s: %s", path,
                     detail ? detail->message : "GStreamer initialization failed") >= 0) {
            jclass exception = (*env)->FindClass(env, "java/lang/IllegalStateException");
            if (exception) (*env)->ThrowNew(env, exception, message);
            free(message);
        }
    }
    if (error) {
        void *glib = dlopen("libglib-2.0.so", RTLD_NOW | RTLD_LOCAL);
        void (*release)(void *) = glib ? dlsym(glib, "g_error_free") : NULL;
        if (release) release(error);
        if (glib) dlclose(glib);
    }
    (*env)->ReleaseStringUTFChars(env, cache, cache_path);
    (*env)->ReleaseStringUTFChars(env, filename, path);
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
