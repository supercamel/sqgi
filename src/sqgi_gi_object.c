#include "sqgi_gi_object.h"
#include "sqgi_gi.h"
#include "sqgi_marshal.h"
#include "sqgi_signal.h"
#include "sqgi_stack.h"

#include <string.h>
#include <stdio.h>

/* ── Registry key ────────────────────────────────────────────────────────── */

/*
 * The VM registry table (sq_pushregistrytable) holds a sub-table under the
 * key "sqgi_classes" mapping GType name → Squirrel class.
 */
#define SQGI_REGISTRY_KEY "sqgi_classes"

static void ensure_class_registry(HSQUIRRELVM v)
{
    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_REGISTRY_KEY, -1);
    if (SQ_FAILED(sq_rawget(v, -2))) {
        /* Create the sub-table */
        sq_pushstring(v, SQGI_REGISTRY_KEY, -1);
        sq_newtable(v);
        sq_rawset(v, -3);
        sq_pushstring(v, SQGI_REGISTRY_KEY, -1);
        sq_rawget(v, -2); /* push it back for caller */
    }
    /* stack: [registry, sqgi_classes] */
}

void sqgi_gi_object_register_class(HSQUIRRELVM v, const char *gtype_name,
                                   SQInteger class_idx)
{
    SQGI_STACK_CHECK_BEGIN(v);
    /* Normalise class_idx to positive */
    SQInteger top = sq_gettop(v);
    if (class_idx < 0) class_idx = top + class_idx + 1;

    ensure_class_registry(v);
    /* stack: [..., registry, sqgi_classes] */
    sq_pushstring(v, gtype_name, -1);
    sq_push(v, class_idx);
    sq_rawset(v, -3);       /* sqgi_classes[gtype_name] = class */
    sq_pop(v, 2);           /* pop sqgi_classes + registry */
    SQGI_STACK_CHECK_END(v, 0);
}

SQRESULT sqgi_gi_object_lookup_class(HSQUIRRELVM v, const char *gtype_name)
{
    SQGI_STACK_CHECK_BEGIN(v);
    ensure_class_registry(v);
    /* stack: [..., registry, sqgi_classes] */
    sq_pushstring(v, gtype_name, -1);
    SQRESULT res = sq_rawget(v, -2);
    /* pop sqgi_classes + registry regardless */
    if (SQ_SUCCEEDED(res)) {
        /* class is on top; remove sqgi_classes + registry underneath */
        sq_remove(v, -2); /* sqgi_classes */
        sq_remove(v, -2); /* registry */
        SQGI_STACK_CHECK_END(v, 1);
    } else {
        sq_pop(v, 2); /* sqgi_classes + registry */
        SQGI_STACK_CHECK_END(v, 0);
    }
    return res;
}

/* ── Instance release hook (called by Squirrel GC) ──────────────────────── */

static SQInteger gobject_release_hook(SQUserPointer p, SQInteger size)
{
    (void)size;
    if (p) g_object_unref(G_OBJECT(p));
    return 0;
}

/* ── Boxed/refcounted record ownership tracking ──────────────────────────
 *
 * GVariant / GBytes / GIB-defined boxed records returned from constructors
 * arrive with a transferred ref but Squirrel only knows the raw pointer —
 * there's no way to learn the GType from the release hook. We maintain a
 * process-wide map (raw pointer → GType) populated when we register
 * ownership, consulted by the release hook to dispatch the correct
 * teardown.
 *
 * Same-pointer collisions are statistically rare (GVariant/GBytes
 * constructors return fresh allocations), and the worst case is that
 * the second register replaces the first → first wrapper's release
 * becomes a no-op (leak), not a double free. */

static GMutex sqgi_boxed_owners_mu;
static GHashTable *sqgi_boxed_owners = NULL; /* gpointer → GSIZE(GType) */

static SQInteger boxed_release_hook(SQUserPointer p, SQInteger size)
{
    (void)size;
    if (!p) return 0;
    GType gtype = G_TYPE_INVALID;
    g_mutex_lock(&sqgi_boxed_owners_mu);
    if (sqgi_boxed_owners) {
        gpointer val = g_hash_table_lookup(sqgi_boxed_owners, p);
        if (val) {
            gtype = (GType)GPOINTER_TO_SIZE(val);
            g_hash_table_remove(sqgi_boxed_owners, p);
        }
    }
    g_mutex_unlock(&sqgi_boxed_owners_mu);
    if (gtype == G_TYPE_INVALID) return 0;

    if (gtype == G_TYPE_VARIANT) {
        g_variant_unref((GVariant *)p);
    } else if (gtype == G_TYPE_BYTES) {
        g_bytes_unref((GBytes *)p);
    } else if (g_type_is_a(gtype, G_TYPE_BOXED)) {
        g_boxed_free(gtype, p);
    }
    /* Plain (non-boxed) structs: we don't know how to free safely. Leave
     * the pointer alone — Squirrel side never owned the storage. */
    return 0;
}

