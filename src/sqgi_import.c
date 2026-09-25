#include "sqgi_import.h"
#include "sqgi_gi.h"
#include "sqgi_system.h"

#include <squirrel.h>
#include <sqstdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <glib/gstdio.h>
#ifdef G_OS_WIN32
#include <windows.h>
#endif

/* The registry belongs to the VM shared state (including its coroutines).
 * A null entry marks a load in progress; a native closure holds a successful
 * export in its free variable. Unlike table/array slots, closure captures keep
 * weakref exports intact instead of dereferencing them on retrieval. GC can
 * trace the captures and VM teardown releases them. */
#define SQGI_MODULE_CACHE "sqgi_module_cache"

/* ── import() native function ────────────────────────────────────────────── */

/*
 * Squirrel signature:
 *
 *   import(name)
 *   import(name, version)
 *
 * If `name` ends in ".nut", executes it once per VM and caches its export.
 * Otherwise treats `name` as a GI namespace name (and `version` as optional
 * version string) and loads it via GObject-Introspection.
 *
 * Returns the namespace table (or whatever the .nut file returns).
 */
static int sqgi_path_is_absolute(const char *path)
{
    return path && g_path_is_absolute(path);
}

typedef struct SqgiImportFrame {
    HSQUIRRELVM v;
    char *path;
    struct SqgiImportFrame *prev;
} SqgiImportFrame;

static SqgiImportFrame *sqgi_import_frames = NULL;

static int sqgi_file_exists(const char *path)
{
    FILE *f = g_fopen(path, "rb");
    if (!f) return 0;
    fclose(f);
    return 1;
}

static char *sqgi_join_path(const char *dir, const char *name)
{
    if (!dir || !name) return NULL;

    size_t dir_len = strlen(dir);
    size_t name_len = strlen(name);
    int needs_sep = dir_len > 0 && dir[dir_len - 1] != '/';
    char *out = (char *)malloc(dir_len + (needs_sep ? 1 : 0) + name_len + 1);
    if (!out) return NULL;

    memcpy(out, dir, dir_len);
    if (needs_sep) out[dir_len++] = '/';
    memcpy(out + dir_len, name, name_len);
    out[dir_len + name_len] = '\0';
    return out;
}

static char *sqgi_strdup(const char *value)
{
    if (!value) return NULL;

    size_t len = strlen(value);
    char *out = (char *)malloc(len + 1);
    if (!out) return NULL;

    memcpy(out, value, len + 1);
    return out;
}

static char *sqgi_strndup(const char *value, size_t len)
{
    if (!value) return NULL;

    char *out = (char *)malloc(len + 1);
    if (!out) return NULL;

    memcpy(out, value, len);
    out[len] = '\0';
    return out;
}

static char *sqgi_dirname_dup(const char *path)
{
    if (!path || path[0] == '\0') return sqgi_strdup(".");

    const char *slash = strrchr(path, '/');
#ifdef G_OS_WIN32
    const char *backslash = strrchr(path, '\\');
    if (backslash && (!slash || backslash > slash)) slash = backslash;
    if (slash == path + 2 && path[1] == ':') return sqgi_strndup(path, 3);
#endif
    if (!slash) return sqgi_strdup(".");
    if (slash == path) return sqgi_strndup(path, 1);
    return sqgi_strndup(path, (size_t)(slash - path));
}

int sqgi_import_push_file(HSQUIRRELVM v, const char *path)
{
    SqgiImportFrame *frame = (SqgiImportFrame *)calloc(1, sizeof(SqgiImportFrame));
    if (!frame) return 0;

    frame->path = sqgi_strdup(path ? path : "");
    if (!frame->path) {
        free(frame);
        return 0;
    }

    frame->v = v;
    frame->prev = sqgi_import_frames;
    sqgi_import_frames = frame;
    return 1;
}

void sqgi_import_pop_file(HSQUIRRELVM v)
{
    SqgiImportFrame **link = &sqgi_import_frames;
    while (*link) {
        SqgiImportFrame *frame = *link;
        if (frame->v == v) {
            *link = frame->prev;
            free(frame->path);
            free(frame);
            return;
        }
        link = &frame->prev;
    }
}

static const char *sqgi_import_current_file(HSQUIRRELVM v)
{
    for (SqgiImportFrame *frame = sqgi_import_frames; frame; frame = frame->prev) {
        if (frame->v == v) return frame->path;
    }
    return NULL;
}

static char *sqgi_resolve_nut_import_path(HSQUIRRELVM v, const char *name)
{
    if (!name) return NULL;

    if (sqgi_path_is_absolute(name) || sqgi_file_exists(name))
        return sqgi_strdup(name);

    const char *current = sqgi_import_current_file(v);
    if (current && current[0] != '\0') {
        char *dir = sqgi_dirname_dup(current);
        char *candidate = dir ? sqgi_join_path(dir, name) : NULL;
        free(dir);
        if (candidate && sqgi_file_exists(candidate))
            return candidate;
        free(candidate);
    }

    const char *app_share = getenv("SQGI_APP_SHARE");
    if (app_share && app_share[0] != '\0') {
        char *candidate = sqgi_join_path(app_share, name);
        if (candidate && sqgi_file_exists(candidate))
            return candidate;
        free(candidate);
    }

    return sqgi_strdup(name);
}

