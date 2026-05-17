/* sqgi_cairo.h — native cairo binding for SQGI.
 *
 * cairo records (cairo_t, cairo_surface_t, cairo_pattern_t, …) are declared
 * `foreign="1"` in cairo-1.0.gir, meaning GObject-Introspection refuses to
 * marshal them and defers all knowledge of the type to the language binding.
 * This module provides:
 *
 *   1. A native userdata-backed Squirrel class for each foreign cairo type
 *      with the canonical methods bound directly to libcairo.
 *   2. A push helper used by sqgi_marshal so that GI-provided cairo_t*
 *      (e.g. the cr argument to a Gtk.DrawingArea.set_draw_func callback)
 *      arrives in Squirrel as a fully usable cairo.Context instance.
 *   3. A namespace overlay applied at import("cairo") time so that the
 *      enum/constant table loaded from GI is augmented with our native
 *      classes + constructors.
 */
#pragma once

#include <squirrel.h>
#include <cairo.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Called once from sqgi_vm_new() to register the cairo classes. */
void sqgi_cairo_register(HSQUIRRELVM v);

/* If `full_key` (e.g. "cairo.Context") names one of our foreign cairo
 * records, push a Squirrel instance wrapping `ptr` and return 1. The wrapper
 * always owns one reference; if transfer_full is 0 (TRANSFER_NOTHING) we
 * cairo_*_reference() to obtain that reference, if 1 (TRANSFER_EVERYTHING)
 * we adopt the caller's reference verbatim. Returns 0 if full_key is not a
 * cairo foreign type. */
int  sqgi_cairo_try_push_foreign(HSQUIRRELVM v, const char *full_key,
                                 void *ptr, int transfer_full);

/* Called from sqgi_gi.c's namespace loader after building the cairo
 * namespace table (top of stack). Overlays our native classes + helpers. */
void sqgi_cairo_overlay_namespace(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
