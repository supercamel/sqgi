#include "sqgi_marshal.h"
#include "sqgi_gi_object.h"
#include "sqgi_gerror.h"
#include "sqgi_cairo.h"

#include <string.h>
#include <stdio.h>

/* ── GVariant → Squirrel (recursive) ─────────────────────────────────────── */

static void sqgi_push_gvariant(HSQUIRRELVM v, GVariant *gv)
{
    if (!gv) { sq_pushnull(v); return; }

    switch (g_variant_classify(gv)) {
    case G_VARIANT_CLASS_BOOLEAN:
        sq_pushbool(v, g_variant_get_boolean(gv) ? SQTrue : SQFalse);
        return;
    case G_VARIANT_CLASS_BYTE:
        sq_pushinteger(v, (SQInteger)g_variant_get_byte(gv));
        return;
    case G_VARIANT_CLASS_INT16:
        sq_pushinteger(v, (SQInteger)g_variant_get_int16(gv));
        return;
    case G_VARIANT_CLASS_UINT16:
        sq_pushinteger(v, (SQInteger)g_variant_get_uint16(gv));
        return;
    case G_VARIANT_CLASS_INT32:
        sq_pushinteger(v, (SQInteger)g_variant_get_int32(gv));
        return;
    case G_VARIANT_CLASS_UINT32:
        sq_pushinteger(v, (SQInteger)g_variant_get_uint32(gv));
        return;
    case G_VARIANT_CLASS_INT64:
        sq_pushinteger(v, (SQInteger)g_variant_get_int64(gv));
        return;
    case G_VARIANT_CLASS_UINT64:
        sq_pushinteger(v, (SQInteger)g_variant_get_uint64(gv));
        return;
    case G_VARIANT_CLASS_HANDLE:
        sq_pushinteger(v, (SQInteger)g_variant_get_handle(gv));
        return;
    case G_VARIANT_CLASS_DOUBLE:
        sq_pushfloat(v, (SQFloat)g_variant_get_double(gv));
        return;
    case G_VARIANT_CLASS_STRING:
    case G_VARIANT_CLASS_OBJECT_PATH:
    case G_VARIANT_CLASS_SIGNATURE: {
        const char *s = g_variant_get_string(gv, NULL);
        if (s) sq_pushstring(v, s, -1);
        else   sq_pushnull(v);
        return;
    }
    case G_VARIANT_CLASS_VARIANT: {
        GVariant *inner = g_variant_get_variant(gv);
        sqgi_push_gvariant(v, inner);
        if (inner) g_variant_unref(inner);
        return;
    }
    case G_VARIANT_CLASS_MAYBE: {
        GVariant *inner = g_variant_get_maybe(gv);
        if (inner) {
            sqgi_push_gvariant(v, inner);
            g_variant_unref(inner);
        } else {
            sq_pushnull(v);
        }
        return;
    }
    case G_VARIANT_CLASS_ARRAY: {
        /* Dictionary (a{?*}) → Squirrel table */
        if (g_variant_is_of_type(gv, G_VARIANT_TYPE_DICTIONARY)) {
            sq_newtable(v);
            GVariantIter iter;
            GVariant *entry;
            g_variant_iter_init(&iter, gv);
            while ((entry = g_variant_iter_next_value(&iter))) {
                GVariant *key = g_variant_get_child_value(entry, 0);
                GVariant *val = g_variant_get_child_value(entry, 1);
                sqgi_push_gvariant(v, key);
                sqgi_push_gvariant(v, val);
                sq_rawset(v, -3);
                g_variant_unref(key);
                g_variant_unref(val);
                g_variant_unref(entry);
            }
            return;
        }
        /* Bytestring (ay with NUL terminator) → Squirrel string */
        if (g_variant_is_of_type(gv, G_VARIANT_TYPE_BYTESTRING)) {
            const char *data = g_variant_get_bytestring(gv);
            sq_pushstring(v, data ? data : "", -1);
            return;
        }
        sq_newarray(v, 0);
        GVariantIter iter;
        GVariant *child;
        g_variant_iter_init(&iter, gv);
        while ((child = g_variant_iter_next_value(&iter))) {
            sqgi_push_gvariant(v, child);
            sq_arrayappend(v, -2);
            g_variant_unref(child);
        }
        return;
    }
    case G_VARIANT_CLASS_TUPLE: {
        gsize n = g_variant_n_children(gv);
        sq_newarray(v, 0);
        for (gsize i = 0; i < n; i++) {
            GVariant *child = g_variant_get_child_value(gv, i);
            sqgi_push_gvariant(v, child);
            sq_arrayappend(v, -2);
            g_variant_unref(child);
        }
        return;
    }
    case G_VARIANT_CLASS_DICT_ENTRY: {
        GVariant *key = g_variant_get_child_value(gv, 0);
        GVariant *val = g_variant_get_child_value(gv, 1);
        sq_newarray(v, 0);
        sqgi_push_gvariant(v, key);
        sq_arrayappend(v, -2);
        sqgi_push_gvariant(v, val);
        sq_arrayappend(v, -2);
        g_variant_unref(key);
        g_variant_unref(val);
        return;
    }
    }
    sq_pushnull(v);
}