static char *sqgi_module_key(const char *path)
{
    /* Resolve filesystem aliases, including symlinks, before caching. Keep
     * the original resolved path for execution and relative imports. */
#ifdef G_OS_WIN32
    gunichar2 *wide = g_utf8_to_utf16(path, -1, NULL, NULL, NULL);
    HANDLE file = wide ? CreateFileW((LPCWSTR)wide, 0,
        FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, NULL,
        OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL) : INVALID_HANDLE_VALUE;
    g_free(wide);
    if (file != INVALID_HANDLE_VALUE) {
        DWORD count = GetFinalPathNameByHandleW(file, NULL, 0, FILE_NAME_NORMALIZED);
        char *key = NULL;
        if (count) {
            WCHAR *buffer = g_new(WCHAR, (gsize)count + 1);
            DWORD written = GetFinalPathNameByHandleW(file, buffer, count + 1,
                                                     FILE_NAME_NORMALIZED);
            if (written && written <= count)
                key = g_utf16_to_utf8((const gunichar2 *)buffer, -1, NULL, NULL, NULL);
            g_free(buffer);
        }
        CloseHandle(file);
        if (key) return key;
    }
#else
    char *physical = realpath(path, NULL);
    if (physical) {
        char *key = g_strdup(physical);
        free(physical);
        return key;
    }
#endif
    /* Missing/unreadable files still go through the normal loader error path. */
    return g_canonicalize_filename(path, NULL);
}

/* Native closure free variables are appended to the call stack. */
static SQInteger sqgi_module_export(HSQUIRRELVM v)
{
    sq_push(v, -1);
    return 1;
}

static SQInteger sqgi_import_nut(HSQUIRRELVM v, const char *name)
{
    SQInteger top = sq_gettop(v);
    char *resolved = sqgi_resolve_nut_import_path(v, name);
    if (!resolved) return sq_throwerror(v, "import: out of memory");
    char *key = sqgi_module_key(resolved);

    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_MODULE_CACHE, -1);
    sq_rawget(v, -2);
    sq_remove(v, -2);
    SQInteger cache = sq_gettop(v);

    sq_pushstring(v, key, -1);
    if (SQ_SUCCEEDED(sq_rawget(v, cache))) {
        if (sq_gettype(v, -1) == OT_NULL) {
            char *message = g_strdup_printf("import: circular module import: %s", key);
            sq_settop(v, top);
            SQInteger result = sq_throwerror(v, message);
            g_free(message);
            g_free(key);
            free(resolved);
            return result;
        }
        sq_getfreevariable(v, -1, 0);
        sq_remove(v, -2); /* entry */
        sq_remove(v, -2); /* cache */
        g_free(key);
        free(resolved);
        return 1;
    }

    if (!sqgi_import_push_file(v, resolved)) {
        sq_settop(v, top);
        g_free(key);
        free(resolved);
        return sq_throwerror(v, "import: out of memory");
    }
    sq_pushstring(v, key, -1);
    sq_pushnull(v);
    sq_rawset(v, cache);

    sq_pushroottable(v);
    SQRESULT result = sqstd_dofile(v, resolved, SQTrue, SQTrue);
    sqgi_import_pop_file(v);
    free(resolved);
    if (SQ_FAILED(result)) {
        /* Roll back the loading marker without replacing the loader's error. */
        sq_settop(v, cache);
        sq_pushstring(v, key, -1);
        sq_rawdeleteslot(v, cache, SQFalse);
        sq_settop(v, top);
        g_free(key);
        return result;
    }
    sq_pushstring(v, key, -1);
    sq_push(v, -2); /* export */
    sq_newclosure(v, sqgi_module_export, 1);
    sq_rawset(v, cache);
    sq_remove(v, -2); /* root environment */
    sq_remove(v, cache);
    g_free(key);
    return 1;
}

static SQInteger sqgi_import(HSQUIRRELVM v)
{
    SQInteger nargs = sq_gettop(v); /* includes 'this' at index 1 */

    const SQChar *name = NULL;
    if (SQ_FAILED(sq_getstring(v, 2, &name)) || !name) {
        return sq_throwerror(v, "import: expected a string argument");
    }

    /* Check built-in modules before falling through to GI namespaces. */
    if (strcmp(name, "system") == 0) {
        SQRESULT res = sqgi_system_push_module(v);
        if (SQ_FAILED(res)) return res;
        return 1;
    }

    /* Check if it's a .nut file */
    size_t len = strlen(name);
    if (len >= 4 && strcmp(name + len - 4, ".nut") == 0) {
        return sqgi_import_nut(v, name);
    }

    /* GI namespace */
    const SQChar *version = NULL;
    if (nargs >= 3) {
        sq_getstring(v, 3, &version); /* nullable */
    }

    SQRESULT res = sqgi_gi_load_namespace(v, name, version);
    if (SQ_FAILED(res)) return res;
    return 1; /* namespace table is on stack */
}

/* ── Registration ────────────────────────────────────────────────────────── */

void sqgi_import_register(HSQUIRRELVM v)
{
    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_MODULE_CACHE, -1);
    sq_newtable(v);
    sq_rawset(v, -3);
    sq_pop(v, 1);

    sq_pushroottable(v);
    sq_pushstring(v, "import", -1);
    sq_newclosure(v, sqgi_import, 0);
    sq_setnativeclosurename(v, -1, "import");
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1); /* pop root table */
}
