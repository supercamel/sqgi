#include <sqgi_android_entry.h>
#include <glib.h>
int sqgi_android_main(const SqgiAndroidEntryContext *);
void sqgi_android_shutdown(const SqgiAndroidEntryContext *, int);
int main(int argc, char **argv)
{
    g_autofree char *source = g_get_current_dir();
    SqgiAndroidEntryContext context = { .abi_version = SQGI_ANDROID_ENTRY_ABI_VERSION,
        .struct_size = sizeof(context), .application_id = "org.sqgi.android.nativeentry",
        .source_directory = source, .entry_script = "main.nut", .data_directory = g_get_user_data_dir(),
        .config_directory = g_get_user_config_dir(), .cache_directory = g_get_user_cache_dir(),
        .argc = argc, .argv = (const char *const *)argv };
    int result = sqgi_android_main(&context); sqgi_android_shutdown(&context, result); return result;
}
