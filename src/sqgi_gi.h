#pragma once

#include <squirrel.h>
#include <girepository.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_gi_load_namespace
 *
 * Require `namespace_name` (with optional `version`, may be NULL) from the
 * GObject-Introspection repository and build a Squirrel table in the root
 * table with the same name.
 *
 * On GError the error message is thrown as a Squirrel exception.
 * On success the namespace table is left on the stack and SQ_OK returned.
 */
SQRESULT sqgi_gi_load_namespace(HSQUIRRELVM v, const char *namespace_name,
                                const char *version);

/*
 * sqgi_gi_wrap_function
 *
 * Push a native Squirrel closure that invokes the given GIFunctionInfo.
 * The closure is suitable for use as a standalone function or as a method
 * on a class (first arg will be checked for GObject* if it's a method).
 */
void sqgi_gi_wrap_function(HSQUIRRELVM v, GIFunctionInfo *info);

/*
 * sqgi_gi_push_enum_table
 *
 * Build and push a Squirrel table of integer constants from an enum/flags info.
 */
void sqgi_gi_push_enum_table(HSQUIRRELVM v, GIEnumInfo *info);

/* ── libffi helpers (internal, used by sqgi_subclass.c) ───────────────────── */

#include <ffi.h>

/* Map a GITypeInfo to its corresponding libffi type. NULL if unsupported.
 * `is_return` tells us we're handling the return slot (some return types
 * have promotion rules different from arguments). */
ffi_type *sqgi_ffi_type_for_gi(GITypeInfo *ti, gboolean is_return);

/* Pull a GIArgument out of a void* libffi arg slot for a given type tag. */
void sqgi_ffi_arg_to_gi(GIArgument *out, GITypeInfo *ti, void *slot);

#ifdef __cplusplus
}
#endif
