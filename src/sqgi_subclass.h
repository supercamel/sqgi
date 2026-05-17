#pragma once

#include <squirrel.h>
#include <glib-object.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_subclass_register_helpers
 *
 * Installs `sqgi.register_class` and related helpers. Must be called after
 * sqgi_gi_object_register_helpers (which exposes `sqgi.new_object`).
 *
 * Squirrel surface:
 *
 *   local MyApp = sqgi.register_class({
 *       name = "SqgiMyApp",
 *       parent = Gio.Application,
 *       overrides = {
 *           activate = function(self) {
 *               print("MyApp activated\n")
 *           }
 *       }
 *   })
 *
 *   local app = sqgi.new_object(MyApp, { "application-id" = "org.x" })
 *   app.run([])
 *
 * Constraint: overridden vfuncs may only be invoked from the GLib main
 * thread (the same thread that owns the Squirrel VM). vfuncs invoked from
 * worker threads will crash. This matches existing SQGI thread-safety.
 */
void sqgi_subclass_register_helpers(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
