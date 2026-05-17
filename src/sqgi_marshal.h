#pragma once

#include <squirrel.h>
#include <girepository.h>
#include <glib-object.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_push_gi_argument
 *
 * Push a GIArgument value (described by type_info) onto the Squirrel stack.
 * Caller owns transfer semantics; this function honours GITransfer where
 * needed for strings/objects.
 */
void sqgi_push_gi_argument(HSQUIRRELVM v, GIArgument *arg,
                           GITypeInfo *type_info, GITransfer transfer);

/*
 * sqgi_get_gi_argument
 *
 * Pop/read the Squirrel value at stack index `idx` and marshal it into `arg`
 * according to `type_info`.  Returns SQ_OK on success.
 */
SQRESULT sqgi_get_gi_argument(HSQUIRRELVM v, SQInteger idx,
                              GIArgument *arg, GITypeInfo *type_info);

/*
 * sqgi_push_gvalue
 *
 * Push a GValue onto the Squirrel stack (used for signal parameters).
 */
void sqgi_push_gvalue(HSQUIRRELVM v, const GValue *gval);

/*
 * sqgi_get_gvalue
 *
 * Read the Squirrel value at `idx` into an already-initialised GValue.
 * Returns SQ_OK on success.
 */
SQRESULT sqgi_get_gvalue(HSQUIRRELVM v, SQInteger idx, GValue *gval);

/*
 * sqgi_push_gobject
 *
 * Wrap a GObject* as a Squirrel class instance (userdata).
 * Adds a reference to the object.  If obj is NULL, pushes null.
 */
void sqgi_push_gobject(HSQUIRRELVM v, GObject *obj);

/*
 * sqgi_get_gobject
 *
 * Extract the GObject* from a Squirrel instance (userdata) at stack index
 * `idx`. Returns NULL and throws a Squirrel error if the value is not a
 * GObject wrapper.
 */
GObject *sqgi_get_gobject(HSQUIRRELVM v, SQInteger idx);

#ifdef __cplusplus
}
#endif