void sqgi_boxed_track_ownership(HSQUIRRELVM v, SQInteger instance_idx,
                                gpointer ptr, GType gtype)
{
    if (!ptr || gtype == G_TYPE_INVALID || gtype == G_TYPE_NONE) return;
    /* Only types we know how to free. */
    if (gtype != G_TYPE_VARIANT && gtype != G_TYPE_BYTES &&
        !g_type_is_a(gtype, G_TYPE_BOXED)) {
        return;
    }
    g_mutex_lock(&sqgi_boxed_owners_mu);
    if (!sqgi_boxed_owners) {
        sqgi_boxed_owners = g_hash_table_new(NULL, NULL);
    }
    g_hash_table_insert(sqgi_boxed_owners, ptr, GSIZE_TO_POINTER(gtype));
    g_mutex_unlock(&sqgi_boxed_owners_mu);
    sq_setreleasehook(v, instance_idx, boxed_release_hook);
}

/* ── _get metamethod (property access) ──────────────────────────────────── */

static SQInteger gobject_get(HSQUIRRELVM v)
{
    /* Stack: [instance, key] */
    GObject *obj = sqgi_get_gobject(v, 1);
    if (!obj) return SQ_ERROR;

    const SQChar *key;
    if (SQ_FAILED(sq_getstring(v, 2, &key))) return SQ_ERROR;

    GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), key);
    if (!pspec) return sq_throwerror(v, "property not found");

    GValue gval = G_VALUE_INIT;
    g_value_init(&gval, pspec->value_type);
    g_object_get_property(obj, key, &gval);
    sqgi_push_gvalue(v, &gval);
    g_value_unset(&gval);
    return 1;
}

/* ── _set metamethod (property write) ───────────────────────────────────── */

static SQInteger gobject_set(HSQUIRRELVM v)
{
    /* Stack: [instance, key, value] */
    GObject *obj = sqgi_get_gobject(v, 1);
    if (!obj) return SQ_ERROR;

    const SQChar *key;
    if (SQ_FAILED(sq_getstring(v, 2, &key))) return SQ_ERROR;

    GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), key);
    if (!pspec) return sq_throwerror(v, "property not found");

    GValue gval = G_VALUE_INIT;
    g_value_init(&gval, pspec->value_type);
    if (SQ_FAILED(sqgi_get_gvalue(v, 3, &gval))) {
        g_value_unset(&gval);
        return SQ_ERROR;
    }
    g_object_set_property(obj, key, &gval);
    g_value_unset(&gval);
    return 0;
}

/* ── Explicit get_property / set_property methods ────────────────────────── */

static SQInteger gobject_get_property(HSQUIRRELVM v)
{
    /* Stack: [instance, name_string] */
    return gobject_get(v);
}

static SQInteger gobject_set_property(HSQUIRRELVM v)
{
    /* Stack: [instance, name_string, value] */
    return gobject_set(v);
}

/* ── connect / disconnect ────────────────────────────────────────────────── */

static SQInteger gobject_connect(HSQUIRRELVM v)
{
    /* Stack: [instance, signal_name, handler_closure] */
    GObject *obj = sqgi_get_gobject(v, 1);
    if (!obj) return SQ_ERROR;

    const SQChar *signal;
    if (SQ_FAILED(sq_getstring(v, 2, &signal))) return SQ_ERROR;

    /* handler is at index 3 */
    gulong id = sqgi_signal_connect(v, obj, signal, 3);
    if (id == 0) return sq_throwerror(v, "sqgi: failed to connect signal");

    sq_pushinteger(v, (SQInteger)id);
    return 1;
}

static SQInteger gobject_disconnect(HSQUIRRELVM v)
{
    /* Stack: [instance, handler_id] */
    GObject *obj = sqgi_get_gobject(v, 1);
    if (!obj) return SQ_ERROR;

    SQInteger id;
    if (SQ_FAILED(sq_getinteger(v, 2, &id))) return SQ_ERROR;

    sqgi_signal_disconnect(obj, (gulong)id);
    return 0;
}

/* ── emit ────────────────────────────────────────────────────────────────── */

static SQInteger gobject_emit(HSQUIRRELVM v)
{
    /* Stack: [instance, signal_name, arg0, arg1, ...] */
    GObject *obj = sqgi_get_gobject(v, 1);
    if (!obj) return SQ_ERROR;

    const SQChar *signal;
    if (SQ_FAILED(sq_getstring(v, 2, &signal))) {
        return sq_throwerror(v, "emit: signal name must be a string");
    }

    /* Parse "signal::detail" form */
    const char *detail_str = strstr(signal, "::");
    char signal_name[128];
    GQuark detail_quark = 0;
    if (detail_str) {
        gsize n = (gsize)(detail_str - signal);
        if (n >= sizeof(signal_name)) n = sizeof(signal_name) - 1;
        memcpy(signal_name, signal, n);
        signal_name[n] = '\0';
        detail_quark = g_quark_try_string(detail_str + 2);
    } else {
        snprintf(signal_name, sizeof(signal_name), "%s", signal);
    }

    /* Look up signal id on the object's type (walks parent + interface chain) */
    guint signal_id = g_signal_lookup(signal_name, G_OBJECT_TYPE(obj));
    if (signal_id == 0) {
        return sq_throwerror(v, "emit: no such signal on object");
    }

    GSignalQuery query;
    g_signal_query(signal_id, &query);

    SQInteger nargs_passed = sq_gettop(v) - 2; /* exclude instance + signal_name */
    if ((guint)nargs_passed != query.n_params) {
        return sq_throwerror(v, "emit: wrong number of signal arguments");
    }

    /* Build instance + param GValue array. instance_and_params[0] = sender. */
    GValue *params = g_new0(GValue, query.n_params + 1);
    g_value_init(&params[0], G_OBJECT_TYPE(obj));
    g_value_set_object(&params[0], obj);

    for (guint i = 0; i < query.n_params; i++) {
        GType ptype = query.param_types[i] & ~G_SIGNAL_TYPE_STATIC_SCOPE;
        g_value_init(&params[i + 1], ptype);
        if (SQ_FAILED(sqgi_get_gvalue(v, 3 + (SQInteger)i, &params[i + 1]))) {
            for (guint j = 0; j <= i + 1; j++) g_value_unset(&params[j]);
            g_free(params);
            return sq_throwerror(v, "emit: failed to marshal argument");
        }
    }

    /* Prepare return value slot if any */
    GValue retv = G_VALUE_INIT;
    gboolean has_retval = (query.return_type != G_TYPE_NONE &&
                          query.return_type != G_TYPE_INVALID);
    if (has_retval) g_value_init(&retv, query.return_type);

    g_signal_emitv(params, signal_id, detail_quark, has_retval ? &retv : NULL);

    /* Unref params */
    for (guint i = 0; i <= query.n_params; i++) g_value_unset(&params[i]);
    g_free(params);

    if (has_retval) {
        sqgi_push_gvalue(v, &retv);
        g_value_unset(&retv);
        return 1;
    }
    return 0;
}

