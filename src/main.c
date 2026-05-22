#include "sqgi_import.h"
#include "sqgi_vm.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef _WIN32
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#endif

#define SQGI_INTERACTIVE_BUF 2048

#ifdef _WIN32
static char *sqgi_win_strdup_range(const char *start, size_t len)
{
    char *out = (char *)malloc(len + 1);
    if (!out) return NULL;
    memcpy(out, start, len);
    out[len] = '\0';
    return out;
}

static const char *sqgi_win_basename_ptr(const char *path)
{
    const char *base = path;
    for (const char *p = path; *p; p++) {
        if (*p == '\\' || *p == '/') base = p + 1;
    }
    return base;
}

static char *sqgi_win_dirname_dup(const char *path)
{
    const char *sep = NULL;
    for (const char *p = path; *p; p++) {
        if (*p == '\\' || *p == '/') sep = p;
    }
    if (!sep) return sqgi_win_strdup_range(".", 1);
    if (sep == path) return sqgi_win_strdup_range(path, 1);
    if (sep > path && sep[-1] == ':') return sqgi_win_strdup_range(path, (size_t)(sep - path + 1));
    return sqgi_win_strdup_range(path, (size_t)(sep - path));
}

static char *sqgi_win_join(const char *base, const char *rel)
{
    size_t base_len = strlen(base);
    size_t rel_len = strlen(rel);
    int needs_sep = base_len > 0 && base[base_len - 1] != '\\' && base[base_len - 1] != '/';
    char *out = (char *)malloc(base_len + (needs_sep ? 1 : 0) + rel_len + 1);
    if (!out) return NULL;
    memcpy(out, base, base_len);
    if (needs_sep) out[base_len++] = '\\';
    memcpy(out + base_len, rel, rel_len);
    out[base_len + rel_len] = '\0';
    return out;
}

static int sqgi_win_dir_exists(const char *path)
{
    DWORD attrs = GetFileAttributesA(path);
    return attrs != INVALID_FILE_ATTRIBUTES && (attrs & FILE_ATTRIBUTE_DIRECTORY);
}

static int sqgi_win_file_exists(const char *path)
{
    DWORD attrs = GetFileAttributesA(path);
    return attrs != INVALID_FILE_ATTRIBUTES && !(attrs & FILE_ATTRIBUTE_DIRECTORY);
}

static void sqgi_win_set_env(const char *name, const char *value)
{
    if (value) SetEnvironmentVariableA(name, value);
}

static void sqgi_win_prepend_env(const char *name, const char *value)
{
    if (!value || !*value) return;

    DWORD old_len = GetEnvironmentVariableA(name, NULL, 0);
    if (old_len == 0) {
        SetEnvironmentVariableA(name, value);
        return;
    }

    char *old_value = (char *)malloc(old_len);
    if (!old_value) return;
    GetEnvironmentVariableA(name, old_value, old_len);

    size_t value_len = strlen(value);
    size_t old_value_len = strlen(old_value);
    char *combined = (char *)malloc(value_len + 1 + old_value_len + 1);
    if (!combined) {
        free(old_value);
        return;
    }

    memcpy(combined, value, value_len);
    combined[value_len] = ';';
    memcpy(combined + value_len + 1, old_value, old_value_len + 1);
    SetEnvironmentVariableA(name, combined);

    free(combined);
    free(old_value);
}