/* ── GIArgument → Squirrel ───────────────────────────────────────────────── */

void sqgi_push_gi_argument(HSQUIRRELVM v, GIArgument *arg,
                           GITypeInfo *type_info, GITransfer transfer)
{
    GITypeTag tag = g_type_info_get_tag(type_info);

    switch (tag) {
    case GI_TYPE_TAG_VOID:
        sq_pushnull(v);
        break;

    case GI_TYPE_TAG_BOOLEAN:
        sq_pushbool(v, arg->v_boolean ? SQTrue : SQFalse);
        break;

    case GI_TYPE_TAG_INT8:
        sq_pushinteger(v, (SQInteger)arg->v_int8);
        break;
    case GI_TYPE_TAG_UINT8:
        sq_pushinteger(v, (SQInteger)arg->v_uint8);
        break;
    case GI_TYPE_TAG_INT16:
        sq_pushinteger(v, (SQInteger)arg->v_int16);
        break;
    case GI_TYPE_TAG_UINT16:
        sq_pushinteger(v, (SQInteger)arg->v_uint16);
        break;
    case GI_TYPE_TAG_INT32:
        sq_pushinteger(v, (SQInteger)arg->v_int32);
        break;
    case GI_TYPE_TAG_UINT32:
        sq_pushinteger(v, (SQInteger)arg->v_uint32);
        break;
    case GI_TYPE_TAG_INT64:
        sq_pushinteger(v, (SQInteger)arg->v_int64);
        break;
    case GI_TYPE_TAG_UINT64:
        sq_pushinteger(v, (SQInteger)arg->v_uint64);
        break;

    case GI_TYPE_TAG_FLOAT:
        sq_pushfloat(v, (SQFloat)arg->v_float);
        break;
    case GI_TYPE_TAG_DOUBLE:
        sq_pushfloat(v, (SQFloat)arg->v_double);
        break;

    case GI_TYPE_TAG_GTYPE:
        sq_pushinteger(v, (SQInteger)arg->v_size);
        break;

    case GI_TYPE_TAG_UTF8:
    case GI_TYPE_TAG_FILENAME: {
        const char *s = arg->v_string;
        if (s) {
            sq_pushstring(v, s, -1);
            if (transfer == GI_TRANSFER_EVERYTHING) g_free(arg->v_string);
        } else {
            sq_pushnull(v);
        }
        break;
    }

    case GI_TYPE_TAG_INTERFACE: {
        GIBaseInfo *iface = g_type_info_get_interface(type_info);
        GIInfoType itype = g_base_info_get_type(iface);

        if (itype == GI_INFO_TYPE_ENUM || itype == GI_INFO_TYPE_FLAGS) {
            sq_pushinteger(v, (SQInteger)arg->v_int32);
        } else if (itype == GI_INFO_TYPE_OBJECT || itype == GI_INFO_TYPE_INTERFACE) {
            if (arg->v_pointer) {
                GObject *obj = G_OBJECT(arg->v_pointer);
                /* Floating-ref handling: a method or function that returns a
                 * floating GInitiallyUnowned (Gtk widgets, GtkTreeIter ctors,
                 * etc.) needs the float sunk so the wrapper's strong ref
                 * keeps the object alive. Without this, the object dies the
                 * next time anything calls g_object_ref_sink on it (e.g. a
                 * container.append() call), even though Squirrel still holds
                 * the wrapper. */
                if (g_object_is_floating(obj)) {
                    g_object_ref_sink(obj);     /* claim the float */
                    sqgi_push_gobject(v, obj);   /* +1 for wrapper */
                    g_object_unref(obj);        /* release our claim */
                } else if (transfer == GI_TRANSFER_NOTHING) {
                    g_object_ref(obj);
                    sqgi_push_gobject(v, obj);
                    g_object_unref(obj);
                } else {
                    /* TRANSFER_EVERYTHING / CONTAINER: callee gave us
                     * ownership; transfer it to the wrapper. */
                    sqgi_push_gobject(v, obj);
                    g_object_unref(obj);
                }
            } else {
                sq_pushnull(v);
            }
        } else if (itype == GI_INFO_TYPE_STRUCT ||
                   itype == GI_INFO_TYPE_BOXED ||
                   itype == GI_INFO_TYPE_UNION) {
            /* Special-case GVariant: unwrap into native Squirrel values
             * (bool/int/float/string/array/table) rather than presenting an
             * opaque wrapper, since GVariant is the canonical "dynamic value"
             * type in GLib (option dicts, GAction state, GSettings, etc.). */
            GType gtype = g_registered_type_info_get_g_type(
                (GIRegisteredTypeInfo *)iface);
            if (gtype == G_TYPE_VARIANT) {
                GVariant *gv = (GVariant *)arg->v_pointer;
                sqgi_push_gvariant(v, gv);
                if (gv && transfer == GI_TRANSFER_EVERYTHING) {
                    g_variant_unref(gv);
                }
                g_base_info_unref(iface);
                break;
            }
            if (arg->v_pointer) {
                const char *ns = g_base_info_get_namespace(iface);
                const char *name = g_base_info_get_name(iface);
                char full_key[256];
                snprintf(full_key, sizeof(full_key), "%s.%s", ns, name);
                /* Foreign records (cairo_t, …) need a native binding that
                 * knows how to ref/unref them. */
                if (itype == GI_INFO_TYPE_STRUCT &&
                    g_struct_info_is_foreign((GIStructInfo *)iface)) {
                    if (sqgi_cairo_try_push_foreign(
                            v, full_key, arg->v_pointer,
                            transfer == GI_TRANSFER_EVERYTHING)) {
                        g_base_info_unref(iface);
                        break;
                    }
                }
                if (SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, full_key))) {
                    sq_createinstance(v, -1);
                    sq_remove(v, -2);
                    sq_setinstanceup(v, -1, arg->v_pointer);
                    /* If the callee transferred ownership of a refcounted
                     * boxed (GVariant / GBytes / G_TYPE_BOXED descendant),
                     * arrange for the Squirrel GC to release it. */
                    if (transfer == GI_TRANSFER_EVERYTHING) {
                        sqgi_boxed_track_ownership(v, -1, arg->v_pointer, gtype);
                    }
                } else {
                    sq_pushuserpointer(v, arg->v_pointer);
                }
            } else {
                sq_pushnull(v);
            }
        } else {
            sq_pushnull(v);
        }
        g_base_info_unref(iface);
        break;
    }

    case GI_TYPE_TAG_ARRAY: {
        /* Convert to a Squirrel array */
        GIArrayType atype = g_type_info_get_array_type(type_info);
        GITypeInfo *param = g_type_info_get_param_type(type_info, 0);
        GITypeTag elem_tag = g_type_info_get_tag(param);
        sq_newarray(v, 0);

        if (atype == GI_ARRAY_TYPE_C && arg->v_pointer) {
            gint len = g_type_info_get_array_length(type_info);
            /* Fixed-length or NULL-terminated */
            if (len < 0) {
                /* NULL-terminated array of pointers */
                gpointer *arr = (gpointer *)arg->v_pointer;
                for (gint i = 0; arr[i]; i++) {
                    GIArgument elem = { .v_pointer = arr[i] };
                    sqgi_push_gi_argument(v, &elem, param, GI_TRANSFER_NOTHING);
                    sq_arrayappend(v, -2);
                }
            } else {
                for (gint i = 0; i < len; i++) {
                    /* Fixed-size element access not trivially generic here;
                     * for now handle pointer arrays only */
                    gpointer *arr = (gpointer *)arg->v_pointer;
                    GIArgument elem = { .v_pointer = arr[i] };
                    sqgi_push_gi_argument(v, &elem, param, GI_TRANSFER_NOTHING);
                    sq_arrayappend(v, -2);
                }
            }
            /* Free the array spine / contents as required by the GIR
             * transfer annotation. We only know how to free a few element
             * kinds — refuse to free anything else to avoid double-free. */
            if (transfer == GI_TRANSFER_EVERYTHING &&
                (elem_tag == GI_TYPE_TAG_UTF8 || elem_tag == GI_TYPE_TAG_FILENAME)) {
                g_strfreev((char **)arg->v_pointer);
                arg->v_pointer = NULL;
            } else if (transfer == GI_TRANSFER_CONTAINER ||
                       (transfer == GI_TRANSFER_EVERYTHING && len < 0)) {
                /* Plain pointer-array spine (no per-element teardown we
                 * can safely apply): free just the array. */
                g_free(arg->v_pointer);
                arg->v_pointer = NULL;
            }
        } else if (atype == GI_ARRAY_TYPE_PTR_ARRAY) {
            GPtrArray *pa = (GPtrArray *)arg->v_pointer;
            if (pa) {
                for (guint pi = 0; pi < pa->len; pi++) {
                    GIArgument elem = { .v_pointer = pa->pdata[pi] };
                    sqgi_push_gi_argument(v, &elem, param, GI_TRANSFER_NOTHING);
                    sq_arrayappend(v, -2);
                }
                if (transfer == GI_TRANSFER_EVERYTHING ||
                    transfer == GI_TRANSFER_CONTAINER) {
                    g_ptr_array_unref(pa);
                    arg->v_pointer = NULL;
                }
            }
        }
        g_base_info_unref(param);
        break;
    }

    case GI_TYPE_TAG_GLIST:
    case GI_TYPE_TAG_GSLIST: {
        GITypeInfo *param = g_type_info_get_param_type(type_info, 0);
        gboolean is_slist = (g_type_info_get_tag(type_info) == GI_TYPE_TAG_GSLIST);
        sq_newarray(v, 0);
        for (GList *l = (GList *)arg->v_pointer; l; l = l->next) {
            GIArgument elem = { .v_pointer = l->data };
            sqgi_push_gi_argument(v, &elem, param, GI_TRANSFER_NOTHING);
            sq_arrayappend(v, -2);
        }
        /* Container-or-full transfer ⇒ free the spine; we don't have a
         * generic per-element freer so transfer-full degrades to
         * container (leaks elements, never double-frees). */
        if (arg->v_pointer && (transfer == GI_TRANSFER_CONTAINER ||
                               transfer == GI_TRANSFER_EVERYTHING)) {
            if (is_slist) g_slist_free((GSList *)arg->v_pointer);
            else          g_list_free((GList *)arg->v_pointer);
            arg->v_pointer = NULL;
        }
        g_base_info_unref(param);
        break;
    }

    case GI_TYPE_TAG_GHASH: {
        GITypeInfo *key_type = g_type_info_get_param_type(type_info, 0);
        GITypeInfo *val_type = g_type_info_get_param_type(type_info, 1);
        sq_newtable(v);
        if (arg->v_pointer) {
            GHashTableIter iter;
            gpointer key, val;
            g_hash_table_iter_init(&iter, (GHashTable *)arg->v_pointer);
            while (g_hash_table_iter_next(&iter, &key, &val)) {
                GIArgument ka = { .v_pointer = key };
                GIArgument va = { .v_pointer = val };
                sqgi_push_gi_argument(v, &ka, key_type, GI_TRANSFER_NOTHING);
                sqgi_push_gi_argument(v, &va, val_type, GI_TRANSFER_NOTHING);
                sq_rawset(v, -3);
            }
        }
        g_base_info_unref(key_type);
        g_base_info_unref(val_type);
        break;
    }

    case GI_TYPE_TAG_ERROR: {
        GError *err = (GError *)arg->v_pointer;
        sqgi_gerror_push(v, err);
        break;
    }

    default:
        sq_pushnull(v);
        break;
    }
}