/* ── Helper: add a native method to the class on top of the stack ─────────── */

static void add_method(HSQUIRRELVM v, const SQChar *name, SQFUNCTION fn)
{
    sq_pushstring(v, name, -1);
    sq_newclosure(v, fn, 0);
    sq_setnativeclosurename(v, -1, name);
    sq_newslot(v, -3, SQFalse);
}

static gboolean sqgi_name_has_suffix(const char *name, const char *suffix)
{
    if (!name || !suffix) return FALSE;
    size_t name_len = strlen(name);
    size_t suffix_len = strlen(suffix);
    return name_len >= suffix_len &&
           strcmp(name + name_len - suffix_len, suffix) == 0;
}

static gboolean sqgi_type_is_gio_cancellable(GITypeInfo *type_info)
{
    if (g_type_info_get_tag(type_info) != GI_TYPE_TAG_INTERFACE)
        return FALSE;

    GIBaseInfo *iface = g_type_info_get_interface(type_info);
    const char *ns = g_base_info_get_namespace(iface);
    const char *name = g_base_info_get_name(iface);
    gboolean is_cancellable =
        ns && name && strcmp(ns, "Gio") == 0 && strcmp(name, "Cancellable") == 0;
    g_base_info_unref(iface);
    return is_cancellable;
}

static gboolean sqgi_callable_arg_is_callback(GICallableInfo *callable, gint arg_index)
{
    GIArgInfo *arg_info = g_callable_info_get_arg(callable, arg_index);
    GITypeInfo *type_info = g_arg_info_get_type(arg_info);
    gboolean is_callback = FALSE;

    if (g_type_info_get_tag(type_info) == GI_TYPE_TAG_INTERFACE) {
        GIBaseInfo *iface = g_type_info_get_interface(type_info);
        is_callback = (g_base_info_get_type(iface) == GI_INFO_TYPE_CALLBACK);
        g_base_info_unref(iface);
    }

    g_base_info_unref(type_info);
    g_base_info_unref(arg_info);
    return is_callback;
}

static gboolean sqgi_async_method_omits_cancellable(GIFunctionInfo *method)
{
    const char *name = g_base_info_get_name((GIBaseInfo *)method);
    if (!sqgi_name_has_suffix(name, "_async"))
        return FALSE;

    GICallableInfo *callable = (GICallableInfo *)method;
    gint n_args = g_callable_info_get_n_args(callable);
    for (gint i = 0; i < n_args; i++) {
        if (!sqgi_callable_arg_is_callback(callable, i))
            continue;

        if (i <= 0)
            return TRUE;

        GIArgInfo *prev_arg = g_callable_info_get_arg(callable, i - 1);
        GITypeInfo *prev_type = g_arg_info_get_type(prev_arg);
        gboolean has_cancellable = sqgi_type_is_gio_cancellable(prev_type);
        g_base_info_unref(prev_type);
        g_base_info_unref(prev_arg);
        return !has_cancellable;
    }

    return FALSE;
}

static void sqgi_note_async_method_shape(HSQUIRRELVM v, SQInteger klass_idx,
                                         GIFunctionInfo *method)
{
    if (klass_idx < 0)
        klass_idx = sq_gettop(v) + klass_idx + 1;

    const char *name = g_base_info_get_name((GIBaseInfo *)method);
    if (!sqgi_name_has_suffix(name, "_async"))
        return;

    size_t base_len = strlen(name) - strlen("_async");
    char *base = g_strndup(name, base_len);
    gboolean omits_cancellable = sqgi_async_method_omits_cancellable(method);
    SQInteger top = sq_gettop(v);

    sq_pushstring(v, "__sqgi_async_no_cancellable", -1);
    if (SQ_FAILED(sq_get(v, klass_idx))) {
        sq_settop(v, top);
        sq_pushstring(v, "__sqgi_async_no_cancellable", -1);
        sq_newtable(v);
        sq_newslot(v, klass_idx, SQTrue);

        sq_pushstring(v, "__sqgi_async_no_cancellable", -1);
        if (SQ_FAILED(sq_get(v, klass_idx))) {
            sq_settop(v, top);
            g_free(base);
            return;
        }
    }

    SQInteger table_idx = sq_gettop(v);
    sq_pushstring(v, base, -1);
    sq_pushbool(v, omits_cancellable ? SQTrue : SQFalse);
    sq_rawset(v, table_idx);
    sq_settop(v, top);
    g_free(base);
}