static void sqgi_win_configure_packaged_env(void)
{
    char module_path[32768];
    DWORD len = GetModuleFileNameA(NULL, module_path, (DWORD)sizeof(module_path));
    if (len == 0 || len >= sizeof(module_path)) return;

    char *exe_dir = sqgi_win_dirname_dup(module_path);
    if (!exe_dir) return;

    char *appdir = NULL;
    if (_stricmp(sqgi_win_basename_ptr(exe_dir), "bin") == 0) {
        appdir = sqgi_win_dirname_dup(exe_dir);
    } else {
        appdir = sqgi_win_strdup_range(exe_dir, strlen(exe_dir));
    }
    free(exe_dir);
    if (!appdir) return;

    char *app_share = sqgi_win_join(appdir, "share\\sqgi\\app");
    if (!app_share || !sqgi_win_dir_exists(app_share)) {
        free(app_share);
        free(appdir);
        return;
    }

    char *resources = sqgi_win_join(app_share, "resources");
    char *bin = sqgi_win_join(appdir, "bin");
    char *lib = sqgi_win_join(appdir, "lib");
    char *share = sqgi_win_join(appdir, "share");
    char *etc = sqgi_win_join(appdir, "etc");
    char *gtk4 = sqgi_win_join(appdir, "lib\\gtk-4.0");
    char *gtk3 = sqgi_win_join(appdir, "lib\\gtk-3.0");
    char *gtk_path = NULL;
    if (gtk4 && gtk3) {
        gtk_path = (char *)malloc(strlen(gtk4) + 1 + strlen(gtk3) + 1);
        if (gtk_path) sprintf(gtk_path, "%s;%s", gtk4, gtk3);
    }
    char *typelibs = sqgi_win_join(appdir, "lib\\girepository-1.0");
    char *gst = sqgi_win_join(appdir, "lib\\gstreamer-1.0");
    char *gio = sqgi_win_join(appdir, "lib\\gio\\modules");
    char *pixbuf = sqgi_win_join(appdir, "lib\\gdk-pixbuf-2.0\\2.10.0\\loaders");

    sqgi_win_set_env("SQGI_APPDIR", appdir);
    sqgi_win_set_env("SQGI_APP_SHARE", app_share);
    if (resources) sqgi_win_set_env("SQGI_APP_RESOURCES", resources);
    if (lib) sqgi_win_prepend_env("PATH", lib);
    if (bin) sqgi_win_prepend_env("PATH", bin);
    if (share) sqgi_win_prepend_env("XDG_DATA_DIRS", share);
    if (etc) sqgi_win_prepend_env("XDG_CONFIG_DIRS", etc);
    sqgi_win_set_env("GTK_DATA_PREFIX", appdir);
    sqgi_win_set_env("GTK_EXE_PREFIX", appdir);
    if (gtk_path) sqgi_win_prepend_env("GTK_PATH", gtk_path);
    if (typelibs) sqgi_win_prepend_env("GI_TYPELIB_PATH", typelibs);
    if (gst) sqgi_win_prepend_env("GST_PLUGIN_PATH", gst);
    if (gio) sqgi_win_prepend_env("GIO_EXTRA_MODULES", gio);
    if (pixbuf) sqgi_win_set_env("GDK_PIXBUF_MODULEDIR", pixbuf);

    free(resources);
    free(bin);
    free(lib);
    free(share);
    free(etc);
    free(gtk4);
    free(gtk3);
    free(gtk_path);
    free(typelibs);
    free(gst);
    free(gio);
    free(pixbuf);
    free(app_share);
    free(appdir);
}

static char *sqgi_win_default_packaged_script(void)
{
    const char *app_share = getenv("SQGI_APP_SHARE");
    if (!app_share || !*app_share) return NULL;

    char *script = sqgi_win_join(app_share, "main.cnut");
    if (script && sqgi_win_file_exists(script)) return script;
    free(script);

    script = sqgi_win_join(app_share, "main.nut");
    if (script && sqgi_win_file_exists(script)) return script;
    free(script);
    return NULL;
}
#endif

/* ── Interactive REPL ────────────────────────────────────────────────────── */

static SQInteger quit_fn(HSQUIRRELVM v)
{
    (void)v;
    exit(0);
    return 0;
}

static void run_repl(HSQUIRRELVM v)
{
    char buf[SQGI_INTERACTIVE_BUF];

    /* Register quit() in root table */
    sq_pushroottable(v);
    sq_pushstring(v, "quit", -1);
    sq_newclosure(v, quit_fn, 0);
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);

    printf("SQGI interactive console (Squirrel %d)\n", SQUIRREL_VERSION_NUMBER);
    printf("Type 'quit()' to exit.\n");

    for (;;) {
        printf(">> ");
        fflush(stdout);

        if (!fgets(buf, sizeof(buf), stdin)) break;

        SQInteger len = (SQInteger)strlen(buf);
        if (len == 0) continue;

        /* Strip trailing newline */
        if (buf[len - 1] == '\n') buf[--len] = '\0';
        if (len == 0) continue;

        /* Leading '=' prints the result expression */
        const char *src = buf;
        SQBool retval = SQFalse;
        char print_buf[SQGI_INTERACTIVE_BUF + 16];
        if (buf[0] == '=') {
            snprintf(print_buf, sizeof(print_buf), "return %s", buf + 1);
            src = print_buf;
            retval = SQTrue;
        }

        SQRESULT res = sq_compilebuffer(v, src, (SQInteger)strlen(src), "interactive", SQTrue);
        if (SQ_FAILED(res)) continue;

        sq_pushroottable(v);
        res = sq_call(v, 1, retval, SQTrue);
        if (SQ_SUCCEEDED(res) && retval) {
            const SQChar *str = NULL;
            if (SQ_SUCCEEDED(sq_tostring(v, -1))) {
                if (SQ_SUCCEEDED(sq_getstring(v, -1, &str)) && str) {
                    printf("%s\n", str);
                }
                sq_pop(v, 1); /* pop stringified value */
            }
            sq_pop(v, 1); /* pop result */
        }
        sq_pop(v, 1); /* pop closure */
    }
}