/* ── Squirrel → GIArgument ───────────────────────────────────────────────── */

SQRESULT sqgi_get_gi_argument(HSQUIRRELVM v, SQInteger idx,
                              GIArgument *arg, GITypeInfo *type_info)
{
    GITypeTag tag = g_type_info_get_tag(type_info);
    memset(arg, 0, sizeof(*arg));

    switch (tag) {
    /* null/nil: treat as GI NULL pointer for any nullable param */
    case GI_TYPE_TAG_VOID:
        break;

    default:
        /* Check for null first — memset already zeroed the arg */
        if (sq_gettype(v, idx) == OT_NULL) {
            arg->v_pointer = NULL;
            return SQ_OK;
        }
        /* fall through into real tag dispatch */
        break;
    }

    /* Reset and dispatch properly */
    switch (tag) {
    case GI_TYPE_TAG_VOID:
        break;

    case GI_TYPE_TAG_ARRAY:
    {
        GIArrayType atype = g_type_info_get_array_type(type_info);
        GITypeInfo *param = g_type_info_get_param_type(type_info, 0);
        GITypeTag ptag = g_type_info_get_tag(param);

        /* Support C arrays of bytes (uint8/int8) from a Squirrel string. */
        if (atype == GI_ARRAY_TYPE_C &&
            (ptag == GI_TYPE_TAG_UINT8 || ptag == GI_TYPE_TAG_INT8) &&
            sq_gettype(v, idx) == OT_STRING) {
            const SQChar *s = NULL;
            SQInteger slen = 0;
            if (SQ_SUCCEEDED(sq_getstring(v, idx, &s)) && s) {
                slen = sq_getsize(v, idx);
                /* The data lifetime is tied to the Squirrel string on the
                 * stack — safe for the duration of the synchronous call. */
                arg->v_pointer = (gpointer)s;
                (void)slen;
            } else {
                arg->v_pointer = NULL;
            }
            g_base_info_unref(param);
            break;
        }

        /* Support C arrays of UTF-8 strings (char**), used by APIs like
         * Gio.Application.run(argc, argv). */
        if (atype == GI_ARRAY_TYPE_C &&
            (ptag == GI_TYPE_TAG_UTF8 || ptag == GI_TYPE_TAG_FILENAME) &&
            (sq_gettype(v, idx) == OT_ARRAY || sq_gettype(v, idx) == OT_TABLE)) {

            SQInteger n = sq_getsize(v, idx);
            if (n < 0) {
                g_base_info_unref(param);
                return sq_throwerror(v, "sqgi: invalid array size for string array argument");
            }

            char **strv = g_new0(char *, (gsize)n + 1);
            for (SQInteger i = 0; i < n; i++) {
                const SQChar *s = NULL;

                sq_push(v, idx);
                sq_pushinteger(v, i);
                if (SQ_SUCCEEDED(sq_get(v, -2)) && SQ_SUCCEEDED(sq_getstring(v, -1, &s)) && s) {
                    strv[i] = g_strdup(s);
                } else {
                    strv[i] = g_strdup("");
                }
                sq_pop(v, 2);
            }
            strv[n] = NULL;
            arg->v_pointer = strv;

            g_base_info_unref(param);
            break;
        }

        /* C arrays of interface-typed pointers: GObject*, GVariant*,
         * boxed records, etc. Used by GVariant.new_tuple/new_array,
         * g_object_bind_property_with_closures, GListStore.splice, …
         * We build a gpointer[] of the underlying instance pointers and
         * hand it to the callee. Element ownership is NOT transferred —
         * we only own the spine array, freed in the caller post-dispatch. */
        if (atype == GI_ARRAY_TYPE_C && ptag == GI_TYPE_TAG_INTERFACE &&
            (sq_gettype(v, idx) == OT_ARRAY || sq_gettype(v, idx) == OT_TABLE)) {

            SQInteger n = sq_getsize(v, idx);
            if (n < 0) {
                g_base_info_unref(param);
                return sq_throwerror(v, "sqgi: invalid array size for interface array argument");
            }

            gpointer *ptrv = g_new0(gpointer, (gsize)n + 1);
            for (SQInteger i = 0; i < n; i++) {
                sq_push(v, idx);
                sq_pushinteger(v, i);
                if (SQ_SUCCEEDED(sq_get(v, -2))) {
                    SQUserPointer up = NULL;
                    if (sq_gettype(v, -1) == OT_NULL) {
                        ptrv[i] = NULL;
                    } else if (SQ_SUCCEEDED(sq_getinstanceup(v, -1, &up, NULL, SQFalse)) && up) {
                        ptrv[i] = up;
                    } else if (SQ_SUCCEEDED(sq_getuserpointer(v, -1, &up))) {
                        ptrv[i] = up;
                    } else {
                        ptrv[i] = NULL;
                    }
                }
                sq_pop(v, 2);
            }
            ptrv[n] = NULL;
            arg->v_pointer = ptrv;

            g_base_info_unref(param);
            break;
        }

        g_base_info_unref(param);
        /* Keep legacy behavior for unsupported array shapes: pass NULL rather
         * than failing hard, so unrelated APIs continue to work. */
        arg->v_pointer = NULL;
        break;
    }

    case GI_TYPE_TAG_BOOLEAN: {
        SQBool b;
        if (SQ_FAILED(sq_getbool(v, idx, &b))) return SQ_ERROR;
        arg->v_boolean = b ? TRUE : FALSE;
        break;
    }

    case GI_TYPE_TAG_INT8:
    case GI_TYPE_TAG_INT16:
    case GI_TYPE_TAG_INT32:
    case GI_TYPE_TAG_INT64: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        if (tag == GI_TYPE_TAG_INT8)  arg->v_int8  = (gint8)i;
        if (tag == GI_TYPE_TAG_INT16) arg->v_int16 = (gint16)i;
        if (tag == GI_TYPE_TAG_INT32) arg->v_int32 = (gint32)i;
        if (tag == GI_TYPE_TAG_INT64) arg->v_int64 = (gint64)i;
        break;
    }

    case GI_TYPE_TAG_UINT8:
    case GI_TYPE_TAG_UINT16:
    case GI_TYPE_TAG_UINT32:
    case GI_TYPE_TAG_UINT64: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        if (tag == GI_TYPE_TAG_UINT8)  arg->v_uint8  = (guint8)i;
        if (tag == GI_TYPE_TAG_UINT16) arg->v_uint16 = (guint16)i;
        if (tag == GI_TYPE_TAG_UINT32) arg->v_uint32 = (guint32)i;
        if (tag == GI_TYPE_TAG_UINT64) arg->v_uint64 = (guint64)i;
        break;
    }

    case GI_TYPE_TAG_FLOAT:
    case GI_TYPE_TAG_DOUBLE: {
        SQFloat f;
        if (SQ_FAILED(sq_getfloat(v, idx, &f))) return SQ_ERROR;
        if (tag == GI_TYPE_TAG_FLOAT)  arg->v_float  = (gfloat)f;
        if (tag == GI_TYPE_TAG_DOUBLE) arg->v_double = (gdouble)f;
        break;
    }

    case GI_TYPE_TAG_UTF8:
    case GI_TYPE_TAG_FILENAME: {
        const SQChar *s;
        if (SQ_FAILED(sq_getstring(v, idx, &s))) return SQ_ERROR;
        arg->v_string = (char *)s; /* GI will not take ownership from us */
        break;
    }

    case GI_TYPE_TAG_INTERFACE: {
        GIBaseInfo *iface = g_type_info_get_interface(type_info);
        GIInfoType itype = g_base_info_get_type(iface);
        if (itype == GI_INFO_TYPE_ENUM || itype == GI_INFO_TYPE_FLAGS) {
            SQInteger i;
            if (SQ_FAILED(sq_getinteger(v, idx, &i))) {
                g_base_info_unref(iface);
                return SQ_ERROR;
            }
            arg->v_int32 = (gint32)i;
        } else if (itype == GI_INFO_TYPE_OBJECT || itype == GI_INFO_TYPE_INTERFACE) {
            GObject *obj = sqgi_get_gobject(v, idx);
            if (!obj) { g_base_info_unref(iface); return SQ_ERROR; }
            arg->v_pointer = obj;
        } else {
            SQUserPointer p = NULL;
            if (SQ_SUCCEEDED(sq_getinstanceup(v, idx, &p, NULL, SQFalse)) && p) {
                arg->v_pointer = p;
            } else {
                if (SQ_FAILED(sq_getuserpointer(v, idx, &p))) {
                    g_base_info_unref(iface);
                    return SQ_ERROR;
                }
                arg->v_pointer = p;
            }
        }
        g_base_info_unref(iface);
        break;
    }

    default:
        return sq_throwerror(v, "sqgi: unsupported argument type");
    }

    return SQ_OK;
}