/* Scan the class on top of the stack for `<bn>_async` / `<bn>_finish`
 * pairs and install a bare-name `<bn>` method that returns an awaitable
 * Task. The wrapper closure is built by the Squirrel-side helper
 * sqgi.__make_async_wrapper (in sqgi_async.c); we install it from C
 * because sq_newslot overrides existing class slots, whereas Squirrel
 * `<-` and `=` do not (the latter raises "trying to set 'class'").
 *
 * Policy: the bare-name slot is *always* installed and SHADOWS any
 * synchronous sibling (e.g. Gio.File.read). To preserve access to the
 * sync variant, the original method is also copied to `<bn>_sync`
 * before the wrapper is installed — so callers can write
 * `f.read_sync(null)` for blocking I/O. The raw `<bn>_async` and
 * `<bn>_finish` slots remain untouched. Failures are silently ignored. */
static void sqgi_install_async_wrappers(HSQUIRRELVM v)
{
    SQInteger klass_idx = sq_gettop(v);

    /* Resolve sqgi table and the two helper closures. */
    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    if (SQ_FAILED(sq_get(v, -2))) { sq_settop(v, klass_idx); return; }
    SQInteger sqgi_idx = sq_gettop(v);

    sq_pushstring(v, "__find_async_pairs", -1);
    if (SQ_FAILED(sq_get(v, sqgi_idx))) { sq_settop(v, klass_idx); return; }
    sq_pushstring(v, "__make_async_wrapper", -1);
    if (SQ_FAILED(sq_get(v, sqgi_idx))) { sq_settop(v, klass_idx); return; }
    SQInteger maker_idx = sq_gettop(v);
    SQInteger finder_idx = maker_idx - 1;

    /* Stack: ..., klass, root, sqgi, finder, maker */

    /* Call finder(klass) → array of base names. */
    sq_push(v, finder_idx);
    sq_push(v, sqgi_idx);    /* this = sqgi */
    sq_push(v, klass_idx);   /* arg = klass */
    if (SQ_FAILED(sq_call(v, 2, SQTrue, SQTrue))) {
        sq_settop(v, klass_idx);
        return;
    }
    /* Stack top: bases array */
    SQInteger bases_idx = sq_gettop(v);
    SQInteger n_bases = sq_getsize(v, bases_idx);

    for (SQInteger i = 0; i < n_bases; i++) {
        sq_pushinteger(v, i);
        if (SQ_FAILED(sq_get(v, bases_idx))) continue;
        /* Stack top: base name string */
        const SQChar *bn = NULL;
        if (SQ_FAILED(sq_getstring(v, -1, &bn)) || !bn) {
            sq_poptop(v);
            continue;
        }
        char *bn_dup = g_strdup(bn);
        sq_poptop(v); /* base name */

        /* Strategy: keep user-facing call names natural.
         *   - Sync sibling `<bn>` (if any) → leave alone.
         *   - `<bn>_async` → preserve raw under `<bn>_async_raw` (for power
         *     users / explicit lambda form), then overwrite `<bn>_async`
         *     with the awaitable wrapper. This lets user code write
         *         await obj.foo_async(arg1, arg2)
         *     without the two-lambda dance, while keeping the `_async`
         *     suffix as a visual cue that the call is asynchronous.
         *
         * If `<bn>_async_raw` already exists (re-run on derived class) we
         * skip — the slot has already been migrated. */
        char *an_name  = g_strconcat(bn_dup, "_async", NULL);
        char *raw_name = g_strconcat(bn_dup, "_async_raw", NULL);

        sq_pushstring(v, raw_name, -1);
        if (SQ_SUCCEEDED(sq_get(v, klass_idx))) {
            sq_poptop(v); /* _async_raw already exists; skip */
            g_free(an_name); g_free(raw_name); g_free(bn_dup);
            continue;
        }

        /* Fetch the raw _async closure. */
        sq_pushstring(v, an_name, -1);
        if (SQ_FAILED(sq_get(v, klass_idx))) {
            g_free(an_name); g_free(raw_name); g_free(bn_dup);
            continue;
        }
        /* Stack top: raw _async closure. Install copy under _async_raw. */
        sq_pushstring(v, raw_name, -1);
        sq_push(v, -2);                       /* duplicate raw closure */
        sq_newslot(v, klass_idx, SQFalse);
        sq_poptop(v);                         /* drop raw closure */

        SQBool no_cancellable = SQFalse;
        SQInteger before_shape_lookup = sq_gettop(v);
        sq_pushstring(v, "__sqgi_async_no_cancellable", -1);
        if (SQ_SUCCEEDED(sq_get(v, klass_idx))) {
            SQInteger shape_table_idx = sq_gettop(v);
            sq_pushstring(v, bn_dup, -1);
            if (SQ_SUCCEEDED(sq_get(v, shape_table_idx))) {
                if (sq_gettype(v, -1) == OT_BOOL)
                    sq_getbool(v, -1, &no_cancellable);
                sq_poptop(v);
            } else {
                sq_settop(v, shape_table_idx);
            }
            sq_poptop(v);
        } else {
            sq_settop(v, before_shape_lookup);
        }

        /* maker(bn) → wrapper closure */
        sq_push(v, maker_idx);
        sq_push(v, sqgi_idx);                 /* this = sqgi */
        sq_pushstring(v, bn_dup, -1);         /* arg = bn */
        sq_pushbool(v, no_cancellable);
        if (SQ_SUCCEEDED(sq_call(v, 3, SQTrue, SQTrue))) {
            /* Stack top: wrapper closure. Override `<bn>_async`. */
            sq_pushstring(v, an_name, -1);
            sq_push(v, -2);                   /* duplicate the closure */
            sq_remove(v, -3);                 /* drop original closure */
            sq_newslot(v, klass_idx, SQFalse);
        }
        g_free(an_name);
        g_free(raw_name);
        g_free(bn_dup);
    }

    sq_settop(v, klass_idx);
}