/* ── Entry Point ─────────────────────────────────────────────────────────── */

int main(int argc, char *argv[])
{
#ifdef _WIN32
    sqgi_win_configure_packaged_env();
#endif

    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) {
        fprintf(stderr, "sqgi: failed to create VM\n");
        return 1;
    }

    const char *filename = NULL;
    int first_script_arg = 2;
#ifdef _WIN32
    char *default_packaged_script = NULL;
#endif

    if (argc < 2) {
#ifdef _WIN32
        default_packaged_script = sqgi_win_default_packaged_script();
        if (default_packaged_script) {
            filename = default_packaged_script;
            first_script_arg = 1;
        } else {
            run_repl(v);
            sqgi_vm_free(v);
            return 0;
        }
#else
        run_repl(v);
        sqgi_vm_free(v);
        return 0;
#endif
    }

    /* --version / -v */
    if (argc >= 2 && (strcmp(argv[1], "--version") == 0 || strcmp(argv[1], "-v") == 0)) {
#ifndef SQGI_VERSION
#define SQGI_VERSION "unknown"
#endif
        printf("sqgi %s\n", SQGI_VERSION);
        sqgi_vm_free(v);
        return 0;
    }

    /* --help / -h */
    if (argc >= 2 && (strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0)) {
        printf(
            "Usage: sqgi [options] [script [args...]]\n"
            "\n"
            "Options:\n"
            "  -e <src>       Evaluate inline Squirrel source and exit\n"
            "  -v, --version  Print version and exit\n"
            "  -h, --help     Show this message and exit\n"
            "\n"
            "With no arguments, sqgi starts an interactive REPL.\n"
        );
        sqgi_vm_free(v);
        return 0;
    }

    /* Check for -e "inline script" flag */
    if (argc >= 2 && strcmp(argv[1], "-e") == 0) {
        if (argc < 3) {
            fprintf(stderr, "sqgi: -e requires a script string\n");
            sqgi_vm_free(v);
            return 1;
        }
        const char *src = argv[2];
        SQRESULT res = sqgi_vm_dobuffer(v, src, (SQInteger)strlen(src), "cmdline");
        sqgi_vm_free(v);
        return SQ_FAILED(res) ? 1 : 0;
    }

    /* Script file mode: push remaining argv as string args */
    if (!filename) {
        filename = argv[1];
        first_script_arg = 2;
    }

    /* Load file to a closure, then call it with remaining args */
    sq_pushroottable(v);
    SQRESULT res = sqstd_loadfile(v, filename, SQTrue);
    if (SQ_FAILED(res)) {
        sq_pop(v, 1); /* pop root table */
        sqgi_vm_free(v);
#ifdef _WIN32
        free(default_packaged_script);
#endif
        return 1;
    }

    /* closure is at top, push root as 'this' then push argv[2..] as params */
    sq_pushroottable(v);
    int callargs = 1;
    for (int i = first_script_arg; i < argc; i++) {
        sq_pushstring(v, argv[i], -1);
        callargs++;
    }

    if (!sqgi_import_push_file(v, filename)) {
        fprintf(stderr, "sqgi: out of memory\n");
        sq_pop(v, callargs + 2);
        sqgi_vm_free(v);
#ifdef _WIN32
        free(default_packaged_script);
#endif
        return 1;
    }

    res = sq_call(v, callargs, SQTrue, SQTrue);
    sqgi_import_pop_file(v);
    int exitcode = 0;
    if (SQ_SUCCEEDED(res)) {
        SQInteger ret = 0;
        if (SQ_SUCCEEDED(sq_getinteger(v, -1, &ret)))
            exitcode = (int)ret;
        sq_pop(v, 1); /* pop return value */
    } else {
        exitcode = 1;
    }
    sq_pop(v, 2); /* pop closure + root table */

    sqgi_vm_free(v);
#ifdef _WIN32
    free(default_packaged_script);
#endif
    return exitcode;
}
