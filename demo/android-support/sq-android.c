#include "sq-android.h"
#define __GDKANDROID_H_INSIDE__
#include <gdk/android/gdkandroidtoplevel.h>
#undef __GDKANDROID_H_INSIDE__
#include <dlfcn.h>
#include <jni.h>

struct _SqAndroidDevice { GObject parent_instance; };
G_DEFINE_TYPE(SqAndroidDevice, sq_android_device, G_TYPE_OBJECT)
static void sq_android_device_class_init(SqAndroidDeviceClass *klass) { (void)klass; }
static void sq_android_device_init(SqAndroidDevice *self) { (void)self; }

typedef struct { JavaVM *vm; JNIEnv *env; jclass bridge; gboolean attached; } Context;
static void fail(GError **error, const char *message) {
    g_set_error_literal(error, g_quark_from_static_string("sq-android-error"), 1, message);
}
static gboolean exception(Context *context, GError **error) {
    jthrowable thrown = (*context->env)->ExceptionOccurred(context->env);
    if (!thrown) return FALSE;
    (*context->env)->ExceptionClear(context->env);
    jclass type = (*context->env)->GetObjectClass(context->env, thrown);
    jmethodID method = (*context->env)->GetMethodID(context->env, type, "toString", "()Ljava/lang/String;");
    jstring text = method ? (*context->env)->CallObjectMethod(context->env, thrown, method) : NULL;
    const char *message = text ? (*context->env)->GetStringUTFChars(context->env, text, NULL) : NULL;
    fail(error, message ? message : "Android service failed");
    if (message) (*context->env)->ReleaseStringUTFChars(context->env, text, message);
    (*context->env)->ExceptionClear(context->env);
    return TRUE;
}
static void end(Context *context) {
    if (context->env) (*context->env)->PopLocalFrame(context->env, NULL);
    if (context->attached) (*context->vm)->DetachCurrentThread(context->vm);
}
static gboolean begin(Context *context, GError **error) {
    void *platform = dlopen("libsqgi-platform.so", RTLD_NOW | RTLD_LOCAL);
    JavaVM *(*get_vm)(void) = platform ? dlsym(platform, "sqgi_android_get_java_vm") : NULL;
    jobject (*get_loader)(void) = platform ? dlsym(platform, "sqgi_android_get_application_class_loader") : NULL;
    context->vm = get_vm ? get_vm() : NULL;
    jobject loader = get_loader ? get_loader() : NULL;
    if (platform) dlclose(platform);
    if (!context->vm || !loader) { fail(error, "This demo requires the SQGI Android runtime"); return FALSE; }
    if ((*context->vm)->GetEnv(context->vm, (void **)&context->env, JNI_VERSION_1_6) != JNI_OK) {
        if ((*context->vm)->AttachCurrentThread(context->vm, &context->env, NULL) != JNI_OK) {
            fail(error, "Cannot attach to Android"); return FALSE;
        }
        context->attached = TRUE;
    }
    if ((*context->env)->PushLocalFrame(context->env, 24) != JNI_OK) {
        fail(error, "Cannot allocate JNI local frame");
        (*context->env)->ExceptionClear(context->env);
        if (context->attached) (*context->vm)->DetachCurrentThread(context->vm);
        context->env = NULL; return FALSE;
    }
    jclass type = (*context->env)->GetObjectClass(context->env, loader);
    jmethodID method = (*context->env)->GetMethodID(context->env, type, "loadClass", "(Ljava/lang/String;)Ljava/lang/Class;");
    jstring name = (*context->env)->NewStringUTF(context->env, "org.sqgi.demo.AndroidDevice");
    if (method && name) context->bridge = (*context->env)->CallObjectMethod(context->env, loader, method, name);
    if (exception(context, error) || !context->bridge) { end(context); return FALSE; }
    return TRUE;
}
SqAndroidDevice *sq_android_device_new(GdkSurface *surface, GError **error) {
    if (!GDK_IS_ANDROID_TOPLEVEL(surface)) { fail(error, "Present the Android window first"); return NULL; }
    Context context = {0}; if (!begin(&context, error)) return NULL;
    jmethodID method = (*context.env)->GetStaticMethodID(context.env, context.bridge, "initialize", "(Landroid/app/Activity;)V");
    if (method) (*context.env)->CallStaticVoidMethod(context.env, context.bridge, method,
                                                   gdk_android_toplevel_get_activity(GDK_ANDROID_TOPLEVEL(surface)));
    gboolean failed = exception(&context, error); end(&context);
    return failed ? NULL : g_object_new(SQ_ANDROID_TYPE_DEVICE, NULL);
}
static void command(SqAndroidDevice *self, const char *name, GError **error) {
    g_return_if_fail(SQ_ANDROID_IS_DEVICE(self));
    Context context = {0}; if (!begin(&context, error)) return;
    jmethodID method = (*context.env)->GetStaticMethodID(context.env, context.bridge, name, "()V");
    if (method) (*context.env)->CallStaticVoidMethod(context.env, context.bridge, method);
    exception(&context, error); end(&context);
}
void sq_android_device_request_location(SqAndroidDevice *self, GError **error) { command(self, "requestLocation", error); }
void sq_android_device_stop_location(SqAndroidDevice *self, GError **error) { command(self, "stopLocation", error); }
void sq_android_device_request_camera(SqAndroidDevice *self, GError **error) { command(self, "requestCamera", error); }
gboolean sq_android_device_has_camera_permission(SqAndroidDevice *self, GError **error) {
    g_return_val_if_fail(SQ_ANDROID_IS_DEVICE(self), FALSE);
    Context context = {0}; if (!begin(&context, error)) return FALSE;
    jmethodID method = (*context.env)->GetStaticMethodID(context.env, context.bridge, "hasCameraPermission", "()Z");
    gboolean value = method ? (*context.env)->CallStaticBooleanMethod(context.env, context.bridge, method) : FALSE;
    if (exception(&context, error)) value = FALSE;
    end(&context); return value;
}
static gchar *json_result(SqAndroidDevice *self, const char *name, GError **error) {
    g_return_val_if_fail(SQ_ANDROID_IS_DEVICE(self), NULL);
    Context context = {0}; if (!begin(&context, error)) return NULL;
    jmethodID method = (*context.env)->GetStaticMethodID(context.env, context.bridge, name, "()Ljava/lang/String;");
    jstring value = method ? (*context.env)->CallStaticObjectMethod(context.env, context.bridge, method) : NULL;
    gchar *result = NULL;
    if (!exception(&context, error) && value) {
        const char *text = (*context.env)->GetStringUTFChars(context.env, value, NULL);
        if (text) { result = g_strdup(text); (*context.env)->ReleaseStringUTFChars(context.env, value, text); }
    }
    end(&context); return result;
}
gchar *sq_android_device_snapshot(SqAndroidDevice *self, GError **error) { return json_result(self, "snapshot", error); }
gchar *sq_android_device_cameras(SqAndroidDevice *self, GError **error) { return json_result(self, "cameras", error); }