/* ── GValue ↔ Squirrel ───────────────────────────────────────────────────── */

void sqgi_push_gvalue(HSQUIRRELVM v, const GValue *gval)
{
    GType type = G_VALUE_TYPE(gval);

    switch (G_TYPE_FUNDAMENTAL(type)) {
    case G_TYPE_BOOLEAN:
        sq_pushbool(v, g_value_get_boolean(gval) ? SQTrue : SQFalse);
        return;
    case G_TYPE_INT:
        sq_pushinteger(v, (SQInteger)g_value_get_int(gval));
        return;
    case G_TYPE_UINT:
        sq_pushinteger(v, (SQInteger)g_value_get_uint(gval));
        return;
    case G_TYPE_LONG:
        sq_pushinteger(v, (SQInteger)g_value_get_long(gval));
        return;
    case G_TYPE_ULONG:
        sq_pushinteger(v, (SQInteger)g_value_get_ulong(gval));
        return;
    case G_TYPE_INT64:
        sq_pushinteger(v, (SQInteger)g_value_get_int64(gval));
        return;
    case G_TYPE_UINT64:
        sq_pushinteger(v, (SQInteger)g_value_get_uint64(gval));
        return;
    case G_TYPE_FLOAT:
        sq_pushfloat(v, (SQFloat)g_value_get_float(gval));
        return;
    case G_TYPE_DOUBLE:
        sq_pushfloat(v, (SQFloat)g_value_get_double(gval));
        return;
    case G_TYPE_STRING: {
        const char *s = g_value_get_string(gval);
        if (s) sq_pushstring(v, s, -1);
        else   sq_pushnull(v);
        return;
    }
    case G_TYPE_ENUM:
        sq_pushinteger(v, (SQInteger)g_value_get_enum(gval));
        return;
    case G_TYPE_FLAGS:
        sq_pushinteger(v, (SQInteger)g_value_get_flags(gval));
        return;
    case G_TYPE_OBJECT:
    case G_TYPE_INTERFACE: {
        GObject *obj = (GObject *)g_value_get_object(gval);
        if (obj) sqgi_push_gobject(v, obj);
        else     sq_pushnull(v);
        return;
    }
    case G_TYPE_PARAM: {
        /* GParamSpec — surface as a small Squirrel table with name/nick/blurb
         * so notify:: handlers can read pspec.name without us having to wrap
         * the GParamSpec hierarchy as instance classes. */
        GParamSpec *pspec = g_value_get_param(gval);
        if (!pspec) { sq_pushnull(v); return; }
        sq_newtable(v);
        sq_pushstring(v, "name", -1);
        sq_pushstring(v, g_param_spec_get_name(pspec), -1);
        sq_rawset(v, -3);
        sq_pushstring(v, "nick", -1);
        const char *nick = g_param_spec_get_nick(pspec);
        if (nick) sq_pushstring(v, nick, -1); else sq_pushnull(v);
        sq_rawset(v, -3);
        sq_pushstring(v, "blurb", -1);
        const char *blurb = g_param_spec_get_blurb(pspec);
        if (blurb) sq_pushstring(v, blurb, -1); else sq_pushnull(v);
        sq_rawset(v, -3);
        return;
    }
    case G_TYPE_BOXED: {
        /* Recognise cairo boxed types delivered by GStreamer's cairooverlay
         * (and other GObject signal arguments) so handlers receive a real
         * Squirrel cairo.Context / cairo.Surface / cairo.Pattern instance
         * rather than a raw userpointer. The Squirrel side does NOT own the
         * pointer — cairooverlay frees the context after the signal returns,
         * so we pass adopt=0 (transfer_full=0). */
        gpointer p = g_value_get_boxed(gval);
        if (!p) { sq_pushnull(v); return; }
        const char *tname = g_type_name(type);
        if (tname) {
            const char *full_key = NULL;
            if      (strcmp(tname, "CairoContext") == 0) full_key = "cairo.Context";
            else if (strcmp(tname, "CairoSurface") == 0) full_key = "cairo.Surface";
            else if (strcmp(tname, "CairoPattern") == 0) full_key = "cairo.Pattern";
            if (full_key && sqgi_cairo_try_push_foreign(v, full_key, p, /*transfer_full=*/0)) {
                return;
            }
        }
        /* Fallback: opaque userpointer so handlers can at least pass it
         * through. Future work: register boxed types via GI for richer
         * access. */
        sq_pushuserpointer(v, p);
        return;
    }
    case G_TYPE_POINTER: {
        gpointer p = g_value_get_pointer(gval);
        if (p) sq_pushuserpointer(v, p);
        else   sq_pushnull(v);
        return;
    }
    default:
        break;
    }

    /* Non-fundamental: handle G_TYPE_VARIANT (its fundamental is itself but
     * the switch above already covers boxed; check explicitly). */
    if (type == G_TYPE_VARIANT) {
        GVariant *gv = g_value_get_variant(gval);
        sqgi_push_gvariant(v, gv);
        return;
    }

    /* Fallback */
    sq_pushnull(v);
}

