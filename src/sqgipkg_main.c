/* Native command-line entry point. No command interpreter is involved. */
#include <gio/gio.h>
#ifdef G_OS_WIN32
#include <windows.h>
#endif

#ifndef SQGI_TOOL_SHARE_RELATIVE
#define SQGI_TOOL_SHARE_RELATIVE "../share/sqgi"
#endif

int main(int argc, char **argv)
{
    char *self = NULL;
#ifdef G_OS_WIN32
    char **utf8_argv = g_win32_get_command_line();
    argc = (int)g_strv_length(utf8_argv);
    argv = utf8_argv;
    wchar_t buffer[32768];
    DWORD length = GetModuleFileNameW(NULL, buffer, G_N_ELEMENTS(buffer));
    if (length == 0 || length == G_N_ELEMENTS(buffer)) return 1;
    self = g_utf16_to_utf8((gunichar2 *)buffer, length, NULL, NULL, NULL);
#else
    self = g_find_program_in_path(argv[0]);
#endif
    if (!self) { g_printerr("sqgipkg: cannot locate executable\n"); return 1; }
    char *bin = g_path_get_dirname(self);
    const char *override = g_getenv("SQGI_TOOL_SHARE");
    char *share = override ? g_strdup(override) : g_build_filename(bin, SQGI_TOOL_SHARE_RELATIVE, NULL);
    char *script = g_build_filename(share, "sqgipkg.nut", NULL);
    char *runtime = g_build_filename(bin, "sqgi.exe", NULL);
    g_setenv("SQGI_APP_SHARE", share, TRUE);
    char **child_argv = g_new0(char *, argc + 2);
    child_argv[0] = runtime;
    child_argv[1] = script;
    for (int i = 1; i < argc; i++) child_argv[i + 1] = argv[i];
    GError *error = NULL;
    GSubprocess *child = g_subprocess_newv((const gchar *const *)child_argv, G_SUBPROCESS_FLAGS_NONE, &error);
    int status = 1;
    if (child && g_subprocess_wait(child, NULL, &error) && g_subprocess_get_if_exited(child))
        status = g_subprocess_get_exit_status(child);
    if (error) { g_printerr("sqgipkg: %s\n", error->message); g_error_free(error); }
    g_clear_object(&child);
    g_free(child_argv); g_free(runtime); g_free(script); g_free(share);
    g_free(bin); g_free(self);
#ifdef G_OS_WIN32
    g_strfreev(utf8_argv);
#endif
    return status;
}