/* ── Build GObject class ─────────────────────────────────────────────────── */

void sqgi_gi_object_build_class(HSQUIRRELVM v, GIObjectInfo *info)
{
    /* Check for parent class */
    GIObjectInfo *parent_info = g_object_info_get_parent(info);
    SQBool has_base = SQFalse;

    if (parent_info) {
        const char *parent_ns   = g_base_info_get_namespace((GIBaseInfo *)parent_info);
        const char *parent_name = g_base_info_get_name((GIBaseInfo *)parent_info);
        char full_name[256];
        snprintf(full_name, sizeof(full_name), "%s.%s", parent_ns, parent_name);

        /* Try lookup from registry */
        if (SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, full_name))) {
            has_base = SQTrue;
        } else {
            /* Parent class not registered yet (often due load order).
             * Build it recursively now so inherited methods are available. */
            sqgi_gi_object_build_class(v, parent_info);
            has_base = SQTrue;
        }
        g_base_info_unref(parent_info);
    }

    sq_newclass(v, has_base);
    /* If has_base: the parent class was already on stack, sq_newclass consumes it */

    /* Add property metamethods.
     *
     * NOTE: These are installed AFTER the GI-derived methods below so they
     * override any introspected `set_property` / `get_property` brought in
     * by implemented interfaces (e.g. `GstChildProxy`'s versions take a
     * `GValue *` that the GI marshaller cannot construct from a plain
     * Squirrel value, which segfaults inside `g_type_check_value`).
     * `_get` / `_set` are also installed here so user property access via
     * `obj.foo = x` always goes through the native, pspec-aware path. */

    /* Wrap all methods from GI */
    gint n_methods = g_object_info_get_n_methods(info);

        /* Add methods from all implemented interfaces first.
         * Own methods added afterwards will override these if names conflict,
         * since sq_newslot on an existing class method slot updates it. */
        gint n_ifaces_impl = g_object_info_get_n_interfaces(info);
        for (gint ii = 0; ii < n_ifaces_impl; ii++) {
            GIInterfaceInfo *iface_info = g_object_info_get_interface(info, ii);
            gint ni = g_interface_info_get_n_methods(iface_info);
            for (gint j = 0; j < ni; j++) {
                GIFunctionInfo *meth = g_interface_info_get_method(iface_info, j);
                const char *mname = g_base_info_get_name((GIBaseInfo *)meth);
                sq_pushstring(v, mname, -1);
                sqgi_gi_wrap_function(v, meth);
                sq_newslot(v, -3, SQFalse);
                sqgi_note_async_method_shape(v, -1, meth);
                g_base_info_unref(meth);
            }
            g_base_info_unref(iface_info);
        }

    for (gint i = 0; i < n_methods; i++) {
        GIFunctionInfo *meth = g_object_info_get_method(info, i);
        const char *mname = g_base_info_get_name((GIBaseInfo *)meth);
        sq_pushstring(v, mname, -1);
        sqgi_gi_wrap_function(v, meth);
        sq_newslot(v, -3, SQFalse);
        sqgi_note_async_method_shape(v, -1, meth);
        g_base_info_unref(meth);
    }

    /* Signal helpers are added LAST so they override any GI method with the
     * same name (e.g. g_cancellable_connect). This mirrors PyGObject's
     * convention where obj.connect() always means signal connection. */
    add_method(v, "connect",    gobject_connect);
    add_method(v, "disconnect", gobject_disconnect);
    add_method(v, "emit",       gobject_emit);

    /* Native property accessors win over any introspected version brought
     * in by interface methods. See note above. */
    add_method(v, "_get",         gobject_get);
    add_method(v, "_set",         gobject_set);
    add_method(v, "get_property", gobject_get_property);
    add_method(v, "set_property", gobject_set_property);

    /* Register class in VM registry using "Namespace.TypeName" as key
     * AND using the plain GType name (e.g. "GCancellable") for instance
     * lookup via g_type_name(). */
    const char *ns   = g_base_info_get_namespace((GIBaseInfo *)info);
    const char *name = g_base_info_get_name((GIBaseInfo *)info);
    char full_key[256];
    snprintf(full_key, sizeof(full_key), "%s.%s", ns, name);
    sqgi_gi_object_register_class(v, full_key, -1);

    /* Also register under the GType name for runtime instance wrapping */
    GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)info);
    if (gtype != G_TYPE_NONE && gtype != G_TYPE_INVALID) {
        sqgi_gi_object_register_class(v, g_type_name(gtype), -1);

        /* Stash GType name as a static slot so sqgi.new_object(klass, {...})
         * can resolve it via g_type_from_name. */
        sq_pushstring(v, "__gtype", -1);
        sq_pushstring(v, g_type_name(gtype), -1);
        sq_newslot(v, -3, SQTrue);
    }

    sqgi_install_async_wrappers(v);

    /* class remains on stack */
}

