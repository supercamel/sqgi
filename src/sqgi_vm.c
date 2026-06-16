#include "sqgi_vm.h"
#include "sqgi_import.h"
#include "sqgi_async.h"
#include "sqgi_signal.h"
#include "sqgi_gi_object.h"
#include "sqgi_gerror.h"
#include "sqgi_subclass.h"
#include "sqgi_json.h"
#include "sqgi_cairo.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

/* ── Print / error callbacks ─────────────────────────────────────────────── */

static void sq_printfunc(HSQUIRRELVM v, const SQChar *fmt, ...)
{
    (void)v;
    va_list args;
    va_start(args, fmt);
    vprintf(fmt, args);
    va_end(args);
}

static void sq_errorfunc(HSQUIRRELVM v, const SQChar *fmt, ...)
{
    (void)v;
    va_list args;
    va_start(args, fmt);
    vfprintf(stderr, fmt, args);
    va_end(args);
}

static SQInteger sqgi_errorhandler(HSQUIRRELVM v)
{
    SQPRINTFUNCTION pf = sq_geterrorfunc(v);
    if (!pf) return 0;

    const SQChar *message = NULL;
    SQInteger top = sq_gettop(v);
    if (sq_gettop(v) >= 2 &&
        SQ_SUCCEEDED(sq_tostring(v, 2)) &&
        SQ_SUCCEEDED(sq_getstring(v, -1, &message)) &&
        message) {
        pf(v, "\nAN ERROR HAS OCCURRED [%s]\n", message);
    } else {
        pf(v, "\nAN ERROR HAS OCCURRED [unknown]\n");
    }
    sq_settop(v, top);
    sqstd_printcallstack(v);
    return 0;
}

static void sqgi_seterrorhandlers(HSQUIRRELVM v)
{
    sq_newclosure(v, sqgi_errorhandler, 0);
    sq_seterrorhandler(v);
}

/* ── Public API ──────────────────────────────────────────────────────────── */

HSQUIRRELVM sqgi_vm_new(void)
{
    HSQUIRRELVM v = sq_open(1024);
    if (!v) return NULL;

    /* Stash root VM in shared foreign ptr so coro threads can find a
     * long-lived VM for sq_release in deferred callbacks (see sqgi_root_vm). */
    sq_setsharedforeignptr(v, v);

    sq_setprintfunc(v, sq_printfunc, sq_errorfunc);

    /* Standard library registration — all go into the root table */
    sq_pushroottable(v);
    sqstd_register_bloblib(v);
    sqstd_register_iolib(v);
    sqstd_register_systemlib(v);
    sqstd_register_mathlib(v);
    sqstd_register_stringlib(v);
    sq_pop(v, 1); /* pop root table */

    sqstd_seterrorhandlers(v);

    /* Register `import` in the root table */
    sqgi_import_register(v);

    /* Register `sqgi` async utilities table */
    sqgi_async_register(v);

    /* Extend `sqgi` with object helpers (new_object). */
    sqgi_gi_object_register_helpers(v);

    /* Install sqgi.GError class. */
    sqgi_gerror_register(v);

    /* Install sqgi.register_class for GType subclassing. */
    sqgi_subclass_register_helpers(v);

    /* Install sqgi.json parse/stringify. */
    sqgi_json_register_helpers(v);

    /* Register native cairo classes (foreign GI records). */
    sqgi_cairo_register(v);

    sqgi_seterrorhandlers(v);

    return v;
}

void sqgi_vm_free(HSQUIRRELVM v)
{
    sqgi_signal_mark_vm_closing(v);
    sq_close(v);
}

HSQUIRRELVM sqgi_root_vm(HSQUIRRELVM v)
{
    HSQUIRRELVM root = (HSQUIRRELVM)sq_getsharedforeignptr(v);
    return root ? root : v;
}

SQRESULT sqgi_vm_dofile(HSQUIRRELVM v, const SQChar *filename)
{
    sq_pushroottable(v);
    SQRESULT res = sqstd_dofile(v, filename, SQFalse, SQTrue);
    if (SQ_FAILED(res)) {
        sq_pop(v, 1); /* pop root table */
        return res;
    }
    sq_pop(v, 1); /* pop root table */
    return SQ_OK;
}

SQRESULT sqgi_vm_dobuffer(HSQUIRRELVM v, const SQChar *buf, SQInteger len, const SQChar *name)
{
    SQRESULT res = sq_compilebuffer(v, buf, len, name, SQTrue);
    if (SQ_FAILED(res)) return res;

    sq_pushroottable(v);
    res = sq_call(v, 1, SQFalse, SQTrue);
    sq_pop(v, 1); /* pop closure */
    return res;
}