SQRESULT sqgi_get_gvalue(HSQUIRRELVM v, SQInteger idx, GValue *gval)
{
    GType type = G_VALUE_TYPE(gval);
    SQObjectType sqtype = sq_gettype(v, idx);

    switch (G_TYPE_FUNDAMENTAL(type)) {
    case G_TYPE_BOOLEAN: {
        SQBool b;
        if (SQ_FAILED(sq_getbool(v, idx, &b))) return SQ_ERROR;
        g_value_set_boolean(gval, b);
        return SQ_OK;
    }
    case G_TYPE_INT: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_int(gval, (gint)i);
        return SQ_OK;
    }
    case G_TYPE_UINT: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_uint(gval, (guint)i);
        return SQ_OK;
    }
    case G_TYPE_INT64: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_int64(gval, (gint64)i);
        return SQ_OK;
    }
    case G_TYPE_UINT64: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_uint64(gval, (guint64)i);
        return SQ_OK;
    }
    case G_TYPE_FLOAT: {
        SQFloat f;
        if (SQ_FAILED(sq_getfloat(v, idx, &f))) return SQ_ERROR;
        g_value_set_float(gval, (gfloat)f);
        return SQ_OK;
    }
    case G_TYPE_DOUBLE: {
        SQFloat f;
        if (SQ_FAILED(sq_getfloat(v, idx, &f))) return SQ_ERROR;
        g_value_set_double(gval, (gdouble)f);
        return SQ_OK;
    }
    case G_TYPE_STRING: {
        const SQChar *s;
        if (SQ_FAILED(sq_getstring(v, idx, &s))) return SQ_ERROR;
        g_value_set_string(gval, s);
        return SQ_OK;
    }
    case G_TYPE_ENUM: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_enum(gval, (gint)i);
        return SQ_OK;
    }
    case G_TYPE_FLAGS: {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        g_value_set_flags(gval, (guint)i);
        return SQ_OK;
    }
    case G_TYPE_OBJECT:
    case G_TYPE_INTERFACE: {
        if (sqtype == OT_NULL) {
            g_value_set_object(gval, NULL);
            return SQ_OK;
        }
        GObject *obj = sqgi_get_gobject(v, idx);
        if (!obj) return SQ_ERROR;
        g_value_set_object(gval, obj);
        return SQ_OK;
    }
    default:
        break;
    }

    if (type == G_TYPE_VARIANT) {
        if (sqtype == OT_NULL) {
            g_value_set_variant(gval, NULL);
            return SQ_OK;
        }
        SQUserPointer p = NULL;
        if (SQ_SUCCEEDED(sq_getinstanceup(v, idx, &p, NULL, SQFalse)) && p) {
            g_value_set_variant(gval, (GVariant *)p);
            return SQ_OK;
        }
        if (SQ_SUCCEEDED(sq_getuserpointer(v, idx, &p)) && p) {
            g_value_set_variant(gval, (GVariant *)p);
            return SQ_OK;
        }
        return sq_throwerror(v,
            "sqgi: GVariant GValue requires a GVariant instance");
    }

    return sq_throwerror(v, "sqgi: unsupported GValue type");
}

/* ── GObject wrapper helpers ─────────────────────────────────────────────── */

void sqgi_push_gobject(HSQUIRRELVM v, GObject *obj)
{
    if (!obj) {
        sq_pushnull(v);
        return;
    }
    g_object_ref(obj);
    sqgi_gi_object_push_instance(v, obj);
}

GObject *sqgi_get_gobject(HSQUIRRELVM v, SQInteger idx)
{
    SQUserPointer p = NULL;
    /* Instances store a GObject* as their userdata (set via sq_setinstanceup) */
    if (SQ_FAILED(sq_getinstanceup(v, idx, &p, NULL, SQFalse))) {
        sq_throwerror(v, "sqgi: expected a GObject instance");
        return NULL;
    }
    return G_OBJECT(p);
}