/* ── Build Interface class ───────────────────────────────────────────────── */

void sqgi_gi_object_build_interface_class(HSQUIRRELVM v, GIInterfaceInfo *info)
{
    sq_newclass(v, SQFalse);

    gint n_methods = g_interface_info_get_n_methods(info);
    for (gint i = 0; i < n_methods; i++) {
        GIFunctionInfo *meth = g_interface_info_get_method(info, i);
        const char *mname = g_base_info_get_name((GIBaseInfo *)meth);
        sq_pushstring(v, mname, -1);
        sqgi_gi_wrap_function(v, meth);
        sq_newslot(v, -3, SQFalse);
        sqgi_note_async_method_shape(v, -1, meth);
        g_base_info_unref(meth);
    }

    add_method(v, "connect",    gobject_connect);
    add_method(v, "disconnect", gobject_disconnect);
    add_method(v, "emit",       gobject_emit);

    /* Native property accessors installed last so they win over any
     * introspected `set_property` / `get_property` on the interface. */
    add_method(v, "_get",         gobject_get);
    add_method(v, "_set",         gobject_set);
    add_method(v, "get_property", gobject_get_property);
    add_method(v, "set_property", gobject_set_property);

    const char *ns   = g_base_info_get_namespace((GIBaseInfo *)info);
    const char *name = g_base_info_get_name((GIBaseInfo *)info);
    char full_key[256];
    snprintf(full_key, sizeof(full_key), "%s.%s", ns, name);
    sqgi_gi_object_register_class(v, full_key, -1);

    GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)info);
    if (gtype != G_TYPE_NONE && gtype != G_TYPE_INVALID) {
        sqgi_gi_object_register_class(v, g_type_name(gtype), -1);
    }

    sqgi_install_async_wrappers(v);

    /* class remains on stack */
}

/* ── Struct field access ─────────────────────────────────────────────────── */

typedef struct {
    GIStructInfo *info;
} SqgiStructTypeData;

static SQInteger sqgi_struct_type_release(SQUserPointer p, SQInteger size)
{
    (void)size;
    SqgiStructTypeData *d = (SqgiStructTypeData *)p;
    if (d->info) g_base_info_unref((GIBaseInfo *)d->info);
    return 0;
}

/* The struct/union class's "_giinfo" static slot stores a userdata pointing
 * to the GIStructInfo so _get / _set can look up field offsets at runtime. */
#define SQGI_STRUCT_INFO_SLOT "__giinfo"

static GIStructInfo *sqgi_struct_info_from_instance(HSQUIRRELVM v, SQInteger idx)
{
    /* Walk: instance → class → static slot */
    if (SQ_FAILED(sq_getclass(v, idx))) return NULL;
    sq_pushstring(v, SQGI_STRUCT_INFO_SLOT, -1);
    if (SQ_FAILED(sq_get(v, -2))) {
        sq_pop(v, 1); /* pop class */
        return NULL;
    }
    SQUserPointer up = NULL;
    if (SQ_FAILED(sq_getuserdata(v, -1, &up, NULL)) || !up) {
        sq_pop(v, 2);
        return NULL;
    }
    GIStructInfo *info = ((SqgiStructTypeData *)up)->info;
    sq_pop(v, 2); /* pop userdata + class */
    return info;
}

static SQInteger sqgi_struct_get(HSQUIRRELVM v)
{
    /* Stack: [instance, key] */
    const SQChar *key;
    if (SQ_FAILED(sq_getstring(v, 2, &key))) return SQ_ERROR;

    SQUserPointer base = NULL;
    if (SQ_FAILED(sq_getinstanceup(v, 1, &base, NULL, SQFalse)) || !base)
        return sq_throwerror(v, "sqgi: struct field access on non-instance");

    GIStructInfo *info = sqgi_struct_info_from_instance(v, 1);
    if (!info) return sq_throwerror(v, "sqgi: missing struct type info");

    gint n_fields = g_struct_info_get_n_fields(info);
    for (gint i = 0; i < n_fields; i++) {
        GIFieldInfo *fi = g_struct_info_get_field(info, i);
        const char *fname = g_base_info_get_name((GIBaseInfo *)fi);
        if (fname && strcmp(fname, key) == 0) {
            GIArgument val;
            memset(&val, 0, sizeof(val));
            if (g_field_info_get_field(fi, base, &val)) {
                GITypeInfo *ti = g_field_info_get_type(fi);
                sqgi_push_gi_argument(v, &val, ti, GI_TRANSFER_NOTHING);
                g_base_info_unref(ti);
                g_base_info_unref(fi);
                return 1;
            }
            g_base_info_unref(fi);
            return sq_throwerror(v, "sqgi: failed to read struct field");
        }
        g_base_info_unref(fi);
    }
    return sq_throwerror(v, "the index doesn't exist");
}

