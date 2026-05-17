#include "sqgi_import.h"
#include "sqgi_gi.h"

#include <squirrel.h>
#include <sqstdio.h>
#include <string.h>

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
        sq_pushroottable(v);
        SQRESULT res = sqstd_dofile(v, name, SQTrue, SQTrue);
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
