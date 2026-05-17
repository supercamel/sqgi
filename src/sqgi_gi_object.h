#pragma once

#include <squirrel.h>
#include <girepository.h>
#include <glib-object.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_gi_object_build_class
 *
 * Build a Squirrel class for the given GIObjectInfo (or GIInterfaceInfo).
 * The class is left on the stack.
 *
 * Applies inheritance from the parent GIObjectInfo if one exists.
 * Registers all methods, constructors, properties (_get/_set metamethods),
 * and signal helpers (connect/disconnect).
 */
void sqgi_gi_object_build_class(HSQUIRRELVM v, GIObjectInfo *info);

/*
 * sqgi_gi_object_build_interface_class
 *
 * Build a Squirrel class for a GIInterfaceInfo.
 */
void sqgi_gi_object_build_interface_class(HSQUIRRELVM v, GIInterfaceInfo *info);

/*
 * sqgi_gi_object_build_struct_class
 *
 * Build a minimal Squirrel class for a GI struct/union.
 * Methods are exposed as closures; no reference counting.
 */
void sqgi_gi_object_build_struct_class(HSQUIRRELVM v, GIStructInfo *info);

/*
 * sqgi_gi_object_push_instance
 *
 * Push a new Squirrel instance wrapping an already-ref'd GObject*.
 * The class is looked up from the VM registry via the GType name.
 * If not found a generic fallback instance is pushed.
 *
 * Takes ownership of this reference (i.e. does NOT add another ref).
 */
void sqgi_gi_object_push_instance(HSQUIRRELVM v, GObject *obj);

/*
 * sqgi_gi_object_register_class
 *
 * Store a Squirrel class object in the VM registry keyed by GType name.
 * Called during sqgi_gi_object_build_class so that sqgi_gi_object_push_instance
 * can look it up later.
 */
void sqgi_gi_object_register_class(HSQUIRRELVM v, const char *gtype_name,
                                   SQInteger class_idx);

/*
 * sqgi_gi_object_lookup_class
 *
 * Retrieve a registered class from the VM registry.
 * Pushes the class and returns SQ_OK, or returns SQ_ERROR if not found.
 */
SQRESULT sqgi_gi_object_lookup_class(HSQUIRRELVM v, const char *gtype_name);

/*
 * sqgi_gi_object_register_helpers
 *
 * Add helper functions (currently `new_object`) to the existing `sqgi` root
 * table. Must be called after sqgi_async_register has created that table.
 */
void sqgi_gi_object_register_helpers(HSQUIRRELVM v);

/*
 * sqgi_boxed_track_ownership
 *
 * Mark a boxed/refcounted record pointer as owned by the Squirrel wrapper
 * currently on the top of the stack. When the wrapper is GC'd, its release
 * hook will perform the appropriate teardown (g_variant_unref for
 * GVariant, g_bytes_unref for GBytes, g_boxed_free for generic G_TYPE_BOXED
 * descendants). Safe to call with G_TYPE_NONE / G_TYPE_INVALID — becomes a
 * no-op (the wrapper is then non-owning).
 *
 * Callers MUST hold a transferred-everything reference: the registered
 * unref/free happens exactly once.
 */
void sqgi_boxed_track_ownership(HSQUIRRELVM v, SQInteger instance_idx,
                                gpointer ptr, GType gtype);

#ifdef __cplusplus
}
#endif