static SQInteger sqgi_struct_set(HSQUIRRELVM v)
{
    /* Stack: [instance, key, value] */
    const SQChar *key;
    if (SQ_FAILED(sq_getstring(v, 2, &key))) return SQ_ERROR;

    SQUserPointer base = NULL;
    if (SQ_FAILED(sq_getinstanceup(v, 1, &base, NULL, SQFalse)) || !base)
        return sq_throwerror(v, "sqgi: struct field write on non-instance");

    GIStructInfo *info = sqgi_struct_info_from_instance(v, 1);
    if (!info) return sq_throwerror(v, "sqgi: missing struct type info");

    gint n_fields = g_struct_info_get_n_fields(info);
    for (gint i = 0; i < n_fields; i++) {
        GIFieldInfo *fi = g_struct_info_get_field(info, i);
        const char *fname = g_base_info_get_name((GIBaseInfo *)fi);
        if (fname && strcmp(fname, key) == 0) {
            GITypeInfo *ti = g_field_info_get_type(fi);
            GIArgument val;
            if (SQ_FAILED(sqgi_get_gi_argument(v, 3, &val, ti))) {
                g_base_info_unref(ti);
                g_base_info_unref(fi);
                return SQ_ERROR;
            }
            gboolean ok = g_field_info_set_field(fi, base, &val);
            g_base_info_unref(ti);
            g_base_info_unref(fi);
            if (!ok) return sq_throwerror(v, "sqgi: failed to write struct field");
            return 0;
        }
        g_base_info_unref(fi);
    }
    return sq_throwerror(v, "the index doesn't exist");
}

void sqgi_gi_object_build_struct_class(HSQUIRRELVM v, GIStructInfo *info)
{
    sq_newclass(v, SQFalse);

    /* Store a userdata referencing the GIStructInfo so _get/_set can resolve
     * fields by name at runtime. */
    sq_pushstring(v, SQGI_STRUCT_INFO_SLOT, -1);
    SqgiStructTypeData *td = (SqgiStructTypeData *)sq_newuserdata(v, sizeof(SqgiStructTypeData));
    td->info = (GIStructInfo *)g_base_info_ref((GIBaseInfo *)info);
    sq_setreleasehook(v, -1, sqgi_struct_type_release);
    sq_newslot(v, -3, SQTrue);

    /* Field _get / _set */
    add_method(v, "_get", sqgi_struct_get);
    add_method(v, "_set", sqgi_struct_set);

    gint n_methods = g_struct_info_get_n_methods(info);
    for (gint i = 0; i < n_methods; i++) {
        GIFunctionInfo *meth = g_struct_info_get_method(info, i);
        const char *mname = g_base_info_get_name((GIBaseInfo *)meth);
        sq_pushstring(v, mname, -1);
        sqgi_gi_wrap_function(v, meth);
        sq_newslot(v, -3, SQFalse);
        g_base_info_unref(meth);
    }

    const char *ns   = g_base_info_get_namespace((GIBaseInfo *)info);
    const char *name = g_base_info_get_name((GIBaseInfo *)info);
    char full_key[256];
    snprintf(full_key, sizeof(full_key), "%s.%s", ns, name);
    sqgi_gi_object_register_class(v, full_key, -1);

    GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)info);
    if (gtype != G_TYPE_NONE && gtype != G_TYPE_INVALID) {
        sqgi_gi_object_register_class(v, g_type_name(gtype), -1);
    }
}

/* ── Push GObject instance ───────────────────────────────────────────────── */

void sqgi_gi_object_push_instance(HSQUIRRELVM v, GObject *obj)
{
    if (!obj) { sq_pushnull(v); return; }

    GType gtype = G_OBJECT_TYPE(obj);
    /* Walk up the type hierarchy until we find a registered class */
    GType t = gtype;
    while (t != G_TYPE_INVALID && t != G_TYPE_OBJECT) {
        const char *tname = g_type_name(t);
        /* Build lookup key; GType names are plain (e.g. "GtkButton"),
         * but registry uses "Namespace.Name".  Try both. */
        if (SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, tname))) {
            goto create_inst;
        }
        t = g_type_parent(t);
    }

    /* Second pass: check GInterfaces implemented by the concrete type.
     * This handles cases where the concrete class (e.g. GLocalFile) is never
     * registered but an interface it implements (e.g. GFile / Gio.File) is.
     * Walk from the concrete type upward so most-derived interface is preferred. */
    t = gtype;
    while (t != G_TYPE_INVALID && t != G_TYPE_OBJECT) {
        guint n_ifaces = 0;
        GType *ifaces = g_type_interfaces(t, &n_ifaces);
        for (guint ii = 0; ii < n_ifaces; ii++) {
            const char *iname = g_type_name(ifaces[ii]);
            if (iname && SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, iname))) {
                g_free(ifaces);
                goto create_inst;
            }
        }
        g_free(ifaces);
        t = g_type_parent(t);
    }

    /* Fallback: push as raw userpointer */
    sq_pushuserpointer(v, obj);
    return;

