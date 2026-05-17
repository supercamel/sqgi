#include "sqgi_gerror.h"

#include <stdio.h>
#include <string.h>

/* Registry key under which the GError class is stored. */
#define SQGI_GERROR_REG_KEY "sqgi_gerror_class"

/* _tostring metamethod: "<domain>:<code>: <message>" */
static SQInteger sq_fn_gerror_tostring(HSQUIRRELVM v)
{
    const SQChar *domain = NULL;
    SQInteger code = 0;
    const SQChar *message = NULL;

    sq_pushstring(v, "domain", -1);
    if (SQ_SUCCEEDED(sq_get(v, 1))) {
        sq_getstring(v, -1, &domain);
        sq_poptop(v);
    }
    sq_pushstring(v, "code", -1);
    if (SQ_SUCCEEDED(sq_get(v, 1))) {
        sq_getinteger(v, -1, &code);
        sq_poptop(v);
    }
    sq_pushstring(v, "message", -1);
    if (SQ_SUCCEEDED(sq_get(v, 1))) {
        sq_getstring(v, -1, &message);
        sq_poptop(v);
    }

    char buf[1024];
    snprintf(buf, sizeof(buf), "%s:%lld: %s",
             domain ? domain : "(no-domain)",
             (long long)code,
             message ? message : "(no-message)");
    sq_pushstring(v, buf, -1);
    return 1;
}

/* Class constructor: GError(domain, code, message)
 * Stores values into the instance itself (instances inherit member slots
 * declared on the class).
 */
static SQInteger sq_fn_gerror_ctor(HSQUIRRELVM v)
{
    SQInteger nargs = sq_gettop(v);

    if (nargs >= 2) {
        sq_pushstring(v, "domain", -1);
        sq_push(v, 2);
        sq_set(v, 1);
    }
    if (nargs >= 3) {
        sq_pushstring(v, "code", -1);
        sq_push(v, 3);
        sq_set(v, 1);
    }
    if (nargs >= 4) {
        sq_pushstring(v, "message", -1);
        sq_push(v, 4);
        sq_set(v, 1);
    }
    return 0;
}

void sqgi_gerror_register(HSQUIRRELVM v)
{
    SQInteger top = sq_gettop(v);

    /* Build the class. */
    sq_newclass(v, SQFalse);
    SQInteger cls = sq_gettop(v);

    /* Member slots with defaults */
    sq_pushstring(v, "domain", -1);  sq_pushstring(v, "", -1);  sq_newslot(v, cls, SQFalse);
    sq_pushstring(v, "code", -1);    sq_pushinteger(v, 0);      sq_newslot(v, cls, SQFalse);
    sq_pushstring(v, "message", -1); sq_pushstring(v, "", -1);  sq_newslot(v, cls, SQFalse);

    /* Constructor */
    sq_pushstring(v, "constructor", -1);
    sq_newclosure(v, sq_fn_gerror_ctor, 0);
    sq_newslot(v, cls, SQFalse);

    /* _tostring metamethod */
    sq_pushstring(v, "_tostring", -1);
    sq_newclosure(v, sq_fn_gerror_tostring, 0);
    sq_newslot(v, cls, SQFalse);

    /* Expose as sqgi.GError */
    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    if (SQ_SUCCEEDED(sq_get(v, -2))) {
        sq_pushstring(v, "GError", -1);
        sq_push(v, cls);
        sq_newslot(v, -3, SQFalse);
        sq_poptop(v); /* sqgi table */
    }
    sq_poptop(v); /* root table */

    /* Stash in the registry for fast lookup by sqgi_gerror_push. */
    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_GERROR_REG_KEY, -1);
    sq_push(v, cls);
    sq_newslot(v, -3, SQFalse);
    sq_poptop(v); /* registry */

    sq_settop(v, top);
}

void sqgi_gerror_push(HSQUIRRELVM v, const GError *err)
{
    if (!err) {
        sq_pushnull(v);
        return;
    }

    /* Look up class from registry. */
    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_GERROR_REG_KEY, -1);
    if (SQ_FAILED(sq_get(v, -2))) {
        /* No class registered (gerror_register never called). Fall back to
         * pushing the bare message string so callers don't crash. */
        sq_poptop(v); /* registry */
        sq_pushstring(v, err->message ? err->message : "", -1);
        return;
    }

    /* Stack: registry, class. Create instance. */
    if (SQ_FAILED(sq_createinstance(v, -1))) {
        sq_pop(v, 2); /* class, registry */
        sq_pushstring(v, err->message ? err->message : "", -1);
        return;
    }
    SQInteger inst = sq_gettop(v);

    /* Populate fields directly. */
    const char *domain = g_quark_to_string(err->domain);
    sq_pushstring(v, "domain", -1);
    sq_pushstring(v, domain ? domain : "", -1);
    sq_set(v, inst);

    sq_pushstring(v, "code", -1);
    sq_pushinteger(v, (SQInteger)err->code);
    sq_set(v, inst);

    sq_pushstring(v, "message", -1);
    sq_pushstring(v, err->message ? err->message : "", -1);
    sq_set(v, inst);

    /* Stack: registry, class, instance — leave only instance. */
    sq_remove(v, -2); /* class */
    sq_remove(v, -2); /* registry */
}

SQRESULT sqgi_gerror_throw(HSQUIRRELVM v, GError *err, const char *fallback_msg)
{
    if (!err) {
        SQRESULT r = sq_throwerror(v, fallback_msg ? fallback_msg : "unknown GError");
        return r;
    }
    sqgi_gerror_push(v, err);
    sq_throwobject(v); /* pops the instance into _lasterror */
    g_error_free(err);
    return SQ_ERROR;
}
