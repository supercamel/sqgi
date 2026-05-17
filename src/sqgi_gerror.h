#pragma once

#include <squirrel.h>
#include <glib.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_gerror_register
 *
 * Install the `sqgi.GError` Squirrel class. Must be called after
 * sqgi_async_register has created the `sqgi` root table.
 *
 * The class has three fields populated on instances:
 *   .domain   string  — GQuark name of the error domain (e.g. "g-file-error")
 *   .code     integer — domain-specific error code
 *   .message  string  — human-readable message
 *
 * It overrides `_tostring` so unhandled-rejection reporting and string
 * concatenation yield "<domain>:<code>: <message>".
 */
void sqgi_gerror_register(HSQUIRRELVM v);

/*
 * sqgi_gerror_push
 *
 * Push a Squirrel instance of `sqgi.GError` populated from `err`. If `err`
 * is NULL pushes null. Does NOT free `err`.
 */
void sqgi_gerror_push(HSQUIRRELVM v, const GError *err);

/*
 * sqgi_gerror_throw
 *
 * Push a `sqgi.GError` instance from `err`, then sq_throwobject. Returns
 * SQ_ERROR. Frees `err` (consumes it). If `err` is NULL falls back to
 * throwing a plain string `fallback_msg`.
 */
SQRESULT sqgi_gerror_throw(HSQUIRRELVM v, GError *err, const char *fallback_msg);

#ifdef __cplusplus
}
#endif