create_inst:
    /* class is on top; create instance */
    sq_createinstance(v, -1);
    sq_remove(v, -2); /* remove class from under instance */
    sq_setinstanceup(v, -1, obj);
    /* Set a release hook so _gc fires */
    /* (releasehook is called when instance is finalized) */
    sq_setreleasehook(v, -1, gobject_release_hook);
}

/* ── sqgi.new_object(klass, {prop=value, ...}) ───────────────────────────── */

static SQInteger sq_fn_new_object(HSQUIRRELVM v)
{
    if (sq_gettype(v, 2) != OT_CLASS)
        return sq_throwerror(v, "new_object: expected class as first argument");
    if (sq_gettype(v, 3) != OT_TABLE)
        return sq_throwerror(v, "new_object: expected table as second argument");

    /* Read klass.__gtype */
    sq_push(v, 2);
    sq_pushstring(v, "__gtype", -1);
    if (SQ_FAILED(sq_get(v, -2)))
        return sq_throwerror(v, "new_object: class has no __gtype slot (not a GObject class?)");
    const SQChar *type_name = NULL;
    if (SQ_FAILED(sq_getstring(v, -1, &type_name)) || !type_name) {
        sq_pop(v, 2);
        return sq_throwerror(v, "new_object: __gtype must be a string");
    }
    GType gtype = g_type_from_name(type_name);
    sq_pop(v, 2);
    if (gtype == G_TYPE_INVALID)
        return sq_throwerror(v, "new_object: unknown GType");
    if (!g_type_is_a(gtype, G_TYPE_OBJECT))
        return sq_throwerror(v, "new_object: GType is not a GObject subtype");

    /* Look up the class's properties via GObjectClass to validate names and
     * pick the correct GValue type for each property. */
    GObjectClass *oclass = g_type_class_ref(gtype);
    if (!oclass)
        return sq_throwerror(v, "new_object: could not ref class");

    /* Iterate the props table, building parallel arrays. */
    GArray *names  = g_array_new(FALSE, FALSE, sizeof(const char *));
    GArray *values = g_array_new(FALSE, FALSE, sizeof(GValue));

    sq_push(v, 3); /* table */
    sq_pushnull(v);
    while (SQ_SUCCEEDED(sq_next(v, -2))) {
        /* stack: [..., table, iter, key, value] */
        const SQChar *pname = NULL;
        if (SQ_FAILED(sq_getstring(v, -2, &pname)) || !pname) {
            sq_pop(v, 2);
            continue;
        }

        GParamSpec *pspec = g_object_class_find_property(oclass, pname);
        if (!pspec) {
            /* Clean up and throw. */
            for (guint i = 0; i < values->len; i++)
                g_value_unset(&g_array_index(values, GValue, i));
            g_array_free(names, TRUE);
            g_array_free(values, TRUE);
            g_type_class_unref(oclass);
            sq_pop(v, 4);
            return sq_throwerror(v, "new_object: unknown property");
        }

        GValue gv = G_VALUE_INIT;
        g_value_init(&gv, G_PARAM_SPEC_VALUE_TYPE(pspec));
        if (SQ_FAILED(sqgi_get_gvalue(v, -1, &gv))) {
            g_value_unset(&gv);
            for (guint i = 0; i < values->len; i++)
                g_value_unset(&g_array_index(values, GValue, i));
            g_array_free(names, TRUE);
            g_array_free(values, TRUE);
            g_type_class_unref(oclass);
            sq_pop(v, 4);
            return sq_throwerror(v, "new_object: failed to marshal property value");
        }

        /* Store the canonical property name returned by GLib (lives for the
         * lifetime of the class), not the Squirrel string. */
        const char *canonical = g_intern_string(pname);
        g_array_append_val(names,  canonical);
        g_array_append_val(values, gv);
        sq_pop(v, 2); /* key, value */
    }
    sq_pop(v, 2); /* null iter, table */

    GObject *obj = g_object_new_with_properties(
        gtype,
        names->len,
        (const char **)names->data,
        (const GValue *)values->data);

    /* Release intermediate GValues + arrays. */
    for (guint i = 0; i < values->len; i++)
        g_value_unset(&g_array_index(values, GValue, i));
    g_array_free(names, TRUE);
    g_array_free(values, TRUE);
    g_type_class_unref(oclass);

    if (!obj)
        return sq_throwerror(v, "new_object: g_object_new_with_properties returned NULL");

    /* Sink a floating ref if the type uses g_initially_unowned (GtkWidget etc). */
    if (g_object_is_floating(obj)) {
        g_object_ref_sink(obj);
    }

    sqgi_gi_object_push_instance(v, obj);
    return 1;
}

void sqgi_gi_object_register_helpers(HSQUIRRELVM v)
{
    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) {
        sq_pop(v, 1);
        return;
    }
    /* stack: [root, sqgi] */
    sq_pushstring(v, "new_object", -1);
    sq_newclosure(v, sq_fn_new_object, 0);
    sq_setnativeclosurename(v, -1, "new_object");
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 2); /* sqgi, root */
}
