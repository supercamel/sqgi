#include "sqgi_import.h"
#include "sqgi_gi.h"

#include <squirrel.h>
#include <sqstdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* ── import() native function ────────────────────────────────────────────── */

/*
 * Squirrel signature:
 *
 *   import(name)
 *   import(name, version)
 *
 * If `name` ends in ".nut", loads and executes the file.
 * Otherwise treats `name` as a GI namespace name (and `version` as optional
 * version string) and loads it via GObject-Introspection.
 *
 * Returns the namespace table (or whatever the .nut file returns).
 */
static int sqgi_path_is_absolute(const char *path)
{
    return path && path[0] == '/';
}

static int sqgi_file_exists(const char *path)
{
    FILE *f = fopen(path, "rb");
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

static char *sqgi_resolve_nut_import_path(const char *name)
{
    if (!name) return NULL;

    if (sqgi_path_is_absolute(name) || sqgi_file_exists(name))
        return sqgi_strdup(name);

    const char *app_share = getenv("SQGI_APP_SHARE");
    if (app_share && app_share[0] != '\0') {
        char *candidate = sqgi_join_path(app_share, name);
        if (candidate && sqgi_file_exists(candidate))
            return candidate;
        free(candidate);
    }

    return sqgi_strdup(name);
}

static SQInteger sqgi_import(HSQUIRRELVM v)
{
    SQInteger nargs = sq_gettop(v); /* includes 'this' at index 1 */

    const SQChar *name = NULL;
    if (SQ_FAILED(sq_getstring(v, 2, &name)) || !name) {
        return sq_throwerror(v, "import: expected a string argument");
    }

    /* Check if it's a .nut file */
    size_t len = strlen(name);
    if (len >= 4 && strcmp(name + len - 4, ".nut") == 0) {
        char *resolved = sqgi_resolve_nut_import_path(name);
        if (!resolved) return sq_throwerror(v, "import: out of memory");

        sq_pushroottable(v);
        SQRESULT res = sqstd_dofile(v, resolved, SQTrue, SQTrue);
        free(resolved);
        if (SQ_FAILED(res)) return res;
        return 1; /* return value of the script */
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
    sq_pushroottable(v);
    sq_pushstring(v, "import", -1);
    sq_newclosure(v, sqgi_import, 0);
    sq_setnativeclosurename(v, -1, "import");
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1); /* pop root table */
}
